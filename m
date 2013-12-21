From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2nd 3/5] Samsung defconfig update for v3.14
Date: Sun, 22 Dec 2013 03:23:39 +0900
Message-ID: <52B5DCAB.204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:33594 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754509Ab3LUSXp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Dec 2013 13:23:45 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so3878403pbc.15
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Dec 2013 10:23:45 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 54b56e62d20ac0de6e8e12b7efdaf3a1b9b6541c:

   ARM: exynos_defconfig: increase CONFIG_NR_CPUS value to 8 (2013-12-02 
07:33:38 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-defconfig-2

for you to fetch changes up to 7c7be272ae6413d1dd298e68752f5e34bc9b3eba:

   ARM: exynos_defconfig: Enable S2MPS11 voltage regulator (2013-12-21 
06:27:47 +0900)

----------------------------------------------------------------
Samsung defconfig 2nd update for v3.14
- enable REGULATOR S2MPS11 for Arndale Octa board

----------------------------------------------------------------
Sachin Kamat (1):
       ARM: exynos_defconfig: Enable S2MPS11 voltage regulator

  arch/arm/configs/exynos_defconfig | 1 +
  1 file changed, 1 insertion(+)
