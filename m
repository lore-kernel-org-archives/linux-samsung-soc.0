From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/1] ARM: dts: don't make DP a consumer of DISP1 on Exynos5250
Date: Mon, 16 Mar 2015 18:36:53 +0100
Message-ID: <550714B5.1020503@collabora.co.uk>
References: <1426320716-28137-1-git-send-email-javier.martinez@collabora.co.uk> <5506C945.5030603@suse.de> <5506E5D4.1020300@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:52153 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753656AbbCPRg7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 13:36:59 -0400
In-Reply-To: <5506E5D4.1020300@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On 03/16/2015 03:16 PM, Javier Martinez Canillas wrote:
>>=20
>> Tested-by: Andreas F=E4rber <afaerber@suse.de>
>>=20
>> This fixes the display on the Spring Chromebook as well!
>>
>=20
> Thanks for testing Andreas but this patch seems to only solve a sympt=
om
> rather than the root cause.
>=20
> Since the error happens again when disabling and enabling the display=
:
>=20
> # echo 1 > /sys/devices/platform/exynos-drm/graphics/fb0/blank
> disp1-power-domain: Power-off latency exceeded, new value 225333 ns
> # echo 0 > /sys/devices/platform/exynos-drm/graphics/fb0/blank
> exynos-dp 145b0000.dp-controller: EDID data does not include any exte=
nsions.
> exynos-dp 145b0000.dp-controller: EDID Read success!
> exynos-dp 145b0000.dp-controller: Link Training Clock Recovery succes=
s
> exynos-dp 145b0000.dp-controller: Link Training success!
> exynos-dp 145b0000.dp-controller: Timeout of video streamclk ok
> exynos-dp 145b0000.dp-controller: unable to config video
>=20
> So what happens is that if the DISP1 power domain is powered off and
> then powered on again, the display fails to be enabled.
>=20
> Making the dp controller a consumer of the DISP1 pd only made this to
> trigger on boot since the driver probe was deferred and the DISP1 pd
> was turned off and on again on exynos-drm probe.
>=20
> It seems that the kernel is not enabling everything that is needed fo=
r
> the power domain and it is working on boot just because the bootloade=
r
> initialized everything properly.
>=20
> This is similar to the problem we had in Exynos5420 and that was fixe=
d
> by Andrzej in the series "Fix power domains handling on exynos542x" [=
0].
> So probably a similar solution is needed.
>=20

Actually, is more similar to the problem we had when trying to get
HDMI working on Exynos5420 that was solved by the following commits:

885601002998 clk: exynos5420: Add IDs for clocks used in DISP1 power do=
main
ea08de16eb1b ARM: dts: Add DISP1 power domain for exynos5420

> Andrzej,
>=20
> I looked at the Exynos5250 manual and I didn't find anything obvious
> that is missing in the DISP1 pd dev node but the asynchronous bridges
> clocks needed on Exynos5420 was also not well documented so I don't
> know if I'm missing something.
>=20
> Do you know what could be missing here? Otherwise I think your patch
> to add the DISP1 pd in the DT should be reverted to have display
> working again on Exynos5250 boards.
>

So my guess is that is missing the attached devices' parent and input c=
locks
to allow the Exynos PD driver to re-parent the devices input clocks whe=
n the
domain is powered off and on.

The Exynos5250 documentation is not as clear as the Exynos5420 on that =
regard
and also the clocks in the clk-exynos5250.c driver don't match exactly =
the
names used in the Exynos5250 manual I've access to. So is not clear to =
me what
are the needed clocks.

Best regards,
Javier
