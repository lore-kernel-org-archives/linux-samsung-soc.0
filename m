From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2] pinctrl: samsung: fix suspend/resume functionality
Date: Thu, 16 May 2013 14:51:53 -0700
Message-ID: <CAD=FV=Uqhw4GXjfQrnxzJ4U95wudF1whBcRxK8y3LZMWHTurNw@mail.gmail.com>
References: <1368724352-10849-1-git-send-email-dianders@chromium.org>
	<1944811.006SLH6aYj@flatron>
	<CAD=FV=Wk4sib4RvgVqonSj_wANmUh6vftTqveFNn6X4ceFc6Gw@mail.gmail.com>
	<2469545.4zh8j9i5RI@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f51.google.com ([209.85.215.51]:36055 "EHLO
	mail-la0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752020Ab3EPVvy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 May 2013 17:51:54 -0400
Received: by mail-la0-f51.google.com with SMTP id lx15so1610400lab.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 May 2013 14:51:53 -0700 (PDT)
In-Reply-To: <2469545.4zh8j9i5RI@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Prathyush K <prathyush.k@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Tomasz,

On Thu, May 16, 2013 at 2:27 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> OK. I will be fine to go with your patches, after addressing the comments.
> In the end it's good that you posted them, as reviewing them allowed me to
> find even better ways of doing some things than I had in mine ;) .

Yes.  I often find that the best way to review code is to think about
how I would implement it myself.  Certainly I think we've ended up
with something better / less buggy this way.  ;)


> How all of this works is basically a good question. I couldn't find any
> mention about pins switching from power down to normal mode in the
> documentation, but maybe there is a small side note somewhere, which I
> could miss.
>
> On S3C6410, for example, there are two modes. State is switched to power
> down mode automatically, but can be switched out either automatically on
> wake-up (exact timing is unknown to me) or by clearing a special bit,
> depending on value of other special bit.
>
> IMHO this is rather important, so we should find out how it work on other
> SoCs and make the code account for it.

Agreed that it's important.  ...but it's also good not to have tons of
complexity when it's not needed.  It sounds like S3C6410 could be
handled OK by just using the special bits and waiting to take things
out of power down mode.

...thinking about it, all SoCs that have power down modes (which you
_must_ have if your pinctrl state is lost across a low power) would be
slightly broken if they didn't have a bit to switch out of power down
mode.  Otherwise you're asking for at least some type of glitch
because you'll end up in the default state of pins for a little while
during resume.

That's not to say that there aren't broken SoCs out there and it's
entirely possible that people even designed systems around them
(knowing that the default state of each pin after wakeup is not
harmful to whatever is connected to that pin).  If there are any cases
like this then they would need the special code like my V1 patch had.
Do you know of any SoCs like this that we need to support on kernel
3.10 and higher?


I'm planning on going back to the "simpler" code for my next patchset
unless I can find a problem with it.


-Doug
