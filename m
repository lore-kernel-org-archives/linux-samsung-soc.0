From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/7] Samsung defconfig for v3.14
Date: Mon, 16 Dec 2013 05:21:44 +0900
Message-ID: <52AE0F58.1060401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:63851 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829Ab3LOUVu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Dec 2013 15:21:50 -0500
Received: by mail-pd0-f182.google.com with SMTP id v10so4521063pde.27
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Dec 2013 12:21:49 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-defconfig

for you to fetch changes up to 54b56e62d20ac0de6e8e12b7efdaf3a1b9b6541c:

   ARM: exynos_defconfig: increase CONFIG_NR_CPUS value to 8 (2013-12-02 
07:33:38 +0900)

----------------------------------------------------------------
exynos_defconfig updates for v3.14
- increase number of CPU to 8 for EXYNOS SoCs

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (1):
       ARM: exynos_defconfig: increase CONFIG_NR_CPUS value to 8

  arch/arm/configs/exynos_defconfig | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
