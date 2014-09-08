From: Doug Anderson <dianders@chromium.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 8 Sep 2014 08:55:31 -0700
Message-ID: <CAD=FV=U_ZwgqBWN_bLfi97rjMLmDoQBk17gtQS1_ekxJKWJO6w@mail.gmail.com>
References: <20140905115704.GO13515@arm.com>
	<20140905122232.GP13515@arm.com>
	<CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
	<540C202E.2060009@collabora.co.uk>
	<540C7F5B.6070307@gmail.com>
	<CAD=FV=UYDDhL02CrhPUAHPncepwAF2-BgTmXOamy-Mdz80S-vw@mail.gmail.com>
	<540D481F.8030500@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f171.google.com ([209.85.220.171]:50896 "EHLO
	mail-vc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753292AbaIHPzc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 11:55:32 -0400
Received: by mail-vc0-f171.google.com with SMTP id id10so15560101vcb.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2014 08:55:31 -0700 (PDT)
In-Reply-To: <540D481F.8030500@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will.deacon@arm.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>

Javier,

On Sun, Sep 7, 2014 at 11:09 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Doug,
>
> On 09/08/2014 06:36 AM, Doug Anderson wrote:
>>
>> One (ugly?) solution would be to add a feature to your bootloader to
>> modify the device tree to mark regulators as "always-on".  Since the
>> booloader gets to touch the device tree and the bootloader is involved
>> in communicating into about SimpleFB, it kinda makes sense.
>>
>
> I can't say I like to mark the regulators as always-on on the DT and that's
> why I copied the patch in the response instead of posting it as a proper patch
> but I think relying in the bootloaders to modify the DT is not better.
>
> IMHO U-boot should only modify the strictly necessary like the /chosen branch
> even though lately I've seen some attempts in the OMAP community to (ab)use
> U-Boot's fdt command to mangle the DT before passing to the kernel in order to
> support different Beagle Bone Black capes.

So "simple-framebuffer" is added to the device tree here:

https://chromium-review.googlesource.com/#/c/49358/2/board/samsung/smdk5250/smdk5250.c

That's one of the two patches to build your own U-Boot for enabling
simplefb.  You'll notice that's not a super official thing.  It's a
"DO NOT SUBMIT" patch sitting in a gerrit code review server, so I
wouldn't exactly call it a stable ABI that we can't break.  It's not
something shipping in real products and it's not even landed in a git
tree (I suppose maybe someone somewhere landed it, but...).

To me, that means that if someone is using that patch and it works for
them, then that's great!  If it stops working (possibly because it was
making assumptions about the state of the kernel) then it should be
fixed up.

In this case, that patch really should be adding references to
regulators (and possibly clocks) that are needed.  Given that this
patch is already reaching into the device tree to add the
"simple-framebuffer" node, it doesn't seem unreasonable to say that it
should be grabbing the proper references (or mark regulators as
always-on).


...as always, though, remember that my opinion doesn't count for much.
I also sympathize with the problems people are running into.  :(
