From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 3/4] ARM: dts: Add Ethernet chip to SMDK5410
Date: Tue, 27 Oct 2015 09:45:14 +0530
Message-ID: <562EFA52.1060202@samsung.com>
References: <cover.1445859834.git.p.fedin@samsung.com>
 <e98a08b6576931ee935dbfd539839fb857c01e4f.1445859834.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43655 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752006AbbJ0EO6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Oct 2015 00:14:58 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWV02YXJ2GWE1D0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Oct 2015 13:14:56 +0900 (KST)
In-reply-to: <e98a08b6576931ee935dbfd539839fb857c01e4f.1445859834.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>

Hi Pavel,

On Monday 26 October 2015 05:17 PM, Pavel Fedin wrote:
> The chip is smsc9115, connected via SROMc bank 3. Additionally, some GPIO
> initialization is required.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5410-smdk5410.dts | 42 +++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5410-smdk5410.dts b/arch/arm/boot/dts/exynos5410-smdk5410.dts
> index cebeaab..154e37b 100644
> --- a/arch/arm/boot/dts/exynos5410-smdk5410.dts
> +++ b/arch/arm/boot/dts/exynos5410-smdk5410.dts
> @@ -35,6 +35,17 @@
>   		reg = <0x02037000 0x1000>;
>   	};
>
> +	etherhet@07000000 {

%s/etherhet/ethernet/

> +		compatible = "smsc,lan9115";
> +		reg = <0x07000000 0x10000>;
> +		phy-mode = "mii";
> +		interrupt-parent = <&gpx0>;
> +		interrupts = <5 8>;
> +		reg-io-width = <2>;
> +		smsc,irq-push-pull;
> +		smsc,force-internal-phy;
> +	};
> +
>   };
>
>   &mmc_0 {
> @@ -61,6 +72,27 @@
>   	disable-wp;
>   };
>
> +&pinctrl_0 {
> +	srom_ctl: srom-ctl {
> +		samsung,pins = "gpy0-3", "gpy0-4", "gpy0-5",
> +			       "gpy1-0", "gpy1-1", "gpy1-2", "gpy1-3";
> +		samsung,pin-function = <2>;
> +		samsung,pin-drv = <0>;
> +	};
> +
> +	srom_ebi: srom-ebi {
> +		samsung,pins = "gpy3-0", "gpy3-1", "gpy3-2", "gpy3-3",
> +			       "gpy3-4", "gpy3-5", "gpy3-6", "gpy3-7",
> +			       "gpy5-0", "gpy5-1", "gpy5-2", "gpy5-3",
> +			       "gpy5-4", "gpy5-5", "gpy5-6", "gpy5-7",
> +			       "gpy6-0", "gpy6-1", "gpy6-2", "gpy6-3",
> +			       "gpy6-4", "gpy6-5", "gpy6-6", "gpy6-7";
> +		samsung,pin-function = <2>;
> +		samsung,pin-pud = <3>;
> +		samsung,pin-drv = <0>;
> +	};
> +};
> +
>   &uart0 {
>   	status = "okay";
>   };
> @@ -72,3 +104,13 @@
>   &uart2 {
>   	status = "okay";
>   };
> +
> +&sromc_0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&srom_ctl>, <&srom_ebi>;
> +	bank@3 {
> +		bank = <3>;
> +		width = <2>;
> +		srom-timing = <1 9 12 1 9 1 1>;
> +	};
> +};
>

Thanks,
Pankaj Dubey
