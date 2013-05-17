From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 4/6] pinctrl: samsung: Add support for SoC-specific
 suspend/resume callbacks
Date: Fri, 17 May 2013 12:24:29 -0700
Message-ID: <CAD=FV=Xy2Poti6Wz594DpN1ZbB3FQJ1Dkt+PND1Z0fqf2pJvaw@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<1368807872-2601-5-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:35438 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753725Ab3EQTYa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 15:24:30 -0400
Received: by mail-lb0-f173.google.com with SMTP id t10so4787676lbi.18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 12:24:29 -0700 (PDT)
In-Reply-To: <1368807872-2601-5-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Tomasz,

On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> +       if (ctrl->resume)
> +               ctrl->resume(drvdata);
> +

Having this resume at the beginning of the function seems right for
restoring eint settings like you do in patch #6.

...but if you need to try to handle the old s3c64xx and s5p64x0
concept of "restored" to actually take GPIOs out of powerdown mode
then you'll also need a callback at the end.

Does it make sense to add a second callback at the end of this function?


...since it's unclear how we'll handle s3c64xx/s5p64x0 (or even if I'm
misunderstanding and they're already handled somehow), I don't see any
problems with this patch, so...


On exynos5250-snow (pinmux backported to 3.8):

Tested-by: Doug Anderson <dianders@chromium.org>

Reviewed-by: Doug Anderson <dianders@chromium.org>
