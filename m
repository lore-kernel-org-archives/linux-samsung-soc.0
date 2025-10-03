Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24D2C21CD
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Oct 2025 17:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759514122; cv=none; b=vC0qKfmVSicQ+2aWJcLFl4TE/xYvr0imVDsTUBp6dGyfjMbjvDF9zuTdpqd9/VhV5dAWkLiVQ6xMnHtdAmxAJsDYUuFlTZ9HZKNx5ujbHzjyYnF9QxBN2mgflgJ/OmkZPXPe11KkqmrX+e+l/bCEo70Hcwwpm2/2dtRQ2PnIUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759514122; c=relaxed/simple;
	bh=EmYH7lZEN/7mdNIXQQcc5lN2QW1gjvRJcCBMmQkT+IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROX4QiC0Vjl/qg9ATEqZLAe9QiuijDtA9ad5qfSsRDJJMZ6SRtZzT4MFrUs81osYH2cv5W9Cqvyg5fxLSfs487k4A5/Xv6htrtftWucykHYsZqFNGONZUEcOv/ZT4x5hqPL38fHfPMAhmmKFOjnwkM5cLY2cp/g5QYa0AZb13N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hgancyl3; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hgancyl3"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63605f6f64eso2436570d50.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Oct 2025 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759514120; x=1760118920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1b73eD3J07PphzqhxdvLpc171f9Nn9CiIGeoDF7jTM=;
        b=hgancyl39duSMimwchrSnYLQEMXgJc8uYo8aNAMdsYEpS7xFYi2ig7qDo1kyd5H4pU
         AtHRSbPyjNXA5BLdQoUuImzZxrFRUYaWFPdMr6ksTE8+6Wl0OQWOML1pkkQ+Mgbs8LHw
         zTgP++gsrlnEvuJtoTdBQNMq45oHQ1nGp5jhniiZ/Dku3wQh7S2d7cfiBY2/myIoOQpy
         q5aafsggZqJZVtiwX10alCw7cMqH0MS0XmEB7oVzVMGF37wJkFEppQtlSQRQ6IuxOdHV
         ar63hdp+4kNSMTPW/2JjWVywVvsrmbOzmwM4TLIyNK1HX4ALJsN0d8zVJDkb4FqMVuBJ
         dL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759514120; x=1760118920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1b73eD3J07PphzqhxdvLpc171f9Nn9CiIGeoDF7jTM=;
        b=Ehb2QAp1xpyYJtqfjsjR/OCqFrYeIgUbsW5oW9rcz4NWKLiviO4kr6P5GSkH3WgSr0
         O0MSonldI6RabaCdMdTPaJNDN8RHNlbSv6iTV3xRcWGwogO7T1lB0fKjbgAx4VIS3JMh
         56ldeyIjScIJdi5zBqlWNfWAayabwU0CWY/cETWMtPWz07P/xGv73zUIyzlwehQpFdO6
         JAJEzazw/snaGebpicnp9bQBd/JLmqasiouOjvbDHLFo2HSMGh0xXm2ejADDUsxJRy2F
         hY73nLt7ojUpxfhRu2TN/Fh9V288QdmnGLFC/6llY6L2hYaLVK1iN9FwE37QcyQXS7sb
         MZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVRip7Xi3koW7xQpLuEUFUdP5VCAVRtNdvZtdc+dWeW5cuNItDd4ix5mEneUcGCsuCIx+Kt179IHwKuQ7Ntb/KCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywos+QEvbuQoZI5bomZ5mk8jLpUeVEra573tcBUch6KGdKwJ66A
	OtRJ2iCWWHa4n++UTU1tMTindpdHHSqoVk64e+Om+3VoblzqaD35DcsgvcLsa8WU7aHsfRdJ//9
	Imnhh6Pz9qgv5w2V9xYhUZ/05SZFDJjkV4cfK0xMhew==
