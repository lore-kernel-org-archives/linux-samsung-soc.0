From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos: remove unused init_uarts callback for
 exynos4x12 platforms
Date: Tue, 06 Nov 2012 20:52:37 +0900
Message-ID: <0bfd01cdbc15$37948db0$a6bda910$%kim@samsung.com>
References: <1352125973-24228-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57892 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751903Ab2KFLwj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 06:52:39 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD200N7DEBG4130@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 20:52:37 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD200CH1EBP7B30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 20:52:37 +0900 (KST)
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Kukjin Kim wrote:
> 
> Thomas Abraham wrote:
> >
> > All the Exynos4x12 based platforms use only device tree based boot. So
> > remove
> > the unused 'init_uarts' callback from exynos cpu_ids table.
> >
> > Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> > ---
> >  arch/arm/mach-exynos/common.c |    2 --
> >  1 files changed, 0 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-
> exynos/common.c
> > index 56844d1..ce91cba 100644
> > --- a/arch/arm/mach-exynos/common.c
> > +++ b/arch/arm/mach-exynos/common.c
> > @@ -78,7 +78,6 @@ static struct cpu_table cpu_ids[] __initdata = {
> >  		.idmask		= EXYNOS4_CPU_MASK,
> >  		.map_io		= exynos4_map_io,
> >  		.init_clocks	= exynos4_init_clocks,
> > -		.init_uarts	= exynos_init_uarts,
> >  		.init		= exynos_init,
> >  		.name		= name_exynos4212,
> >  	}, {
> > @@ -86,7 +85,6 @@ static struct cpu_table cpu_ids[] __initdata = {
> >  		.idmask		= EXYNOS4_CPU_MASK,
> >  		.map_io		= exynos4_map_io,
> >  		.init_clocks	= exynos4_init_clocks,
> > -		.init_uarts	= exynos_init_uarts,
> >  		.init		= exynos_init,
> >  		.name		= name_exynos4412,
> >  	}, {
> > --
> > 1.6.6.rc2
> 
> Yes, correct. Applied.
> 
Well...

BTW, exynos4x12 can support non-DT yet so I just reverted this patch.

I think, this can be applied when we support only DT for exynos4 series next
time.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
