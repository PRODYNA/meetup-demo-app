@Library('meetup-jenkins-lib') _
import com.prodyna.meetup.jenkins.PodTemplates

buildPipeline {
    // Selection of the build slave to use.
    // (see https://github.com/PRODYNA/meetup-jenkins-lib/blob/master/src/com/prodyna/meetup/jenkins/PodTemplates.groovy)
    buildSlave = { label, body ->
        new PodTemplates().maven(label, body)
    }
}