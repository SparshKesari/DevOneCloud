// Next.js API route support: https://nextjs.org/docs/api-routes/introduction

export default function handler(req, res) {

  let b = `data "aws_ami" "${req.body.ami.name}" {
    most_recent = true
  
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    } 
    owners = ["099720109477"]
  }
  
  resource ${req.body.type} "web" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"
  
  }`
  res.status(200).json({ "file":  b})
}
