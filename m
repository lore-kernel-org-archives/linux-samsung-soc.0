From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add watchdog in exynos5440-ssdk5440 device list
Date: Sat, 19 Jan 2013 11:40:51 +0100
Message-ID: <1793091.ko9ZbaznTT@flatron>
References: <1358571651-22020-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:44109 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723Ab3ASKkw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 05:40:52 -0500
Received: by mail-ee0-f51.google.com with SMTP id d17so2089098eek.24
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Jan 2013 02:40:51 -0800 (PST)
In-Reply-To: <1358571651-22020-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.m@samsung.com>

Hi Kukjin,

The commit message is a bit confusing, because it says that something is 
being added, while in fact the whole node is being removed.

Shouldn't it rather say something like:
ARM: dts: exynos5440-ssdk5440: Remove disabled status from watchdog node

Best regards,
Tomasz Figa

On Friday 18 of January 2013 21:00:51 Kukjin Kim wrote:
> From: Giridhar Maruthy <giridhar.m@samsung.com>
> 
> Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440-ssdk5440.dts |    4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> b/arch/arm/boot/dts/exynos5440-ssdk5440.dts index 81e2c96..5239d75
> 100644
> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> @@ -36,10 +36,6 @@
>  		status = "disabled";
>  	};
> 
> -	watchdog {
> -		status = "disabled";
> -	};
> -
>  	rtc {
>  		status = "disabled";
>  	};
