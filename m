From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Fri, 17 May 2013 10:38:53 +0200
Message-ID: <CACRpkdZ+wrV9O6T0XQFtpLeOgvEhACXc4ycokiqof81K7GSLjg@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<CACRpkdbgjqF3xhxUvfvNJn5Vt-3i0AFBzR_Q8gHdNq919dnNsA@mail.gmail.com>
	<51941F64.9090104@wwwdotorg.org>
	<CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f182.google.com ([209.85.223.182]:62061 "EHLO
	mail-ie0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753136Ab3EQIiy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 May 2013 04:38:54 -0400
Received: by mail-ie0-f182.google.com with SMTP id a14so8754562iee.27
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 May 2013 01:38:53 -0700 (PDT)
In-Reply-To: <CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On Thu, May 16, 2013 at 2:03 AM, Doug Anderson <dianders@google.com> wrote:

>> I prefer to put all the static pinctrl configuration in the pinctrl hog,
>> and only the dynamic stuff in the individual device nodes.
>>
>> I know LinusW won't like this suggestion much though:-)

(It's not that bad actually...)

> Ah right!  I forgot about hogs in this case.  That's also reasonable
> as a solution and is similar to what we've got in the tree for
> powerdown configuration of pins (I'll try to post this patch soon too,
> WIP at <https://gerrit.chromium.org/gerrit/#/c/51292/> and
> <https://gerrit.chromium.org/gerrit/#/c/51372/>.

I don't like these Gerrit patches really, it's better to move
this to the pinctrl core using hogs.

If you look in drivers/pinctr/core.c you can find this:

pinctrl_register()
{
(...)
        if (!IS_ERR(pctldev->p)) {
                pctldev->hog_default =
                        pinctrl_lookup_state(pctldev->p, PINCTRL_STATE_DEFAULT);
                if (IS_ERR(pctldev->hog_default)) {
                        dev_dbg(dev, "failed to lookup the default state\n");
                } else {
                        if (pinctrl_select_state(pctldev->p,
                                                pctldev->hog_default))
                                dev_err(dev,
                                        "failed to select default state\n");
                }

                pctldev->hog_sleep =
                        pinctrl_lookup_state(pctldev->p,
                                                    PINCTRL_STATE_SLEEP);
                if (IS_ERR(pctldev->hog_sleep))
                        dev_dbg(dev, "failed to lookup the sleep state\n");
        }

Just add another state, pctldev->hog_shutdown to this, and
add an operation pinctrl_force_poweroff() in the same spirit as
pinctrl_force_sleep() that we already have.

Add a new state to include/linux/pinctrl/pinctrl-state.h:
#define PINCTRL_STATE_POWEROFF "poweroff"

And define you pin table to hog these pins with the mentioned
default and poweroff states.

Result: pinctrl core keeps track of your offstate too.

Yours,
Linus Walleij
