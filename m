From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] pinctrl: exynos: fix eint wakeup by using irq_set_wake()
Date: Thu, 16 May 2013 16:49:05 -0700
Message-ID: <CAD=FV=Vrq3FtVruE=QfBFLx3+RYy8yZ8PenhP5u=xpBseM99UQ@mail.gmail.com>
References: <1368724352-10849-1-git-send-email-dianders@chromium.org>
	<1483058.pKLP2TAAG6@flatron>
	<CAD=FV=V=QWg8fYX7iZeG6RoQQFGtsQhd7ZLodyVVuYWYZ9fRFg@mail.gmail.com>
	<8199419.ooBeNM55eX@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f47.google.com ([209.85.215.47]:48643 "EHLO
	mail-la0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754887Ab3EPXtH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 May 2013 19:49:07 -0400
Received: by mail-la0-f47.google.com with SMTP id fq12so3637003lab.34
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 May 2013 16:49:06 -0700 (PDT)
In-Reply-To: <8199419.ooBeNM55eX@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Tomasz,

On Thu, May 16, 2013 at 3:37 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Well, to make long story short, including headers from plat/ and mach/
> from files outside plat/ or mach/ is no longer valid with
> CONFIG_MULTIPLATFORM, because more than one plat and/or mach can be
> enabled at the same time. In addition to this, care must be taken for code
> to not break platforms other than written for, when compiled into the
> resulting kernel.

Right.  That makes sense.  That's also why it would be a bit of a
longshot for me to get this done right now.  I'd imagine that there
would be a number of changes to the samsung pm infrastructure that are
needed to make this work and I don't have all of those in my tree
right now.  We've already picked back a lot to 3.8, but multiplatform
seems too much.


>> Perhaps for this patch it makes more sense for you to post your
>> version and I can review it?  We may end up just keeping our version
>> of this patch for 3.8 and pick up yours when we do our next rebase.
>> Does that sound OK?
>
> Fine. I will also send a patch adding save and restore for several EINT
> registers that need it.

OK, sounds good.  I was trying to figure out why we didn't seem to
have those in our 3.4 stuff and that it seems to work without
saving/restoring.  I assumed that maybe higher level code was
masking/unmasking interrupts but didn't dig.


> Since EINT handling is highly SoC-specific (i.e. done in pinctrl-exynos,
> not pinctrl-samsung), such assumption wouldn't be a problem. Let me see
> how I solved this problem in my version tomorrow at work.

Fair enough.  :)  Looking forward to seeing your patch!

-Doug
