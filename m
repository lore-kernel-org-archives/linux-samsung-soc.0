From: Doug Anderson <dianders@google.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Wed, 15 May 2013 17:03:44 -0700
Message-ID: <CAD=FV=UWftrtEe+qUT92RTd-3BG8hpznu3CtztOfw4eMWOqHrw@mail.gmail.com>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
	<CACRpkdbgjqF3xhxUvfvNJn5Vt-3i0AFBzR_Q8gHdNq919dnNsA@mail.gmail.com>
	<51941F64.9090104@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:50800 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414Ab3EPADq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 20:03:46 -0400
Received: by mail-lb0-f180.google.com with SMTP id o10so2495095lbi.39
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 May 2013 17:03:44 -0700 (PDT)
In-Reply-To: <51941F64.9090104@wwwdotorg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>

Stephen,

On Wed, May 15, 2013 at 4:51 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> I don't really see much disadvantage here; the interrupt bindings
> specify things related to interrupts and the pinctrl bindings specify
> thing related to pin configuration.

OK.  If this is the best way then I can accept that and maybe we
should just drop this thread.  What do people think?  It means less
work for me in the short term since I've already got it implemented
that way and then I don't need to submit any patches to try to change
things!  ;)


> If you want to condense the DT, I'd suggest using a the pinctrl hogging
> feature, i.e. don't put pinctrl-* properties in the trackpad node, but
> rather define a system-wide "default" pinctrl state in the pin
> controller node itself. That configuration will be applied as soon as
> the pin controller driver is registered. That'd be the same as the
> above, with the following added:
>
> pinctrl@11400000 {
>     pinctrl-names = "default";
>     pinctrl-0 = <&cyapa_irq>;
> };
>
> except that the pinctrl-0 property would probably end up configuring a
> whole bunch of basic pinctrl state rather than just that one interrupt pin.
>
> I prefer to put all the static pinctrl configuration in the pinctrl hog,
> and only the dynamic stuff in the individual device nodes.
>
> I know LinusW won't like this suggestion much though:-)

Ah right!  I forgot about hogs in this case.  That's also reasonable
as a solution and is similar to what we've got in the tree for
powerdown configuration of pins (I'll try to post this patch soon too,
WIP at <https://gerrit.chromium.org/gerrit/#/c/51292/> and
<https://gerrit.chromium.org/gerrit/#/c/51372/>.

It sounds like there's a bit of disagreement about the "best way" so
I'll probably keep the way I have.  ...but I'll keep hogs in my back
pocket.


> I don't like that myself, since it makes the interrupt binding (and I
> assume you'd want to go back to the similar misuse in the GPIO binding)
> also configure pinctrl-related stuff.

Fair enough.  :)

-Doug
