From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Update exynos_defconfig
Date: Tue, 15 Jul 2014 13:55:16 +0530
Message-ID: <CAHfPSqCifjTWwhiN9+UvBWdAQHZu9xNO8hjc0OGqG=Z8Gr1L=w@mail.gmail.com>
References: <1404901353-14806-1-git-send-email-sachin.kamat@samsung.com>
 <CAD=FV=XHFY3OtPg6vttpAkX1he0iS6cFLVC6ESauG+1=gredwA@mail.gmail.com>
 <CAOesGMgyZN8TApVO0Svi65qLBzV6jnzGNg9UP1U+hRw=uXg1Bw@mail.gmail.com> <CAK5sBcEwehAeDqTG=+sRzw57krnQ=8J3wGGcPsuR7r4VZ3tJVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:58333 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256AbaGOIZh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 04:25:37 -0400
Received: by mail-qg0-f43.google.com with SMTP id a108so4378857qge.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jul 2014 01:25:37 -0700 (PDT)
In-Reply-To: <CAK5sBcEwehAeDqTG=+sRzw57krnQ=8J3wGGcPsuR7r4VZ3tJVw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <spk.linux@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@linaro.org>, Vivek Gautam <gautam.vivek@samsung.com>, naveen krishna <ch.naveen@samsung.com>

Hello Sachin,

On 15 July 2014 10:01, Sachin Kamat <spk.linux@gmail.com> wrote:
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
>
>> [WARN] [    1.673277] 10060000.tmu supply vtmu not found, using dummy regulator
>> [WARN] [    1.685873] 10064000.tmu supply vtmu not found, using dummy regulator
>> [WARN] [    1.706262] 10068000.tmu supply vtmu not found, using dummy regulator
>> [WARN] [    1.720076] 1006c000.tmu supply vtmu not found, using dummy regulator
>> [WARN] [    1.733957] 100a0000.tmu supply vtmu not found, using dummy regulator
>
> I think similar patches as with USB are required here.
> Naveen, comments?

The "vtmu" regulator supply is required only for one of the Exynos4412
based boards.
There is a TODO in the driver for the same.

This warning can be ignored for Exynos5 based platforms.

>
> --
> Regards,
> Sachin.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Shine bright,
(: Nav :)
