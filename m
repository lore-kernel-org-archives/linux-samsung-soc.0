From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4210-trats: add max8997 IRQ
Date: Fri, 14 Mar 2014 18:23:04 +0100
Message-ID: <53233AF8.9020501@samsung.com>
References: <1394792001-7837-1-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:46942 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755341AbaCNRXI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Mar 2014 13:23:08 -0400
In-reply-to: <1394792001-7837-1-git-send-email-r.baldyga@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Robert Baldyga <r.baldyga@samsung.com>, ben-linux@fluff.org, kgene.kim@samsung.com
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com

Hi Robert,

On 14.03.2014 11:13, Robert Baldyga wrote:
> This patch adds device tree node for IRQ used by max8997.
>

Generally, this patch does not add just a node, but rather "IRQ line 
specification for the MAX8997 PMIC chip and necessary pinctrl group to 
configure pull-up and driver strength of the pin".

Also it would be nice to mention a reason for this change, e.g. what can 
be achieved after applying this patch.

Otherwise looks good.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

--
Best regards,
Tomasz

> Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
> ---
>   arch/arm/boot/dts/exynos4210-trats.dts |   13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
> index 1d18428..0e1fc19 100644
> --- a/arch/arm/boot/dts/exynos4210-trats.dts
> +++ b/arch/arm/boot/dts/exynos4210-trats.dts
> @@ -148,6 +148,14 @@
>   		};
>   	};
>
> +	pinctrl@11000000 {
> +		max8997_irq: max8997-irq {
> +			samsung,pins = "gpx0-7";
> +			samsung,pin-pud = <3>;
> +			samsung,pin-drv = <0>;
> +		};
> +	};
> +
>   	i2c@13890000 {
>   		samsung,i2c-sda-delay = <100>;
>   		samsung,i2c-slave-addr = <0x10>;
> @@ -179,6 +187,11 @@
>   		max8997_pmic@66 {
>   			compatible = "maxim,max8997-pmic";
>
> +			pinctrl-0 = <&max8997_irq>;
> +			pinctrl-names = "default";
> +
> +			interrupt-parent = <&gpx0>;
> +			interrupts = <7 0>;
>   			reg = <0x66>;
>
>   			max8997,pmic-buck1-uses-gpio-dvs;
>
