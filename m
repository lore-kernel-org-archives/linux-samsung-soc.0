From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Increase framebuffer virtual size for origen
Date: Tue, 24 Apr 2012 17:38:33 -0700
Message-ID: <4F974789.4010602@samsung.com>
References: <1334314771-10928-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49205 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753626Ab2DYAih (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 20:38:37 -0400
Received: by pbbro12 with SMTP id ro12so752060pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 17:38:37 -0700 (PDT)
In-Reply-To: <1334314771-10928-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Tushar Behera wrote:
> To support display panning, framebuffer virtual size needs to be increased.
> 
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/mach-exynos/mach-origen.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
> index 878d4c9..4d80212 100644
> --- a/arch/arm/mach-exynos/mach-origen.c
> +++ b/arch/arm/mach-exynos/mach-origen.c
> @@ -596,6 +596,8 @@ static struct s3c_fb_pd_win origen_fb_win0 = {
>   	},
>   	.max_bpp		= 32,
>   	.default_bpp		= 24,
> +	.virtual_x		= 1024,
> +	.virtual_y		= 2 * 600,
>   };
> 
>   static struct s3c_fb_platdata origen_lcd_pdata __initdata = {

OK, will apply

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
