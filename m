From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3] pinctrl: Add pinctrl-s3c24xx driver
Date: Thu, 11 Apr 2013 14:12:57 +0200
Message-ID: <1706031.H7t4gja446@amdc1227>
References: <201304111409.01983.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17142 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753885Ab3DKMNP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 08:13:15 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML300CGWBA0M520@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 11 Apr 2013 21:13:14 +0900 (KST)
In-reply-to: <201304111409.01983.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <tomasz.figa@gmail.com>

Hi Heiko,

On Thursday 11 of April 2013 14:09:01 Heiko St=FCbner wrote:
> The s3c24xx pins follow a similar pattern as the other Samsung SoCs a=
nd
> can therefore reuse the already introduced infrastructure.
>=20
> The s3c24xx SoCs have one design oddity in that the first 4 external
> interrupts do not reside in the eint pending register but in the main
> interrupt controller instead. We solve this by forwarding the externa=
l
> interrupt from the main controller into the irq domain of the pin ban=
k.
> The masking/acking of these interrupts is handled in the same way.
>=20
> Furthermore the S3C2412/2413 SoCs contain another oddity in that they
> keep the same 4 eints in the main interrupt controller and eintpend
> register and requiring ack operations to happen in both. This is solv=
ed
> by using different compatible properties for the wakeup eint node whi=
ch
> set a property accordingly.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> changes since v2:
> - address more comments from Tomasz Figa:
>   * remove obsolete ctrl_type references
>   * remove redundant check for parent_chip
>   * update docs and commit message
>=20
> changes since v1:
> - address comments from Tomasz Figa:
>   * split handling functions for eints 0-3 for s3c2412 and all others
>   * change the handling for s3c2412 eints 0-3 in that they now use
>     chained_irq_* for the outer parent interrupt
>=20
>  .../bindings/pinctrl/samsung-pinctrl.txt           |    8 +
>  drivers/gpio/gpio-samsung.c                        |    4 +
>  drivers/pinctrl/Kconfig                            |    5 +
>  drivers/pinctrl/Makefile                           |    1 +
>  drivers/pinctrl/pinctrl-s3c24xx.c                  |  664
> ++++++++++++++++++++ drivers/pinctrl/pinctrl-samsung.c               =
   | =20
> 10 +
>  drivers/pinctrl/pinctrl-samsung.h                  |    4 +
>  7 files changed, 696 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/pinctrl/pinctrl-s3c24xx.c

Looks good to me, thanks for the patch.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
--=20
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Kernel and System Framework
