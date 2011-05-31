From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Tue, 31 May 2011 11:07:05 +0100
Message-ID: <20110531100705.GC7067@opensource.wolfsonmicro.com>
References: <1306820436-16569-1-git-send-email-giridhar.maruthy@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51084 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752675Ab1EaKHH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 May 2011 06:07:07 -0400
Content-Disposition: inline
In-Reply-To: <1306820436-16569-1-git-send-email-giridhar.maruthy@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Giridhar Maruthy <giridhar.maruthy@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, angus.ainslie@linaro.org, kgene.kim@samsung.com, samsung@lists.linaro.org, jassisinghbrar@gmail.com, lrg@slimlogic.co.uk

On Tue, May 31, 2011 at 11:10:36AM +0530, Giridhar Maruthy wrote:

> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -12,6 +12,7 @@ if ARCH_EXYNOS4
>  config CPU_EXYNOS4210
>  	bool
>  	select S3C_PL330_DMA
> +	select I2C_S3C2410 if MFD_WM8994
>  	help
>  	  Enable EXYNOS4210 CPU support
>  

No, this is all due to the audio machine.  Put this in the individual
boards or in the audio driver.
