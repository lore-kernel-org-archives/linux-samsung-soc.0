From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/5] mfd: sec: Add support for S2MPS15 PMIC
Date: Mon, 26 Oct 2015 14:29:30 +0000
Message-ID: <20151026142930.GJ597@x1>
References: <1445855803-26973-1-git-send-email-alim.akhtar@samsung.com>
 <1445855803-26973-3-git-send-email-alim.akhtar@samsung.com>
 <20151026110611.GH597@x1>
 <562E1F84.2000105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <562E1F84.2000105@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: broonie@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 26 Oct 2015, Alim Akhtar wrote:

> Hi Lee,
> Thanks for looking into this.
>=20
> On 10/26/2015 04:36 PM, Lee Jones wrote:
> >On Mon, 26 Oct 2015, Alim Akhtar wrote:
> >
> >>From: Thomas Abraham <thomas.ab@samsung.com>
> >>
> >>Add support for S2MPS15 PMIC which is similar to S2MPS11 PMIC. The =
S2MPS15
> >>PMIC supports 27 LDO regulators, 10 buck regulators, RTC, three 32.=
768KHz
> >>clock outputs and battery charger. This patch adds initial support =
for
> >>LDO and buck regulators of S2MPS15 device.
> >>
> >>Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> >>Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> >>[Alim: Added s2mps15_devs like rtc and clk and related changes]
> >>Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >>---
> >>  drivers/mfd/sec-core.c              |   31 +++++++
> >>  drivers/mfd/sec-irq.c               |    8 ++
> >>  include/linux/mfd/samsung/core.h    |    1 +
> >>  include/linux/mfd/samsung/s2mps15.h |  161 ++++++++++++++++++++++=
+++++++++++++
> >>  4 files changed, 201 insertions(+)
> >>  create mode 100644 include/linux/mfd/samsung/s2mps15.h
> >>
> >>diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> >>index 2626fc0b5b8c..db3d4d4ff805 100644
> >>--- a/drivers/mfd/sec-core.c
> >>+++ b/drivers/mfd/sec-core.c
> >>@@ -29,6 +29,7 @@
> >>  #include <linux/mfd/samsung/s2mps11.h>
> >>  #include <linux/mfd/samsung/s2mps13.h>
> >>  #include <linux/mfd/samsung/s2mps14.h>
> >>+#include <linux/mfd/samsung/s2mps15.h>
> >>  #include <linux/mfd/samsung/s2mpu02.h>
> >>  #include <linux/mfd/samsung/s5m8763.h>
> >>  #include <linux/mfd/samsung/s5m8767.h>
> >>@@ -96,6 +97,17 @@ static const struct mfd_cell s2mps14_devs[] =3D =
{
> >>  	}
> >>  };
> >>
> >>+static const struct mfd_cell s2mps15_devs[] =3D {
> >>+	{
> >>+		.name =3D "s2mps15-pmic",
> >>+	}, {
> >>+		.name =3D "s2mps15-rtc",
> >>+	}, {
> >
> >Why don't these have compatibles?
> >
> s2mps15-pmic does have compatible below in sec_dt_match[].

Woah!!  What's going on here?  You're matching the MFD and Regulator
drivers with the same compatible string.  And then registering the
Regulator device as an MFD.  That's a bit confusing don't you think?

> s2mps15-rtc does not need one as rtc driver does not support OF yet.
> So no DT node for this as of now.

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
