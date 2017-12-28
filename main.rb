require 'barby/barcode/code_128'
require 'barby/outputter/png_outputter'

# パラメータ
xdim    = 3  # 一番細いバーの幅

capital   = ARGV[0]
start_num = ARGV[1]
end_num   = ARGV[2]

(start_num..end_num).to_a.each do |num|
  content_label = format('%s%05d', capital, num)
  content = content_label.to_i(16)

  # QRコード生成
  code128 = Barby::Code128B.new(content)

  # PNGで出力
  png_file = "#{content_label}.png"
  File.open("outputs/#{png_file}", 'wb') do |f|
    f.write code128.to_png(xdim: xdim)
  end

  # HTMLのimgタグ用のbase64で出力
  # puts qrcode.to_image(xdim: xdim).to_data_url
end
