From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add naming of s3c64xx-spi devices
Date: Wed, 17 Oct 2012 17:23:21 +0900
Message-ID: <003b01cdac40$acec1590$06c440b0$%kim@samsung.com>
References: <201210021443.54897.heiko@sntech.de> <507C2492.8010408@samsung.com>
 <507C3845.1030003@inov.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58525 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751761Ab2JQIXZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Oct 2012 04:23:25 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MC1004QR3ARTU80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Oct 2012 17:23:23 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MC100ND53AW1940@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Oct 2012 17:23:23 +0900 (KST)
In-reply-to: <507C3845.1030003@inov.pt>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Jos=C3=A9_Miguel_Gon=C3=A7alves'?= <jose.goncalves@inov.pt>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: =?UTF-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Jos=C3=A9 Miguel Gon=C3=A7alves wrote:
>=20
> On 15-10-2012 15:58, Sylwester Nawrocki wrote:
> > Hi Heiko,
> >
> > On 10/02/2012 02:43 PM, Heiko St=C3=BCbner wrote:
> >> Commit a5238e360b71 (spi: s3c64xx: move controller information int=
o
> driver
> >> data) introduced separate device names for the different subtypes =
of
> the
> >> spi controller but forgot to set these in the relevant machines.
> >>
> >> To fix this introduce a s3c64xx_spi_setname function and populate =
all
> >> Samsung arches with the correct names. The function resides in a n=
ew
> >> header, as the s3c64xx-spi.h contains driver platform data and sho=
uld
> >> therefore at some later point move out of the Samsung include dir.
> >>
> >> Tested on a s3c2416-based machine.
> >>
> >> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >> Cc: stable@vger.kernel.org
> > This patch looks good to me. I've tested it on Exynos4412 SoC based
> > board. And it fixes quite serious problem - broken SPI support on
> > a all Samsung machs (non-dt) except s3c64xx in mainline v3.6 kernel=
=2E
> >
> >
> > Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > (mach-exynos only)
> >
> > Jos=C3=A9 Miguel, can you confirm it solves the problem for you ?
>=20
> The driver initialization problem is solved by this patch on my S3C24=
16
> based
> board. Nevertheless, I didn=E2=80=99t have the time yet to test an ac=
tual SPI
> device
> connected to the bus.
>=20
> BTW, I think the two debug messages at the end of the s3c64xx_spi_pro=
be()
> routine
> should be promoted from dev_dbg to dev_info in order to be shown on a
> normal
> kernel boot.
>=20
You guys, thanks for fixing and testing.

Looks good to me, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
