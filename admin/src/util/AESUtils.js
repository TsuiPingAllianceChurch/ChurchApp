var aesjs = require('aes-js')

var key = [7, 2, 4, 3, 6, 1, 9, 2, 5, 2, 1, 7, 9, 2, 8, 3]
var aes = new aesjs.AES(key)

export function encode (value) {
  if (isNaN(value)) {
    return ''
  }
  var textBytes = aesjs.utils.utf8.toBytes('0'.repeat(16 - value.toString().length) + value)
  var encryptedBytes = aes.encrypt(textBytes)
  var encryptedHex = aesjs.utils.hex.fromBytes(encryptedBytes)
  return encryptedHex
}

export function decode (value) {
  var encryptedBytes = aesjs.utils.hex.toBytes(value)
  var decryptedBytes = aes.decrypt(encryptedBytes)
  var decryptedText = aesjs.utils.utf8.fromBytes(decryptedBytes)
  if (isNaN(decryptedText)) {
    throw new Error('Invalid encode number.')
  }
  return parseInt(decryptedText, 10)
}
