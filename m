From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Thu, 16 May 2013 00:06:48 +0200
Message-ID: <4040680.Aq1C9TECZX@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <2118733.fzZiu9I5M5@flatron> <CAD=FV=XBHtVO6TzbNVXc_omW8ki7DAMx58hLmT0HsyEvUs3YMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f175.google.com ([209.85.215.175]:51502 "EHLO
	mail-ea0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752301Ab3EOWGw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 18:06:52 -0400
Received: by mail-ea0-f175.google.com with SMTP id h10so1203194eaj.20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 15:06:51 -0700 (PDT)
In-Reply-To: <CAD=FV=XBHtVO6TzbNVXc_omW8ki7DAMx58hLmT0HsyEvUs3YMg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On Wednesday 15 of May 2013 15:01:23 Doug Anderson wrote:
> Tomasz,
> 
> On Wed, May 15, 2013 at 2:41 PM, Tomasz Figa <tomasz.figa@gmail.com> 
wrote:
> > This will be hard, since the phandle in interrupt-parent is
> > represented by an IRQ domain in kernel code. One-interrupt IRQ
> > domains seem a bit awkward to me.
> > 
> > Since we are already going to modify the binding, let's think a bit
> > more about this problem and try to figure out a solution that doesn't
> > add any disadvantages (at least any significant) to avoid such
> > situation in future again.
> 
> I'm definitely not super familiar with the implementation at that
> level of detail, so don't take my proposed syntax as something I've
> thought all the way through.  ...but hopefully you understand what I'm
> getting at in terms of eliminating duplication?

Yes. I don't like the current way too much either, duplication being one 
of the reasons.

Best regards,
Tomasz
