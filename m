From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] ARM: EXYNOS5: Add gscalar device from DT
Date: Fri, 06 Jul 2012 20:50:22 +0200
Message-ID: <4FF7336E.4030007@gmail.com>
References: <1341578702-10263-1-git-send-email-shaik.ameer@samsung.com> <1341578702-10263-3-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:56126 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757440Ab2GFSu1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Jul 2012 14:50:27 -0400
Received: by bkwj10 with SMTP id j10so4675926bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Jul 2012 11:50:25 -0700 (PDT)
In-Reply-To: <1341578702-10263-3-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, olofj@google.com, prashanth.g@samsung.com, joshi@samsung.com, ameersk@gmail.com, thomas.ab@samsung.com, devicetree-discuss@lists.ozlabs.org

Hi Shaik,

On 07/06/2012 02:45 PM, Shaik Ameer Basha wrote:
> Adding all 4 gscalar devices from DT device list in machine file.

nit: s/gscalar/gscaler

The above sentence doesn't quite parse though.

> Signed-off-by: Abhilash Kesavan<a.kesavan@samsung.com>
> Signed-off-by: Leela Krishna Amudala<l.krishna@samsung.com>
> Signed-off-by: Shaik Ameer Basha<shaik.ameer@samsung.com>
> ---
>   arch/arm/boot/dts/exynos5250.dtsi      |   31 +++++++++++++++++++++++++++++++
>   arch/arm/mach-exynos/mach-exynos5-dt.c |    8 ++++++++
>   2 files changed, 39 insertions(+), 0 deletions(-)
>
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

What are these aliases useful for ?
Also I think all DT related patches should be posted to
devicetree-discuss@lists.ozlabs.org as well.

>   	gic:interrupt-controller@10481000 {
>   		compatible = "arm,cortex-a9-gic";
>   		#interrupt-cells =<3>;
> @@ -424,4 +431,28 @@
>   			#gpio-cells =<4>;
>   		};
>   	};
> +
> +	gsc_0:  gsc@0x13e00000 {
> +		compatible = "samsung,exynos-gsc";
> +		reg =<0x13e00000 0x1000>;
> +		interrupts =<0 85 0>;
> +	};
> +
> +	gsc_1:  gsc@0x13e10000 {
> +		compatible = "samsung,exynos-gsc";
> +		reg =<0x13e10000 0x1000>;
> +		interrupts =<0 86 0>;
> +	};
> +
> +	gsc_2:  gsc@0x13e20000 {
> +		compatible = "samsung,exynos-gsc";
> +		reg =<0x13e20000 0x1000>;
> +		interrupts =<0 87 0>;
> +	};
> +
> +	gsc_3:  gsc@0x13e30000 {
> +		compatible = "samsung,exynos-gsc";
> +		reg =<0x13e30000 0x1000>;
> +		interrupts =<0 88 0>;
> +	};
>   };
> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
> index 7b1e11a..76b081c 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -50,6 +50,14 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
>   	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA0, "dma-pl330.0", NULL),
>   	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_PDMA1, "dma-pl330.1", NULL),
>   	OF_DEV_AUXDATA("arm,pl330", EXYNOS5_PA_MDMA1, "dma-pl330.2", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E00000,
> +				"exynos-gsc.0", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E10000,
> +				"exynos-gsc.1", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E20000,
> +				"exynos-gsc.2", NULL),
> +	OF_DEV_AUXDATA("samsung,exynos-gsc", 0x13E30000,
> +				"exynos-gsc.3", NULL),

It's probably better to add relevant entry at 
arch/arm/mach-exynos/include/mach/map. It's just a one line, e.g.

/* x = 0...3 */
#define EXYNOS5_PA_GSC(x)	(0x13e00000 + ((x) * 0x10000))

And use it here instead of plain numbers.

--
Thanks,
Sylwester
