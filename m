From: Doug Anderson <dianders@chromium.org>
Subject: Re: State of pinctrl and exynos5250?
Date: Tue, 5 Mar 2013 15:29:17 -0800
Message-ID: <CAD=FV=XMpL7z-UX4UgqaUv-=QcJAPOD3bKbLVTRsR15RTG1A2Q@mail.gmail.com>
References: <CAD=FV=XTHs5De3hrZu5BMPD3sTzBLikHwdS88XA0KOn-XG499Q@mail.gmail.com>
	<1534249.MsU3ROUVJz@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:52171 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750931Ab3CEX3T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 18:29:19 -0500
Received: by mail-lb0-f181.google.com with SMTP id gm6so5199688lbb.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Mar 2013 15:29:17 -0800 (PST)
In-Reply-To: <1534249.MsU3ROUVJz@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Prathyush <prathyush.k@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Olof Johansson <olofj@chromium.org>, Simon Glass <sjg@chromium.org>, Katie Roberts-Hoffman <katierh@chromium.org>, Linus Walleij <linus.walleij@linaro.org>

Tomasz,

Thanks for your response.


On Sat, Mar 2, 2013 at 3:48 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>
> The 4 patches above are already merged in Kgene's for-next-next (for 3.10)
> branch.

Excellent.  I see them now.  I haven't yet seen them show up in
linux-next (which is where I tend to look first), though...

>> ARM: dts: add pinctrl nodes for Exynos5250 SoC
>> - https://patchwork.kernel.org/patch/1871991/
>
> This one is not merged yet. Since I do not know much about Exynos 5250, I
> could not verify any hardware-specific details in the patch, just the
> general correctness of the patch.

OK, good.  That means you guys came to the same conclusions that I did.  :)

>> IMHO that means we've got the following work ahead of us:
>> 1. Add pinctrl support to dw_mmc-exynos (with backward compability for
>> GPIO specifier)
>> 2. Add pinctrl support to spi-s3c64xx.c (with backward compability for
>> GPIO specifier)
>
> There is a patch that should be already merged that makes the driver core
> set default pinctrl state for a device before entering driver's probe
> callback.
>
> In case when the driver doesn't require more states than just the default
> one you don't have to add pinctrl support to the driver at all, just
> specify appropriate pinctrl properties in device tree (with only one state
> listed in pinctrl-names called "default").
>
> However in some drivers this might be prevented by legacy pin
> configuration code which would fail.

Nice to know about.  In the very least I'm pretty sure that we'll need
a patch to make the GPIO settings optional.  Looking at
dw_mci_exynos_setup_bus it's a fatal error if the GPIOs are missing.
The dw_mmc stuff will also be interesting since we'll need to figure
out if the muxing needs to be specified on a per-slot level.  I think
that most of the automatic stuff won't work in that case.

It sounds like Thomas is planning on taking this on?

-Doug
