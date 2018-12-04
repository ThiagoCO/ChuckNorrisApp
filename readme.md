
# Desafio GuiaBolso - 	ChuckNorris

Aplicativo para o processo de seleção do GuiaBolso.

## Desafio

O objetivo do teste é fazer uma lista em grid com o nome da categoria e uma tela de detalhes com uma imagem mostrando uma piada do gênero selecionado.

API Utilizada: https://api.chucknorris.io/jokes/categories

## Ferramentas utilizadas

- Xcode 10
- Swift 4.2
- CocoaPods

## Arquitetura utilizada

Neste projeto estou utilizando MVVM (Movel-View-ViewModel) por ser um dos melhores padrões de arquitetura para desenvolvimento iOS.

Mais informações: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel

## Pods utilizados

#### Alamofire (https://github.com/Alamofire/Alamofire)
Para requisições HTTP.

#### SDWebImage (https://github.com/rs/SDWebImage)
Para carregar imagens pelo link e gerenciamento de cache.


## Como compilar

1. Instale o CocoaPods caso não tenha instalado: https://cocoapods.org/
2. Vá até a pasta do projeto pelo terminal (a pasta que tem o arquivo `Podfile`)
3. Digite: `pod install`
4. Pronto. Agora basta abrir o projeto no XCode pelo arquivo **`ChuckNorris.xcworkspace`**

OBS: Não abra pelo **`ChuckNorris.xcodeproj`** pois os pods não serão carregados e dará erro na hora de compilar.
