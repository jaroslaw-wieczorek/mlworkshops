pipeline {
    agent { dockerfile true }
    stages {
      stage('Hello In Docker') {
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
      		copyArtifacts filter: 'wikiniews_results.tsv', fingerprintArtifacts: true, projectName: 'ASR-eval', selector: lastSuccessful()
      	}
      }
      stage('Count metrics')
      {
      	steps{
      		sh label: 'ls', script: 'ls'
      		sh label: 'metrics', script: './skrypt.sh'
      	}
      }
      stage('Archive metrics')
      {
      	steps{
      		archiveArtifacts 'wynik.txt'
      	}
      }
   }
}
