# frozen_string_literal: true

require_relative '../lib/caesar_cipher' # Assumes your code is in `caesar_cipher.rb`

RSpec.describe 'Caesar Cipher' do
  # Test helper method: encode_character
  describe '#encode_character' do
    it 'shifts a character within ASCII printable range' do
      expect(encode_character('A', 3)).to eq('D')
      expect(encode_character('z', 1)).to eq('{') # 'z' (122) + 1 = '{' (123)
    end

    it 'wraps around the ASCII printable range (32-126)' do
      # Shift past 126 (e.g., '~' + 1 = ' ')
      expect(encode_character('~', 1)).to eq(' ') # 126 → 32
      # Shift below 32 (e.g., ' ' - 1 = '~')
      expect(encode_character(' ', -1)).to eq('~') # 32 → 126
    end

    it 'handles negative shifts' do
      expect(encode_character('D', -3)).to eq('A')
    end
  end

  # Test main cipher function: caesar_cipher
  describe '#caesar_cipher' do
    xit 'encodes a full string correctly' do
      expect(caesar_cipher('Hello!', 5)).to eq('Mjqqt&')
    end

    xit 'handles shifts that wrap around the ASCII range' do
      expect(caesar_cipher('~~~', 1)).to eq('   ')  # '~' (126) → ' ' (32)
      expect(caesar_cipher('   ', -1)).to eq('~~~') # ' ' (32) → '~' (126)
    end

    xit 'works with empty strings' do
      expect(caesar_cipher('', 10)).to eq('')
    end
  end

  # Test user input validation (stubbing `gets`)
  describe 'User Input Handling' do
    describe '#user_text' do
      xit 'rejects empty input and reprompts' do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('', 'Valid Text')
        expect(user_text).to eq('Valid Text')
      end
    end

    describe '#user_shift' do
      xit 'rejects non-integer input and reprompts' do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('abc', '5')
        expect(user_shift).to eq(5)
      end
    end
  end
end
