From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3] ARM: dts: Add SPI CS on exynos5250-snow
Date: Wed, 29 Jul 2015 09:57:29 +0900
Message-ID: <041501d0c999$8af92f30$a0eb8d90$@kernel.org>
References: <a5054dfad3d48c582b062b0536125c9bcff41f31.1438027526.git.hramrach@gmail.com>
 <e1952e8c102a3b7a7f3f79c759c44093e0d11dc7.1438073049.git.hramrach@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49986 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751232AbbG2A5b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jul 2015 20:57:31 -0400
In-reply-to: <e1952e8c102a3b7a7f3f79c759c44093e0d11dc7.1438073049.git.hramrach@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Michal Suchanek' <hramrach@gmail.com>, 'Rob Herring' <robh+dt@kernel.org>, 'Pawel Moll' <pawel.moll@arm.com>, 'Mark Rutland' <mark.rutland@arm.com>, 'Ian Campbell' <ijc+devicetree@hellion.org.uk>, 'Kumar Gala' <galak@codeaurora.org>, 'Russell King' <linux@arm.linux.org.uk>, 'Kukjin Kim' <kgene@kernel.org>, 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Michal Suchanek wrote:
> 
> Although there is only one choice of chipselect it is necessary to
> specify it. The driver cannot claim the gpio otherwise.
> 
> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
> Acked-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 

>From here ---8<--------8<-----------

> --
>  - don't move unrelated line
>  - use symbolic GPIO_ACTIVE_HIGH

to here  ---8<--------8<-----------

should be added under the following '---'.

Please add some additional comments like above 'changes since previous version'
under the following '---' not '--', because all comments will be logged before
the '---' and I don't want to keep the changes basically.

Anyway, applied with removing above comments.

Thanks,
Kukjin

> ---
>  arch/arm/boot/dts/exynos5250-snow.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
> index b7f4122..2d6a976 100644
> --- a/arch/arm/boot/dts/exynos5250-snow.dts
> +++ b/arch/arm/boot/dts/exynos5250-snow.dts
> @@ -688,6 +688,7 @@
>  	status = "okay";
>  	samsung,spi-src-clk = <0>;
>  	num-cs = <1>;
> +	cs-gpios = <&gpa2 5 GPIO_ACTIVE_HIGH>;
>  };
> 
>  &usbdrd_dwc3 {
> --
> 2.1.4
