From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v3 0/2] Add device tree and clock support for Gscaler.
Date: Fri, 20 Jul 2012 18:38:41 +0530
Message-ID: <1342789723-3949-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37339 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753451Ab2GTMyA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jul 2012 08:54:00 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7G0046HMHWWVA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 21:53:59 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7G00EA1MHSQ5A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jul 2012 21:53:59 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sy0816.kang@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, shaik.samsung@gmail.com, shaik.ameer@samsung.com

This patch series adds clock support for Gscaler and device node
 entries for Gscaler on exynos5.

This patch is based on Kukjin Kim's (linux-samsung) for-next branch.
    https://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

changes since v2:
- Addressed review comments from Sylwester Nawrocki
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11372.html
- Addressed review comments from Kukjin Kim and Sunyoung Kang
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11377.html
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11429.html

Shaik Ameer Basha (2):
  ARM: EXYNOS: Add clock support for Gscaler
  ARM: EXYNOS: Add Gscaler device from DT

 .../devicetree/bindings/media/exynos5-gsc.txt      |   32 ++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   28 ++++++
 arch/arm/mach-exynos/clock-exynos5.c               |  100 ++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |    3 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 ++
 5 files changed, 171 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
