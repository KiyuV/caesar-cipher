# frozen_string_literal: true

require_relative '../lib/caesar_cipher'

describe CaesarCipher do
  describe '.caesar_cipher' do
    context 'when the given shift is small' do
      string = 'Joe discovered that traffic cones make excellent megaphones'
      shift = 3
      ans = 'Mrh glvfryhuhg wkdw wudiilf frqhv pdnh hafhoohqw phjdskrqhv'

      it 'Ciphers the sentence correctly' do
        result = described_class.caesar_cipher(string, shift)
        expect(result).to eq(ans)
      end
    end

    context 'when the given shift is large' do
      string = 'Nobody questions who built the pyramids in Mexico'
      shift = 32
      ans = 'Tuhuje wakyzouty cnu haorz znk vexgsojy ot Skdoiu'

      it 'Ciphers the sentence correctly' do
        result = CaesarCipher.caesar_cipher(string, shift)
        expect(result).to eq(ans)
      end
    end

    context 'when there are special characters' do
      string = "I'm confused: when people ask me what's up, and I point, they groan."
      shift = 5
      ans = "N'r htskzxji: bmjs ujtuqj fxp rj bmfy'x zu, fsi N utnsy, ymjd lwtfs."

      it 'does not shift special characters' do
        result = CaesarCipher.caesar_cipher(string, shift)
        expect(result).to eq(ans)
      end
    end
  end
end
