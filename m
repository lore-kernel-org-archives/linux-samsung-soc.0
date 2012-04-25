From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RFC] ARM: SAMSUNG: devs: Use common macro to define resources
Date: Tue, 24 Apr 2012 17:01:07 -0700
Message-ID: <4F973EC3.9010901@samsung.com>
References: <1335258206-5937-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:58239 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756950Ab2DYABK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 20:01:10 -0400
Received: by dadz8 with SMTP id z8so1558185dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 17:01:10 -0700 (PDT)
In-Reply-To: <1335258206-5937-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk

Tushar Behera wrote:
> CC: Kukjin Kim<kgene.kim@samsung.com>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
> I am not sure whether changes like this are accepted as independent patches,
> as they are not changing the behaviour of the code at all.
> 
Yeah, makes sense. will apply in my cleanup branch.

> I have a patchset doing similar clean up in various Samsung related arch files.
> If changes like this are acceptable, I will post the complete patchset.
> 
OK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

>   arch/arm/plat-samsung/devs.c |   12 ++----------
>   1 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index db32ec5..1013a34 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -272,16 +272,8 @@ struct platform_device s5p_device_fimc3 = {
> 
>   #ifdef CONFIG_S5P_DEV_G2D
>   static struct resource s5p_g2d_resource[] = {
> -	[0] = {
> -		.start	= S5P_PA_G2D,
> -		.end	= S5P_PA_G2D + SZ_4K - 1,
> -		.flags	= IORESOURCE_MEM,
> -	},
> -	[1] = {
> -		.start	= IRQ_2D,
> -		.end	= IRQ_2D,
> -		.flags	= IORESOURCE_IRQ,
> -	},
> +	[0] = DEFINE_RES_MEM(S5P_PA_G2D, SZ_4K),
> +	[1] = DEFINE_RES_IRQ(IRQ_2D),
>   };
> 
>   struct platform_device s5p_device_g2d = {
