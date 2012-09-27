From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: samsung: Fix input mode setting function for
 GPIO int
Date: Thu, 27 Sep 2012 07:48:50 +0200
Message-ID: <CACRpkdZuED59F2FfewXNxBeYauZEaXUxUiY5GHJDxdQvzxGtZA@mail.gmail.com>
References: <000101cd9c63$ecb606a0$c62213e0$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:47054 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754926Ab2I0Fsw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 01:48:52 -0400
Received: by wgbfm10 with SMTP id fm10so145031wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Sep 2012 22:48:51 -0700 (PDT)
In-Reply-To: <000101cd9c63$ecb606a0$c62213e0$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Eunki Kim <eunki_kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, grant.likely@secretlab.ca

On Thu, Sep 27, 2012 at 5:55 AM, Eunki Kim <eunki_kim@samsung.com> wrote:

> This patch makes GPIO pin to INTERRUPT mode or INPUT mode according
> to bitmap_gpio_int. When the related bit of bitmap_gpio_int is set,
> it makes GPIO pin to INTERRUPT mode instrad of INPUT mode in the
> samsung_gpiolib_4bit_input function.
>
> Signed-off-by: Eunki Kim <eunki_kim@samsung.com>
> Cc: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Are you taking this into the Samsung tree or shall I merge it
into my GPIO tree? In the latter case I need an ACK from
some Samsung maintainer.

Yours,
Linus Walleij
