From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [RFC PATCH 05/12] ARM: dts: exynos: Configure Exynos5410 pinctrl
 for eMMC and SD card
Date: Sat, 7 May 2016 10:23:52 +0530
Message-ID: <CAGOxZ52sH9vcN0MXxhX1ee7wr9Ao6Na=5X1bXxQo+6uvvWCbJA@mail.gmail.com>
References: <1462297949-13824-1-git-send-email-krzk@kernel.org> <1462297949-13824-6-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:34272 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbcEGEyc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 May 2016 00:54:32 -0400
In-Reply-To: <1462297949-13824-6-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kevin Hilman <khilman@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Inki Dae <inki.dae@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Krzysztof,

On Tue, May 3, 2016 at 11:22 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Configure the pinctrl for MMC0 (eMMC) and MMC2 (microSD card).
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> I am not sure about sd0_rclk. Also I wonder whether this should go to
> board DTS...
> ---
>  arch/arm/boot/dts/exynos5410-pinctrl.dtsi | 87 +++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
> index f9aa6bb55464..dc12a79b8b32 100644
> --- a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
> @@ -277,6 +277,93 @@
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>         };
> +
> +       sd0_clk: sd0-clk {
> +               samsung,pins = "gpc0-0";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <0>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd0_cmd: sd0-cmd {
> +               samsung,pins = "gpc0-1";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <0>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd0_cd: sd0-cd {
> +               samsung,pins = "gpc0-2";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <3>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd0_bus1: sd0-bus-width1 {
> +               samsung,pins = "gpc0-3";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <3>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd0_bus4: sd0-bus-width4 {
> +               samsung,pins = "gpc0-4", "gpc0-5", "gpc0-6";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <3>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd0_bus8: sd0-bus-width8 {
> +               samsung,pins = "gpc3-0", "gpc3-1", "gpc3-2", "gpc3-3";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <3>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       /* TODO: What's up with with rclk? On Odroid XU this is missing... */
> +       /*
> +       sd0_rclk: sd0-rclk {
> +               samsung,pins = "gpc0-7";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <1>;
> +               samsung,pin-drv = <3>;
> +       };
> +       */
> +
IF Odroid XU is populated with an eMMC5.0+ device && RCLK (Data
Strobe) is connected from AP to emmc device, THEN you should configure
this dedicated PIN.
Otherwise you can remove this TODO and uncomment the node and put a
comment saying that this feature (emmc5.0+) is not supported on this
SoC.

> +       sd2_clk: sd2-clk {
> +               samsung,pins = "gpc2-0";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <0>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd2_cmd: sd2-cmd {
> +               samsung,pins = "gpc2-1";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <0>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd2_cd: sd2-cd {
> +               samsung,pins = "gpc2-2";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <3>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd2_bus1: sd2-bus-width1 {
> +               samsung,pins = "gpc2-3";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <3>;
> +               samsung,pin-drv = <3>;
> +       };
> +
> +       sd2_bus4: sd2-bus-width4 {
> +               samsung,pins = "gpc2-4", "gpc2-5", "gpc2-6";
> +               samsung,pin-function = <2>;
> +               samsung,pin-pud = <3>;
> +               samsung,pin-drv = <3>;
> +       };
>  };
>
>  &pinctrl_1 {
> --
> 2.5.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Regards,
Alim
