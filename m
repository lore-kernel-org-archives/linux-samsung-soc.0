From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 07/22] ARM: Exynos4210: Remove '0x's from Exynos4110
 DTSI file
Date: Wed, 24 Jul 2013 16:03:55 +0200
Message-ID: <6156493.tCYrm4xD5A@amdc1227>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org>
 <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
 <20130724123931.GL26801@laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56071 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986Ab3GXOEC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 10:04:02 -0400
In-reply-to: <20130724123931.GL26801@laptop>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Wednesday 24 of July 2013 13:39:31 Lee Jones wrote:
> ... for the sake of consistency and assumed convention.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi index b7f358a..53e2527 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -72,7 +72,7 @@
>                 };
>         };
> 
> -       clock: clock-controller@0x10030000 {
> +       clock: clock-controller@10030000 {
>                 compatible = "samsung,exynos4210-clock";
>                 reg = <0x10030000 0x20000>;
>                 #clock-cells = <1>;

Looks good to me, except the subject which is still wrong - 
s/Exynos4110/Exynos4210/.

I guess it might be fixed when applying, though.

Best regards,
Tomasz
