From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] ARM: S3C24XX: fix missing common.h in mach-s3c24xx/
Date: Tue, 3 Apr 2012 18:33:28 -0400
Message-ID: <CAP=VYLp-FwEu2AY9wWY7vygmjtZ30AMD=0h8+VtuNVZF2xtTYw@mail.gmail.com>
References: <1332980074-4614-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:57630 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754866Ab2DCWda convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Apr 2012 18:33:30 -0400
In-Reply-To: <1332980074-4614-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-next@vger.kernel.org

Hi,

On Wed, Mar 28, 2012 at 8:14 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch fixes missing mach-s3c24xx/common.h which has been
> lost when regarding s3c24xx directories merged.

Just checking that the updated version of this patch is headed
in for 3.4 -- we are still seeing the failure in linux-next builds
and it would be nice to close out the build regressions in there
as quickly as possible, since they tend to mask other regressions
from being seen.

Thanks,
Paul.
--

>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s3c24xx/common.h | =A0 23 +++++++++++++++++++++++
> =A01 files changed, 23 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-s3c24xx/common.h
>
> diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/c=
ommon.h
> new file mode 100644
> index 0000000..a7cd62f
> --- /dev/null
> +++ b/arch/arm/mach-s3c24xx/common.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + *
> + * Common Header for S3C24XX SoCs
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __ARCH_ARM_MACH_S3C24XX_COMMON_H
> +#define __ARCH_ARM_MACH_S3C24XX_COMMON_H
> +
> +#ifdef CONFIG_CPU_S3C2410
> +void s3c2410_restart(char mode, const char *cmd);
> +#endif
> +
> +#ifdef CONFIG_CPU_S3C244X
> +void s3c244x_restart(char mode, const char *cmd);
> +#endif
> +
> +#endif /* __ARCH_ARM_MACH_S3C24XX_COMMON_H */
> --
> 1.7.2.3
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
