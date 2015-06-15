From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [RFC] ARM: exynos: MCPM: [is this a] fix for secondary boot on 5422?
Date: Mon, 15 Jun 2015 16:49:39 +0530
Message-ID: <CAP245DVU4RmkSuOR2dNV+GMwkKxAXFs_p3zo90DP2Zo4-hbhcg@mail.gmail.com>
References: <1416896510-24612-1-git-send-email-khilman@kernel.org>
	<CAJKOXPfLEV1sQsz87ULDKX4vijqRpbGj7AcOEDiy83kukvVKVg@mail.gmail.com>
	<557EA6AE.304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f52.google.com ([209.85.213.52]:35828 "EHLO
	mail-yh0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754139AbbFOLTj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 07:19:39 -0400
Received: by yhak3 with SMTP id k3so40120595yha.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2015 04:19:39 -0700 (PDT)
In-Reply-To: <557EA6AE.304@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Przemyslaw Marczak <p.marczak@samsung.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>, Kevin Hilman <khilman@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Andrew Bresticker <abrestic@chromium.org>, Mauro Ribeiro <mauro.ribeiro@hardkernel.com>, Doug Anderson <dianders@chromium.org>, Abhilash Kesavan <a.kesavan@samsung.com>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Lists LAKML <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Mon, Jun 15, 2015 at 3:49 PM, Przemyslaw Marczak
<p.marczak@samsung.com> wrote:
> Hello Krzysztof,
>
>
> On 06/14/2015 10:56 AM, Krzysztof Koz=C5=82owski wrote:

<snip>

> I'm trying port the hardkernel's SPL to the mainline U-Boot at presen=
t. The
> mainline SPL is implemented for E5420 and E5800. But there are few
> differences:
> - different DRAM
> - different clocks
> - different boot core (peach-pi boots from A15)
> - bl2 signature
> - hdk's SPL uses smc calls
> ... and some more.

This is really good news! Would this work leave CCI control to Linux
so that we may use MCPM to manage cpu and cluster OFF?

> The BL1 keeps signature key and some part of code, but it's code is
> proprietary - but we should be able to setup the secondary cores in B=
L2.
>
> When, I get the basic setup working, then I'm going to focus on the
> secondary CPU's init. I don't have the documentation for iROM code, s=
o
> everything takes a while.
>
>  If you looking for the lowlevel code, which is executed after wakeup=
,
> please check this :
> https://github.com/hardkernel/u-boot/blob/odroidxu3-v2012.07/board/sa=
msung/smdk5422/lowlevel_init.S
>
> The 'lowlevel_init' label is always executed on boot.
