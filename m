From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH RESEND v2 2/2] ARM: EXYNOS: Add gscaler device from DT
Date: Mon, 16 Jul 2012 22:33:45 +0200
Message-ID: <50047AA9.4000608@gmail.com>
References: <1342416803-30809-1-git-send-email-shaik.ameer@samsung.com> <1342416803-30809-3-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:55323 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753125Ab2GPUdt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 16:33:49 -0400
Received: by bkwj10 with SMTP id j10so5107373bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Jul 2012 13:33:48 -0700 (PDT)
In-Reply-To: <1342416803-30809-3-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, sachin.kamat@linaro.org, joshi@samsung.com, ameersk@gmail.com

Hi Shaik,

On 07/16/2012 07:33 AM, Shaik Ameer Basha wrote:
> +++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
> @@ -0,0 +1,16 @@
> +* Samsung Exynos5 Gscaler device
> +
> +Gscaler is used for scaling and color space conversion on EXYNOS5 SoCs.
> +
> +Required properties:
> +- compatible: should be "samsung,exynos-gsc"

Shouldn't there rather be a specific "compatible" property for each SoC,
e.g.
    - compatible: should be one of:
	"samsung5250,exynos-gsc",
	"samsung5450,exynos-gsc",
etc. ?

> +- reg: should contian Gsaler physical address location and length.

contian -> contain, Gsaler -> Gscaler

> +- interrupts: should contain Gscaler interrupt number
> +
> +Example:
> +
> +gsc_0:  gsc@0x13e00000 {
> +	compatible = "samsung,exynos-gsc";

	compatible = "samsung5250,exynos-gsc";

> +	reg =<0x13e00000 0x1000>;
> +	interrupts =<0 85 0>;
> +};

The aliases are still undocumented. How about adding something
along the lines of:

"Each Gscaler node should have a numbered alias in the aliases node,
in the form of gscN, N = 0...3."

?

> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index 4272b29..b945c00 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -23,6 +23,13 @@
>   	compatible = "samsung,exynos5250";
>   	interrupt-parent =<&gic>;
>
> +	aliases {
> +		gsc0 =&gsc_0;
> +		gsc1 =&gsc_1;
> +		gsc2 =&gsc_2;
> +		gsc3 =&gsc_3;
> +	};
> +
>   	gic:interrupt-controller@10481000 {
>   		compatible = "arm,cortex-a9-gic";
>   		#interrupt-cells =<3>;

--

Regards,
Sylwester
