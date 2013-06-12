From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled platforms
Date: Tue, 11 Jun 2013 17:20:05 -0700
Message-ID: <CAOesGMh1aeiQfiEAd7xx_PmyZq1fC8y2pxjAVABHLmE7ECkEtQ@mail.gmail.com>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com>
	<20130611074552.GK6688@quad.lixom.net>
	<CAOesGMgjnt+T1OEFy15J0-zkHwHyeo3XLyzTGqmozq-t0nm=GQ@mail.gmail.com>
	<1904605.joOAnPJ6dR@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qe0-f54.google.com ([209.85.128.54]:53995 "EHLO
	mail-qe0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752573Ab3FLAUG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 20:20:06 -0400
Received: by mail-qe0-f54.google.com with SMTP id ne12so5279572qeb.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 17:20:05 -0700 (PDT)
In-Reply-To: <1904605.joOAnPJ6dR@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Prathyush K <prathyush.k@samsung.com>, Doug Anderson <dianders@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>, "arm@kernel.org" <arm@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

On Tue, Jun 11, 2013 at 5:15 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

>> > Please do follow through with the promised cleanups
>> > at some point, Tomasz. :-)
>
> Yeah, just managed to reserve some time for it, so stay tuned ;) .

Cool.

>> Btw, I had to add an include of <linux/of.h> or else all non-DT builds
>> broke...
>
> Sorry, I must have missed it.
>
> I guess it's the right time to set up some autobuild framework to check
> all patches with several most interesting configs. I guess some git hooks
> would be enough...

No worries. I tend to build all defconfigs after doing a batch of
pulls, and that's when we find these issues. I also boot on the few
boards that I have to make sure nothing catastrophic is broken, but
there's obviously much less coverage on that side.


-Olof
