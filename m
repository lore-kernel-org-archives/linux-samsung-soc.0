From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Fri, 17 May 2013 11:09:19 +0200
Message-ID: <2465185.vYkbXUqoOT@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com> <CACRpkdZ+wrV9O6T0XQFtpLeOgvEhACXc4ycokiqof81K7GSLjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:45932 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752319Ab3EQJJW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 05:09:22 -0400
Received: by mail-ee0-f51.google.com with SMTP id e51so2341381eek.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 02:09:21 -0700 (PDT)
In-Reply-To: <CACRpkdZ+wrV9O6T0XQFtpLeOgvEhACXc4ycokiqof81K7GSLjg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Doug Anderson <dianders@google.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Hi Linus,

On Friday 17 of May 2013 10:38:53 Linus Walleij wrote:
> On Thu, May 16, 2013 at 2:03 AM, Doug Anderson <dianders@google.com> 
wrote:
> >> I prefer to put all the static pinctrl configuration in the pinctrl
> >> hog, and only the dynamic stuff in the individual device nodes.
> >> 
> >> I know LinusW won't like this suggestion much though:-)
> 
> (It's not that bad actually...)
> 
> > Ah right!  I forgot about hogs in this case.  That's also reasonable
> > as a solution and is similar to what we've got in the tree for
> > powerdown configuration of pins (I'll try to post this patch soon too,
> > WIP at <https://gerrit.chromium.org/gerrit/#/c/51292/> and
> > <https://gerrit.chromium.org/gerrit/#/c/51372/>.
> 
> I don't like these Gerrit patches really, it's better to move
> this to the pinctrl core using hogs.
> 
> If you look in drivers/pinctr/core.c you can find this:
> 
> pinctrl_register()
> {
> (...)
>         if (!IS_ERR(pctldev->p)) {
>                 pctldev->hog_default =
>                         pinctrl_lookup_state(pctldev->p,
> PINCTRL_STATE_DEFAULT); if (IS_ERR(pctldev->hog_default)) {
>                         dev_dbg(dev, "failed to lookup the default
> state\n"); } else {
>                         if (pinctrl_select_state(pctldev->p,
>                                                 pctldev->hog_default))
>                                 dev_err(dev,
>                                         "failed to select default
> state\n"); }
> 
>                 pctldev->hog_sleep =
>                         pinctrl_lookup_state(pctldev->p,
>                                                    
> PINCTRL_STATE_SLEEP); if (IS_ERR(pctldev->hog_sleep))
>                         dev_dbg(dev, "failed to lookup the sleep
> state\n"); }
> 
> Just add another state, pctldev->hog_shutdown to this, and
> add an operation pinctrl_force_poweroff() in the same spirit as
> pinctrl_force_sleep() that we already have.
> 
> Add a new state to include/linux/pinctrl/pinctrl-state.h:
> #define PINCTRL_STATE_POWEROFF "poweroff"
> 
> And define you pin table to hog these pins with the mentioned
> default and poweroff states.
> 
> Result: pinctrl core keeps track of your offstate too.

Power down mode settings on our pin controller are completely unrelated to 
normal mode settings. You can set them once in appropriate registers and 
pins are switched to them automatically when the SoC enters sleep mode.

So IMHO in our case power mode settings are just additional pin 
configuration options, next to pull-up/-down and driver strength.

Best regards,
Tomasz