X-Gm-Gg: ASbGncuIVNJVNlLXuW73+M3C6++VJv4bHcDZI9u+1mLify3RLkJDKtbbs1fvDflPKKV
	5ex49TMX3Bip5XbwR4jKjmnclQBn2PwimGqvLovyBeBbgZI0sbmPPWWGJ0Uw+KEzaxyVVUHD05g
	XyaoyUXyVs86vBK0xI9yDU2XFgzDJ8MqGB3IPHWVUydXLIWgc1859Wy5dm1l/EREIDJ7xHX0XdD
	GLR/oHEw5xqVMklhv//3ZztfGv4VYkMVDokk56OL4qL
X-Google-Smtp-Source: AGHT+IEsi3zTjbIEzgUfpuQxM21bQ1UgHTZkyJdgVHLwOTUMPzbn8+oeMmltFD2cdIn5JGTG7y0eC8dfLjZ7tA/qYSk=
X-Received: by 2002:a53:a0ca:0:b0:629:ec90:c446 with SMTP id
 956f58d0204a3-63b9a06f1a3mr3107060d50.12.1759514119507; Fri, 03 Oct 2025
 10:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org> <20251002-gs101-pmu-regmap-tables-v1-2-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-2-1f96f0920eb3@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Oct 2025 12:55:08 -0500
X-Gm-Features: AS18NWDO4wOWUr7D5fpivRh4cck7ZlJFct3DOK5VRmjxFhJsrC5iwEvf350v8mo
Message-ID: <CAPLW+4=+efttfgj9gMSGpv2sjhJQ7whtoCuitK+Ku4U7hzE+1A@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: samsung: exynos-pmu: move some gs101 related
 code into new file
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 5:33=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@li=
naro.org> wrote:
>
> To avoid cluttering common code, move most of the gs101 code into a new
> file, gs101-pmu.c
>
> More code is going to be added for gs101 - having it all in one file
> helps keeping the common code (file) more readable.
>

Maybe add "no functional change" note for refactoring/cleanup patches like =
this.

> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/soc/samsung/Makefile     |   3 +-
>  drivers/soc/samsung/exynos-pmu.c | 133 ---------------------------------=
---
>  drivers/soc/samsung/exynos-pmu.h |   7 ++
>  drivers/soc/samsung/gs101-pmu.c  | 141 +++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 151 insertions(+), 134 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3439485437117aaffbe61b709468348231ca3cc4..b8908a95abc561ecf04be560f=
0e358c58acad693 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10599,6 +10599,7 @@ F:      Documentation/devicetree/bindings/clock/g=
oogle,gs101-clock.yaml
>  F:     Documentation/devicetree/bindings/soc/google/google,gs101-pmu-int=
r-gen.yaml
>  F:     arch/arm64/boot/dts/exynos/google/
>  F:     drivers/clk/samsung/clk-gs101.c
> +F:     drivers/soc/samsung/gs101-pmu.c
>  F:     drivers/phy/samsung/phy-gs101-ufs.c
>  F:     include/dt-bindings/clock/google,gs101.h
>  K:     [gG]oogle.?[tT]ensor
> diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
> index 248a33d7754af1a1e5fbbbb79413eb300bbbc8e5..636a762608c9ba2c22a72d6f9=
597ceb015f7f36c 100644
> --- a/drivers/soc/samsung/Makefile
> +++ b/drivers/soc/samsung/Makefile
> @@ -6,7 +6,8 @@ exynos_chipid-y                 +=3D exynos-chipid.o exyn=
os-asv.o
>
>  obj-$(CONFIG_EXYNOS_USI)       +=3D exynos-usi.o
>
> -obj-$(CONFIG_EXYNOS_PMU)       +=3D exynos-pmu.o
> +obj-$(CONFIG_EXYNOS_PMU)       +=3D exynos_pmu.o
> +exynos_pmu-y                   +=3D exynos-pmu.o gs101-pmu.o
>
>  obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)   +=3D exynos3250-pmu.o exynos4-pmu=
.o \
>                                         exynos5250-pmu.o exynos5420-pmu.o
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyno=
s-pmu.c
> index 9f416de03610b1727d8cc77616e5c87e2525cc69..528fd4bd96f515a15b0bf8d67=
c505f7a84c0fc2e 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -6,7 +6,6 @@
>  // Exynos - CPU PMU(Power Management Unit) support
>
>  #include <linux/array_size.h>
> -#include <linux/arm-smccc.h>
>  #include <linux/bitmap.h>
>  #include <linux/cpuhotplug.h>
>  #include <linux/cpu_pm.h>
> @@ -25,14 +24,6 @@
>
>  #include "exynos-pmu.h"
>
> -#define PMUALIVE_MASK                  GENMASK(13, 0)
> -#define TENSOR_SET_BITS                        (BIT(15) | BIT(14))
> -#define TENSOR_CLR_BITS                        BIT(15)
> -#define TENSOR_SMC_PMU_SEC_REG         0x82000504
> -#define TENSOR_PMUREG_READ             0
> -#define TENSOR_PMUREG_WRITE            1
> -#define TENSOR_PMUREG_RMW              2
> -
>  struct exynos_pmu_context {
>         struct device *dev;
>         const struct exynos_pmu_data *pmu_data;
> @@ -54,125 +45,6 @@ static struct exynos_pmu_context *pmu_context;
>  /* forward declaration */
>  static struct platform_driver exynos_pmu_driver;
>
> -/*
> - * Tensor SoCs are configured so that PMU_ALIVE registers can only be wr=
itten
> - * from EL3, but are still read accessible. As Linux needs to write some=
 of
> - * these registers, the following functions are provided and exposed via
> - * regmap.
> - *
> - * Note: This SMC interface is known to be implemented on gs101 and deri=
vative
> - * SoCs.
> - */
> -
> -/* Write to a protected PMU register. */
> -static int tensor_sec_reg_write(void *context, unsigned int reg,
> -                               unsigned int val)
> -{
> -       struct arm_smccc_res res;
> -       unsigned long pmu_base =3D (unsigned long)context;
> -
> -       arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
> -                     TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
> -
> -       /* returns -EINVAL if access isn't allowed or 0 */
> -       if (res.a0)
> -               pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
> -
> -       return (int)res.a0;
> -}
> -
> -/* Read/Modify/Write a protected PMU register. */
> -static int tensor_sec_reg_rmw(void *context, unsigned int reg,
> -                             unsigned int mask, unsigned int val)
> -{
> -       struct arm_smccc_res res;
> -       unsigned long pmu_base =3D (unsigned long)context;
> -
> -       arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
> -                     TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
> -
> -       /* returns -EINVAL if access isn't allowed or 0 */
> -       if (res.a0)
> -               pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
> -
> -       return (int)res.a0;
> -}
> -
> -/*
> - * Read a protected PMU register. All PMU registers can be read by Linux=
.
> - * Note: The SMC read register is not used, as only registers that can b=
e
> - * written are readable via SMC.
> - */
> -static int tensor_sec_reg_read(void *context, unsigned int reg,
> -                              unsigned int *val)
> -{
> -       *val =3D pmu_raw_readl(reg);
> -       return 0;
> -}
> -
> -/*
> - * For SoCs that have set/clear bit hardware this function can be used w=
hen
> - * the PMU register will be accessed by multiple masters.
> - *
> - * For example, to set bits 13:8 in PMU reg offset 0x3e80
> - * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
> - *
> - * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
> - * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
> - */
> -static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 va=
l,
> -                                 u32 mask)
> -{
> -       int ret;
> -       unsigned int i;
> -
> -       for (i =3D 0; i < 32; i++) {
> -               if (!(mask & BIT(i)))
> -                       continue;
> -
> -               offset &=3D ~TENSOR_SET_BITS;
> -
> -               if (val & BIT(i))
> -                       offset |=3D TENSOR_SET_BITS;
> -               else
> -                       offset |=3D TENSOR_CLR_BITS;
> -
> -               ret =3D tensor_sec_reg_write(ctx, offset, i);
> -               if (ret)
> -                       return ret;
> -       }
> -       return 0;
> -}
> -
> -static bool tensor_is_atomic(unsigned int reg)
> -{
> -       /*
> -        * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF=
)
> -        * as the target registers can be accessed by multiple masters. S=
FRs
> -        * that don't support atomic are added to the switch statement be=
low.
> -        */
> -       if (reg > PMUALIVE_MASK)
> -               return false;
> -
> -       switch (reg) {
> -       case GS101_SYSIP_DAT0:
> -       case GS101_SYSTEM_CONFIGURATION:
> -               return false;
> -       default:
> -               return true;
> -       }
> -}
> -
> -static int tensor_sec_update_bits(void *ctx, unsigned int reg,
> -                                 unsigned int mask, unsigned int val)
> -{
> -
> -       if (!tensor_is_atomic(reg))
> -               return tensor_sec_reg_rmw(ctx, reg, mask, val);
> -
> -       return tensor_set_bits_atomic(ctx, reg, val, mask);
> -}
> -
>  void pmu_raw_writel(u32 val, u32 offset)
>  {
>         writel_relaxed(val, pmu_base_addr + offset);
> @@ -244,11 +116,6 @@ static const struct regmap_config regmap_pmu_intr =
=3D {
>         .use_raw_spinlock =3D true,
>  };
>
> -static const struct exynos_pmu_data gs101_pmu_data =3D {
> -       .pmu_secure =3D true,
> -       .pmu_cpuhp =3D true,
> -};
> -
>  /*
>   * PMU platform driver and devicetree bindings.
>   */
> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exyno=
s-pmu.h
> index 113149ed32c88a09b075be82050c26970e4c0620..fe11adc4f6ac8fc8bce228d58=
52deaff7c438221 100644
> --- a/drivers/soc/samsung/exynos-pmu.h
> +++ b/drivers/soc/samsung/exynos-pmu.h
> @@ -44,7 +44,14 @@ extern const struct exynos_pmu_data exynos4412_pmu_dat=
a;
>  extern const struct exynos_pmu_data exynos5250_pmu_data;
>  extern const struct exynos_pmu_data exynos5420_pmu_data;
>  #endif
> +extern const struct exynos_pmu_data gs101_pmu_data;
>
>  extern void pmu_raw_writel(u32 val, u32 offset);
>  extern u32 pmu_raw_readl(u32 offset);
> +
> +int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int v=
al);
> +int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int *v=
al);
> +int tensor_sec_update_bits(void *ctx, unsigned int reg, unsigned int mas=
k,
> +                          unsigned int val);

