From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: Add Samsung G2D DT bindings documentation
Date: Thu, 14 Feb 2013 00:17:14 +0100
Message-ID: <104679815.9jiIT0ld5D@flatron>
References: <1360151477-26460-1-git-send-email-sachin.kamat@linaro.org> <1360151477-26460-8-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f180.google.com ([74.125.82.180]:46131 "EHLO
	mail-we0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965136Ab3BMXWd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 18:22:33 -0500
Received: by mail-we0-f180.google.com with SMTP id k14so1430198wer.39
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Feb 2013 15:22:31 -0800 (PST)
In-Reply-To: <1360151477-26460-8-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, s.nawrocki@samsung.com, inki.dae@samsung.com, patches@linaro.org

Hi Sachin,

On Wednesday 06 of February 2013 17:21:17 Sachin Kamat wrote:
> Added documentaion about G2D bindings.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/gpu/samsung-g2d.txt        |   30
> ++++++++++++++++++++ 1 files changed, 30 insertions(+), 0 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt new file mode
> 100644
> index 0000000..838b26b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> @@ -0,0 +1,30 @@
> +* Samsung 2D Graphics Accelerator
> +
> +Samsung FIMG2D is a 2D graphics accelerator which supports Bit Block
> Transfer. +We set the drawing-context registers for configuring the
> rendering parameters +and then start rendering.
> +The G2D has V4L2 as well as DRM framework based driver support.
> +
> +Required properties:
> +  - compatible : value should be one among the following
> +	(a) "samsung,s5pv210-g2d" for G2D IP present in S5PV210 & Exynos4210
> SoC +	(b) "samsung,exynos4212-g2d" for G2D IP present in Exynos4x12
> SoCs +	(b) "samsung,exynos5250-g2d" for G2D IP present in Exynos5250
> SoC +
> +  - reg : Physical base address of the IP registers and length of
> memory +	  mapped region.
> +
> +  - interrupts : G2D interrupt number to the CPU.
> +
> +Optional properties:
> +  - samsung,power-domain : power-domain property defined with a phandle
> +			   to respective power domain.

I'm not sure if samsung,power-domain should be mentioned in this 
documentation file. The driver itself does not use this property.

Otherwise looks fine.

Best regards,
Tomasz

> +
> +Example:
> +	g2d@12800000 {
> +		compatible = "samsung,s5pv210-g2d";
> +		reg = <0x12800000 0x1000>;
> +		interrupts = <0 89 0>;
> +		samsung,power-domain = <&pd_lcd0>;
> +		status = "disabled";
> +	};
