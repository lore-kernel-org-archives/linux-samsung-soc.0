From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: dts: fix tick and alarm inq numbers for exynos5440
Date: Sun, 20 Jan 2013 09:30:52 +0530
Message-ID: <CAK9yfHxGS1EunwNpjQfAsBXR6FsYuwXjV0PQqd_NP=rgL6Qasg@mail.gmail.com>
References: <1358571422-21832-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35022 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054Ab3ATEAx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 23:00:53 -0500
Received: by mail-ob0-f178.google.com with SMTP id eh20so4919957obb.37
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Jan 2013 20:00:52 -0800 (PST)
In-Reply-To: <1358571422-21832-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.m@samsung.com>

typo in patch title s/inq/irq


On 19 January 2013 10:27, Kukjin Kim <kgene.kim@samsung.com> wrote:
> From: Giridhar Maruthy <giridhar.m@samsung.com>
>
> The interrupts for RTC tick and alarm interrupt were swapped.
> Has been fixed here.
>
> Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5440.dtsi |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
> index 25f0fa6..5f3562a 100644
> --- a/arch/arm/boot/dts/exynos5440.dtsi
> +++ b/arch/arm/boot/dts/exynos5440.dtsi
> @@ -154,6 +154,6 @@
>         rtc {
>                 compatible = "samsung,s3c6410-rtc";
>                 reg = <0x130000 0x1000>;
> -               interrupts = <0 16 0>, <0 17 0>;
> +               interrupts = <0 17 0>, <0 16 0>;
>         };
>  };
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With warm regards,
Sachin
