resource "aws_instance" "webapp1" {
  ami                         = "ami-04a1376c19330f050"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.PublicAZA.id
  vpc_security_group_ids      = [aws_security_group.WebServer.id]
  key_name                    = var.key_name
  tags = {
    Name = "ion-WebApp1"
  }
  user_data = file("app-userdata.sh")
}

#resource "aws_instance" "webapp2" {
#  ami                         = "ami-04a1376c19330f050"
##  instance_type               = "t2.micro"
#  subnet_id                   = aws_subnet.PublicAZB.id
#  vpc_security_group_ids      = [aws_security_group.WebServer.id]
#  key_name                    = var.key_name
#  tags = {
#    Name = "ion-WebApp2"
 # }
 # user_data = file("app-userdata.sh")
#}