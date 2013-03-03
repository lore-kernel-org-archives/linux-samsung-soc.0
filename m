From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v6 5/5] ARM: dts: Add FIMD DT binding Documentation
Date: Sun, 03 Mar 2013 20:11:36 +0100
Message-ID: <5133A068.7060906@gmail.com>
References: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org> <1362044559-7496-6-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:62250 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753246Ab3CCTLl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Mar 2013 14:11:41 -0500
Received: by mail-ee0-f50.google.com with SMTP id e51so3506685eek.23
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Mar 2013 11:11:40 -0800 (PST)
In-Reply-To: <1362044559-7496-6-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, t.figa@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, jy0922.shim@samsung.com

On 02/28/2013 10:42 AM, Vikas Sajjan wrote:
> Adds FIMD DT binding documentation both Samsung SoC and Board, with an example
>
> Signed-off-by: Vikas Sajjan<vikas.sajjan@linaro.org>
> ---
>   .../devicetree/bindings/video/samsung-fimd.txt     |   54 ++++++++++++++++++++
>   1 file changed, 54 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/video/samsung-fimd.txt
>
> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> new file mode 100644
> index 0000000..8d201e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> @@ -0,0 +1,54 @@
> +Device-Tree bindings for Samsung SoC display controller (FIMD)
> +
> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
> +the Samsung series of SoCs which transfers the image data from a video buffer
> +located in the system memory to an external LCD interface.
> +
> +Required properties:
> +- compatible := value should be one of the following
> +		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
> +		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
> +		"samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
> +		"samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
> +		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
> +		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
> +		"samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
> +
> +- reg := physical base address of the fimd and length of memory mapped region

I think FIMD should be capitalized.

> +
> +- interrupt-parent := reference to the interrupt combiner node with phandle

Perhaps this would have been more clear:

- interrupt-parent : a phandle to the interrupt combiner node;

?

And could we just use a colon instead of ":=", to keep it more consistent
with other Samsung SoC DT bindings documentation ?

> +
> +- interrupts := interrupt number from the combiner to the cpu.
> +		We have 3 interrupts and the interrupt combiner order is
> +		FIFO Level, VSYNC, and LCD_SYSTEM.
> +		but since the driver expects VSYNC to be the first IRQ,
> +		make sure to mention order as VSYNC, FIFO Level and LCD_SYSTEM
> +		keeping VSYNC as first IRQ as shown below.
> +		for example: interrupts =<11 1>,<11 0>,<11 2>;

I have a suggestion here. What about using reg-names property to make this
more explicit, e.g.

- interrupts : should contain a list of all FIMD IP block interrupts:
   FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier format depends
   on the interrupt controller used;

- interrupt-names : should contain the interrupt names: "fifo", "vsync",
   "lcd_sys", in the order in which they were listed in the interrupts
   property;

Or something similar to that. Then the drivers would need to be modified
to get interrupt resource by name, and not to rely on the VSYNC interrupt
be listed as the first one.

> +
> +- pinctrl := property defining the pinctrl configurations with a phandle
> +
> +- pinctrl-names := name of the pinctrl

Might be sufficient to just mention that the "default" state needs to be
specified in the fimd node, with reference to the pinctrl bindings
documentation, e.g.

"The pinctrl bindings defined in ../../pinctrl/pinctrl-bindings.txt must be
used to define a pinctrl state named "default".

See https://patchwork.kernel.org/patch/2082311.

> +Optional Properties:
> +- samsung,power-domain := power domain property defined with a phandle

"a phandle to FIMD power domain node" ?
