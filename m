From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/6] ARM: SAMSUNG: pm: Adjust for pinctrl- and DT-enabled platforms
Date: Wed, 12 Jun 2013 02:15:45 +0200
Message-ID: <1904605.joOAnPJ6dR@flatron>
References: <1368807872-2601-1-git-send-email-t.figa@samsung.com> <20130611074552.GK6688@quad.lixom.net> <CAOesGMgjnt+T1OEFy15J0-zkHwHyeo3XLyzTGqmozq-t0nm=GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:63758 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752573Ab3FLAPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 20:15:49 -0400
Received: by mail-ee0-f54.google.com with SMTP id t10so3837586eei.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 17:15:48 -0700 (PDT)
In-Reply-To: <CAOesGMgjnt+T1OEFy15J0-zkHwHyeo3XLyzTGqmozq-t0nm=GQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Tomasz Figa <t.figa@samsung.com>, Prathyush K <prathyush.k@samsung.com>, Doug Anderson <dianders@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>, "arm@kernel.org" <arm@kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Olof,

On Tuesday 11 of June 2013 01:21:59 Olof Johansson wrote:
> On Tue, Jun 11, 2013 at 12:45 AM, Olof Johansson <olof@lixom.net> wrote:
> > On Mon, Jun 10, 2013 at 06:13:10PM +0200, Linus Walleij wrote:
> >> On Mon, Jun 10, 2013 at 4:45 PM, Tomasz Figa <t.figa@samsung.com> 
wrote:
> >> > On Friday 17 of May 2013 18:24:29 Tomasz Figa wrote:
> >> >> This patch makes legacy code on suspend/resume path being executed
> >> >> conditionally, on non-DT platforms only, to fix suspend/resume of
> >> >> DT-enabled systems, for which the code is inappropriate.
> >> >> 
> >> >> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> >> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> >> ---
> >> >> 
> >> >>  arch/arm/plat-samsung/pm.c | 17 ++++++++++++-----
> >> >>  1 file changed, 12 insertions(+), 5 deletions(-)
> >> > 
> >> > It seems like this patch did not make it into 3.10-rc5, while rest
> >> > of patches did, which ended up with suspend/resume still being
> >> > broken.
> >> > 
> >> > What should we do in this case?
> >> 
> >> I did not apply this patch to the pinctrl tree because it begins
> >> with ARM: but it appears I promised to carry it anyway...
> >> 
> >> I need an ACK from the ARM SoC people to do that though,
> >> or you can take it through ARM SoC fixes directly.
> >> 
> >> I would just ask Olof/Arnd to apply it directly as a separate
> >> patch.
> > 
> > It makes sense to take this through arm-soc since it's no longer
> > dependent on anything else.
> > 
> > Applied to fixes. 

Thanks.

> > Please do follow through with the promised cleanups
> > at some point, Tomasz. :-)

Yeah, just managed to reserve some time for it, so stay tuned ;) .

> 
> Btw, I had to add an include of <linux/of.h> or else all non-DT builds
> broke...

Sorry, I must have missed it.

I guess it's the right time to set up some autobuild framework to check 
all patches with several most interesting configs. I guess some git hooks 
would be enough...

Best regards,
Tomasz

> 
> -Olof
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
