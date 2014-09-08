From: Doug Anderson <dianders@chromium.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Sun, 7 Sep 2014 21:36:56 -0700
Message-ID: <CAD=FV=UYDDhL02CrhPUAHPncepwAF2-BgTmXOamy-Mdz80S-vw@mail.gmail.com>
References: <20140905115704.GO13515@arm.com>
	<20140905122232.GP13515@arm.com>
	<CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
	<540C202E.2060009@collabora.co.uk>
	<540C7F5B.6070307@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:48698 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845AbaIHEg5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 00:36:57 -0400
Received: by mail-ob0-f171.google.com with SMTP id wn1so10457502obc.30
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Sep 2014 21:36:57 -0700 (PDT)
In-Reply-To: <540C7F5B.6070307@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Will Deacon <will.deacon@arm.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>

Hi,

On Sun, Sep 7, 2014 at 8:52 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> So I believe we've got a process issue here. If you don't have normal
> support for display hardware, but you want to keep the display
> operational thanks to bootloader already initializing it, you should not
> add anything to the kernel which breaks it, until full support comes in.
>
> This means that respective regulators should be either always-on or not
> listed at all (I'd favor the former) and respective clocks either
> somehow enabled at boot-up or completely ignored, including all their
> parents capable of being gated.

It seems slightly broken to hack the device tree in this way.  I'll be
the first to admit that I often list regulators as "always-on" during
bringup when not everything is done, and I guess it's not that
different.  ...but given everything going on upstream (and people
working on Suspend/Resume, DRM, etc) it seems like it might be a bit
of a pain.  ...but if that's what everyone agrees on, I won't disagree
too strongly.

One (ugly?) solution would be to add a feature to your bootloader to
modify the device tree to mark regulators as "always-on".  Since the
booloader gets to touch the device tree and the bootloader is involved
in communicating into about SimpleFB, it kinda makes sense.
