From: Shaik Ameer Basha <shaik.ameer@samsung.com>
Subject: [PATCH v4 0/2] Add device tree and clock support for G-Scaler
Date: Mon, 13 Aug 2012 15:32:22 +0530
Message-ID: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34256 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929Ab2HMJUg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Aug 2012 05:20:36 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8O004EBSLWS7M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Aug 2012 18:20:34 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8O00L6USLWO650@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 13 Aug 2012 18:20:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com, shaik.ameer@samsung.com

This patch series adds clock support for G-Scaler and device node
 entries for G-Scaler on exynos5.

This patch is based on Kukjin Kim's (linux-samsung) for-next branch.
    https://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

changes since v3:
- Addressed review comments from Kukjin Kim
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11658.html
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11659.html

changes since v2:
- Addressed review comments from Sylwester Nawrocki
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11372.html
- Addressed review comments from Kukjin Kim and Sunyoung Kang
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11377.html
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11429.html 

changes since v1:
- Addressed review comments from Sylwester Nawrocki
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11177.html
- Addressed review comments from Sachin Kamat
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11176.html
    http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg11178.html

Shaik Ameer Basha (2):
  ARM: EXYNOS: Add clock support for G-Scaler
  ARM: EXYNOS: Adds G-Scaler device from Device Tree

 .../devicetree/bindings/media/exynos5-gsc.txt      |   32 +++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   28 +++++++
 arch/arm/mach-exynos/clock-exynos5.c               |   86 ++++++++++++++++++++
 arch/arm/mach-exynos/include/mach/map.h            |    5 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 ++
 5 files changed, 159 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
