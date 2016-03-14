From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 08/10] ARM: dts: Add rtc and adc dt node for
 exynos3250-artik5 module
Date: Mon, 14 Mar 2016 16:12:34 +0900
Message-ID: <56E66462.9000402@samsung.com>
References: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
 <1457921056-21257-10-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:21670 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754792AbcCNHMm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2016 03:12:42 -0400
In-reply-to: <1457921056-21257-10-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

On 14.03.2016 11:04, Chanwoo Choi wrote:
> This patch adds the RTC (Real Time Clock) and ADC (Analog Digital Converter)
> Device Tree node for exynos3250-artik5 module. The RTC is used for wakeup
> source and the ADC is used to read the analog data such as battery temperature.
> 
> ADC need to connect the some H/W device such as battery. So, this patch just
> adds the default setting (clock, regulator).
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> index 877e4827df83..673883fda480 100644
> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
> @@ -48,6 +48,12 @@
>  	};
>  };
>  
> +&adc {
> +	vdd-supply = <&ldo7_reg>;
> +	assigned-clocks = <&cmu CLK_SCLK_TSADC>;
> +	assigned-clock-rates = <6000000>;
> +};

No thermistors, status non-okay. What is provided here?

> +
>  &cpu0 {
>  	cpu0-supply = <&buck2_reg>;
>  };
> @@ -319,6 +325,12 @@
>  	status = "okay";
>  };
>  
> +&rtc {
> +	clocks = <&cmu CLK_RTC>, <&s2mps14_osc S2MPS11_CLK_AP>;
> +	clock-names = "rtc", "rtc_src";
> +	status = "okay";
> +};

Same comment as for previous patch - just squash it. Splitting brings no
benefits and makes it more difficult to see bigger picture.

BR,
Krzysztof

> +
>  &xusbxti {
>  	clock-frequency = <24000000>;
>  };
> 
