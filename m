From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on 5422?
Date: Mon, 15 Jun 2015 11:58:26 -0700
Message-ID: <7hoakg4x4d.fsf@deeprootsystems.com>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
	<CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
	<557EA6AE.304@samsung.com>
	<CAP245DVU4RmkSuOR2dNV+GMwkKxAXFs_p3zo90DP2Zo4-hbhcg@mail.gmail.com>
	<557ECBAE.20302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:36830 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756100AbbFOS6a convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 14:58:30 -0400
Received: by pdjm12 with SMTP id m12so78793800pdj.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2015 11:58:29 -0700 (PDT)
In-Reply-To: <557ECBAE.20302@samsung.com> (Przemyslaw Marczak's message of
	"Mon, 15 Jun 2015 14:57:18 +0200")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Przemyslaw Marczak <p.marczak@samsung.com>
Cc: Amit Kucheria <amit.kucheria@linaro.org>, Krzysztof =?utf-8?Q?Koz?= =?utf-8?Q?=C5=82owski?= <k.kozlowski.k@gmail.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?utf-8?Q?Bart=C5=82omiej_=C5=BBo?= =?utf-8?Q?=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Doug Anderson <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Lists LAKML <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Przemyslaw Marczak <p.marczak@samsung.com> writes:

> On 06/15/2015 01:19 PM, Amit Kucheria wrote:
>> On Mon, Jun 15, 2015 at 3:49 PM, Przemyslaw Marczak
>> <p.marczak@samsung.com> wrote:
>>> Hello Krzysztof,
>>>
>>>
>>> On 06/14/2015 10:56 AM, Krzysztof Koz=C5=82owski wrote:
>>
>> <snip>
>>
>>> I'm trying port the hardkernel's SPL to the mainline U-Boot at pres=
ent. The
>>> mainline SPL is implemented for E5420 and E5800. But there are few
>>> differences:
>>> - different DRAM
>>> - different clocks
>>> - different boot core (peach-pi boots from A15)
>>> - bl2 signature
>>> - hdk's SPL uses smc calls
>>> ... and some more.
>>
>> This is really good news! Would this work leave CCI control to Linux
>> so that we may use MCPM to manage cpu and cluster OFF?
>>
>
> Yes, I would like to get this stuff working.
>

Do you have access to BL1 sources to change this?

IIUC, what is happening is BL1 is leaving CCI in secure mode, which
means the kernel MCPM cannot manage it.  That means the kernel cannot
manage any low-power CPU or cluster states.

Does anyone know at which stage of the boot secure world is left for
normal world?  in BL1?  in BL2?

If it's in BL2, maybe the CCI issue can also be fixed by ensuring that
CCI is not left in secure mode so the kernel can properly manage CCI.

Kevin
