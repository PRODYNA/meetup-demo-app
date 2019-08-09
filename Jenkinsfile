@Library('meetup-jenkins-lib') _
import com.prodyna.meetup.jenkins.PodTemplates

buildPipeline {
    // Selection of the build slave to use.
    // (see https://github.com/PRODYNA/meetup-jenkins-lib/blob/master/src/com/prodyna/meetup/jenkins/PodTemplates.groovy)
    buildSlave = { label, body ->
        new PodTemplates().maven(label, body)
    }

    buildCommand = { utils ->
        sh "mvn clean package"
        utils.buildImage("${this.env.WORKSPACE}/target", "fassmus/meetup-build-slave:develop")
    }
}