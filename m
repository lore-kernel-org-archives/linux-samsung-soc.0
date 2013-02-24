From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] i2c: s3c2410: check for NULL pinctrl handle
Date: Sun, 24 Feb 2013 01:47:49 +0100
Message-ID: <CACRpkdaFv=V8M_Ztb5-hrYm6YnXiG6fg6Z13y3NVFdszBk=7ZQ@mail.gmail.com>
References: <201302231855.47560.heiko@sntech.de>
	<201302231857.46445.heiko@sntech.de>
	<CACRpkdbV-CznfnbCbKkKpndjiG32V9yNdrF1F7M=4qe1EUroGA@mail.gmail.com>
	<5027662.bpQdq7jhyn@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f180.google.com ([209.85.210.180]:59185 "EHLO
	mail-ia0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759256Ab3BXArt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 23 Feb 2013 19:47:49 -0500
Received: by mail-ia0-f180.google.com with SMTP id f27so1598424iae.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Feb 2013 16:47:49 -0800 (PST)
In-Reply-To: <5027662.bpQdq7jhyn@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>

On Sun, Feb 24, 2013 at 1:38 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> The driver must know whether pin control is available, because it has to
> fall back to legacy GPIO-based pin configuration if it is not. This means
> that we must either check for NULL (which probably is not right, since
> returned handle is considered to be opaque) or pin control core must
> return an error code specific to this situation, e.g. -ENODEV.

OK so pass a flag like a bool in your platform data from the
machine like go into <linux/platform_data/i2c-s3c2410.h>
and add:

struct s3c2410_platform_i2c {
        bool  use_that_old_gpio_interface;
        (...)
};

Instead of trying to semi-guess if the pinctrl framework is there?

Surely you know this when setting up the pdata from your machine?

Yours,
Linus Walleij
