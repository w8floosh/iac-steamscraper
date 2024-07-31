resource "aws_instance" "hcptest" {
  ami = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  key_name = "steamscraper"
  vpc_security_group_ids = ["sg-04505151a4ba55fd5"]
  tags = {
    Name = "SteamScraper"
  }
}