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
    var idMask = vrecord[5].replaceAll('*', '').replaceAll('(', '').replaceAll(')', '')
    var nameMask = vrecord[6].replaceAll('*', '').replaceAll(',', '').toUpperCase()
    var mappingstr = idMask + '|' + nameMask
    var found = _find(mappings, {mapping: mappingstr})
    if (found) {
      userid = found.user_id
      return { type: 'vaccine_qr', userid: userid, found: true, mappingstr: mappingstr }
    } else {
      console.log(mappingstr)
      return { type: 'vaccine_qr', userid: userid, found: false, mappingstr: mappingstr }
    }
  }
  return null
}
