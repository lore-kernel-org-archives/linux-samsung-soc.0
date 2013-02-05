From: Vikas Sajjan <sajjan.linux@gmail.com>
Subject: Re: [PATCH v3 5/5] ARM: exynos: dts: Add FIMD DT binding Documentation
Date: Tue, 5 Feb 2013 11:32:19 +0530
Message-ID: <CAGm_ybiHcac_PnOhon-E7MG6osLKAU3dD+V61Ymmex831GuANw@mail.gmail.com>
References: <1359718376-21947-1-git-send-email-vikas.sajjan@linaro.org>
	<1359718376-21947-6-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:35693 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751070Ab3BEGCV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 01:02:21 -0500
Received: by mail-we0-f176.google.com with SMTP id s43so5331085wey.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Feb 2013 22:02:20 -0800 (PST)
In-Reply-To: <1359718376-21947-6-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org

Hi,

any more comments for the below patch.


On Fri, Feb 1, 2013 at 5:02 PM, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds FIMD DT binding documentation both SoC and Board, with an example
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  .../devicetree/bindings/drm/exynos/fimd.txt        |   37 ++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/fimd.txt
>
> diff --git a/Documentation/devicetree/bindings/drm/exynos/fimd.txt b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> new file mode 100644
> index 0000000..bec9d07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/exynos/fimd.txt
> @@ -0,0 +1,37 @@
> +Device-Tree bindings for fimd driver
> +
> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
> +the Exynos series of SoCs which transfers the image data from a video buffer
> +located in the system memory to an external LCD interface.
> +
> +Required properties:
> +- compatible := value should be "samsung,exynos5-fimd" or "samsung,exynos4-fimd"
> +- reg := physical base address of the fimd and length of memory mapped region
> +- interrupt-parent := reference to the interrupt combiner node with phandle
> +- interrupts := interrupt number from the combiner to the cpu
> +- pinctrl := property defining the pinctrl configurations with a phandle
> +- pinctrl-names := name of the pinctrl
> +
> +Optional Properties:
> +- samsung,power-domain := power domain property defined with a phandle
> +- status := property defining the status of the node
> +
> +Example:
> +
> +SoC specific DT Entry:
> +
> +       fimd@11c00000 {
> +               compatible = "samsung,exynos4-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x11c00000 0x20000>;
> +               interrupts = <11 1>, <11 0>, <11 2>;
> +       };
> +
> +Board specific DT Entry:
> +
> +       fimd@11c00000 {
> +               samsung,power-domain = <&pd_lcd0>;
> +               pinctrl-0 = <&lcd_sync &lcd_clk &lcd_en &lcd0_data &pwm1_out>;
> +               pinctrl-names = "default";
> +               status = "okay";
> +       };
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
