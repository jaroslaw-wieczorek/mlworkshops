pipeline {
    agent { dockerfile true }
    stages {
      stage('Hello_in_Docker') {
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
      		// copyArtifacts excludes: 'wikinews_results.tsv', fingerprintArtifacts: true, projectName: 's416199-metrics', selector: lastSuccessful()
      	}
      }
      stage('Metrics')
      {
      	steps{
      		sh label: 'metrics', script: './skrypt.sh'   		
      	}
      }
      //stage('Archive_metrics')
      //{
      	//steps{
      //		archiveArtifacts 'liczba_wierszy.txt'
      //		archiveArtifacts 'wynik.txt'
      //		archiveArtifacts 'results'
      //		archiveArtifacts 'hypothesis.txt'
      //		archiveArtifacts 'reference.txt'
     // 		archiveArtifacts 'hypothesis.trn'
      //		archiveArtifacts 'reference.trn'  
      //		archiveArtifacts 'wer_all.txt'
      //		archiveArtifacts 'wer.txt'
      //		archiveArtifacts 'srr.txt'
      //		archiveArtifacts 'wikinews_results.tsv'
      //	}
     // }
   }
}
