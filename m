From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] pinctrl: exynos: Consolidate irq_chips of GPIO and
 WKUP EINTs
Date: Tue, 8 Jul 2014 10:59:52 +0200
Message-ID: <CACRpkdb2E+U8U2jvXP59sLdt4TAROOmfDZGhFnLahpP28JnUjQ@mail.gmail.com>
References: <1404315664-3174-1-git-send-email-t.figa@samsung.com>
	<1404315664-3174-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:47492 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753552AbaGHI7x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 04:59:53 -0400
Received: by mail-oa0-f49.google.com with SMTP id i7so5970964oag.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2014 01:59:52 -0700 (PDT)
In-Reply-To: <1404315664-3174-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>

On Wed, Jul 2, 2014 at 5:41 PM, Tomasz Figa <t.figa@samsung.com> wrote:

> Handling of irq_chip operations for GPIO and WKUP external interrupts
> is mostly the same, with the difference being offset of registers.
> However currently the driver has all the code duplicated for both EINT
> types, which is undesirable, because changes in irq_chip operations have
> to be done to both instances of the same code.
>
> This patch fixes this by creating exynos_irq_chip struct that has normal
> irq_chip struct embedded and contain differences between particular EINT
> types, which are three register offsets. One instance of code is removed
> and the new structure is used instead to fetch necessary data instead of
> samsung_pin_ctrl struct used previously.
>
> While at it, the patch removes Exynos-specific fields from
> aforementioned structure to improve layering of the driver.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

Patch applied.

Yours,
Linus Walleij
