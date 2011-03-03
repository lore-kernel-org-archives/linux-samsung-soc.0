From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/3] ARM: S5P: Add D-PHY control platform helpers for
	MIPI-CSIS/DSIM drivers
Date: Thu, 03 Mar 2011 20:04:18 +0100
Message-ID: <1299179061-30959-1-git-send-email-s.nawrocki@samsung.com>
References: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22021 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758207Ab1CCTEj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Mar 2011 14:04:39 -0500
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LHH00MTKWZQND@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 19:04:38 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LHH00K4HWZONW@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Mar 2011 19:04:37 +0000 (GMT)
In-reply-to: <01a701cbd95d$9873c160$c95b4420$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com

Hello,

the following patch series adds the platform helpers for MIPI-CSIS and MIPI-DSIM
drivers to control their corresponding D-PHYs. 
MIPI-DSIM driver should use its D-PHY control function from plat-s5p/setup-mipi.c.

Changes since v1:
- created common setup-mipi.c under plat-s5p for all S5P/EXYNOS4* SoCs


The patch series contains:
[PATCH v2 1/3] ARM: S5P: Rename MIPI-CSIS driver header and update Copyright
[PATCH v2 2/3] ARM: S5P: Extend MIPI-CSIS platform_data with the PHY control callback
[PATCH v2 3/3] ARM: S5P: Add support for common MIPI CSIS/DSIM D-PHY control


Regards,
--
Sylwester Nawrocki
Samsung Poland R&D Center
