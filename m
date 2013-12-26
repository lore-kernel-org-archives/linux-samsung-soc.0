From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/1] ASoC: Samsung: Trivial cleanups in header files
Date: Thu, 26 Dec 2013 17:29:36 +0900
Message-ID: <000a01cf0214$9c84e3f0$d58eabd0$%han@samsung.com>
References: <1388038289-8953-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:8541 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381Ab3LZI3i (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Dec 2013 03:29:38 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE0025MNLDDY30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Dec 2013 17:29:37 +0900 (KST)
In-reply-to: <1388038289-8953-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@kernel.org>, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, December 26, 2013 3:11 PM, Sachin Kamat wrote:
> 
> commit 5d229ce569be ("ASoC: samsung: move plat/ headers to local directory")
> moved the header files but forgot to clean the pointers to their old locaton.
> Remove them now.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

It looks good.
Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  sound/soc/samsung/regs-ac97.h |    9 ++++-----
>  sound/soc/samsung/regs-iis.h  |    9 ++++-----
>  2 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/samsung/regs-ac97.h b/sound/soc/samsung/regs-ac97.h
> index c3878f7acb83..a71be45bbffc 100644
> --- a/sound/soc/samsung/regs-ac97.h
> +++ b/sound/soc/samsung/regs-ac97.h
> @@ -1,5 +1,4 @@
> -/* arch/arm/mach-s3c2410/include/mach/regs-ac97.h
> - *
> +/*
>   * Copyright (c) 2006 Simtec Electronics <linux@simtec.co.uk>
>   *		http://www.simtec.co.uk/products/SWLINUX/
>   *
> @@ -10,8 +9,8 @@
>   * S3C2440 AC97 Controller
>  */
> 
> -#ifndef __ASM_ARCH_REGS_AC97_H
> -#define __ASM_ARCH_REGS_AC97_H __FILE__
> +#ifndef __SAMSUNG_REGS_AC97_H__
> +#define __SAMSUNG_REGS_AC97_H__
> 
>  #define S3C_AC97_GLBCTRL				(0x00)
> 
> @@ -64,4 +63,4 @@
>  #define S3C_AC97_PCM_DATA				(0x18)
>  #define S3C_AC97_MIC_DATA				(0x1C)
> 
> -#endif /* __ASM_ARCH_REGS_AC97_H */
> +#endif /* __SAMSUNG_REGS_AC97_H__ */
> diff --git a/sound/soc/samsung/regs-iis.h b/sound/soc/samsung/regs-iis.h
> index a18d35e7a735..dc6cbbe9c4f0 100644
> --- a/sound/soc/samsung/regs-iis.h
> +++ b/sound/soc/samsung/regs-iis.h
> @@ -1,5 +1,4 @@
> -/* arch/arm/plat-samsung/include/plat/regs-iis.h
> - *
> +/*
>   * Copyright (c) 2003 Simtec Electronics <linux@simtec.co.uk>
>   *		      http://www.simtec.co.uk/products/SWLINUX/
>   *
> @@ -10,8 +9,8 @@
>   * S3C2410 IIS register definition
>  */
> 
> -#ifndef __ASM_ARCH_REGS_IIS_H
> -#define __ASM_ARCH_REGS_IIS_H
> +#ifndef __SAMSUNG_REGS_IIS_H__
> +#define __SAMSUNG_REGS_IIS_H__
> 
>  #define S3C2410_IISCON			(0x00)
> 
> @@ -67,4 +66,4 @@
> 
>  #define S3C2410_IISFIFO			(0x10)
> 
> -#endif /* __ASM_ARCH_REGS_IIS_H */
> +#endif /* __SAMSUNG_REGS_IIS_H__ */
> --
> 1.7.9.5
