From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/5] ARM: S3C24XX: convert boards to use common restart
 function
Date: Fri, 24 Jan 2014 11:08:58 +0100
Message-ID: <52E23BBA.7020804@gmail.com>
References: <3105326.uFdOVLyXH8@phil> <3955130.WSqWacB8SI@phil> <52E19931.80803@gmail.com> <1873916.c2IkPH5hCW@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:52289 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053AbaAXKJE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jan 2014 05:09:04 -0500
Received: by mail-ea0-f174.google.com with SMTP id b10so887381eae.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Jan 2014 02:09:02 -0800 (PST)
In-Reply-To: <1873916.c2IkPH5hCW@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org



On 24.01.2014 09:03, Heiko St=FCbner wrote:
> On Thursday 23 January 2014 23:35:29 Tomasz Figa wrote:
>> On 23.01.2014 20:02, Heiko St=FCbner wrote:
>>> Am Donnerstag, 23. Januar 2014, 19:51:34 schrieb Tomasz Figa:
>>>> On 23.01.2014 19:36, Heiko St=FCbner wrote:
>>> In general, I want to try establishing some sort of general restart=
 way,
>>> as in the future one dt-board should hopefully be enough to cover a=
ll
>>> s3c24xx soc variants.
>>
>> If you make SAMSUNG_WDT_RESET always selected on S3C24XX then I gues=
s
>> it's fine.
>>
>>>> Note that you can make the restart field NULL in mach_desc in boar=
d
>>>> files.
>>>
>>> As I said above, this is mainly meant for the dt-case. The legacy-b=
oard
>>> files are more or less only secondary, and the affected boards can =
of
>>> course then have a NULL restart handle :-) .
>>>
>>> So for this the dt-board could simply use the wdt-reset, which then=
 gets
>>> replaced by the ccf-based reset if appropriate.
>>
>> OK. By the way, are there any benefits of using this software reset =
over
>> watchdog reset? Maybe all S3C24xx could simply use watchdog reset an=
d no
>> special handling of those with swrst would be needed.
>
> According to the manuals I looked at, all S3C24XX SoCs seem to suppor=
t the
> watchdog reset - I'm not sure why the swrst variant was choosen for t=
he newer
> ones when they were added initially. So yes in theory all of them see=
m to be
> able to use the watchdog reset.
>
> But in any case the s3c2412 will need its own handling, due to the ap=
parent
> clock problem during resets (mentioned in the code and the manuals of
> s3c2412/s3c2413).

OK. So WDT by default (always selected in Kconfig) and override to SWRS=
T=20
in clock driver if available should work.

Best regards,
Tomasz
