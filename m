From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 6/6] pinctrl: exynos: Handle suspend/resume of GPIO
 EINT registers
Date: Tue, 21 May 2013 21:46:35 -0700
Message-ID: <CAD=FV=VYhBP+V6SQt5SkFZszdVxSJ6AZk-C-zx1Di-RZBYhGvw@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<18754346.1REWN52J0K@flatron>
	<CAD=FV=XiWET3Xptfk2CVWMw=xVCE4zUJhJtgXHbhiND12rJGnQ@mail.gmail.com>
	<4536937.hnhaYZLnaG@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f51.google.com ([209.85.212.51]:42369 "EHLO
	mail-vb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952Ab3EVEqh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 May 2013 00:46:37 -0400
Received: by mail-vb0-f51.google.com with SMTP id x16so986039vbf.38
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 May 2013 21:46:36 -0700 (PDT)
In-Reply-To: <4536937.hnhaYZLnaG@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Tue, May 21, 2013 at 10:05 AM, Tomasz Figa <t.figa@samsung.com> wrote:
>         return 0;
> +
> +err_domains:
> +       bank = d->ctrl->pin_banks;
> +       for (undo = 0; undo < i; ++undo) {

++bank is missing, I think.  This will free the same bank many times.

optional: could also avoid extra 'undo' variable and remove in reverse
order by changing i to signed and counting down to 0.

-Doug
