From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 11/11] dt: Exynos: add Snow SPI NOR node.
Date: Thu, 04 Jun 2015 11:04:18 +0900
Message-ID: <556FB222.2070406@samsung.com>
References: <cover.1433364398.git.hramrach@gmail.com>
 <3234c12c90eabbeeb6d33604a324231937e309ec.1433364398.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30110 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750856AbbFDCEZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 22:04:25 -0400
In-reply-to: <3234c12c90eabbeeb6d33604a324231937e309ec.1433364398.git.hramrach@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michal Suchanek <hramrach@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Alison Chaiken <alison_chaiken@mentor.com>, Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>, Knut Wohlrab <knut.wohlrab@de.bosch.com>, =?UTF-8?B?IkJlYW4gSHVvIOmcjeaWjOaWjCAoYmVhbmh1byki?= <beanhuo@micron.c>

On 04.06.2015 06:26, Michal Suchanek wrote:
> The Snow has onboard SPI NOR flash which contains the bootloader.
> 
> Add DT node for this flash chip. The flash is rated 133MHz but the pl330
> controller can transfer only up to 128 bytes at this speed so use more
> conservative settings. Even at 40MHz pl330 can transfer at most 64k with
> the current driver.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index 1fa72cf..38e4cda 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -691,6 +691,18 @@
>  	num-cs = <1>;
>  	cs-gpios = <&gpa2 5 0>;
>  	status = "okay";
> +		flash: m25p80@0 {

The indentation looks odd. This should be at the same level as "status".

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "jedec,spi-nor";
> +			reg = <0>;
> +			spi-max-frequency = <40000000>;

So actually you wanted 133 MHz but as a workaround for DMA issue you use
40 MHz, right? Could you add here a small TODO note in comment about it?

Best regards,
Krzysztof
