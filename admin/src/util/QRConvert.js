import { decode } from './AESUtils'
import _find from 'lodash/find'

export function convert (val, mappings) {
  var userid = null
  // matching first type of pattern [1123123132]
  if (/\[\w+\]/.test(val)) {
    var pat = /\[\w+\]/g
    var match = pat.exec(val)

    try {
      userid = decode(match[0].slice(1, -1))
      return { type: 'church_qr', userid: userid, found: true }
    } catch (e) {
      return { type: 'church_qr', userid: userid, found: false, message: 'decode error' }
    }
  }
  // matching second type of pattern XXXXXXXX=
  if (/HKSARG|VAC\w+=/.test(val)) {
    var vrecord = val.split('|')
    var mappingstr = vrecord[5] + '|' + vrecord[6]
    var found = _find(mappings, {mapping: mappingstr})
    if (found) {
      userid = found.user_id
      return { type: 'vaccine_qr', userid: userid, found: true, mappingstr: mappingstr }
    } else {
      return { type: 'vaccine_qr', userid: userid, found: false, mappingstr: mappingstr }
    }
  }
  return null
}
