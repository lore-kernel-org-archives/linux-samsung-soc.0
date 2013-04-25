From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-1 for v3.10
Date: Fri, 26 Apr 2013 01:40:02 +0900
Message-ID: <51795C62.8070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:59468 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755921Ab3DYQkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Apr 2013 12:40:07 -0400
Received: by mail-pd0-f175.google.com with SMTP id g12so78342pdj.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2013 09:40:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 58a7bbf75442ea439a4d3b7993ad87023e406063:

   ARM: dts: add PDMA0 changes for exynos5440 (2013-04-09 01:39:27 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-1-for-v3.10

for you to fetch changes up to bf49cd7f8d560497cf39065a537f4c722e456cbb:

   ARM: dts: Disable the RTC by default on exynos5 (2013-04-26 01:26:54 
+0900)

----------------------------------------------------------------
Disables the RTC by default on exynos5 to remove lots of warnings in the 
kernel boot log and Fixes build warning on exynos4x12

----------------------------------------------------------------
Doug Anderson (1):
       ARM: dts: Disable the RTC by default on exynos5

Thomas Abraham (1):
       ARM: dts: add mshc controller node for Exynos4x12 SoCs

  arch/arm/boot/dts/exynos4412.dtsi | 8 ++++++++
  arch/arm/boot/dts/exynos5250.dtsi | 1 +
  arch/arm/boot/dts/exynos5440.dtsi | 1 +
  3 files changed, 10 insertions(+)
