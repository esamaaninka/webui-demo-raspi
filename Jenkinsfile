pipeline {
  agent { docker { image 'node:14-alpine' } }
  stages {
    staqe('build') {
      steps {
        sh 'npm --version'
      }
    }
  }
}
