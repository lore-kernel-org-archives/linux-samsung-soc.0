From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/6] s3c24xx DT
Date: Wed, 12 Jun 2013 06:08:28 +0900
Message-ID: <51B791CC.4000405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:36787 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755904Ab3FKVIc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 17:08:32 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp12so4247523pab.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 14:08:32 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

   Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/s3c24xx-dt-1

for you to fetch changes up to 35aca36450e6c3fb3b3fe9ea60a7c4689a219a87:

   ARM: dts: add devicetree support for s3c2416-smdk2416 (2013-05-21 
01:06:12 +0900)

----------------------------------------------------------------
add DT support for s3c2416-smdk2416

----------------------------------------------------------------
Heiko Stuebner (1):
       ARM: dts: add devicetree support for s3c2416-smdk2416

  arch/arm/boot/dts/Makefile              |   1 +
  arch/arm/boot/dts/s3c2416-pinctrl.dtsi  | 173 
++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/s3c2416-smdk2416.dts  |  72 +++++++++++++
  arch/arm/boot/dts/s3c2416.dtsi          |  79 +++++++++++++++
  arch/arm/boot/dts/s3c24xx.dtsi          |  92 +++++++++++++++++
  arch/arm/mach-s3c24xx/Kconfig           |  12 +++
  arch/arm/mach-s3c24xx/Makefile          |   1 +
  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c |  91 +++++++++++++++++
  8 files changed, 521 insertions(+)
  create mode 100644 arch/arm/boot/dts/s3c2416-pinctrl.dtsi
  create mode 100644 arch/arm/boot/dts/s3c2416-smdk2416.dts
  create mode 100644 arch/arm/boot/dts/s3c2416.dtsi
  create mode 100644 arch/arm/boot/dts/s3c24xx.dtsi
  create mode 100644 arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
