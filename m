From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/16] pinctrl: samsung: Do not pass gpio_chip to pin_to_reg_bank
Date: Wed, 10 Oct 2012 09:42:10 +0200
Message-ID: <CACRpkdYinRRictTsH-zp=Y7FPAd92NP6E1WMU6YoupJDeYre8A@mail.gmail.com>
References: <1349685556-23718-1-git-send-email-t.figa@samsung.com>
	<1349685556-23718-11-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:44425 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751332Ab2JJHmM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Oct 2012 03:42:12 -0400
Received: by mail-wg0-f42.google.com with SMTP id fm10so3262777wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Oct 2012 00:42:10 -0700 (PDT)
In-Reply-To: <1349685556-23718-11-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, swarren@wwwdotorg.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com

On Mon, Oct 8, 2012 at 10:39 AM, Tomasz Figa <t.figa@samsung.com> wrote:

> The pointer to gpio_chip passed to pin_to_reg_bank utility function is
> used only to retrieve a pointer to samsung_pinctrl_drv_data structure.
>
> This patch modifies the function and its users to pass a pointer to
> samsung_pinctrl_drv_data directly.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>

Looks good, can it be applied without the others?

Maybe you can make a patch series without all the
stuff moving register offsets to the DT so I can begin
with merging that and we can discuss the movement
of register info separately?

Thomas A: is this ACK:able?

Yours,
Linus Walleij
