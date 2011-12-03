From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 0/3] ASV support for Exynos4 series
Date: Sat, 03 Dec 2011 19:20:26 +0900
Message-ID: <000701ccb1a5$2cfc3c70$86f4b550$%kim@samsung.com>
References: <1320904083-19173-1-git-send-email-boyko.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17920 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754386Ab1LCKU2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 3 Dec 2011 05:20:28 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVM00G2KI23Q650@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 03 Dec 2011 19:20:27 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVM00735I22KE10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 03 Dec 2011 19:20:27 +0900 (KST)
In-reply-to: <1320904083-19173-1-git-send-email-boyko.lee@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jongpill Lee' <boyko.lee@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: boyko.lee@gmail.com

Jongpill Lee wrote:
> 
> Each SoC has specification.For example voltage or ids current.
> These values are related to production process.
> If you have a good specification SoC, you can supply lower voltage into
> SoC.
> Also, If your SoC has bad specification, you have to supply higher voltage
> into SoC.
> So, after get these SoC specification value on initialize time, we can use
> these value to fix voltage for running SoC.
> Using by this patch set, Exynos4210 can get SoC specification and adjust
> voltage.
> 
> [PATCH V2 1/3] ARM: EXYNOS4: Add ASV feature for Exynos4 series
> [PATCH V2 2/3] ARM: EXYNOS4: Add clock for Exynos4210 asv feature
> [PATCH V2 3/3] ARM: EXYNOS4: Support ASV for Exynos4210

Hi Jongpill,

See my comments and then could you please rebase this series based on latest
my for-next?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
