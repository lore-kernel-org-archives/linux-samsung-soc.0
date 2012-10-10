From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/16] pinctrl: exynos: Parse wakeup-eint parameters from DT
Date: Wed, 10 Oct 2012 09:18:51 +0200
Message-ID: <CACRpkdZ97BRHo1Usen-D9CnojU4HLqkNb5CKNOmx7uP1A9ttgw@mail.gmail.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
	<1349685556-23718-3-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:45370 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172Ab2JJHSw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 03:18:52 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so122977wey.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 00:18:51 -0700 (PDT)
In-Reply-To: <1349685556-23718-3-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> This patch converts the pinctrl-exynos driver to parse wakeup interrupt
> count and register offsets from device tree. It reduces the amount of
> static platform-specific data and facilitates adding further SoC
> variants to pinctrl-samsung driver.

So these are:

> +       ret = of_property_read_u32(wkup_np, "samsung,weint-count", &val);
> +       ret = of_property_read_u32(wkup_np, "samsung,weint-con", &val);
> +       ret = of_property_read_u32(wkup_np, "samsung,weint-mask", &val);
> +       ret = of_property_read_u32(wkup_np, "samsung,weint-pend", &val);

Are these all four register offsets?

I don't think it's proper for the device tree to contain register offsets.

Base address, "regs" property, yes. Individual registers, no. That just
makes the code hard to read and compare to the datasheet.

Or what are you aiming at here?

Linus Walleij
