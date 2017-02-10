From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] arm64: dts: Enable ir-spi in the tm2 and tm2e boards
Date: Fri, 10 Feb 2017 11:04:50 -0300
Message-ID: <287b5f0b-26b2-7811-9305-5194ebf0138a@osg.samsung.com>
References: <CGME20170210022252epcas1p2cad2a32fb74a5ecc17ed73387579c6ab@epcas1p2.samsung.com>
 <20170210022238.12401-1-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:55240
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752116AbdBJOFz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 09:05:55 -0500
In-Reply-To: <20170210022238.12401-1-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>

Hello Andi,

On 02/09/2017 11:22 PM, Andi Shyti wrote:
> Add the device tree node for the ir-spi driver which enable the
> ir led for remote controlling.
> 
> This patch sets first the GPR3[3] gpio line as a regulator-fixed
> for enabling an external regulator which powers the IR LED.
> 
> Removes also the default assignment of GPG3[7] related to the
> MOSI line of the SPI3 bus.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
> Changelog v1 -> v2
> ==================
> v1: https://marc.info/?l=linux-kernel&m=148645523229894&w=2
> 
>  - used 'GPIO_ACTIVE_HIGH' instead of '0'
>  - added back the gpg3-5 gpio initialization related to the SPI3
>    CS line that was erroneously removed
>    
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index 098ad557fee3..4df6b57a0a68 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -106,6 +106,13 @@
>  		};
>  	};
>  
> +	irda_regulator: irda-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpr3 3 GPIO_ACTIVE_HIGH>;
> +		regulator-name = "irda_regulator";

How is this regulator named in the board schematics? My
understanding is that regulator-name should match this.

I don't have access to this so it may be "irda_regulator"
although I was expecting something more like "VDD_IRDA".

Patch looks good to me though:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
