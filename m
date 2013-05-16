From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] pinctrl: samsung: fix suspend/resume functionality
Date: Thu, 16 May 2013 16:10:28 -0700
Message-ID: <CAD=FV=WVx4E0xLpyqwe7LhzFvw4=fOY67Kkiux7Dat8qo7V_Wg@mail.gmail.com>
References: <1368724352-10849-1-git-send-email-dianders@chromium.org>
	<2099430.Q29j0K3hPy@flatron>
	<201305170030.39266.heiko@sntech.de>
	<1475116.qtX3b3bLWZ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:52832 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754646Ab3EPXKa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 May 2013 19:10:30 -0400
Received: by mail-lb0-f182.google.com with SMTP id z5so1351853lbh.27
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 May 2013 16:10:29 -0700 (PDT)
In-Reply-To: <1475116.qtX3b3bLWZ@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Tomasz,

On Thu, May 16, 2013 at 3:56 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Seems like I need some sleep, as I'm already starting to overlook large
> blobs of code.
>
> Originally, GPIO suspend/resume handlers have been configured in
> drivers/gpio/gpio-samsung.c, by setting pm field of samsung_gpio_chip
> struct to point to appropriate samsung_gpio_pm struct, which contains
> pointers to save and resume callbacks.
>
> In result, samsung_gpio_pm_2bit_* or samsung_gpio_pm_4bit_* have been
> used, depending on bank type, on all SoCs.
>
> Now since the documentation states that wake-up reset doesn't reset GPIO
> registers (at least on S3C2440 and S3C2416), I wonder what is the correct
> way of handling them.

If state of these registers isn't lost on those SoCs then running the
save/restore shouldn't _hurt_ though, right?  If you can run the old
GPIO code on one of those systems and do a suspend/resume you could
check...

-Doug
