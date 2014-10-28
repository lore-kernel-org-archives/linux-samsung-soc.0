From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v2] ARM: dts: exynos4412-trats: Add micro SD card SDHCI node
Date: Tue, 28 Oct 2014 19:57:40 +0900
Message-ID: <047101cff29d$fdedc880$f9c95980$@kernel.org>
References: <1414421995-22618-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65366 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751190AbaJ1K5m (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Oct 2014 06:57:42 -0400
In-reply-to: <1414421995-22618-1-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>

Krzysztof Kozlowski wrote:
> 
Hi,

> Add SDHCI node for supporting the micro SD card. On Trats2 board the
> SDHCI does not use sd2_cd pins (gpk2-2) for card detect but gpx3-4
> instead.
> 
> Power is supplied from LDO21 regulator which in off state is controlled
> by external GPIO pin.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---
> 
> Changes since v1:
> 1. Drop FIXME comment (about findings during testing).
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index a5aa52bba72c..7a68e0832cd6 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -603,6 +603,16 @@
>  		cap-mmc-highspeed;
>  	};
> 
> +	sdhci@12530000 {
> +		bus-width = <4>;
> +		cd-gpios = <&gpx3 4 0>;
> +		cd-inverted;
> +		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4>;
> +		pinctrl-names = "default";
> +		vmmc-supply = <&ldo21_reg>;
> +		status = "okay";
> +	};
> +
>  	serial@13800000 {
>  		status = "okay";
>  	};
> --
> 1.9.1

Looks good to me, will apply.

Thanks,
Kukjin
