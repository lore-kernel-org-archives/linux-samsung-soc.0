From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Fri, 17 May 2013 13:59:54 +0200
Message-ID: <CACRpkdZvN_0fd6N11NeSRtVZd5A1oE9TEhbOOz6Q27x6M39bcQ@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com>
	<CACRpkdZ+wrV9O6T0XQFtpLeOgvEhACXc4ycokiqof81K7GSLjg@mail.gmail.com>
	<2465185.vYkbXUqoOT@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:52218 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752487Ab3EQL7y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 07:59:54 -0400
Received: by mail-ie0-f181.google.com with SMTP id x12so8858606ief.40
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 04:59:54 -0700 (PDT)
In-Reply-To: <2465185.vYkbXUqoOT@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Doug Anderson <dianders@google.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On Fri, May 17, 2013 at 11:09 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

>> Just add another state, pctldev->hog_shutdown to this, and
>> add an operation pinctrl_force_poweroff() in the same spirit as
>> pinctrl_force_sleep() that we already have.
>>
>> Add a new state to include/linux/pinctrl/pinctrl-state.h:
>> #define PINCTRL_STATE_POWEROFF "poweroff"
>>
>> And define you pin table to hog these pins with the mentioned
>> default and poweroff states.
>>
>> Result: pinctrl core keeps track of your offstate too.
>
> Power down mode settings on our pin controller are completely unrelated to
> normal mode settings. You can set them once in appropriate registers and
> pins are switched to them automatically when the SoC enters sleep mode.

Aha so it's actually automatic sleep modes, not power down
(as in, disconnect the power and then push the "on" button to
get it back up).

Please remember to document it per above in the code and the
device tree, so everybody understands what it is.

> So IMHO in our case power mode settings are just additional pin
> configuration options, next to pull-up/-down and driver strength.

I see. Yes that is different.

You might want to have a debugfs file in your driver for inspecting
them though, that sounds like it could be helpful. I'd recommend
augmenting your .pin_config_dbg_show() callback in the
struct pinconf_ops to display this for each pin, in addition to the
current configuration.

Yours,
Linus Walleij
