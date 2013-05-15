From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 14:57:43 -0700
Message-ID: <CAD=FV=WSa9BBDKu8jE43ZG+NS1ZSZYQE5Z2n2ts7BmmbTUnSWg@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<2016052.zneaYHvtGE@flatron>
	<CAD=FV=VQ3X=xGhQapcDM6kMRSz0_06wWj7Oxn8hU-zPcajTZDg@mail.gmail.com>
	<2019038.uIdiqCOAdU@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:54626 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab3EOV5p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 17:57:45 -0400
Received: by mail-la0-f46.google.com with SMTP id fk20so2312755lab.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 14:57:44 -0700 (PDT)
In-Reply-To: <2019038.uIdiqCOAdU@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz,

On Wed, May 15, 2013 at 2:36 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> One potential reason for leaving them is the hopes that it might cause
>> a little less line glitching, especially in the case of outputs.
>> There is some delay between the pinmux being configured at the start
>> of device probe and the device actually claiming the GPIO.  Things
>> might be worse in the case of deferred probe (?).  Can you think of
>> any reason to remove (other than yet more lines of device tree to deal
>> with)?
>
> Well, actually in case of interrupts the function should not be configured
> manually, because it is likely to cause a false interrupt to be caught,
> before appropriate interrupt trigger type is configured. The correct way
> is to leave setting pin function to EINT to the pin control driver once
> the trigger gets configured (the pin control driver configures pin
> function from set_irq_type callback).

Ah, OK.  I'll set to input for these.


>> I will probably leave them even for inputs.  They shouldn't matter but
>> I like the idea of initting things to a known state...
>
> Well, the binding you proposed for interrupts doesn't initialize it. This
> is why I pointed that it can be omitted using current way as well.

Agreed.  ...though you could say that the actual code in that case
would just be setting the drive strength to 0 (for consistency).  ;)

-Doug
