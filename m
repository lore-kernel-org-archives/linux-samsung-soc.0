From: Doug Anderson <dianders@chromium.org>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Mon, 8 Sep 2014 09:12:03 -0700
Message-ID: <CAD=FV=UkuxpSxAhheRXqzyKLYSh6GyQPP86oD-58UsK6=gLzeQ@mail.gmail.com>
References: <20140905115704.GO13515@arm.com>
	<20140905122232.GP13515@arm.com>
	<CAD=FV=VfioJf9VYoSYL0QBk-bN93-Ecx3=0n9hb5Q4rcx43-_g@mail.gmail.com>
	<540C202E.2060009@collabora.co.uk>
	<540C7F5B.6070307@gmail.com>
	<CAD=FV=UYDDhL02CrhPUAHPncepwAF2-BgTmXOamy-Mdz80S-vw@mail.gmail.com>
	<540D481F.8030500@collabora.co.uk>
	<CAD=FV=U_ZwgqBWN_bLfi97rjMLmDoQBk17gtQS1_ekxJKWJO6w@mail.gmail.com>
	<20140908160758.GS26030@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f179.google.com ([209.85.220.179]:33890 "EHLO
	mail-vc0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753034AbaIHQME (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 12:12:04 -0400
Received: by mail-vc0-f179.google.com with SMTP id im17so1299997vcb.24
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2014 09:12:03 -0700 (PDT)
In-Reply-To: <20140908160758.GS26030@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@kernel.org>

Will,

On Mon, Sep 8, 2014 at 9:07 AM, Will Deacon <will.deacon@arm.com> wrote:
> On Mon, Sep 08, 2014 at 04:55:31PM +0100, Doug Anderson wrote:
>> So "simple-framebuffer" is added to the device tree here:
>>
>> https://chromium-review.googlesource.com/#/c/49358/2/board/samsung/smdk5250/smdk5250.c
>>
>> That's one of the two patches to build your own U-Boot for enabling
>> simplefb.  You'll notice that's not a super official thing.  It's a
>> "DO NOT SUBMIT" patch sitting in a gerrit code review server, so I
>> wouldn't exactly call it a stable ABI that we can't break.  It's not
>> something shipping in real products and it's not even landed in a git
>> tree (I suppose maybe someone somewhere landed it, but...).
>
> I just took the uboot image linked to from the chromium.org page here:
>
>   http://www.chromium.org/chromium-os/u-boot-porting-guide/using-nv-u-boot-on-the-samsung-arm-chromebook#TOC-Getting-nv-U-Boot

Ah, OK.  It's still using the "DO NOT SUBMIT" patchs, but I guess
given that there is a binary built up there by a fairly official
source...  Hrmm.  I think Olof is the one that built that.  Perhaps
he'd be willing to muck with that and see if he can grab the
regulators?

-Doug
