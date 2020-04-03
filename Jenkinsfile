pipeline {
   agent any
    stages {
        stage('Test') {
            steps {
				echo 'Test'
            }
        }

      stage('Hello') {
         steps {
            echo 'Hello World'
         }
      }
   
      stage('Checkout')
      {
      	agent { dockerfile true }
      	steps {
      		checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/jaroslaw-wieczorek/s416199-mlworkshops.git']]])		
      	}
      }
      
      stage('CopyArtificats')
      {
        agent { dockerfile true }
      	steps{
      		copyArtifacts filter: 'wikiniews_results.tsv', fingerprintArtifacts: true, projectName: 'ASR-eval', selector: lastSuccessful()
      	}
      }
      stage('Count metrics')
      {
        agent { dockerfile true }
      	steps{
      		sh label: 'ls', script: 'ls -l'
      		sh label: 'metrics', script: 'wc -l  wikiniews_results.tsv > wynik.txt'
      	}
      }
      stage('Archive metrics')
      {
        agent { dockerfile true }
      	steps{
      		archiveArtifacts 'wynik.txt'
      	}
      }
   }
}
