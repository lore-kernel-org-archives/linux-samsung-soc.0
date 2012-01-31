From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH v2] EXYNOS4_DT fixes for 3.3-rc1+ kernels
Date: Tue, 31 Jan 2012 17:47:13 +0100
Message-ID: <1328028434-30139-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37317 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753155Ab2AaQrL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 11:47:11 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: thomas.abraham@linaro.org
Cc: m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>

Device Tree-based Exynos4 machine prepared by Thomas Abraham and
included in 3.3-rc1 hasn't been adjusted to changes that have happened
to mach-exynos during 3.3 merge window.

This commit brings exynos4-dt up to date.

Changes since last version (unmarked v1):

 - Added missing .restart handler spotted by Mr. Kyungmin Park
 - Reorganized patch a bit as requested by Mr. Kukjin Kim
 - Squashed all the fixes into one commit


 [ SMP support has been fixed by Thomas Abraham in separate patch:
   http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/9184 ]


Karol Lewandowski (1):
  ARM: Exynos4: Bring exynos4-dt up to date

 arch/arm/mach-exynos/mach-exynos4-dt.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.8.3
