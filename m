From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/16] ARM: dts: exynos4210: Replace legacy GPIO bank
 nodes with pinctrl bank nodes
Date: Wed, 10 Oct 2012 09:26:51 +0200
Message-ID: <CACRpkdZgH9TSr2uWQW+-8-U7BxJCscQgStVOndGixGmRz74TWw@mail.gmail.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
	<1349685556-23718-2-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:50391 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab2JJH0x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 03:26:53 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so126481wey.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 00:26:52 -0700 (PDT)
In-Reply-To: <1349685556-23718-2-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Grant Likely <grant.likely@secretlab.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> Seuqential patches from this series introduce SoC-specific data parsing
> from device tree.
>
> This patch removes legacy GPIO bank nodes from exynos4210.dtsi and
> replaces them with nodes and properties required for these patches.

So to be clear:

> +       pinctrl-bank-types {
> +               bank_off: bank-off {
> +                       samsung,reg-names = "func", "dat", "pud",
> +                                               "drv", "conpdn", "pudpdn";
> +                       samsung,reg-params = <0x00 4>, <0x04 1>, <0x08 2>,
> +                                               <0x0C 2>, <0x10 2>, <0x14 2>;
> +               };

This is starting to look like a firmware language, I have mixed
feelings about this. Shall this be read:

"Poke 4 into 0x00, poke 1 into 0x04, poke 2 into 0x08" etc?

We really need to discuss this, Grant has already NACK:ed
such approaches once.

If you're still going to do this, it is mandatory
to NOT use magic hex numbers anymore, because Stephen has
merged preprocessor support to the DTC compiler so you
can use #defined macros.

See commit:
cd296721a9645f9f28800a072490fa15458d1fb7

> +       pinctrl@11400000 {
> +               gpa0: gpa0 {
> +                       gpio-controller;
> +                       samsung,pctl-offset = <0x000>;
> +                       samsung,pin-count = <8>;
> +                       samsung,bank-type = <&bank_off>;
> +                       #gpio-cells = <2>;

This part is OK.

> +
> +                       interrupt-controller;
> +                       samsung,eint-offset = <0x00>;

This property is *NOT* OK. IMHO the driver should know these
offsets, not the device tree. The driver only needs the offset to
the register range, what registers there are and their names
should be #defined.

> +                       #interrupt-cells = <2>;
> +               };

Yours,
Linus Walleij
