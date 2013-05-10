From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v5] pinctrl: Add pinctrl-s3c24xx driver
Date: Fri, 10 May 2013 09:32:05 +0900
Message-ID: <046401ce4d15$ccba0c80$662e2580$%kim@samsung.com>
References: <201305031552.45410.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29621 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755483Ab3EJAcN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 May 2013 20:32:13 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MMK0099V45IPX20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 May 2013 09:32:07 +0900 (KST)
In-reply-to: <201305031552.45410.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, thomas.abraham@linaro.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=C3=BCbner wrote:
>=20
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
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Looks good to me.

Linus, if you want me to take into samsung tree, please let me know.

Thanks.

- Kukjin

> ---
> changes since v4:
> - fix wrong s3c2413 naming
>   between s3c2412 and s3c2413, the s3c2412 is the base type. Till v4 =
the
>   naming was mixed up, with parts being labeled as s3c2412* and other=
s
>   as s3c2413*. Fix this by renaming the s3c2413* parts to s3c2412.
>   No functional changes.
>=20
> changes since v3:
> - address comments from Sylwester Nawrocki:
>   (typos, wrong comments, etc)
>=20
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
>  drivers/pinctrl/pinctrl-s3c24xx.c                  |  652 ++++++++++=
++++++++++
>  drivers/pinctrl/pinctrl-samsung.c                  |   10 +
>  drivers/pinctrl/pinctrl-samsung.h                  |    4 +
>  7 files changed, 684 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/pinctrl/pinctrl-s3c24xx.c
>=20
[...]
