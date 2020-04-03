pipeline {
   agent any

   stages {
      stage('Hello') {
         steps {
            echo 'Hello World'
         }
      }
      stage('Checkout')
      {
      	steps {
      		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/jaroslaw-wieczorek/s416199-mlworkshops.git']]])		
      	}
      }
      stage('CopyArtificats')
      {
      	steps{
      		copyArtifacts filter: '/artifact/wikinews_results.txt', fingerprintArtifacts: true, projectName: 'ASR-eval', selector: lastSuccessful()
      	}
      }
   }
}
