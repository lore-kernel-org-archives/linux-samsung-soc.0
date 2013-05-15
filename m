From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 16:55:37 -0700
Message-ID: <CAD=FV=VQ5XS8UWeYyFmUqY=_pLzQ-E=vKR53vwLVXWNonXG4Tg@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<2118733.fzZiu9I5M5@flatron>
	<CAD=FV=XBHtVO6TzbNVXc_omW8ki7DAMx58hLmT0HsyEvUs3YMg@mail.gmail.com>
	<4040680.Aq1C9TECZX@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:51326 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414Ab3EOXzj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 19:55:39 -0400
Received: by mail-la0-f54.google.com with SMTP id fd20so2341968lab.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 16:55:38 -0700 (PDT)
In-Reply-To: <4040680.Aq1C9TECZX@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz / Linus,

On Wed, May 15, 2013 at 3:06 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Yes. I don't like the current way too much either, duplication being one
> of the reasons.

Do you have any other ideas?  It sounds like Linus didn't like my
suggestion and makes some good points...

I don't have any other great ideas other than having an argument about
whether the concept of pulls should be added to the GPIO subsystem
(and backed by pinmux).  Then we could make an argument that default
pull state belonged in the GPIO specifier.  OK, maybe we should just
pretend that I didn't bring that up.  ;)

...but I'm definitely interested in other ideas to eliminate the
duplication.  Until then I'm planning on submitting what I have
locally.  I'll probably send some version of it upstream fairly soon.
I will probably submit without trying to get all the preprocessor
symbols names done and will understand if Linus NAKs because of that.
I don't have time to take that on at the moment but can always come
back and rework that patch later.  ;)

-Doug
