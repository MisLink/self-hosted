module.exports = async (require) => {
  const killTheNewsletter = require(".").default

  const { webApplication, emailApplication } = killTheNewsletter(
    process.env.DATA_DIRECTORY
  )

  webApplication.set("url", process.env.WEB_URL)
  webApplication.set("email", process.env.EMAIL_URL)
  webApplication.set("administrator", process.env.ADMIN_EMAIL)

  webApplication.listen(80, () => {
    console.log("Web server started")
  })
  emailApplication.listen(25, () => {
    console.log("Email server started")
  })
}
