From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: Unable to boot mainline on snow chromebook since 3.15
Date: Fri, 5 Sep 2014 19:16:03 +0530
Message-ID: <CAEC9eQOMd7ME5KiG2QHCf3TMJAwSxLUgGpmFrpw_HQT4me9YWg@mail.gmail.com>
References: <20140905115704.GO13515@arm.com>
	<20140905122232.GP13515@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:58208 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756935AbaIENqD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Sep 2014 09:46:03 -0400
Received: by mail-ie0-f180.google.com with SMTP id at1so568691iec.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Sep 2014 06:46:03 -0700 (PDT)
In-Reply-To: <20140905122232.GP13515@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>
Cc: "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "olof@lixom.net" <olof@lixom.net>, "dianders@chromium.org" <dianders@chromium.org>, "rahul.sharma@samsung.com" <rahul.sharma@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Will,

On Fri, Sep 5, 2014 at 5:52 PM, Will Deacon <will.deacon@arm.com> wrote:
> [Looks like it's not just Rutland that can't spell the address of the
>  mailing list today. Fixed here, so please use this post in any replies].
>
> On Fri, Sep 05, 2014 at 12:57:04PM +0100, Will Deacon wrote:
>> Hi all,
>>
>> I'm one of the few, foolish people to try running mainline on my 5250-based
>> Samsung Chromebook (snow). I can live without wireless, usb3 and video
>> acceleration, so actually it makes a reasonable development platform for
>> doing A15-based (micro)-architectural work.
>>
>> However, since 3.15 I've not been able to boot *any* mainline kernels on
>> this board. I did mean to report this earlier, but I have other machines
>> that can run mainline so this has fallen by the wayside.
>>
>> The problems started with 3.16, where simple-fb would fail to initialise
>> and I lost my display. Note that I don't have a serial console on this
>> machine (I looked at the PCB and there's no way I can solder one of those
>> myself :) I bisected the issue at the time, and I could get my display back
>> by removing some of the new regulator and hdmi properties from the DT. At
>> that point, I could boot, but DMA didn't initialise for the MMC controller
>> so I couldn't mount my root filesystem.
>>http://www.spinics.net/lists/dri-devel/msg66740.html
>> With 3.17-rc3, it seems a lot worse -- I don't get any output after nv-uboot
>> (i.e. the nv-uboot screen just remains on the display, with the last line
>> reading "Stashed 20 records").
>>
>> I'd usually try to debug this a bit further, but without a console it's
>> really painful to get anywhere. I've been working with 3.15, but now I'm
>> having to backport patches when I want to test them, which is more effort
>> than I can be bothered with.
>>
>> Is anybody else running mainline on this device and are these known/fixed
>> problems?
AFAIK, ARM chromebooks use DRM based display drivers and the required
patches are still not merged:
http://www.spinics.net/lists/dri-devel/msg66740.html

Corresponding DT patches are also still not merged:
http://www.spinics.net/lists/arm-kernel/msg358324.html
http://www.spinics.net/lists/arm-kernel/msg358325.html

There is a patch for configs as well:
https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35828.html

Try these patches(I hope they will apply directly on 3.17-rc3) and you should
be able to use display on snow.

Ajay
