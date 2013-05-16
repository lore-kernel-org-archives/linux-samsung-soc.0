From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 17:58:23 -0700
Message-ID: <CAD=FV=U7TK4s_GM6XNu3T_gfB+Ky9+dbsYQOVtKz_A_gcp3rmg@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<51941F64.9090104@wwwdotorg.org>
	<CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com>
	<4404195.qJMM4PHBj7@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f42.google.com ([209.85.215.42]:45577 "EHLO
	mail-la0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751435Ab3EPA6Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 20:58:25 -0400
Received: by mail-la0-f42.google.com with SMTP id fg20so183574lab.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 17:58:24 -0700 (PDT)
In-Reply-To: <4404195.qJMM4PHBj7@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz,

On Wed, May 15, 2013 at 5:19 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hmm, last thing before I fell asleep: We already have support for power
> down configuration in pinctrl-samsung. See samsung,pin-conpdn and
> samsung,pin-pudpdn.

Dang it! OK, we'll work on using those.


> Also I already have patches for suspend/resume support of pinctrl-samsung
> and pinctrl-exynos, as well as configuration of wake-up sources. I'm going
> to post them soon.

Huh, I wonder if they look just like the one we've been working on:
* https://gerrit.chromium.org/gerrit/#/c/51336/
* https://gerrit.chromium.org/gerrit/#/c/51342/

Those are about ready for upstream, too.  I was going to send them
this morning when I found out that we were missing a bunch of pinctrl
patches and had to rework then.  :(

Anyway, we can compare our solutions and figure out which is better.
;)  I'm happy with anything that works!

-Doug
