From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/3] ARM: S3C24XX: Add devicetree support for s3c2416
Date: Wed, 10 Apr 2013 19:15:48 +0900
Message-ID: <30ff01ce35d4$5f4920d0$1ddb6270$%kim@samsung.com>
References: <201302180103.53084.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48026 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752546Ab3DJKPv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 06:15:51 -0400
In-reply-to: <201302180103.53084.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Rob Herring' <rob.herring@calxeda.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Heiko St=C3=BCbner wrote:
>=20
> This is the second installment of beginning devicetree support the
> Samsung S3C24xx architectures and focuses on the s3c2416 for now.
>=20
> Included is the devicetree support for the s3c24xx irq controller and
> basic support for smdk2416 boards, which can sucessfully boot.
>=20
>=20
> After the discussion with Thomas Abraham on v1 and staring to long at=
 all
> of
> this, I'm not even sure if having the interrupt mapping in the bindin=
g
> is the correct way to go anymore.
>=20
> The key positive aspect of this solution is, that after everything is
> running
> via dt all the SoC specific mapping tables in the driver can go away,
> cutting
> its length in half.
>=20
> The other option would be as Thomas suggested to define specific irq-
> controller
> types (i.e. s3c2416-intc, s3c2443-intc, ... resulting in 16 types) an=
d
> keep
> the mapping data in the code, as it is now.
>=20
> So I would be very thankful for a bit of guidance on what is the bett=
er
> way.
>=20
>=20
> The series depends on the finalized s3c24xx irq rework, which probabl=
y
> won't
> make it into 3.9 and also the clocksource dt support by Tomasz Figa, =
which
> are not in any tree yet.
>=20
>=20
> Changes since v1:
> - adapt to changes in the underlying s3c24xx irq rework
>   =3D more shared init code
> - use irqchip infrastructure
> - limit number of possible irq-types to not encode implementation det=
ails
>   into the binding
> - include new samsung-clocksource
>=20
> Heiko Stuebner (3):
>   ARM: S3C24XX: move irq driver to drivers/irqchip
>   irqchip: irq-s3c24xx: add devicetree support
>   ARM: S3C24XX: Add devicetree support and dt-board file for s3c2416 =
SoCs
>=20
>  .../interrupt-controller/samsung,s3c24xx-irq.txt   |   53 ++++++
>  arch/arm/boot/dts/Makefile                         |    1 +
>  arch/arm/boot/dts/s3c2416-smdk2416.dts             |   79 ++++++++
>  arch/arm/boot/dts/s3c2416.dtsi                     |  193 ++++++++++=
++++++++++
>  arch/arm/boot/dts/s3c24xx.dtsi                     |  165 ++++++++++=
+++++++
>  arch/arm/mach-s3c24xx/Kconfig                      |   10 +
>  arch/arm/mach-s3c24xx/Makefile                     |    3 +-
>  arch/arm/mach-s3c24xx/mach-s3c2416-dt.c            |   91 +++++++++
>  drivers/irqchip/Makefile                           |    1 +
>  .../irq.c =3D> drivers/irqchip/irq-s3c24xx.c         |  128 ++++++++=
+++++
>  10 files changed, 723 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-
> controller/samsung,s3c24xx-irq.txt
>  create mode 100644 arch/arm/boot/dts/s3c2416-smdk2416.dts
>  create mode 100644 arch/arm/boot/dts/s3c2416.dtsi
>  create mode 100644 arch/arm/boot/dts/s3c24xx.dtsi
>  create mode 100644 arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
>  rename arch/arm/mach-s3c24xx/irq.c =3D> drivers/irqchip/irq-s3c24xx.=
c (92%)
>=20
> --
> 1.7.2.3

Basically, looks good to me and thanks for your effort.

BTW, if you don't mind, would be better to send to upstream next time. =
Because I need to consider other s3c24xx SoCs for DT...

Thanks.

- Kukjin
