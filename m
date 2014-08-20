From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/5] ARM: dts: remove old USB2 PHY node hook for Arndale
Date: Wed, 20 Aug 2014 20:50:18 +0530
Message-ID: <53F4BCB2.3030709@ti.com>
References: <1408026327-31437-1-git-send-email-b.zolnierkie@samsung.com> <1408026327-31437-2-git-send-email-b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408026327-31437-2-git-send-email-b.zolnierkie@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Felipe Balbi <balbi@ti.com>, Kamil Debski <k.debski@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Mark Brown <broonie@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org



On Thursday 14 August 2014 07:55 PM, Bartlomiej Zolnierkiewicz wrote:
> drivers/usb/phy/phy-samsung-usb2 driver got replaced by
> drivers/phy/phy-samsung-usb2 one.  Remove the leftover hook
> from Arndale dts file.
> 
> Cc: Mark Brown <broonie@linaro.org>
> Cc: Kamil Debski <k.debski@samsung.com>
> Cc: Vivek Gautam <gautam.vivek@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  arch/arm/boot/dts/exynos5250-arndale.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index d0de1f5..dad8f9b 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -570,8 +570,4 @@
>  			connect-gpios = <&gpd1 7 1>;
>  		};
>  	};
> -
> -	usb@12110000 {
> -		usb-phy = <&usb2_phy>;
> -	};
>  };
> 
