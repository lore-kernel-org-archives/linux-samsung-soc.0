From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/16] pinctrl: exynos: Use one IRQ domain per pin bank
Date: Wed, 10 Oct 2012 09:40:16 +0200
Message-ID: <CACRpkdbNHqwt2X-SNRv3=7Ca-WrDERb=t01K7pFuvRzTNk1+4Q@mail.gmail.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
	<1349685556-23718-10-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:58682 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753428Ab2JJHkS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 03:40:18 -0400
Received: by mail-wg0-f44.google.com with SMTP id dr13so240141wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 00:40:16 -0700 (PDT)
In-Reply-To: <1349685556-23718-10-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> Instead of registering one IRQ domain for all pin banks of a pin
> controller, this patch implements registration of per-bank domains.
>
> At a cost of a little memory overhead (~2.5KiB for all GPIO interrupts
> of Exynos4x12) it simplifies driver code and device tree sources,
> because GPIO interrupts can be now specified per banks.
>
> Example:
>         device {
>                 /* ... */
>                 interrupt-parent = <&gpa1>;
>                 interrupts = <3 0>;
>                 /* ... */
>         };
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

This looks like a very good patch!
Can it be applied in isolation from the other patches?
Thomas A: can you ACK this?

Yours,
Linus Walleij
