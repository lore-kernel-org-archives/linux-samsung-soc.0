From: jonghwa3.lee@samsung.com
Subject: Re: [PATCH] soc: samsung: pmu: split up SoC specific PMU data
Date: Wed, 03 Dec 2014 14:34:20 +0900
Message-ID: <547EA0DC.70800@samsung.com>
References: <1417364162-29981-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:46265 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbaLCFeY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Dec 2014 00:34:24 -0500
In-reply-to: <1417364162-29981-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, amit.daniel@samsung.com, kgene.kim@samsung.com, arnd@arndb.de, thomas.ab@samsung.com

On 2014=EB=85=84 12=EC=9B=94 01=EC=9D=BC 01:16, Pankaj Dubey wrote:

> This patch splits up exynos-pmu.c file, and moves PMU configuration d=
ata
> and functions handing those data into SoC specific PMU files, keeping
> driver structure and common functionality into exynos-pmu.c.
>=20
> At the same time it also separates compilation of these different SoC=
 PMU files
> based on CONFIG_ARM64 and CONFIG_ARM. This way we can reduce overhead=
 of ARM64
> SoC's PMU getting compiled when kernel is built for ARM and vice-vers=
a.
>=20
> This patch also removes .owner field from exynos-pmu.c as it's redund=
ant for
> drivers calling platform_driver_register to register platform_driver.
>=20
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
> This patch is prepared on top of kgene/for-next and following patch [=
1] from
> Amit Daniel.
>=20
> [1]: http://www.spinics.net/lists/linux-samsung-soc/msg39797.html
>=20
> This patch tries to address some of concerns raised for using exynos-=
pmu.c for
> ARM and ARM64 based SoC at these threads [2], [3].
>=20
> [2]: http://www.spinics.net/lists/linux-samsung-soc/msg39809.html
> [3]: https://lkml.org/lkml/2014/11/24/322
>=20
> Since Exynos SoC's has similar PMU IP, and already existing bindings =
can be
> used, it makes sense to keep single driver for both ARM and ARM64 bas=
ed SoCs.
> All common functionalties are in exynos-pmu.c whereas SoC specific da=
ta and=20
> handling are moved into SoC specific exynosNNNN-pmu files.
>=20
> All changes are compiled tested only. Any improvements/suggestions ar=
e most
> welcome.
>=20
>  drivers/soc/samsung/Makefile         |    9 +-
>  drivers/soc/samsung/exynos-pmu.c     | 1293 +-----------------------=
----------
>  drivers/soc/samsung/exynos-pmu.h     |   63 ++
>  drivers/soc/samsung/exynos3250-pmu.c |  176 +++++
>  drivers/soc/samsung/exynos4-pmu.c    |  223 ++++++
>  drivers/soc/samsung/exynos5250-pmu.c |  196 ++++++
>  drivers/soc/samsung/exynos5420-pmu.c |  298 ++++++++
>  drivers/soc/samsung/exynos7-pmu.c    |  441 ++++++++++++
>  8 files changed, 1412 insertions(+), 1287 deletions(-)
>  create mode 100644 drivers/soc/samsung/exynos-pmu.h
>  create mode 100644 drivers/soc/samsung/exynos3250-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos4-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos5250-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos5420-pmu.c
>  create mode 100644 drivers/soc/samsung/exynos7-pmu.c
>=20

=2E..

> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/e=
xynos-pmu.h
> new file mode 100644
> index 0000000..4adc5a3
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos-pmu.h
> @@ -0,0 +1,63 @@
> +/*
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * Header for EXYNOS PMU Driver support
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __EXYNOSPMU_H
> +#define __EXYNOSPMU_H
> +
> +#include <linux/io.h>
> +
> +#define PMU_TABLE_END	(-1U)
> +
> +static void __iomem *pmu_base_addr;
> +

AFAIK, static variable in header file can't be used globally. It would =
be placed
in exynos-pmu.c or elsewhere and then only extern declaration is allowe=
d here.
If I'm wrong, please let me know.

Thanks.
Jonghwa
