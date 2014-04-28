From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] ARM: dts: Add peach-pit board support
Date: Mon, 28 Apr 2014 10:43:15 -0700
Message-ID: <CAD=FV=Usv07WuEX42mXK=2iEN_QZPgO+FVUOvj4_+spdNiiDag@mail.gmail.com>
References: <1398313031-14848-1-git-send-email-arun.kk@samsung.com>
	<535B9944.8090503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:55893 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751891AbaD1TTb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 15:19:31 -0400
Received: by mail-vc0-f178.google.com with SMTP id hu19so8616352vcb.37
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 12:19:29 -0700 (PDT)
In-Reply-To: <535B9944.8090503@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arun Kumar K <arun.kk@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olofj@google.com>, Sachin Kamat <sachin.kamat@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Arun Kumar <arunkk.samsung@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Grant Likely <grant.likely@secretlab.ca>

Tomasz and Arun,

On Sat, Apr 26, 2014 at 4:32 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> Hi Arun,
>
>
> On 24.04.2014 06:17, Arun Kumar K wrote:
>>
>> Adds the google peach-pit board dts file which uses
>> exynos5420 SoC.
>>
>> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
>> Signed-off-by: Doug Anderson <dianders@chromium.org>
>> ---
>> Changes from v1
>> ---------------
>> - Addressed review comments from Doug, Sachin & Tushar
>> - Removed adc and lid-switch nodes
>> ---
>>   arch/arm/boot/dts/Makefile                 |    1 +
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts |  182
>> ++++++++++++++++++++++++++++
>>   2 files changed, 183 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/exynos5420-peach-pit.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 35c146f..3220e29 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -74,6 +74,7 @@ dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
>>         exynos5250-smdk5250.dtb \
>>         exynos5250-snow.dtb \
>>         exynos5420-arndale-octa.dtb \
>> +       exynos5420-peach-pit.dtb \
>>         exynos5420-smdk5420.dtb \
>>         exynos5440-sd5v1.dtb \
>>         exynos5440-ssdk5440.dtb
>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> new file mode 100644
>> index 0000000..fbb0469
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>> @@ -0,0 +1,182 @@
>> +/*
>> + * Google Peach Pit Rev 6+ board device tree source
>> + *
>> + * Copyright (c) 2014 Google, Inc
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include "exynos5420.dtsi"
>> +
>> +/ {
>> +       model = "Google Peach Pit Rev 6+";
>> +
>> +       compatible = "google,pit-rev16",
>> +               "google,pit-rev15", "google,pit-rev14",
>> +               "google,pit-rev13", "google,pit-rev12",
>> +               "google,pit-rev11", "google,pit-rev10",
>> +               "google,pit-rev9", "google,pit-rev8",
>> +               "google,pit-rev7", "google,pit-rev6",
>> +               "google,pit", "google,peach","samsung,exynos5420",
>> +               "samsung,exynos5";
>
>
> Do you really need so many compatible strings here? Furthermore, are all the
> newer revisions really fully backwards compatible with older ones?
>
> Also, do you have a way to check the revision in hardware, e.g. by some GPIO
> pins? If so, I don't think there would be any need to revision number as a
> part of compatible string.

You can send flames mostly my way for this one.

Technically we could replace this with just "google,pit" for now.
However if we ever actually ship a new / slightly different revision
of pit we might need to introduce these all back in.

I can explain how / why we got to this point if you wish...

Basically:

1. We'd like to support multiple revisions of hardware both during
internal development and post ship.  Each unique spin of the board is
assigned a different logical ID even if differences are pretty minor
or they are probe-able.  Sometimes we find out much later that
something that was supposed to be a minor change actually necessitates
a device tree change.

I believe we've only shipped "rev 13" pit boards.  However many people
in-house at Google and Samsung have older revision boards (some even
using as far back as rev 6), so it's very handy to support the old
boards if it's not too difficult.

Examples of types of changes that have happened:

Between rev 8 and rev 9 we switched WiFi chips.  That's mostly
probe-able.  There's a single GPIO difference in the powerup sequence
but you could use a sequence that's compatible for both.  We've had a
unified device tree here since one can work for both, but if we ever
found an issue we could always split it.

On rev 3, 4, and 5 (dts not submitted upstream) we found an issue
where the SoC couldn't handle powering off the INT rail during
suspend.

On rev 3, 4, and 5 we had HDMI's power coming off a different FET.

On rev 4 there was a problem reading the EDID on the panel, so we had
to add special logic to handle this.

On exynos5250-snow there are actually 3 different revisions released
publicly.  Right now we only have one device tree but if we want to
fully support audio / touchpad we need at least two.  If we want to
enable thermistors on the original rev (optional, really) then we need
a third device tree.


2. As is relatively common, the firmware _doesn't_ ship a device tree.
 It picks among devices trees that are part of the kernel.


3. We wanted to avoid hacks in the kernel like "if strcmp(compatible,
"peach-pit") && revision > 6 && revision < 9".


A reasonable solution to the above is to have separate device trees
for separate revisions whenever they are different enough that they
need it.  ...and for cases where they're not very different then use
the same device tree.


In the case of peach-pit, things got a little extreme.  For various
reasons the project went through an awful lot of spins during
development.  If you insist we can drop some of the revisions above.
Specifically:

* "revision 13" is the shipping revision.  You could remove 14, 15,
and 16.  We tend to put a few extras in so that new revs will "just
work".

* I believe (80% certain) "revision 11" was never used.

---

One other note: I mentioned that you could just use "peach-pit" for
now but that you might need to reintroduce revisions later.  This is
due to an unfortunate bug that was found in the firmware too late to
change.

Specifically the firmware will first look for "google,pit-rev#" across
all of the kernel device trees.  If it finds it then we're great.  If
it doesn't find it, then it will look for "google,pit" across all of
the kernel device trees.  When it finds the first match it will pick
that one.

That means if you've got a kernel with two device trees:

A: "google,pit-rev14", "google,pit"   # imaginary rev 14
B: "google,pit" # older revs

When an older rev13 device picks a device tree it might pick _either_
the rev14 one or the other one.

-Doug
