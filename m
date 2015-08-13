From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4412-odroidu3: Enable SPI1.
Date: Thu, 13 Aug 2015 09:38:10 +0900
Message-ID: <55CBE6F2.9030405@samsung.com>
References: <1439378871-28117-1-git-send-email-aballier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:8776 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750953AbbHMAiP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 20:38:15 -0400
In-reply-to: <1439378871-28117-1-git-send-email-aballier@gentoo.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexis Ballier <aballier@gentoo.org>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On 12.08.2015 20:27, Alexis Ballier wrote:
> SPI1 is available on IO Port #2 (as depicted on their website) in
> PCB Revision 0.5 of Hardkernel Odroid U3 board.
> The shield connects a 256KiB spi-nor flash on that bus.
> 
> Signed-off-by: Alexis Ballier <aballier@gentoo.org>
> ---
>  arch/arm/boot/dts/exynos4412-odroidu3.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-odroidu3.dts b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> index 44684e5..37698e4 100644
> --- a/arch/arm/boot/dts/exynos4412-odroidu3.dts
> +++ b/arch/arm/boot/dts/exynos4412-odroidu3.dts
> @@ -61,3 +61,10 @@
>  		"Speakers", "SPKL",
>  		"Speakers", "SPKR";
>  };
> +
> +&spi_1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi1_bus>;
> +	cs-gpios = <&gpb 5 0>;

Please use GPIO_ACTIVE_HIGH.

Best regards,
Krzysztof

> +	status = "okay";
> +};
> 
