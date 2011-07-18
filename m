From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 0/8] ARM: EXYNOS4: Update PM
Date: Mon, 18 Jul 2011 17:00:56 +0900
Message-ID: <04a701cc4520$d3b02c30$7b108490$%kim@samsung.com>
References: <1309485457-13305-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42202 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740Ab1GRIA7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 04:00:59 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOI004FMRISFGO0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 17:00:58 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOI00BWGRLKMH@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 17:00:58 +0900 (KST)
In-reply-to: <1309485457-13305-1-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>

Kukjin Kim wrote:
> 
> This patch updates EXYNOS4 PM based on Russell's suspend consolidation
> patches.
> 
> NOTE: Depends on external GIC patches which are from Changhwan Youn.
> 
> Changes since V1:
> - address comments from Russell King
> 
> [PATCH V2 1/8] ARM: EXYNOS4: Support system level power down configuration
> [PATCH V2 2/8] ARM: EXYNOS4: Remove PMU configuration for S2RAM
> [PATCH V2 3/8] ARM: EXYNOS4: Add support PM with external GIC
> [PATCH V2 4/8] ARM: SAMSUNG: Add support for failure of sleep mode
> [PATCH V2 5/8] ARM: EXYNOS4: Support early wakeup entering sleep mode
> [PATCH V2 6/8] ARM: EXYNOS4: Move S5P_CENTRAL_SEQ_CONFIGURATION
> setting for PM
> [PATCH V2 7/8] ARM: EXYNOS4: Add save/restore for other ARM registers
> [PATCH V2 8/8] ARM: EXYNOS4: Add save/restore function for PLL

Hi Russell and all,

I'm going to merge this whole series in my for-next except 3rd and 4th
patches late today.
The 3rd patch can be replaced with Colin's regarding suspend-to-ram GIC and
the 4th patch is not needed now because it's ok with Russell's suspend
patch.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
