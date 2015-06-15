From: Przemyslaw Marczak <p.marczak@samsung.com>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on
 5422?
Date: Mon, 15 Jun 2015 14:57:18 +0200
Message-ID: <557ECBAE.20302@samsung.com>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
 <CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
 <557EA6AE.304@samsung.com>
 <CAP245DVU4RmkSuOR2dNV+GMwkKxAXFs_p3zo90DP2Zo4-hbhcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:24320 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752657AbbFOM5o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 08:57:44 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NPZ00GJ5LC51CA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Jun 2015 13:57:41 +0100 (BST)
In-reply-to: <CAP245DVU4RmkSuOR2dNV+GMwkKxAXFs_p3zo90DP2Zo4-hbhcg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: =?UTF-8?B?S3J6eXN6dG9mIEtvesWCb3dza2k=?= <k.kozlowski.k@gmail.com>, Kevin Hilman <khilman@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWC?= =?UTF-8?B?b21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Doug Anderson <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Lists LAKML <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>


On 06/15/2015 01:19 PM, Amit Kucheria wrote:
> On Mon, Jun 15, 2015 at 3:49 PM, Przemyslaw Marczak
> <p.marczak@samsung.com> wrote:
>> Hello Krzysztof,
>>
>>
>> On 06/14/2015 10:56 AM, Krzysztof Koz=C5=82owski wrote:
>
> <snip>
>
>> I'm trying port the hardkernel's SPL to the mainline U-Boot at prese=
nt. The
>> mainline SPL is implemented for E5420 and E5800. But there are few
>> differences:
>> - different DRAM
>> - different clocks
>> - different boot core (peach-pi boots from A15)
>> - bl2 signature
>> - hdk's SPL uses smc calls
>> ... and some more.
>
> This is really good news! Would this work leave CCI control to Linux
> so that we may use MCPM to manage cpu and cluster OFF?
>

Yes, I would like to get this stuff working.

>> The BL1 keeps signature key and some part of code, but it's code is
>> proprietary - but we should be able to setup the secondary cores in =
BL2.
>>
>> When, I get the basic setup working, then I'm going to focus on the
>> secondary CPU's init. I don't have the documentation for iROM code, =
so
>> everything takes a while.
>>
>>   If you looking for the lowlevel code, which is executed after wake=
up,
>> please check this :
>> https://github.com/hardkernel/u-boot/blob/odroidxu3-v2012.07/board/s=
amsung/smdk5422/lowlevel_init.S
>>
>> The 'lowlevel_init' label is always executed on boot.
>

Best regards,
--=20
Przemyslaw Marczak
Samsung R&D Institute Poland
Samsung Electronics
p.marczak@samsung.com
