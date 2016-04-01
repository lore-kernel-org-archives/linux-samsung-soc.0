From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 04/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Trats2 board
Date: Fri, 01 Apr 2016 17:17:16 +0900
Message-ID: <56FE2E8C.3060107@samsung.com>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
 <1459493874-2366-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1459493874-2366-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01.04.2016 15:57, Krzysztof Kozlowski wrote:
> Fix following DTC warnings in Trats2 board:
> 
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
> Warning (unit_address_vs_reg): Node /i2c-gpio-1/max77693@66/regulators/ESAFEOUT1@1 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c-gpio-1/max77693@66/regulators/ESAFEOUT2@2 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c-gpio-1/max77693@66/regulators/CHARGER@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /thermistor-ap@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /thermistor-battery@1 has a unit name, but no reg property
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4412-trats2.dts | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
> index 2bf363c3bf62..523627003738 100644
> --- a/arch/arm/boot/dts/exynos4412-trats2.dts
> +++ b/arch/arm/boot/dts/exynos4412-trats2.dts
> @@ -29,7 +29,7 @@
>  		i2c12 = &i2c_max77693_fuel;
>  	};
>  
> -	memory {
> +	mmemory@40000000 {
>  		reg =  <0x40000000 0x40000000>;
>  	};

Nope, beside obvious typo here, this is bad. This causes creation of
duplicated memory nodes, one coming from skeleton and one from here.

Rob,
How the 'memory' node warning should be fixed?


Best regards,
Krzysztof
