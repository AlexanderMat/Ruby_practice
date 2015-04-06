def iptocountry(ip)
  n = ip.split('.')
  code = n[3].to_i + (n[2].to_i * 256) + (n[1].to_i * 256**2) + (n[0].to_i * 256**3)
  return code
end

imp = gets
code = iptocountry(imp)

File.readlines('IpToCountry.csv').each do |line|
  n = line.scan(/\d{10}...\d{10}/)
  if n[0] != nil
    m = n[0].split('","')
    if (code.to_i >= m[0].to_i) && (code.to_i <= m[1].to_i)
      m = line.scan(/"\w{2}"/)
      print m[0]
    end
  end
end