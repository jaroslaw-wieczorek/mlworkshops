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
      		checkout([$class: 'GitSCM', branches: [[name: '*/develop']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://git.man.poznan.pl/stash/scm/amunatcoll/anc-backend.git']]])		
      	}
      }
      
      stage('CopyReports')
      {
      	steps{
      		copyArtifacts filter: 'reports', fingerprintArtifacts: true, projectName: 'anc-backend-test', selector: lastSuccessful()
      	}      	
      }
      stage('RunTets')
      {
      	steps{
      		sh label: 'tests', script: './skrypt.sh'   		
      	}
      }
      stage('ArchiveReports')
      {
      	steps{
      		archiveArtifacts 'reports/coverage.txt'
      		archiveArtifacts 'reports/coverage.xml'
      	}
     }
     stage('Build plots') 
     {
     	echo 'Hello World'
     }
   }
}
