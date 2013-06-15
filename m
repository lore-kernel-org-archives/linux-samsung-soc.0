From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V2 3/3] gpio: samsung: skip gpiolib registration if pinctrl support is enabled for exynos5420
Date: Sat, 15 Jun 2013 22:37:47 +0200
Message-ID: <2645235.x6BXCzWrh9@flatron>
References: <1371214954-29358-1-git-send-email-l.krishna@samsung.com> <1371214954-29358-4-git-send-email-l.krishna@samsung.com> <CACRpkdYOjcCGD3qqCzMS4TRv8GTBub0Z9niyCAwzRBZd+5w27Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:62391 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754532Ab3FOUhs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Jun 2013 16:37:48 -0400
Received: by mail-bk0-f45.google.com with SMTP id je9so678923bkc.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jun 2013 13:37:46 -0700 (PDT)
In-Reply-To: <CACRpkdYOjcCGD3qqCzMS4TRv8GTBub0Z9niyCAwzRBZd+5w27Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Leela Krishna Amudala <l.krishna@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>, Thomas Abraham <thomas.ab@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Linus,

On Saturday 15 of June 2013 21:51:04 Linus Walleij wrote:
> On Fri, Jun 14, 2013 at 3:02 PM, Leela Krishna Amudala
> <l.krishna@samsung.com> wrote:
> 
> How does this topic:
> > Skip exynos5420 gpiolib registration if pinctrl support is enabled.
> 
> (...)
> 
> Correlate with that:
> >                 { .compatible = "samsung,exynos5250-pinctrl", },
> > 
> > +               { .compatible = "samsung,exynos5420-pinctrl", },
> 
> Sorry I don't get it.
> 
> Should the subject not be "add compatible string for 5420" or
> something?

Hehe, based on the context it really does not make sense :) .

But if you take a closer look, you can see that it's a list of compatible 
strings for which initialization of the old gpio driver should be 
bypassed.

Best regards,
Tomasz

> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