Nitpick: just noticed the inconsistency between context/ctx wording
usage in above function arguments.

> +
>  #endif /* __EXYNOS_PMU_H */
> diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-=
pmu.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..b5a535822ec830b751e36a331=
21e2a03ef2ebcb2
> --- /dev/null
> +++ b/drivers/soc/samsung/gs101-pmu.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright 2025 Linaro Ltd.
> +//
> +// GS101 PMU (Power Management Unit) support
> +

AFAIR headers like these should be made using multi-line comments (not
talking about SPDX part). Or is it the latest fashion trends in
kernel?

Anyways, those all are minor:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +#include <linux/arm-smccc.h>
> +#include <linux/array_size.h>
> +#include <linux/soc/samsung/exynos-pmu.h>
> +#include <linux/soc/samsung/exynos-regs-pmu.h>
> +
> +#include "exynos-pmu.h"
> +
> +#define PMUALIVE_MASK                  GENMASK(13, 0)
> +#define TENSOR_SET_BITS                        (BIT(15) | BIT(14))
> +#define TENSOR_CLR_BITS                        BIT(15)
> +#define TENSOR_SMC_PMU_SEC_REG         0x82000504
> +#define TENSOR_PMUREG_READ             0
> +#define TENSOR_PMUREG_WRITE            1
> +#define TENSOR_PMUREG_RMW              2
> +
> +const struct exynos_pmu_data gs101_pmu_data =3D {
> +       .pmu_secure =3D true,
> +       .pmu_cpuhp =3D true,
> +};
> +
> +/*
> + * Tensor SoCs are configured so that PMU_ALIVE registers can only be wr=
itten
> + * from EL3, but are still read accessible. As Linux needs to write some=
 of
> + * these registers, the following functions are provided and exposed via
> + * regmap.
> + *
> + * Note: This SMC interface is known to be implemented on gs101 and deri=
vative
> + * SoCs.
> + */
> +
> +/* Write to a protected PMU register. */
> +int tensor_sec_reg_write(void *context, unsigned int reg, unsigned int v=
al)
> +{
> +       struct arm_smccc_res res;
> +       unsigned long pmu_base =3D (unsigned long)context;
> +
> +       arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
> +                     TENSOR_PMUREG_WRITE, val, 0, 0, 0, 0, &res);
> +
> +       /* returns -EINVAL if access isn't allowed or 0 */
> +       if (res.a0)
> +               pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
> +
> +       return (int)res.a0;
> +}
> +
> +/* Read/Modify/Write a protected PMU register. */
> +static int tensor_sec_reg_rmw(void *context, unsigned int reg,
> +                             unsigned int mask, unsigned int val)
> +{
> +       struct arm_smccc_res res;
> +       unsigned long pmu_base =3D (unsigned long)context;
> +
> +       arm_smccc_smc(TENSOR_SMC_PMU_SEC_REG, pmu_base + reg,
> +                     TENSOR_PMUREG_RMW, mask, val, 0, 0, 0, &res);
> +
> +       /* returns -EINVAL if access isn't allowed or 0 */
> +       if (res.a0)
> +               pr_warn("%s(): SMC failed: %d\n", __func__, (int)res.a0);
> +
> +       return (int)res.a0;
> +}
> +
> +/*
> + * Read a protected PMU register. All PMU registers can be read by Linux=
.
> + * Note: The SMC read register is not used, as only registers that can b=
e
> + * written are readable via SMC.
> + */
> +int tensor_sec_reg_read(void *context, unsigned int reg, unsigned int *v=
al)
> +{
> +       *val =3D pmu_raw_readl(reg);
> +       return 0;
> +}
> +
> +/*
> + * For SoCs that have set/clear bit hardware this function can be used w=
hen
> + * the PMU register will be accessed by multiple masters.
> + *
> + * For example, to set bits 13:8 in PMU reg offset 0x3e80
> + * tensor_set_bits_atomic(ctx, 0x3e80, 0x3f00, 0x3f00);
> + *
> + * Set bit 8, and clear bits 13:9 PMU reg offset 0x3e80
> + * tensor_set_bits_atomic(0x3e80, 0x100, 0x3f00);
> + */
> +static int tensor_set_bits_atomic(void *ctx, unsigned int offset, u32 va=
l,
> +                                 u32 mask)
> +{
> +       int ret;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < 32; i++) {
> +               if (!(mask & BIT(i)))
> +                       continue;
> +
> +               offset &=3D ~TENSOR_SET_BITS;
> +
> +               if (val & BIT(i))
> +                       offset |=3D TENSOR_SET_BITS;
> +               else
> +                       offset |=3D TENSOR_CLR_BITS;
> +
> +               ret =3D tensor_sec_reg_write(ctx, offset, i);
> +               if (ret)
> +                       return ret;
> +       }
> +       return 0;
> +}
> +
> +static bool tensor_is_atomic(unsigned int reg)
> +{
> +       /*
> +        * Use atomic operations for PMU_ALIVE registers (offset 0~0x3FFF=
)
> +        * as the target registers can be accessed by multiple masters. S=
FRs
> +        * that don't support atomic are added to the switch statement be=
low.
> +        */
> +       if (reg > PMUALIVE_MASK)
> +               return false;
> +
> +       switch (reg) {
> +       case GS101_SYSIP_DAT0:
> +       case GS101_SYSTEM_CONFIGURATION:
> +               return false;
> +       default:
> +               return true;
> +       }
> +}
> +
> +int tensor_sec_update_bits(void *ctx, unsigned int reg, unsigned int mas=
k,
> +                          unsigned int val)
> +{
> +       if (!tensor_is_atomic(reg))
> +               return tensor_sec_reg_rmw(ctx, reg, mask, val);
> +
> +       return tensor_set_bits_atomic(ctx, reg, val, mask);
> +}
>
> --
> 2.51.0.618.g983fd99d29-goog
>
>
