From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 15:01:23 -0700
Message-ID: <CAD=FV=XBHtVO6TzbNVXc_omW8ki7DAMx58hLmT0HsyEvUs3YMg@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<CACRpkdbgjqF3xhxUvfvNJn5Vt-3i0AFBzR_Q8gHdNq919dnNsA@mail.gmail.com>
	<CAD=FV=V-1uO3XSg603zyJx907EhhkMC5UCOfzrhgyGWw_0TO0A@mail.gmail.com>
	<2118733.fzZiu9I5M5@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:39711 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751345Ab3EOWBY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 18:01:24 -0400
Received: by mail-lb0-f179.google.com with SMTP id d10so2435363lbj.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 15:01:23 -0700 (PDT)
In-Reply-To: <2118733.fzZiu9I5M5@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Tomasz,

On Wed, May 15, 2013 at 2:41 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> This will be hard, since the phandle in interrupt-parent is represented by
> an IRQ domain in kernel code. One-interrupt IRQ domains seem a bit awkward
> to me.
>
> Since we are already going to modify the binding, let's think a bit more
> about this problem and try to figure out a solution that doesn't add any
> disadvantages (at least any significant) to avoid such situation in future
> again.

I'm definitely not super familiar with the implementation at that
level of detail, so don't take my proposed syntax as something I've
thought all the way through.  ...but hopefully you understand what I'm
getting at in terms of eliminating duplication?

Thanks!  :)

-Doug
