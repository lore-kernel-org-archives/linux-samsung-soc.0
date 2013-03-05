From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/23] RFC: exynos multiplatform support
Date: Tue, 5 Mar 2013 22:43:00 +0000
Message-ID: <201303052243.00681.arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de> <201303052154.22857.arnd@arndb.de> <201303052325.13143.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:50456 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755681Ab3CEWnJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 17:43:09 -0500
In-Reply-To: <201303052325.13143.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Tuesday 05 March 2013, Heiko St=FCbner wrote:
> Am Dienstag, 5. M=E4rz 2013, 22:54:22 schrieb Arnd Bergmann:
> > On Tuesday 05 March 2013, Arnd Bergmann wrote:
>=20
> > We still need a solution for the ASoC drivers, but they are
> > not as essential. We could probably move the wrapper files
> > from plat-samsung/*dma*.c to sounds/soc/samsung when that becomes
> > the only remaining user.
>=20
> In ASoC there is also a clear distinction between the different SoC
> generations. SND_SAMSUNG_I2S /_PCM /_AC97 ... is only used by newer S=
oCs
> while SND_S3C24XX_I2S and SND_S3C_I2SV2_SOC is used by the legacy SoC=
s.

Well, the only file that really needs to get changed is dma.c, which
seems to be used by both the old and the new drivers.

	Arnd
