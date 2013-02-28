From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v5 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Thu, 28 Feb 2013 11:42:16 +0530
Message-ID: <CAK9yfHyqC4TzR4p+xfYv2LH-mrR=vV3k0C68-Kts_t6M-AMgyg@mail.gmail.com>
References: <1361954620-20614-1-git-send-email-vikas.sajjan@linaro.org>
	<1361954620-20614-6-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:48733 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751332Ab3B1GMQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Feb 2013 01:12:16 -0500
Received: by mail-ie0-f176.google.com with SMTP id k13so1657685iea.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Feb 2013 22:12:16 -0800 (PST)
In-Reply-To: <1361954620-20614-6-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, inki.dae@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, joshi@samsung.com

Hi Vikas,

On 27 February 2013 14:13, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds FIMD DT binding documentation both SoC and Board, with an example
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  .../devicetree/bindings/video/exynos-fimd.txt      |   46 ++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/exynos-fimd.txt
>
> diff --git a/Documentation/devicetree/bindings/video/exynos-fimd.txt b/Documentation/devicetree/bindings/video/exynos-fimd.txt
> new file mode 100644
> index 0000000..b3542b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/exynos-fimd.txt
> @@ -0,0 +1,46 @@
> +Device-Tree bindings for Exynos SoC display controller (FIMD)
> +
> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
> +the Exynos series of SoCs which transfers the image data from a video buffer

I think this should be Samsung series of SoCs intead of Exynos series.
As such the file name could be samsung-fimd.txt.

> +located in the system memory to an external LCD interface.
> +
> +Required properties:
> +- compatible := value can be one these below

"value should be one of the following:"


> +               "samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
> +               "samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
> +               "samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
> +               "samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
> +               "samsung,s5pv210-fimd"; /* for S5PV210 SoC */
> +               "samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
> +               "samsung,exynos5250-fimd"; /* for Exynos5 SoCs */

blank line here would make it more readable?

> +- reg := physical base address of the fimd and length of memory mapped region
> +- interrupt-parent := reference to the interrupt combiner node with phandle
> +- interrupts := interrupt number from the combiner to the cpu
> +               we have 3 interrupts and the Interrupt combiner order is
> +               FIFO Level, VSYNC and LCD_SYSTEM. Make sure to mention order
> +               as VSYNC, FIFO Level and LCD_SYSTEM as show in the example below.

Please rephrase the above as there seems to be difference in order in
the above 2 lines itself. :)


-- 
With warm regards,
Sachin
