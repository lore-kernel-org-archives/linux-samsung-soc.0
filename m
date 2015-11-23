From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, Regulator and RTC
Date: Mon, 23 Nov 2015 14:29:00 +0000
Message-ID: <20151123142900.GL3098@x1>
References: <1448015873-8743-1-git-send-email-alim.akhtar@samsung.com>
 <20151123142737.GK3098@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151123142737.GK3098@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: broonie@kernel.org, k.kozlowski@samsung.com, alexandre.belloni@free-electrons.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
List-Id: linux-samsung-soc@vger.kernel.org

Better $SUBJECT for ya'll -- so it doesn't get lost in the noise.

> Mark, Alexandre,
>=20
> Enjoy!
>=20
> The following changes since commit 1ec218373b8ebda821aec00bb156a9c94f=
ad9cd4:
>=20
>   Linux 4.4-rc2 (2015-11-22 16:45:59 -0800)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-m=
fd-regulator-rtc-v4.5
>=20
> for you to fetch changes up to a65e5efa7c5faa8c320fe56cc351d47fcd0067=
49:
>=20
>   rtc: s5m.c: Add support for S2MPS15 RTC (2015-11-23 10:34:38 +0000)
>=20
> ----------------------------------------------------------------
> Immutable branch between MFD, Regulator and RTC for the v4.5 merge wi=
ndow
>=20
> ----------------------------------------------------------------
> Alim Akhtar (1):
>       rtc: s5m.c: Add support for S2MPS15 RTC
>=20
> Thomas Abraham (2):
>       mfd: sec: Add support for S2MPS15 PMIC
>       regulator: s2mps11: Add support for S2MPS15 regulators
>=20
>  drivers/mfd/sec-core.c              |  31 +++++
>  drivers/mfd/sec-irq.c               |   8 ++
>  drivers/regulator/Kconfig           |   4 +-
>  drivers/regulator/s2mps11.c         | 135 +++++++++++++++++-
>  drivers/rtc/rtc-s5m.c               |  37 ++++-
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/rtc.h     |   2 +
>  include/linux/mfd/samsung/s2mps15.h | 158 ++++++++++++++++++++++
>  8 files changed, 369 insertions(+), 7 deletions(-)
>  create mode 100644 include/linux/mfd/samsung/s2mps15.h
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
