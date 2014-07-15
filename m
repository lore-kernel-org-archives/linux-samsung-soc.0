From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Tue, 15 Jul 2014 16:17:36 +0530
Message-ID: <CAFp+6iED1C1_nxgcCz1PwwXSMfgauzhxjobPR58Xig4KAPqHPQ@mail.gmail.com>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
	<CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
	<CAOesGMgyZN8TApVO0Svi65qLBzV6jnzGNg9UP1U+hRw=uXg1Bw@mail.gmail.com>
	<CAK5sBcEwehAeDqTG=+sRzw57krnQ=8J3wGGcPsuR7r4VZ3tJVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f45.google.com ([209.85.216.45]:64284 "EHLO
	mail-qa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758038AbaGOKrh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 06:47:37 -0400
Received: by mail-qa0-f45.google.com with SMTP id cm18so2881008qab.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2014 03:47:36 -0700 (PDT)
In-Reply-To: <CAK5sBcEwehAeDqTG=+sRzw57krnQ=8J3wGGcPsuR7r4VZ3tJVw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <spk.linux@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, naveen krishna <ch.naveen@samsung.com>

On Tue, Jul 15, 2014 at 10:01 AM, Sachin Kamat <spk.linux@gmail.com> wrote:
> On Tue, Jul 15, 2014 at 12:20 AM, Olof Johansson <olof@lixom.net> wrote:
>> On Mon, Jul 14, 2014 at 9:47 AM, Doug Anderson <dianders@chromium.org> wrote:
>>> Sachin,
>>>
>>> On Wed, Jul 9, 2014 at 3:22 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>
> <snip>
>
>> Gave this a go on my board farm as well, it looks better than before
>> for sure. Boot logs are at:
>> http://arm-soc.lixom.net/bootlogs/misc/v3.16-rc4-360-g1501776
>>
>> There are still some issues to resolve but this is an improvement so
>> let's pick it up and fix with new patches on top.
>
> Thanks for your review and testing.
>
>>
>> Some of the new warnings are:
>>
>> [WARN] [    0.785066] usb@12000000 supply vdd33 not found, using dummy regulator
>> [WARN] [    0.791071] usb@12000000 supply vdd10 not found, using dummy regulator
>> [WARN] [    0.998658] usb@12400000 supply vdd33 not found, using dummy regulator
>> [WARN] [    1.004049] usb@12400000 supply vdd10 not found, using dummy regulator
>
> Vivek had submitted patches for the same [1].
> Vivek, any updates?
>
> [1] https://lkml.org/lkml/2014/6/25/363

Well, these messages are coming out of DWC3, where VDD3.3 and VDD1.0
regulators are expected.
These regulator right now are required by smdk5250, and on boards on
which the USB Vdd regulators are not
enabled by default. On peach and snow, this will just be a warning and
we will go ahead with the probe.

To add the required dt entry for these regulators is in my TODO list,
but on snow and peach there's no regression
due to unavailability of these, since the required regulator supplies
are enabled by default.

[snip]


-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
