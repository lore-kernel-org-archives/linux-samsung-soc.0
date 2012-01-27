From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Fix
 "warning: initialization from incompatible pointer type"
Date: Fri, 27 Jan 2012 17:15:49 +0900
Message-ID: <01b301ccdccb$e0caca40$a2605ec0$%kim@samsung.com>
References: <1325984332-32146-1-git-send-email-jhbird.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56349 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752187Ab2A0IPu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jan 2012 03:15:50 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYG000Y26VJS2M0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 17:15:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYG006Z06YDZ430@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 17:15:49 +0900 (KST)
In-reply-to: <1325984332-32146-1-git-send-email-jhbird.choi@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jhbird.choi@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Russell King' <linux@arm.linux.org.uk>

jhbird.choi@samsung.com wrote:
> 
> From: Jonghwan Choi <jhbird.choi@samsung.com>
> 
> Fix the wrong function prototype.
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---
>  arch/arm/mach-exynos/pm.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index c4f792d..db33f47 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -205,7 +205,7 @@ static void exynos4_pm_prepare(void)
> 
>  }
> 
> -static int exynos4_pm_add(struct device *dev)
> +static int exynos4_pm_add(struct device *dev, struct subsys_interface *sif)
>  {
>  	pm_cpu_prep = exynos4_pm_prepare;
>  	pm_cpu_sleep = exynos4_cpu_suspend;
> --
> 1.7.1

Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
