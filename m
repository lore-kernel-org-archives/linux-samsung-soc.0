From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2nd 5/5] Samsung SoC update for v3.14
Date: Sun, 22 Dec 2013 03:23:57 +0900
Message-ID: <52B5DCBD.5020202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:59768 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754509Ab3LUSYC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Dec 2013 13:24:02 -0500
Received: by mail-pb0-f45.google.com with SMTP id rp16so3873699pbb.18
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Dec 2013 10:24:02 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 538cfbb4c40ab59688236484138133b8e3e89220:

   ARM: dts: Add initial support for Arndale Octa board (2013-12-16 
05:05:43 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-soc-2

for you to fetch changes up to 7a28f198735d040f4d318511827d913d4b53f355:

   ARM: dts: add board dts file for EXYNOS4412 based TINY4412 board 
(2013-12-19 05:34:26 +0900)

----------------------------------------------------------------
Samsung SoC 2nd update for v3.14
- add exynos4412-tiny4412 board dt
   for FriendlyARM's TINY4412 board

----------------------------------------------------------------
Alex Ling (1):
       ARM: dts: add board dts file for EXYNOS4412 based TINY4412 board

  arch/arm/boot/dts/Makefile                |  1 +
  arch/arm/boot/dts/exynos4412-tiny4412.dts | 93 
+++++++++++++++++++++++++++++++
  2 files changed, 94 insertions(+)
  create mode 100644 arch/arm/boot/dts/exynos4412-tiny4412.dts
