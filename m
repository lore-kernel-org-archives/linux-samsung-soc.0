From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/6] pinctrl: samsung: Add support for SoC-specific suspend/resume callbacks
Date: Fri, 17 May 2013 22:51:04 +0200
Message-ID: <31112981.QqbfMZZPSN@flatron>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com> <1368807872-2601-5-git-send-email-t.figa@samsung.com> <CAD=FV=Xy2Poti6Wz594DpN1ZbB3FQJ1Dkt+PND1Z0fqf2pJvaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:54527 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755385Ab3EQUvH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 16:51:07 -0400
Received: by mail-ee0-f53.google.com with SMTP id c1so2453504eek.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 13:51:05 -0700 (PDT)
In-Reply-To: <CAD=FV=Xy2Poti6Wz594DpN1ZbB3FQJ1Dkt+PND1Z0fqf2pJvaw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Friday 17 of May 2013 12:24:29 Doug Anderson wrote:
> Tomasz,
> 
> On Fri, May 17, 2013 at 9:24 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > +       if (ctrl->resume)
> > +               ctrl->resume(drvdata);
> > +
> 
> Having this resume at the beginning of the function seems right for
> restoring eint settings like you do in patch #6.
> 
> ...but if you need to try to handle the old s3c64xx and s5p64x0
> concept of "restored" to actually take GPIOs out of powerdown mode
> then you'll also need a callback at the end.
> 
> Does it make sense to add a second callback at the end of this function?

Right. I haven't thought of this. It might make sense to add .resumed() 
callback as well to handle this.

I guess it could be added as a part of patches for S3C64xx-specific 
pinctrl suspend/resume, that I will post some day.

> ...since it's unclear how we'll handle s3c64xx/s5p64x0 (or even if I'm
> misunderstanding and they're already handled somehow), I don't see any
> problems with this patch, so...
> 
> 
> On exynos5250-snow (pinmux backported to 3.8):
> 
> Tested-by: Doug Anderson <dianders@chromium.org>
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>

Thanks.

Best regards,
Tomasz
