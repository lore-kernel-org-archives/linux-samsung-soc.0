From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 11/17] pwm: samsung: remove s5pc100 related pwm codes
Date: Thu, 03 Jul 2014 14:44:17 +0200
Message-ID: <53B55021.9020307@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
 <1404163947-3105-12-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39434 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbaGCMou (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Jul 2014 08:44:50 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N840067VZEM8IA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jul 2014 13:44:46 +0100 (BST)
In-reply-to: <1404163947-3105-12-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>

Hi Kukjin,

On 30.06.2014 23:32, Kukjin Kim wrote:
> This patch removes supporting s5pc100 related pwm codes.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-samsung.txt |    2 --
>  drivers/clocksource/samsung_pwm_timer.c               |   12 ------------
>  drivers/pwm/pwm-samsung.c                             |    8 --------
>  3 files changed, 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.txt b/Documentation/devicetree/bindings/pwm/pwm-samsung.txt
> index 43925d3..82c7f6b 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-samsung.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.txt
> @@ -11,8 +11,6 @@ Required properties:
>  - compatible : should be one of following:
>      samsung,s3c2410-pwm - for 16-bit timers present on S3C24xx SoCs
>      samsung,s3c6400-pwm - for 32-bit timers present on S3C64xx SoCs
> -    samsung,s5pc100-pwm - for 32-bit timers present on S5PC100, S5PV210,
> -			  Exynos4210 rev0 SoCs

As you can see here, this variant is used for more than S5PC100. It is
needed for S5PV210 and Exynos4210 rev0 SoCs as well. So this patch
should be dropped.

Best regards,
Tomasz
