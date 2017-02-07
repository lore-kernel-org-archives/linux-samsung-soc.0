From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Enable ir-spi in the tm2 and tm2e boards
Date: Tue, 7 Feb 2017 23:12:33 +0200
Message-ID: <20170207211233.ge3fzw5x2fvebpjq@kozik-lap>
References: <CGME20170207081338epcas5p23530ff8663c58f8868a0f9dfa2e19f7a@epcas5p2.samsung.com>
 <20170207081325.9769-1-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170207081325.9769-1-andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 07, 2017 at 05:13:25PM +0900, Andi Shyti wrote:
> Add the device tree node for the ir-spi driver which enable the
> ir led for remote controlling.
> 
> This patch sets first the GPR3[3] gpio line as a regulator-fixed
> for enabling an external regulator which powers the IR LED.
> 
> Removes also the default assignment of the GPG3[5] and GPG3[7]
> related to the SPI3 line.
> 
> Signed-off-by: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 27 ++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 098ad557fee3..c61df2318d8b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -106,6 +106,13 @@
>  		};
>  	};
>  
> +	irda_regulator: irda-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpr3 3 0>;

GPIO_ACTIVE_HIGH

> +		regulator-name = "irda_regulator";
> +	};
> +
>  	sound {
>  		compatible = "samsung,tm2-audio";
>  		audio-codec = <&wm5110>;
> @@ -1073,8 +1080,6 @@
>  
>  		PIN(INPUT, gpg3-0, DOWN, FAST_SR1);
>  		PIN(INPUT, gpg3-1, DOWN, FAST_SR1);
> -		PIN(INPUT, gpg3-5, DOWN, FAST_SR1);
> -		PIN(INPUT, gpg3-7, DOWN, FAST_SR1);

I think gpg3-5 would be missing its configuration. It is not present in
spi3 bus pins. Is it a chip select pin? If you remove the default
configuration, it will still work as input-pull down because no one is
setting different config. Why you need to touch gpg3-5?


Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
