From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 8 Sep 2014 13:20:11 +0100
Message-ID: <CACxGe6v40wMSW8LJRtyZ3C6PinRMcQM-Zog+XpTJ-QG3HHJknw@mail.gmail.com>
References: <20140905115704.GO13515@arm.com> <20140905122232.GP13515@arm.com>
 <CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
 <540C202E.2060009@collabora.co.uk> <540C7F5B.6070307@gmail.com>
 <540C83DE.10505@collabora.co.uk> <540C8577.2070907@gmail.com> <20140908112112.GK26030@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:45642 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753482AbaIHMUb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 08:20:31 -0400
Received: by mail-ig0-f171.google.com with SMTP id l13so2584843iga.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2014 05:20:31 -0700 (PDT)
In-Reply-To: <20140908112112.GK26030@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>

On Mon, Sep 8, 2014 at 12:21 PM, Will Deacon <will.deacon@arm.com> wrote:
> On Sun, Sep 07, 2014 at 05:19:03PM +0100, Tomasz Figa wrote:
>> At least for next 3.17-rc I'd suggest fixing this up in respective clock
>> driver and dropping the hack only after Exynos DRM patches are merged
>> and confirmed working.
>
> Whilst I'm sympathetic to people working to enable DRM, I think this is
> the right solution to the problem. The transition from simplefb to DRM
> shouldn't break display for a bunch of kernel revisions whilst the code is
> in flux.

I would go further. The kernel behaviour has changed, and we have to
deal with platforms that assume the old behaviour. That means either
defaulting to leaving enabled regulators/clocks alone unless there is
a flag in the DT saying they can be power managed, or black listing
platforms that are known to depend on the regulator being on.

Updating the device tree must not be required to get the kernel to
boot, but it is valid to require a DT upgrade to get better
performance (battery life) out of the platform.

g.
