From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 0/2] ARM: dts: snow: add backlight node
Date: Mon, 19 May 2014 10:45:38 +0530
Message-ID: <1400476540-14828-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61749 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750738AbaESFRC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 01:17:02 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5T00K6O2OCCX50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 May 2014 14:17:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on Kukjin Kim's tree, for-next branch.

This series adds:
	-- pinctrl definitions for pwmX_out on exynos5250
	-- pwm-backlight DT node for exynos5250 based snow board

Changes since V1:
	-- Added the branch name against which patches are created.
	-- Rebase the patches on top of for-next branch.

Ajay Kumar (2):
  [PATCH V2 1/2] ARM: dts: Add pwmX_out pinctrl nodes to Exynos5250
  [PATCH V2 2/2] ARM: dts: enable pwm backlight for snow

 arch/arm/boot/dts/exynos5250-pinctrl.dtsi |   28 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-snow.dts     |   10 ++++++++++
 2 files changed, 38 insertions(+)

-- 
1.7.9.5
