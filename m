From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH v2 00/15] pinctrl: samsung: Usability and extensibiltiy improvements
Date: Thu, 11 Oct 2012 20:50:39 +0800
Message-ID: <CAJuYYwSnAAqxbBf06051St4Zo89nUH+yFHkWCSfHm0dzoqU9pA@mail.gmail.com>
References: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:35547 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756848Ab2JKMul (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Oct 2012 08:50:41 -0400
Received: by mail-la0-f46.google.com with SMTP id h6so1186493lag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Oct 2012 05:50:39 -0700 (PDT)
In-Reply-To: <1349943081-27939-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linus.walleij@linaro.org, swarren@wwwdotorg.org, tony@atomide.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On 11 October 2012 16:11, Tomasz Figa <t.figa@samsung.com> wrote:
> This patch series is a work on improving usability and extensibiltiy of
> the pinctrl-samsung driver. It consists of three main parts:
>  - improving flexibility of SoC-specific data specification
>  - converting the driver to one GPIO chip and IRQ domain per pin bank
>  - improving wake-up IRQ setup and handling
>
> 1) What the first part does, in addition to various related fixes, is
> removing any unnecessary static data from pinctrl-exynos driver.
>
> This is achieved mostly thanks to assigning pin numbers dynamically,
> with help of only pin counts of particular banks. It also simplifies
> adding next SoC variants, since much less static data needs to be
> specified.
>
> 2) The second part attempts to simplify usage of the driver and fix several
> problems of current implementation, in particular:
>
>   - Simplifies GPIO pin specification in device tree by using pin
>     namespace local to pin bank instead of local to pin controller, e.g.
>
>         gpios = <&gpj0 3 0>;
>
>     instead of
>
>         gpios = <&pinctrl0 115 0>;
>
>   - Simplifies GPIO interrupt specification in device tree by using
>     namespace local to pin bank (and equal to GPIO namespace), e.g.
>
>         interrupt-parent = <&gpj0>;
>         interrupts = <3 0>;
>
>     instead of
>
>         interrupt-parent = <&pinctrl0>;
>         interrupts = <115 0>;
>
>   - Simplifies internal GPIO pin to bank translation thanks to
>     correspondence of particular GPIO chips to pin banks. This allows
>     to remove the (costly in case of GPIO bit-banging drivers) lookup
>     over all banks to find the one that the pin is from.
>
> 3) Third part is focused on removing the hard-coded description of wake-up
> interrupt layout.
>
> It moves wake-up interrupt description to bank struct and device tree,
> which allows to specify which pin banks support wake-up interrupts and
> how they are handled (direct or multiplexed/chained).
>
> See particular patches for more detailed descriptions and the last patch for
> updated device tree bindings.
>
> Changes since v1:
>  - dropped moving SoC-specific data to device tree
>    (might be added in further patches)
>  - dropped per-bank specification of configuration register offsets
>    (thus limiting scope of the driver to Exynos SoCs; will be added in
>     further patches)
>
> Tomasz Figa (15):
>   pinctrl: samsung: Detect and handle unsupported configuration types
>   pinctrl: samsung: Do not pass gpio_chip to pin_to_reg_bank
>   pinctrl: samsung: Assing pin numbers dynamically
>   pinctrl: samsung: Remove static pin enumerations
>   pinctrl: samsung: Distinguish between pin group and bank nodes
>   ARM: dts: exynos4210-pinctrl: Add nodes for pin banks
>   pinctrl: samsung: Match pin banks with their device nodes
>   pinctrl: samsung: Hold pointer to driver data in bank struct
>   pinctrl: samsung: Include bank-specific eint offset in bank struct
>   pinctrl: exynos: Use one IRQ domain per pin bank
>   pinctrl: samsung: Use one GPIO chip per pin bank
>   pinctrl: samsung: Use per-bank IRQ domain for wake-up interrupts
>   pinctrl: exynos: Set pin function to EINT in irq_set_type of wake-up
>     EINT
>   pinctrl: samsung: Add GPIO to IRQ translation
>   Documentation: Update samsung-pinctrl device tree bindings
>     documentation
>
>  .../bindings/pinctrl/samsung-pinctrl.txt           | 118 +++++--
>  arch/arm/boot/dts/exynos4210-pinctrl.dtsi          | 278 ++++++++++++++++
>  arch/arm/boot/dts/exynos4210.dtsi                  | 241 +-------------
>  drivers/pinctrl/pinctrl-exynos.c                   | 367 ++++++++++-----------
>  drivers/pinctrl/pinctrl-exynos.h                   | 170 ++--------
>  drivers/pinctrl/pinctrl-samsung.c                  | 203 ++++++++----
>  drivers/pinctrl/pinctrl-samsung.h                  |  29 +-
>  7 files changed, 741 insertions(+), 665 deletions(-)

Hi Tomasz,

Thanks for this excellent series. This is a nice improvement for the
samsung pinctrl driver.

For this series:
Acked-by: Thomas Abraham <thomas.abraham@linaro.org>


Regards,
Thomas.

>
> --
> 1.7.12
>
