From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: dts: Add RTC in exynos5440-ssdk5440 device list
Date: Sat, 19 Jan 2013 11:49:09 +0100
Message-ID: <1986461.4YYQHTpIaN@flatron>
References: <1358571880-24199-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f48.google.com ([74.125.83.48]:47050 "EHLO
	mail-ee0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723Ab3ASKtM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 05:49:12 -0500
Received: by mail-ee0-f48.google.com with SMTP id t10so2182266eei.21
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Jan 2013 02:49:11 -0800 (PST)
In-Reply-To: <1358571880-24199-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.m@samsung.com>

Hi Kukjin,

Just like with

[PATCH] ARM: dts: Add watchdog in exynos5440-ssdk5440 device list 

the commit message is a bit confusing.

Best regards,
Tomasz Figa

On Friday 18 of January 2013 21:04:40 Kukjin Kim wrote:
> From: Giridhar Maruthy <giridhar.m@samsung.com>
> 
> Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440-ssdk5440.dts |    4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> b/arch/arm/boot/dts/exynos5440-ssdk5440.dts index 5239d75..4c411fa
> 100644
> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
> @@ -35,8 +35,4 @@
>  	i2c@100000 {
>  		status = "disabled";
>  	};
> -
> -	rtc {
> -		status = "disabled";
> -	};
>  };
