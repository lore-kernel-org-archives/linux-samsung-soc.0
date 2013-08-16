From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V5] ARM: dts: Change i2s compatible string on exynos5250
Date: Thu, 15 Aug 2013 21:48:32 -0700
Message-ID: <CAOesGMj4y=uVMmETLXs_1ZfTD+CrQgKuirrpGrqs=CU3uk5__Q@mail.gmail.com>
References: <1376627178-28649-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:55010 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810Ab3HPEsd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 00:48:33 -0400
Received: by mail-qc0-f169.google.com with SMTP id m15so875644qcq.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Aug 2013 21:48:33 -0700 (PDT)
In-Reply-To: <1376627178-28649-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, padma.kvr@gmail.com, Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>

On Thu, Aug 15, 2013 at 9:26 PM, Padmavathi Venna <padma.v@samsung.com> wrote:
> This patch removes quirks from i2s node and change the i2s
> compatible names.
>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>
> Changes since V4:
>         - Mark Brown reverted the below two patches due to below build failure with
>           exynos_defconfig.
>                 "ARM: dts: exynos5250: move common i2s properties to exynos5 dtsi"
>                 "ARM: dts: Change i2s compatible string on exynos5250"
>
>           build error:
>           DTC     arch/arm/boot/dts/exynos5420-smdk5420.dtb
>           ERROR (phandle_references): Reference to non-existent node or label "pdma1"
>           ERROR (phandle_references): Reference to non-existent node or label "pdma1"
>           ERROR (phandle_references): Reference to non-existent node or label "pdma0"
>           ERROR (phandle_references): Reference to non-existent node or label "pdma0"
>
> But with out "ARM: dts: Change i2s compatible string on exynos5250" will break the i2s
> driver.
>
> So posting this patch now and will take care of posting other patch later after dependent
> patches got merged.
>
>  arch/arm/boot/dts/exynos5250.dtsi |    9 +++------
>  1 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index ef57277..376090f 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -405,7 +405,7 @@
>         };
>
>         i2s0: i2s@03830000 {
> -               compatible = "samsung,i2s-v5";
> +               compatible = "samsung,s5pv210-i2s";

Device tree reviewers, this is something to look out for in the
future. Some samsung platforms/drivers use "samsung,<chip>-<ip>",
others "samsung,<ip>-<chip>". I don't personally care much one way or
another, but it really should be consistent.


-Olof
