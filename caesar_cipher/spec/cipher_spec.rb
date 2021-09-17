# frozen_string_literal: true

require_relative '../cipher'

describe Cipher do
  subject { Cipher.new }

  describe '#caeser_cipher' do
    it 'returns correctly shifted single word, all lower case' do
      expect(subject.caeser_cipher('cerebral', 5)).to eql('hjwjgwfq')
    end

    it 'returns correctly shifted single word, all upper case' do
      expect(subject.caeser_cipher('CEREBRAL', 5)).to eql('HJWJGWFQ')
    end

    it 'returns correctly shifted single word, mixed case' do
      expect(subject.caeser_cipher('CeReBrAl', 5)).to eql('HjWjGwFq')
    end

    it 'returns correctly shifted multiple words' do
      expect(subject.caeser_cipher('What a string', 5)).to eql('Bmfy f xywnsl')
    end

    it 'returns correctly shifted multiple words, with punctuation' do
      expect(subject.caeser_cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
    end

    it 'returns number as they are given (not shifted)' do
      expect(subject.caeser_cipher('12345', 5)).to eql('12345')
    end

    it 'handles numbers and letters together by shifting letters but not numbers' do
      expect(subject.caeser_cipher('Letters 12345', 5)).to eql('Qjyyjwx 12345')
    end

    it 'correctly shifts when passed a different shift factor' do
      expect(subject.caeser_cipher('cerebral', 2)).to eql('egtgdtcn')
    end
  end
end
