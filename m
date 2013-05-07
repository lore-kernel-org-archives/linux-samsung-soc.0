From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2 2/3] ARM: dts: add Exynos audio subsystem clock
 controller node
Date: Tue, 07 May 2013 11:54:20 +0200
Message-ID: <2829319.bZPJnVErnQ@amdc1227>
References: <1367909016-19657-1-git-send-email-padma.v@samsung.com>
 <1367909016-19657-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12203 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751365Ab3EGJym (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 May 2013 05:54:42 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MMF00EJWA6GZIR0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 May 2013 18:54:40 +0900 (KST)
In-reply-to: <1367909016-19657-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org

Hi Padmavathi,

On Tuesday 07 of May 2013 12:13:35 Padmavathi Venna wrote:
> Audio subsystem introduced in s5pv210 and exynos platforms
> which has a internal clock controller. This patch adds a node
> for the same on exynos5250.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index 36c9d8d..7026de0 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -72,6 +72,12 @@
>  		#clock-cells = <1>;
>  	};
> 
> +	clock_audss: audss-clock-controller@0x03810000 {

Just a nitpick: this should be @3810000, without the 0x and leading zeroes.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework

> +		compatible = "samsung,exynos5250-audss-clock";
> +		reg = <0x03810000 0x0C>;
> +		#clock-cells = <1>;
> +	};
> +
>  	gic:interrupt-controller@10481000 {
>  		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>  		#interrupt-cells = <3>;
