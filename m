From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/10] pinctrl: exynos/samsung: Add header with values
 used for configuration
Date: Wed, 7 Sep 2016 22:20:52 +0200
Message-ID: <CACRpkdZuRym=SuAiBA_UsNmKd7N5n9g=z=ZxwcEk7J0BcXDsFw@mail.gmail.com>
References: <1472714638-15676-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34207 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754406AbcIGUUx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2016 16:20:53 -0400
Received: by mail-oi0-f44.google.com with SMTP id m11so42496969oif.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Sep 2016 13:20:53 -0700 (PDT)
In-Reply-To: <1472714638-15676-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

I have one comment though, if you're anyway making changes to all
the DTS files:

On Thu, Sep 1, 2016 at 9:23 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:

> -               samsung,pin-function = <2>;
> -               samsung,pin-pud = <0>;
> -               samsung,pin-drv = <0>;
> +               samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
> +               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
> +               samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;

Nowadays we have standard bindings for this, see
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

Section "Generic pin multiplexing node content".

By patching the driver and bindings to accept also the standard
bindings with just function and pins and also adding support
for standard pin configurations like bias-disable
bias-pull-up with the old samsung,* bindings as a fallback
etc you can actually modernize the whole binding and
DTS looks to something simpler.

You will find that this is how newer platforms do it.

But it is admittedly a bigger project.

Yours,
Linus Walleij
