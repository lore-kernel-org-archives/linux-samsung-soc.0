From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v9 4/4] ARM: dts: Add FIMD DT binding Documentation
Date: Mon, 25 Mar 2013 16:40:02 +0530
Message-ID: <CAJuYYwQZKXXVNNbDS20d8i6mybzyRc_Y8BQs73NSw6mUVwsGwQ@mail.gmail.com>
References: <1363960608-23825-1-git-send-email-vikas.sajjan@linaro.org>
	<1363960608-23825-5-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:59686 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757255Ab3CYLKD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 07:10:03 -0400
Received: by mail-ie0-f179.google.com with SMTP id k11so7104327iea.24
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2013 04:10:02 -0700 (PDT)
In-Reply-To: <1363960608-23825-5-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, sylvester.nawrocki@gmail.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, linaro-kernel@lists.linaro.org

On 22 March 2013 19:26, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> Adds FIMD DT binding documentation for both Samsung SoC and Board, with an example
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  .../devicetree/bindings/video/samsung-fimd.txt     |   68 ++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/samsung-fimd.txt
>
> diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> new file mode 100644
> index 0000000..f92c507
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
> @@ -0,0 +1,68 @@
> +Device-Tree bindings for Samsung SoC display controller (FIMD)
> +
> +FIMD stands for Fully Interactive Mobile Display, is the Display Controller for
> +the Samsung series of SoCs which transfers the image data from a video buffer
> +located in the system memory to an external LCD interface.
> +
> +Required properties:
> +- compatible : value should be one of the following
> +               "samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
> +               "samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
> +               "samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
> +               "samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
> +               "samsung,s5pv210-fimd"; /* for S5PV210 SoC */
> +               "samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
> +               "samsung,exynos5250-fimd"; /* for Exynos5 SoCs */
> +
> +- reg : physical base address of the FIMD and length of memory mapped region
> +
> +- interrupt-parent : a phandle to the interrupt combiner node

Since the bindings documentation have to be generic across multiple
platforms that uses the fimd controller, it is not right to say that
the interrupt-parent phandle should be combiner node. Instead, it
should just mention that it should be the phandle of the fimd
controller's interrupt parent controller.

> +
> +- interrupts : should contain a list of all FIMD IP block interrupts:
> +  FIFO Level, VSYNC, LCD_SYSTEM. The interrupt specifier format depends
> +    on the interrupt controller used.
> +
> +- interrupt-names : should contain the interrupt names: "fifo", "vsync",
> +       "lcd_sys", in the same order as they were listed in the interrupts
> +        property.
> +
> +- pinctrl : property defining the pinctrl configurations with a phandle
> +
> +- pinctrl-names : "default" state needs to be specified in the fimd node
> +               The pinctrl bindings defined in
> +               ../../../pinctrl/pinctrl-bindings.txt must be used to define a
> +               pinctrl state named "default".
> +
> +- clocks : List of phandle and clock ID pairs, one pair for each clock input
> +       to the device. Should contain clock ID as per
> +       Documentation/devicetree/bindings/clock/exynosXXXX-clock.txt

Non-exynos platfroms can also migrate to dt. So writing file name
above will be inappropriate.

> +
> +- clock-names: List of clock input name strings sorted in the same order as
> +               the clocks property. Should contain "sclk_fimd" and "fimd".
> +
> +Optional Properties:
> +- samsung,power-domain := a phandle to FIMD power domain node
> +
> +Example:
> +
> +SoC specific DT Entry:
> +
> +       fimd@11c00000 {
> +               compatible = "samsung,exynos4210-fimd";
> +               interrupt-parent = <&combiner>;
> +               reg = <0x11c00000 0x20000>;
> +               interrupt-names = "fifo", "vsync", "lcd_sys";
> +               interrupts = <11 0>, <11 1>, <11 2>;
> +               clocks = <&clock 140>, <&clock 283>;
> +               clock-names = "sclk_fimd", "fimd";
> +               status = "disabled";
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
