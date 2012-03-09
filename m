From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Fri, 09 Mar 2012 07:33:15 -0800
Message-ID: <4F5A22BB.2080808@samsung.com>
References: <22926872.16671331267895327.JavaMail.weblogic@epml04> <CAJ0PZbQebwvFrmXWn=-m7YH3Ri7t2fvm+E_EKZ45rD7cAyo2UA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:65308 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754332Ab2CIPdT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 10:33:19 -0500
Received: by mail-tul01m020-f174.google.com with SMTP id uo6so2273888obb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 07:33:19 -0800 (PST)
In-Reply-To: <CAJ0PZbQebwvFrmXWn=-m7YH3Ri7t2fvm+E_EKZ45rD7cAyo2UA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: myungjoo.ham@gmail.com
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, =?EUC-KR?B?seixucH4?= <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?EUC-KR?B?udqw5rnO?= <kyungmin.park@samsung.com>

On 03/08/12 23:06, MyungJoo Ham wrote:
> 2012/3/9 =C7=D4=B8=ED=C1=D6<myungjoo.ham@samsung.com>:

[...]

>=20
> Hello, Kgene
>=20
> I've rebased the branch that was pull-requested to Kgene based on thi=
s branch.
>=20

OK, thanks. Let me apply this series on top of new cleanup-exynos-clock=
=2E

> http://git.infradead.org/users/kmpark/linux-samsung/shortlog/refs/hea=
ds/devfreq-for-samsung
>=20
>=20
> The following changes since commit e01127814c640f6cd06a5c06731c6d1ee8=
c45101:
>=20
>    PM / devfreq: update the name of EXYNOS clock register (2012-03-07
> 03:25:31 -0800)
>=20
> are available in the git repository at:
>    git://git.infradead.org / users/kmpark/linux-samsung devfreq-for-s=
amsung
>=20
> MyungJoo Ham (4):
>        ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
>        ARM: EXYNOS4: Add clock register addresses for Exynos4x12 bus
> devfreq driver
>        ARM Exynos4210-Nuri: support Exynos4210-bus Devfreq driver.
>        PM / devfreq: update the name of EXYNOS clock registers that w=
ere omitted.
>=20
>   arch/arm/mach-exynos/common.c                  |    7 +++-
>   arch/arm/mach-exynos/include/mach/map.h        |    1 +
>   arch/arm/mach-exynos/include/mach/regs-clock.h |   42 +++++++++++++=
+++++++++++
>   arch/arm/mach-exynos/mach-nuri.c               |   11 ++++--
>   drivers/devfreq/exynos4_bus.c                  |    6 ++--
>   5 files changed, 60 insertions(+), 7 deletions(-)
>=20

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
