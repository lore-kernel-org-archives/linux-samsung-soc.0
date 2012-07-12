From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] Exynos4: power domain fixes for v3.5-rc
Date: Thu, 12 Jul 2012 18:11:00 +0900
Message-ID: <0fad01cd600e$41940240$c4bc06c0$%kim@samsung.com>
References: <1339750473-32699-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29058 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932960Ab2GLJLM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:11:12 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100FRPITDRHW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:11:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71002LKIUDB150@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:11:01 +0900 (KST)
In-reply-to: <1339750473-32699-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> Hello,
> 
> This is a resend of my power domain fixes for Samsung Exynos platform.
> They fix issues introduced by switching to gen_pd based driver in commit
> 91cfbd4ee0 ('ARM: EXYNOS: Hook up power domains to generic power domain
> infrastructure') and restore runtime pm functionality for multimedia
> drivers (s5p-fimc, s5p-mfc, s5p-tv, exynos-drm). Tested on Universal
> C210 and NURI boards, but the issues were also reported for Origen
> boards and others. If possible, please consider these patches as fixes
> (runtime pm is broken without them) and merge to v3.5-rc line.
> 
> Best regards
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> 
> Patch summary:
> 
> Marek Szyprowski (2):
>   ARM: Exynos4: read initial state of power domain from hw registers
>   ARM: Exynos4: pm_domains: register devices in 'need_restore' state
> 
>  arch/arm/mach-exynos/pm_domains.c |   13 +++++++++----
>  1 files changed, 9 insertions(+), 4 deletions(-)
> 
> --
> 1.7.1.569.g6f426

OK, applied this series in my -fixes.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
