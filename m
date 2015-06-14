From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCHv6 2/4] ARM: dts: exynos5422-odroidxu3: Enable TMU at
 Exynos5422 base
Date: Mon, 15 Jun 2015 08:51:10 +0900
Message-ID: <557E136E.7090409@samsung.com>
References: <1434277445-5243-1-git-send-email-linux.amoon@gmail.com>
 <1434277445-5243-2-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52676 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569AbbFNXvT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Jun 2015 19:51:19 -0400
In-reply-to: <1434277445-5243-2-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 14.06.2015 19:24, Anand Moon wrote:
> This changes enables TMU IP block on the Exynos5422 Odroid-XU3
> device.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
> Acked-by: Lukasz Majewski <l.majewski@samsung.com>
> ---
> Changes rebase on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung branch for-next
> Changes from v5: Use LDO7 regulator instead of LD010.
> 
> The output of LDO18 goes to VDD_EMMC_1V8. This is not regulator for TMU.
> 
> I think the schematics are missing some of details but it can be deducted that:
> 1. TEMP SE is supplied by VDD18_TS power domain. It consists of 5
> pairs of pins (XTSTEST_OUT[0-4], XTSEXT_RES[0-4]).
> 2. The VDD18_TS01, VDD18_TS23 and VDD18_TS4 are wired to the LDO7 of
> S2MPS11 PMIC.
> 3. I confirmed with the Exynos5422 datasheet that these
> VDD18_TS{01,23,4} supply the XTSTEST pins (OUT and RES).
> 
> So the LDO7 it is... but before using it there is a caveat. The LDO7
> is also connected to VDD of MIPI, HDMI and few more. So when you use
> this regulator in TMU it may be turned off by TMU driver (e.g. during
> unbind). In such case these other blocks also should be tested and
> checked whether they take this regulator and enable it.

Why did you took my email and pasted it here?
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/343702.html

It is written now in first person so it pretends that you wrote this.
You are actually doing this for second time - taking my
reply and putting into commit message or changelog. Why?

And where is proper changelog?

Krzysztof

> ---
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index a2f9941..b6570fc 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -474,6 +474,31 @@
>  	status = "okay";
>  };
>  
> +&tmu_cpu0 {
> +	vtmu-supply = <&ldo7_reg>;
> +	status = "okay";
> +};
> +
> +&tmu_cpu1 {
> +	vtmu-supply = <&ldo7_reg>;
> +	status = "okay";
> +};
> +
> +&tmu_cpu2 {
> +	vtmu-supply = <&ldo7_reg>;
> +	status = "okay";
> +};
> +
> +&tmu_cpu3 {
> +	vtmu-supply = <&ldo7_reg>;
> +	status = "okay";
> +};
> +
> +&tmu_gpu {
> +	vtmu-supply = <&ldo7_reg>;
> +	status = "okay";
> +};
> +
>  &rtc {
>  	status = "okay";
>  	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
> 
