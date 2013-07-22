From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 07/22] ARM: exynos: Remove '0x's from Exynos4110 DTSI file
Date: Mon, 22 Jul 2013 21:25:35 +0200
Message-ID: <2350088.9z671SCjFz@flatron>
References: <1374490361-25769-1-git-send-email-lee.jones@linaro.org> <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374490361-25769-7-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de, linus.walleij@stericsson.com, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Lee,

On Monday 22 of July 2013 11:52:26 Lee Jones wrote:
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210.dtsi
> b/arch/arm/boot/dts/exynos4210.dtsi index b7f358a..53e2527 100644
> --- a/arch/arm/boot/dts/exynos4210.dtsi
> +++ b/arch/arm/boot/dts/exynos4210.dtsi
> @@ -72,7 +72,7 @@
>  		};
>  	};
> 
> -	clock: clock-controller@0x10030000 {
> +	clock: clock-controller@10030000 {
>  		compatible = "samsung,exynos4210-clock";
>  		reg = <0x10030000 0x20000>;
>  		#clock-cells = <1>;

This looks fine, but please fix commit message - it should be Exynos4210. 
Also some explanation why this change is needed would be good, even if 
it's obvious.

Best regards,
Tomasz
