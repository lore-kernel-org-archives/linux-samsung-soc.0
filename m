From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH RESEND v2 0/2] Add device tree and clock support for Gscaler.
Date: Mon, 16 Jul 2012 11:03:21 +0530
Message-ID: <1342416803-30809-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52058 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789Ab2GPFS6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 01:18:58 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7800I5IMRC9IC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Jul 2012 14:18:57 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M78008JRMRF4640@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Jul 2012 14:18:56 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, ameersk@gmail.com, shaik.ameer@samsung.com

This patch series adds clock support for Gscaler and device node
 entries for Gscaler on exynos5.

This patch is based on Kukjin Kim's (linux-samsung) for-next branch.
    https://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

changes since v1:
- Addressed review comments from Sylwester Nawrocki
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11177.html
- Addressed review comments from Sachin Kamat
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11176.html
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11178.html

Resending this patch for posting to devicetree-discuss@lists.ozlabs.org

Shaik Ameer Basha (2):
  ARM: EXYNOS: Add clock support for Gscaler
  ARM: EXYNOS: Add gscaler device from DT

 .../devicetree/bindings/media/exynos5-gsc.txt      |   16 ++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   31 ++++++++
 arch/arm/mach-exynos/clock-exynos5.c               |   79 ++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |    3 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 ++
 5 files changed, 137 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
