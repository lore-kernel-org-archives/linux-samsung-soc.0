From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add Samsung pinctrl entries
Date: Thu, 13 Jun 2013 20:25:09 +0200
Message-ID: <CACRpkdbmO2opXAzrVqmjFS3JpTb62qeaV1-24vovJGRxxgxU4Q@mail.gmail.com>
References: <1371143144-31764-1-git-send-email-dianders@chromium.org>
	<9948950.GZ51yJYkxQ@flatron>
	<CAD=FV=Un+Ti8atZLUbK+5w=dB7vX7HoxVacEGkjvCboVo4mNpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:63632 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759014Ab3FMSZK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 14:25:10 -0400
Received: by mail-ob0-f172.google.com with SMTP id wo10so15407653obc.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2013 11:25:09 -0700 (PDT)
In-Reply-To: <CAD=FV=Un+Ti8atZLUbK+5w=dB7vX7HoxVacEGkjvCboVo4mNpA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Mauro Carvalho Chehab <mchehab@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Cesar Eduardo Barros <cesarb@cesarb.net>, "David S. Miller" <davem@davemloft.net>, Hans Verkuil <hans.verkuil@cisco.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Abraham <thomas.abraham@linaro.org>

On Thu, Jun 13, 2013 at 7:25 PM, Doug Anderson <dianders@chromium.org> wrote:

>>> +PIN CONTROLLER - SAMSUNG
>>> +M:   Linus Walleij <linus.walleij@linaro.org>
>>> +M:   Kukjin Kim <kgene.kim@samsung.com>
>>
>> So actually this would be:
>> M:      Thomas Abraham <thomas.abraham@linaro.org>
>> M:      Tomasz Figa <t.figa@samsung.com>
>>
>> Thomas, do you agree on this?
>
> Ah.  Wasn't sure where the official maintainership should lie.  ;)  If
> Thomas is happy with this then I'll spin and re-send.  Shall I remove
> Kukjin and Linus, then?  It's convenient to have Linus on the list
> since he tends to be the one applying the patches...

Check what output you get from scripts/get-maintainer before
and after this patch. I don't know how it works but I think I
will end up on this list anyway due to the way the bigger
regex for the subsystem works. I.e. this:

PIN CONTROL SUBSYSTEM
M:      Linus Walleij <linus.walleij@linaro.org>
S:      Maintained
F:      drivers/pinctrl/
F:      include/linux/pinctrl/

Yours,
Linus Walleij
