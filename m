From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 1/1] ARM: dts: don't make DP a consumer of DISP1 on Exynos5250
Date: Mon, 16 Mar 2015 13:15:01 +0100
Message-ID: <5506C945.5030603@suse.de>
References: <1426320716-28137-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44535 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753939AbbCPMPF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Mar 2015 08:15:05 -0400
In-Reply-To: <1426320716-28137-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

Am 14.03.2015 um 09:11 schrieb Javier Martinez Canillas:
> By making the DP controller a consumer of DISP1, the PD is powered
> off when the exynos-dp probe is deferred and powered on again when
> the exynos-drm driver is probed.
>=20
> But this causes the exynos-dp driver failing to obtain the stream
> clock since the FIMD has been powered off with the DISP1 PD:
>=20
> exynos-dp 145b0000.dp-controller: Timeout of video streamclk ok
> exynos-dp 145b0000.dp-controller: unable to config video
>=20
> The Exynos5250 documentation doesn't mention that the Display Port
> Transmitter module is included in the DISP1 PD so the device should
> not have a reference to this Power Domain.
>=20
> This patch fixes video display on an Exynos5250 Snow Chromebook.
>=20
> Fixes: 2d2c9a8d0a4f ("ARM: dts: add display power domain for exynos52=
50")
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> ---
>=20
> Hello Andrzej and Marek,
>=20
> I need this patch to have display working on an Snow Chromebook

Tested-by: Andreas F=E4rber <afaerber@suse.de>

This fixes the display on the Spring Chromebook as well!

Thanks,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Jennifer Guild, Dilip Upmanyu,
Graham Norton; HRB 21284 (AG N=FCrnberg)
