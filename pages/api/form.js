
export default function handler(req, res) {
  console.log(req)
  let b = `data "aws_ami" "ubuntu" {
    most_recent = true
  
    filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    } 
    owners = ["099720109477"]
  }
  
  resource "${req.body.resource_type}" "${req.body.instance_name}" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "${req.body.instance_type}"
  
  }`

  res.status(200).json({ "file":  b})
}
