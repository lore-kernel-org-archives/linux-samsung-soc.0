From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos5420/5250: add ADC device tree node
Date: Mon, 26 Aug 2013 02:43:35 +0900
Message-ID: <521A4247.9000900@samsung.com>
References: <1377166691-5118-1-git-send-email-ch.naveen@samsung.com> <1377244952-25493-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1377244952-25493-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, naveenkrishna.ch@gmail.com, rob.herring@calxeda.com
List-Id: linux-samsung-soc@vger.kernel.org

On 08/23/13 17:02, Naveen Krishna Chatradhi wrote:
> Add ADC device tree node for exynos5420 and exynos5250
>
> Signed-off-by: Naveen Krishna Chatradhi<ch.naveen@samsung.com>
> Signed-off-by: Doug Anderson<dianders@chromium.org>
> ---
>
> Added recipients accordingly,
> ./scripts/get_maintainer.pl  -f of the modified files
>
>   arch/arm/boot/dts/exynos5250.dtsi |   11 +++++++++++
>   arch/arm/boot/dts/exynos5420.dtsi |   11 +++++++++++
>   2 files changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 1eec646..518f8cd 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -641,4 +641,15 @@
>   		clocks =<&clock 133>,<&clock 339>;
>   		clock-names = "sclk_fimd", "fimd";
>   	};
> +
> +	adc: adc@12D10000 {
> +		compatible = "samsung,exynos-adc-v1";
> +		reg =<0x12D10000 0x100>,<0x10040718 0x4>;
> +		interrupts =<0 106 0>;
> +		clocks =<&clock 303>;
> +		clock-names = "adc";
> +		#io-channel-cells =<1>;
> +		io-channel-ranges;
> +		status = "disabled";
> +	};
>   };
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 5353e32..0c5c055 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -218,4 +218,15 @@
>   		clocks =<&clock 147>,<&clock 421>;
>   		clock-names = "sclk_fimd", "fimd";
>   	};
> +
> +	adc: adc@12D10000 {
> +		compatible = "samsung,exynos-adc-v2";
> +		reg =<0x12D10000 0x100>,<0x10040720 0x4>;
> +		interrupts =<0 106 0>;
> +		clocks =<&clock 270>;
> +		clock-names = "adc";
> +		#io-channel-cells =<1>;
> +		io-channel-ranges;
> +		status = "disabled";
> +	};
>   };

Looks good to me, applied.

Thanks,
Kukjin
