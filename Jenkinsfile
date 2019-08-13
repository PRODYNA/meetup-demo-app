@Library('meetup-jenkins-lib@v1.0.0') _
import com.prodyna.meetup.jenkins.PodTemplates

buildPipeline {
    // Selection of the build slave to use.
    // (see https://github.com/PRODYNA/meetup-jenkins-lib/blob/master/src/com/prodyna/meetup/jenkins/PodTemplates.groovy)
    buildSlave = { label, body ->
        new PodTemplates().maven(label, body)
    }

    buildCommand = { utils ->
        def branchName = this.env.BRANCH_NAME

        // Build binary
        sh "mvn clean package"
        
        // Build and push image based on Dockerfile using Kaniko
        utils.buildImageFromDockerfile("${this.env.WORKSPACE}/target", "fassmus/meetup-demo-app:${branchName}-kaniko")

        // Build same image with Maven and Jib
        utils.buildImageWithJib("fassmus/meetup-demo-app:${branchName}-jib")
    }

    // Map branch to list of environments to update.
    deployTargets=["develop":["https://github.com/PRODYNA/meetup-demo-environment.git/meetup-demo-app"]]
}