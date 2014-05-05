From: Tom Rini <trini@ti.com>
Subject: Re: [PATCH 3/3] ARM: dts: Add peach-pi board support
Date: Mon, 5 May 2014 14:18:09 -0400
Message-ID: <5367D5E1.9070709@ti.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>	<1399035821-25096-4-git-send-email-arun.kk@samsung.com>	<5363D176.80601@gmail.com>	<CAD=FV=XYjMg7V9=OzAy_ifwaM83QS0tiTrp5+nxvG236kkSjRQ@mail.gmail.com>	<53644DDB.7050503@gmail.com> <CAD=FV=U_b_n=V_mEFYNPFZ1wyrgjjr5jEGrVb5TviP0Z33popg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:43970 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750713AbaEESSS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 14:18:18 -0400
In-Reply-To: <CAD=FV=U_b_n=V_mEFYNPFZ1wyrgjjr5jEGrVb5TviP0Z33popg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>

On 05/05/2014 11:17 AM, Doug Anderson wrote:
> On Fri, May 2, 2014 at 7:00 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Well, if you can use the device tree of peach-pit board and boot peach-pi
>> and vice-versa and it won't cause any hardware failures then I guess it's
>> fine to keep this string.
> 
> I believe you can actually make it a good portion of the way through
> boot, though a bunch of things (including graphics) won't work.  I
> general I don't think it's all that different from "exynos5".
> 
> 
>>>> I don't think this is a good idea, because this is basically rendering
>>>> this
>>>> dts file useless, unless used with a bootloader that can actually inject
>>>> correct values. I believe that some generic setup could be provided in
>>>> the
>>>> dts, so you could at least get the board running.
>>>
>>>
>>> I won't say that I care a whole lot, but I think that was what was
>>> agreed upon the other day.  Specifically Tom Rini of U-Boot was
>>> worried about the fact that U-Boot will read the memory node and
>>> totally clobber it.  He thought there might be cases where someone
>>> might _purposely_ not want U-Boot to do that.
>>>
>>> ...I would wonder what alternate bootloader you're imagining will
>>> actually run on this board and not do this?
>>
>>
>> People should have the freedom to choose anything they want. We have also
>> barebox and coreboot with ARM and even Exynos5 support (in coreboot), but
>> people might want to use something completely exotic as well and the device
>> tree should let them do so.
> 
> Fair enough.  Unless Tom cares about this enough to throw his opinion
> in here, I guess our answer is that the memory node should have a sane
> default and we'll expect the bootloader to put something better in if
> it can properly probe memory.
> 
> In this case I guess it would be 2GB.

So, a memory node that says a size of 0 is a valid and long standing
(see PowerPC folks) way of saying "please fill in my memory node value
for me" due to any number of reasons for not knowing before hand how
much memory there is.  Any boot loader which cannot fill in the memory
node is going to have problems with the various boards (PowerPC, ARM and
other) which say "my memory size is 0, I want this fixed up at run time".

The problem I was raising at the ELC BoF is that today we can't just
stop overwriting values in the non-zero case as many boards lie about
their memory size, in non-zero ways, but no one noticed as they only
tested with U-Boot which was performing the fixup.

-- 
Tom
