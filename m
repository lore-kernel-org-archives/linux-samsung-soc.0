From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 23:41:54 +0200
Message-ID: <2118733.fzZiu9I5M5@flatron>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com> <CACRpkdbgjqF3xhxUvfvNJn5Vt-3i0AFBzR_Q8gHdNq919dnNsA@mail.gmail.com> <CAD=FV=V-1uO3XSg603zyJx907EhhkMC5UCOfzrhgyGWw_0TO0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178]:45084 "EHLO
	mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354Ab3EOVl6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 17:41:58 -0400
Received: by mail-ea0-f178.google.com with SMTP id q16so1370944ead.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 14:41:57 -0700 (PDT)
In-Reply-To: <CAD=FV=V-1uO3XSg603zyJx907EhhkMC5UCOfzrhgyGWw_0TO0A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

On Wednesday 15 of May 2013 14:31:20 Doug Anderson wrote:
> Linus,
> 
> Thank you for your comments.  See below...
> 
> Stephen: sorry for missing you earlier!  :(
> 
> On Wed, May 15, 2013 at 11:29 AM, Linus Walleij
> 
> <linus.walleij@linaro.org> wrote:
> > But please use the preprocessor to provide symbolic names for
> > the configurations. See for example these two patches from
> > J-C:
> > http://www.mail-archive.com/devicetree-discuss@lists.ozlabs.org/msg321
> > 64.html
> Ah, that does look nice!  This probably needs to be addressed in a
> separate patch to cleanup all of the samsung pinctrl devicetrees.
> 
> > I don't think the idea with device tree is to write as compact trees
> > as possible, but as expressive and exact yet abstract trees as
> > possible for OS independence.
> 
> The compactness was one benefit, but also it was about trying to avoid
> excessive duplication of information.  I found it awkward that I
> needed to list that my interrupt was "gpx1-2" in two different ways.
> 
> I would find it just as good if I could express things like this (for
> interrupts):
> 
>   pinctrl@11400000 {
>     cyapa_irq: cyapa-irq {
>       samsung,pins = "gpx1-2";
>       samsung,pin-function = <0xf>;
>       samsung,pin-pud = <0>;
>       samsung,pin-drv = <0>;
> 
>       interrupt-controller;
>       #interrupt-cells = <1>;
>     };
>   };
> 
>   trackpad {
>     reg = <0x67>;
>     compatible = "cypress,cyapa";
>     interrupt-parent = <&cyapa_irq>;
>     interrupts = <0>;
>     wakeup-source;
>   };
> 
> In this case I'm not saying that my interrupt parent is "gpx1-2" in
> two separate places that could diverge.

This will be hard, since the phandle in interrupt-parent is represented by 
an IRQ domain in kernel code. One-interrupt IRQ domains seem a bit awkward 
to me.

Since we are already going to modify the binding, let's think a bit more 
about this problem and try to figure out a solution that doesn't add any 
disadvantages (at least any significant) to avoid such situation in future 
again.

Best regards,
Tomasz
