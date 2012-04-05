From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/4] ARM: EXYNOS: Hook up power domains to generic power
 domain infrastructure (part 2)
Date: Thu, 05 Apr 2012 18:50:10 +0200
Message-ID: <201204051850.10213.b.zolnierkie@samsung.com>
References: <1330505255-25587-1-git-send-email-b.zolnierkie@samsung.com>
 <076701ccf75f$8c217b20$a4647160$%kim@samsung.com>
 <201203061611.52908.b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13272 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211Ab2DEQuf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 12:50:35 -0400
In-reply-to: <201203061611.52908.b.zolnierkie@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, rjw@sisk.pl, 'Kyungmin Park' <kyungmin.park@samsung.com>

On Tuesday 06 March 2012 16:11:52 Bartlomiej Zolnierkiewicz wrote:
> On Thursday 01 March 2012 04:58:23 Kukjin Kim wrote:
> > Bartlomiej Zolnierkiewicz wrote:
> > > 
> > > * Add support of enabling/disabling modules in S5P_CLKGATE_BLOCK register.
> > 
> > NO. I remember, we talked about this before and I'm still thinking it should
> > be handled independently.
> 
> OK, here is only the cleanup part.  Unfortunately I couldn't find
> the previous discussion regarding S5P_CLKGATE_BLOCK register handling
> on the public mailing lists so could you please describe how it
> should be done properly?
> 
> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung Poland R&D Center
> 
> 
> From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Subject: [PATCH] ARM: EXYNOS: Remove leftovers of the Samsung specific power domain control

ping?

Could I get this patch merged please.

> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rafael J. Wysocki <rjw@sisk.pl>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> 
>  arch/arm/mach-exynos/mach-nuri.c           |    1 
>  arch/arm/mach-exynos/mach-origen.c         |    1 
>  arch/arm/mach-exynos/mach-smdkv310.c       |    1 
>  arch/arm/mach-exynos/mach-universal_c210.c |    1 
>  arch/arm/plat-samsung/Kconfig              |    8 --
>  arch/arm/plat-samsung/Makefile             |    4 -
>  arch/arm/plat-samsung/include/plat/devs.h  |    1 
>  arch/arm/plat-samsung/include/plat/pd.h    |   30 ---------
>  arch/arm/plat-samsung/pd.c                 |   95 -----------------------------
>  9 files changed, 142 deletions(-)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung Poland R&D Center
