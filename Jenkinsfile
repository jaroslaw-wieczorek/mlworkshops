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
      		copyArtifacts filter: 'wikiniews_results.tsv', fingerprintArtifacts: true, projectName: 'ASR-eval', selector: lastSuccessful()
      	}
      }
      stage('Count metrics')
      {
      	steps{
      		sh label: 'metrics', script: 'wc -l  wikiniews_results.tsv > wynik.txt'
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
