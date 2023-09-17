using Microsoft.VisualBasic;
using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace ECOMBLL
{
    public class Cryptography
    {
        public string EncryptString(string plainText)
        {
            try
            {
                byte[] plainTextBytes = new byte[plainText.Length];
                string cipherText = string.Empty;

                plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
                cipherText = Convert.ToBase64String(plainTextBytes);

                return cipherText;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        public string DecryptString(string cipherText)
        {
            try
            {
                System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
                System.Text.Decoder utf8Decode = encoder.GetDecoder();

                byte[] cipherTextBytes = Convert.FromBase64String(cipherText);
                int charCount = utf8Decode.GetCharCount(cipherTextBytes, 0, cipherTextBytes.Length);
                char[] cipherTextChar = new char[charCount];
                utf8Decode.GetChars(cipherTextBytes, 0, cipherTextBytes.Length, cipherTextChar, 0);
                string plainText = new string(cipherTextChar);

                return plainText;
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        public string EncryptString(string plainText, string SecretKey)
        {
            try
            {
                byte[] SecretKeyBytes = { };
                byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xab, 0xcd, 0xef };

                SecretKeyBytes = System.Text.Encoding.UTF8.GetBytes(Strings.Left(SecretKey, 8));
                byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
                DESCryptoServiceProvider dESCryptoServiceProvider = new DESCryptoServiceProvider();
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, dESCryptoServiceProvider.CreateEncryptor(SecretKeyBytes, IV), CryptoStreamMode.Write);
                cs.Write(plainTextBytes, 0, plainTextBytes.Length);
                cs.FlushFinalBlock();

                return Convert.ToBase64String(ms.ToArray());
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        public string DecryptString(string cipherText, string SecretKey)
        {
            try
            {
                byte[] SecretKeyBytes = { };
                byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xab, 0xcd, 0xef };
                byte[] cipherTextBytes = new byte[cipherText.Length + 1];

                SecretKeyBytes = System.Text.Encoding.UTF8.GetBytes(Strings.Left(SecretKey, 8));
                cipherTextBytes = Convert.FromBase64String(cipherText);
                DESCryptoServiceProvider dESCryptoServiceProvider = new DESCryptoServiceProvider();
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, dESCryptoServiceProvider.CreateDecryptor(SecretKeyBytes, IV), CryptoStreamMode.Write);
                cs.Write(cipherTextBytes, 0, cipherTextBytes.Length);
                cs.FlushFinalBlock();
                System.Text.Encoding encoding = System.Text.Encoding.UTF8;

                return encoding.GetString(ms.ToArray());
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

    }
}