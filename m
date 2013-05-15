From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 14:19:18 -0700
Message-ID: <CAD=FV=VQ3X=xGhQapcDM6kMRSz0_06wWj7Oxn8hU-zPcajTZDg@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<2016052.zneaYHvtGE@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:49776 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932698Ab3EOVTU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 17:19:20 -0400
Received: by mail-lb0-f170.google.com with SMTP id t11so2404700lbd.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 14:19:19 -0700 (PDT)
In-Reply-To: <2016052.zneaYHvtGE@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, devicetree-discuss@lists.ozlabs.org, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz,

Thanks for your comments.  I'm glad I'm not totally off-track.  I'll
respond to most things in reply to Linus' email, but a few here:

On Wed, May 15, 2013 at 10:26 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>   pinctrl@11400000 {
>>     cyapa_irq: cyapa-irq {
>>       samsung,pins = "gpx1-2";
>>       samsung,pin-function = <0xf>;
>
> You can omit samsung,pin-function here.

One potential reason for leaving them is the hopes that it might cause
a little less line glitching, especially in the case of outputs.
There is some delay between the pinmux being configured at the start
of device probe and the device actually claiming the GPIO.  Things
might be worse in the case of deferred probe (?).  Can you think of
any reason to remove (other than yet more lines of device tree to deal
with)?

>
>>       samsung,pin-pud = <0>;
>>       samsung,pin-drv = <0>;
>
> For inputs I guess you can omit samsung,pin-drv as well.

I will probably leave them even for inputs.  They shouldn't matter but
I like the idea of initting things to a known state...

-Doug
