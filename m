From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/2] Samsung EXYNOS5420 PINCTRL for v3.11
Date: Wed, 19 Jun 2013 23:48:41 +0900
Message-ID: <51C1C4C9.8090001@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:64142 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756724Ab3FSOsq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Jun 2013 10:48:46 -0400
Received: by mail-pb0-f44.google.com with SMTP id uo1so5158316pbc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jun 2013 07:48:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Leela Krishna Amudala <l.krishna@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Linus Walleij <linus.walleij@linaro.org>

The following changes since commit eff4e7c7f32a4e4be60b19b209ffab5cb430b385:

   ARM: EXYNOS: extend soft-reset support for EXYNOS5420 (2013-06-19 
04:09:37 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/soc-exynos5420-2

for you to fetch changes up to 983dbeb35f1543668b8f3b31a735bf2163f2b233:

   pinctrl: exynos: add exynos5420 SoC specific data (2013-06-19 
22:19:08 +0900)

----------------------------------------------------------------
based on tags/soc-exynos5420-1
- add pinctrl support for exynos5420

----------------------------------------------------------------
Leela Krishna Amudala (2):
       ARM: dts: add pinctrl support to EXYNOS5420
       pinctrl: exynos: add exynos5420 SoC specific data

  .../bindings/pinctrl/samsung-pinctrl.txt           |   1 +
  arch/arm/boot/dts/exynos5420-pinctrl.dtsi          | 680 
+++++++++++++++++++++
  arch/arm/boot/dts/exynos5420.dtsi                  |  45 ++
  drivers/pinctrl/pinctrl-exynos.c                   | 118 ++++
  drivers/pinctrl/pinctrl-samsung.c                  |   2 +
  drivers/pinctrl/pinctrl-samsung.h                  |   1 +
  6 files changed, 847 insertions(+)
  create mode 100644 arch/arm/boot/dts/exynos5420-pinctrl.dtsi
