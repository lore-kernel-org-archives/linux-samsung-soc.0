From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [RFC][PATCH] serial: samsung: Use single interrupt handler for
 s3c64xx and higher SoC's
Date: Fri, 12 Aug 2011 19:04:22 +0900
Message-ID: <008801cc58d7$36575dd0$a3061970$%kim@samsung.com>
References: <1312734133-27727-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58373 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752578Ab1HLKE0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:04:26 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT004Q47YQOAS0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:04:24 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00EGV7ZC0A@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:04:24 +0900 (KST)
In-reply-to: <1312734133-27727-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: grant.likely@secretlab.ca, ben-linux@fluff.org

Thomas Abraham wrote:
> 
> s3c64xx and higher SoC's include the interrupt mask and pending registers
> in the uart controller, unlike the s3c24xx SoC's which have these
registers
> in the interrupt controller. When the mask and pending registers are part
> of the uart controller, it is easier to manage interrupts with a single
> interrupt rather than having to create 3 seperate tx/rx/err interrupts.
> 
> This patch modifies the tx/rx/err uart interrupt handling for s3c64xx
> SoC's and higher by registering a single interrupt handler. This makes
> it easier to add device tree support as well.
> 
> Suggested-by: Grant Likely <grant.likely@secretlab.ca>
> CC: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> Tested on Exynos4 smdkv310 only. If this approach is acceptable, it will
be
> tested it on s3c64xx and all s5p SoC's (should work on all as the changes
> are generic). This is a bulky patch but it will split into smaller patches
> if the approach is acceptable.
> 
Hi Thomas,

Hmm, could you please test this on other boards before split?
And I need to check whether this is available on s3c24xx SoCs or not...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
