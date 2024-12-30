Powershell で CPU アーキテクチャを確認する


■ これは何?
実行中のコンピュータが使用している CPU アーキテクチャと CPU 名を確認します

識別できるアーキテクチャは以下です

    x86
    MIPS
    Alpha
    PowerPC
    ARM
    IA64(Itanium)
    x64
    ARM64


■ 確認方法
PowerShell プロンプトで以下の実行スクリプトをコピペしてください
(GitHub で公開しているスクリプトをダウンロードして実行します)

# 以下の実行スクリプトを PowerShell プロンプトにコピペして下さい
Set-ExecutionPolicy RemoteSigned -Scope Process -Force
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MuraAtVwnet/GetArchitecture/master/GetArchitecture.ps1 -OutFile ~/GetArchitecture.ps1
& ~/GetArchitecture.ps1


■ PowerShell に馴染みのない方へ
PowerShell プロンプトの開き方と、スクリプト実行は以下の手順です

・PowerShell プロンプトを開く
Win + R で「ファイル名を指定して実行」を開き、「PowerShell」と入力し OK

・実行スクリプトのコピペ
「確認方法」の実行スクリプトをコピーしてください
PowerShell プロンプトでマウスを右クリックしてペーストします

・スクリプトの実行
警告が出ますが、「強制的に張り付け」をしてください

・アーキテクチャの確認
しばらくすると、アーキテクチャと CPU 名が表示されます


■ 仕組み
CPU アーキテクチャは、WMI の Win32_Processor で得られる Architecture で確認できます
PowerShell の Get-WmiObject で WMI を叩き(PowerShell 7.4.6 でも叩けました)、得られた Architecture からアーキテクチャを判別しています
CPU 名は Win32_Processor の Name で得ています

実行スクリプトで、プロファイルに確認スクリプトがダウンロードされていますので、コードに興味があれば以下コマンドででスクリプト内容が確認できます

type ~\GetArchitecture.ps1


■ 動作確認環境
Windows PowerShell 5.1
PowerShell 7.4.6
(WMI 使っているので Windows 専用です)


■ 参考
Win32_Processor クラス - Win32 apps | Microsoft Learn
https://learn.microsoft.com/ja-jp/windows/win32/cimwin32prov/win32-processor

作成した PowerShell 関数のモジュール化とオンラインインストール/オンライン更新の実装
https://www.vwnet.jp/Windows/PowerShell/2024101501/PowerShellModuleOnlineInstallUpdate.htm

管理権限を持っていないユーザーで PowerShell スクリプトを実行する
https://www.vwnet.jp/Windows/PowerShell/2020072901/SetExecutionPolicy.htm

PowerShell でコンピューターのハード情報を取得する
https://www.vwnet.jp/windows/PowerShell/2017162902/GetSystemInfo.htm


■ リポジトリ
このスクリプトは以下で公開しています
https://github.com/MuraAtVwnet/GetArchitecture
git@github.com:MuraAtVwnet/GetArchitecture.git


■ Web サイト
Powershell で CPU アーキテクチャを確認する
https://www.vwnet.jp/windows/PowerShell/2024123001/GetCpuArchitecture.htm



