From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: EXYNOS: Add G2D related clock entries for SMDK4X12
Date: Fri, 13 Jul 2012 22:41:19 +0900
Message-ID: <118801cd60fd$2f3cd280$8db67780$%kim@samsung.com>
References: <1337314071-15305-1-git-send-email-sachin.kamat@linaro.org>
 <1337314071-15305-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30809 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185Ab2GMNl5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jul 2012 09:41:57 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7300HTWQ0QZOR0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 22:41:21 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7300AMDQ0W1F60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 13 Jul 2012 22:41:20 +0900 (KST)
In-reply-to: <1337314071-15305-3-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Adds G2D related clock entries for SMDK4X12 boards.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/clock-exynos4212.c |   41
> +++++++++++++++++++++++++++++-
>  1 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos4212.c b/arch/arm/mach-
> exynos/clock-exynos4212.c
> index da397d2..fdc26ac 100644
> --- a/arch/arm/mach-exynos/clock-exynos4212.c
> +++ b/arch/arm/mach-exynos/clock-exynos4212.c
> @@ -68,12 +68,45 @@ static struct clksrc_clk clk_mout_mpll_user = {
>  	.reg_src	= { .reg = EXYNOS4_CLKSRC_CPU, .shift = 24, .size =
> 1 },
>  };
> 
> +static struct clksrc_clk exynos4_clk_mout_g2d0 = {

Same as previous comments, 'exynos4212_clk_mout_g2d0' is better here, or
exynos4x12_clk_mout_g2d0.

[snip]...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
