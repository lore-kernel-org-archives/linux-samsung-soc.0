Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80422DA777
	for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Oct 2025 18:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759515900; cv=none; b=Ut4xl9l3xA3cFD3P++k1uGfO9kVw+uv5NpUNRzHZX1tQzNJUzG52q9uvKL4qZk2mRj4+h5BEmY6FEdlU4vOeH/8nzIr4slgZE2zxpYl1MvAse3JtyccfTAJuD0S+cEohclp/AzdcLP4VoLM0ZzKbMo3bPkXZImyMFUhD5JSyg1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759515900; c=relaxed/simple;
	bh=84ttSBuMfwGQgY3CogH0WwoPCdXyRB+Zwg79mBTjfFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfQXf2raypyM25uR+NubqGytp9lYc0jXYewrA7v8ZudgUkJtUapFDMLf59bfEZZ0EuazUemWkdEYdvpdAGhTCcBop+tbXOC0udi1l38z8w4e1p4IXM8nGbRbFXLtwtecUQtDQhQxdHp4Ii8ZsFB7/UvbxYcOSkIWMS0Dv9n7YrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FYXInEEm; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FYXInEEm"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-60170e15cf6so3175012d50.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Oct 2025 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759515897; x=1760120697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7M01wpdkUCoh68iElSIuzcZC3cb/t+0V8xISk1HIcu4=;
        b=FYXInEEmUYEv1JGyU3/bc6mT7gFzWQfc3j+BePvBeYEECv3q13TLtx620kyU1aE9eF
         Wto+aIhVEq4mqV1ZnJcREm3PazMFuHa8rxqbSxxB2a/pgtWvnpvwRTMXg5Wo79EJP5iN
         25J+VZnbkNaR4uBI2rfHNhDx/6C1+SbFckwM5YuLH8WtWYFUI0aaUDLk04aPQwwMj07f
         GJkg7ZT87Bz5NJviJp6kfOpLPzqPV4j7fTtDSiEdAAgHZKqPDWY3BAkH9XJvDjbCu1PD
         KvSV1QBVcdXk7UTPaPA1xid1qpn0+2RQH8Vvd+lkmkaT8WLY6sy2oeCRrO6MiowTu36F
         xmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759515897; x=1760120697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7M01wpdkUCoh68iElSIuzcZC3cb/t+0V8xISk1HIcu4=;
        b=pBkD/PuGkhRWwoOE+yiahbNnVQBJXPGf3llySNA8TO21+KHC0OtOLWgnQsCqbCKEyz
         IAvOJCgyHgXNVfr8aEDB7YJosALvEjCGfkbDYTweFK5SkEt2hhj/p8wfsnMeiJxpiLAq
         YkSInlkMzMprCl0jkkrrz6WNNn9daQuL7KcmgFeAwG6tlsaNjS+JeUHjFwVGdyK2N5XS
         3krtv9g4ITEEqDE3XtTpDxY/5c7fFC7cSpImv33HVYfinGUUyiwvLCrVZaGeh8P6nUd7
         anrjxncfOfT6abRf90jzXQpV1FlCEUn+jyUt5aRSDU3uPgVEahp+KErfngWrAFMAUJzy
         Cf3w==
X-Forwarded-Encrypted: i=1; AJvYcCUH7LX1fRSthDTUB3bQvyWBjrtUBQLdyn3h2X/Yi0//owQF1Qwae21YimQe0HynTvR2yQ+07InL+kFYnlhUNzZpvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbY6IvBpSkGPAZshekbcfXm1KPjOToybyV/2eIYh62eBkojmb3
	/9/3X8wirZYA0yZSv9t1EkG8bltOKLoHjVe0SyOzjbv6Z+Zry/uqqP7sH/tFpHVibQk5o89PrgX
	rJoGtne+nfltwgq2Z7h+VeW6i3NsH23DoXvYwyUroCA==
X-Gm-Gg: ASbGncvhwHTO1KWDAuyNXZAMNyvcLuat34Bg5NZO3pm76zdceS8PYj8QNomv4yDP22A
	Qi4w92U56LhRZwYJEL9rnkyODWranPiSIHkK9BzZKEqcZ+GoPSRK5o63POqxKP9+y2gcd1TVtJy
	KrlRjepkm+3z3t52SXHIgaaPpH5vQywol9FNnQYSmhnAfqMfltEAF2k4SqJOFcGW6OTo8kZ5k8H
	x9fJz2NYBP6Ovh9f42WlVl5k9xT7oPVaA==
X-Google-Smtp-Source: AGHT+IEqkSLEAJIF3RCB254DMN2vrWSJI9RD/xOAJYRSnybd4atWde+fLGwOZ781hslIMdzP4UcygC0pakLJfKECM6k=
X-Received: by 2002:a05:690e:d2:b0:63b:827a:5b0c with SMTP id
 956f58d0204a3-63b9a0e647dmr3180804d50.24.1759515896454; Fri, 03 Oct 2025
 11:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org> <20251002-gs101-pmu-regmap-tables-v1-3-1f96f0920eb3@linaro.org>
In-Reply-To: <20251002-gs101-pmu-regmap-tables-v1-3-1f96f0920eb3@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 3 Oct 2025 13:24:45 -0500
X-Gm-Features: AS18NWDW2Jvm6KjKvKkpJJlvTyhsxr9HpeFvLWZ_vKpuKsJH6iJntmjZENO9rUo
Message-ID: <CAPLW+4nvuGd8AoDKK1VdF2pabCHzjgYHRJkYrcncRt4s=qt8Dw@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: samsung: gs101-pmu: implement access tables for
 read and write
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
> Accessing non-existent PMU registers causes an SError, halting the
> system.
>
> Implement read and write access tables for the gs101-PMU to specify
> which registers are read- and/or writable to avoid that SError.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

I think having "Fixes:" tag would be justified here?

>
> ---
> Note there are checkpatch warnings 'Macros with complex values should
> be enclosed in parentheses' and 'Macro argument reuse' for macros like
> CLUSTER_CPU_RANGE(). Since they are used in an initialiser, the only
> way to get rid of the warnings is to avoid the macros and duplicate all
> the related register ranges I believe, which I'd rather not due to the
> sheer amount of similar blocks.
> ---
>  drivers/soc/samsung/gs101-pmu.c             | 306 ++++++++++++++++++++++=
++-
>  include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++++++=
+++++-
>  2 files changed, 640 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-=
pmu.c
> index b5a535822ec830b751e36a33121e2a03ef2ebcb2..5be1cbfa58c95e466bbdf9549=
23f324f74460783 100644
> --- a/drivers/soc/samsung/gs101-pmu.c
> +++ b/drivers/soc/samsung/gs101-pmu.c
> @@ -8,6 +8,7 @@
>  #include <linux/array_size.h>
>  #include <linux/soc/samsung/exynos-pmu.h>
>  #include <linux/soc/samsung/exynos-regs-pmu.h>
> +#include <linux/regmap.h>

If you decide to add this line to exynos-pmu.h (as I commented in the
preceding patch), it can then be omitted here.

>
>  #include "exynos-pmu.h"
>
> @@ -19,9 +20,312 @@
>  #define TENSOR_PMUREG_WRITE            1
>  #define TENSOR_PMUREG_RMW              2
>
> +static const struct regmap_range gs101_pmu_registers[] =3D {
> +       regmap_reg_range(GS101_OM_STAT, GS101_SYSTEM_INFO),
> +       regmap_reg_range(GS101_IDLE_IP(0), GS101_IDLE_IP_MASK(3)),
> +       regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(0),
> +                        GS101_PPMPURAM_INFORM_SCL_CH(3)),
> +       regmap_reg_range(GS101_INFORM0, GS101_SYSIP_DAT(0)),
> +       /* skip SYSIP_DAT1 SYSIP_DAT2 */
> +       regmap_reg_range(GS101_SYSIP_DAT(3), GS101_PWR_HOLD_SW_TRIP),
> +       regmap_reg_range(GS101_GSA_INFORM(0), GS101_GSA_INFORM(1)),
> +       regmap_reg_range(GS101_INFORM4, GS101_IROM_INFORM),
> +       regmap_reg_range(GS101_IROM_CPU_INFORM(0), GS101_IROM_CPU_INFORM(=
7)),
> +       regmap_reg_range(GS101_PMU_SPARE(0), GS101_PMU_SPARE(3)),
> +       /* skip most IROM_xxx registers */
> +       regmap_reg_range(GS101_DREX_CALIBRATION(0), GS101_DREX_CALIBRATIO=
N(7)),
> +
> +#define CLUSTER_CPU_RANGE(cl, cpu)                                     \
> +       regmap_reg_range(GS101_CLUSTER_CPU_CONFIGURATION(cl, cpu),      \
> +                        GS101_CLUSTER_CPU_OPTION(cl, cpu)),            \
> +       regmap_reg_range(GS101_CLUSTER_CPU_OUT(cl, cpu),                \
> +                        GS101_CLUSTER_CPU_IN(cl, cpu)),                \
> +       regmap_reg_range(GS101_CLUSTER_CPU_INT_IN(cl, cpu),             \
> +                        GS101_CLUSTER_CPU_INT_DIR(cl, cpu))
> +
> +       /* cluster 0..2 and cpu 0..4 or 0..1 */
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 0),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 1),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 2),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 3),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 0),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 1),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 0),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 1),
> +#undef CLUSTER_CPU_RANGE
> +
> +#define CLUSTER_NONCPU_RANGE(cl)                                       \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_CONFIGURATION(cl),        \
> +                        GS101_CLUSTER_NONCPU_OPTION(cl)),              \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_OUT(cl),                  \
> +                        GS101_CLUSTER_NONCPU_IN(cl)),                  \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_INT_IN(cl),               \
> +                        GS101_CLUSTER_NONCPU_INT_DIR(cl)),             \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_OUT(cl),    \
> +                        GS101_CLUSTER_NONCPU_DUALRAIL_POS_OUT(cl)),    \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl),     \
> +                        GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
> +
> +       CLUSTER_NONCPU_RANGE(0),
> +       regmap_reg_range(GS101_CLUSTER0_NONCPU_DSU_PCH,
> +                        GS101_CLUSTER0_NONCPU_DSU_PCH),
> +       CLUSTER_NONCPU_RANGE(1),
> +       CLUSTER_NONCPU_RANGE(2),
> +#undef CLUSTER_NONCPU_RANGE
> +
> +#define SUBBLK_RANGE(blk)                                              \
> +       regmap_reg_range(GS101_SUBBLK_CONFIGURATION(blk),               \
> +                        GS101_SUBBLK_CTRL(blk)),                       \
> +       regmap_reg_range(GS101_SUBBLK_OUT(blk), GS101_SUBBLK_IN(blk)),  \
> +       regmap_reg_range(GS101_SUBBLK_INT_IN(blk),                      \
> +                        GS101_SUBBLK_INT_DIR(blk)),                    \
> +       regmap_reg_range(GS101_SUBBLK_MEMORY_OUT(blk),                  \
> +                        GS101_SUBBLK_MEMORY_IN(blk))
> +
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ALIVE),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_AOC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_APM),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CMU),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CORE),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EH),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3D),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_CPUCL0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_G3D),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DPU),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DISP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G2D),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MFC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CSIS),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PDP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DNS),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3AA),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_IPP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ITP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MCSC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_GDC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TNR),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BO),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TPU),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF3),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MISC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_S2D),
> +#undef SUBBLK_RANGE
> +
> +#define SUBBLK_CPU_RANGE(blk)                                          \
> +       regmap_reg_range(GS101_SUBBLK_CPU_CONFIGURATION(blk),           \
> +                        GS101_SUBBLK_CPU_OPTION(blk)),                 \
> +       regmap_reg_range(GS101_SUBBLK_CPU_OUT(blk),                     \
> +                        GS101_SUBBLK_CPU_IN(blk)),                     \
> +       regmap_reg_range(GS101_SUBBLK_CPU_INT_IN(blk),                  \
> +                        GS101_SUBBLK_CPU_INT_DIR(blk))
> +
> +       SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_APM),
> +       SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_DBGCORE),
> +       SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_SSS),
> +#undef SUBBLK_CPU_RANGE
> +
> +       regmap_reg_range(GS101_MIF_CONFIGURATION, GS101_MIF_CTRL),
> +       regmap_reg_range(GS101_MIF_OUT, GS101_MIF_IN),
> +       regmap_reg_range(GS101_MIF_INT_IN, GS101_MIF_INT_DIR),
> +       regmap_reg_range(GS101_TOP_CONFIGURATION, GS101_TOP_OPTION),
> +       regmap_reg_range(GS101_TOP_OUT, GS101_TOP_IN),
> +       regmap_reg_range(GS101_TOP_INT_IN, GS101_WAKEUP2_STAT),
> +       regmap_reg_range(GS101_WAKEUP2_INT_IN, GS101_WAKEUP2_INT_DIR),
> +       regmap_reg_range(GS101_SYSTEM_CONFIGURATION, GS101_USER_DEFINED_O=
UT),
> +       regmap_reg_range(GS101_SYSTEM_OUT, GS101_SYSTEM_IN),
> +       regmap_reg_range(GS101_SYSTEM_INT_IN, GS101_EINT_WAKEUP_MASK3),
> +       regmap_reg_range(GS101_USER_DEFINED_INT_IN, GS101_SCAN2DRAM_INT_D=
IR),
> +       /* skip HCU_START */
> +       regmap_reg_range(GS101_CUSTOM_OUT, GS101_CUSTOM_IN),
> +       regmap_reg_range(GS101_CUSTOM_INT_IN, GS101_CUSTOM_INT_DIR),
> +       regmap_reg_range(GS101_ACK_LAST_CPU, GS101_HCU_R(3)),
> +       regmap_reg_range(GS101_HCU_SP, GS101_HCU_PC),
> +       /* skip PMU_RAM_CTRL */
> +       regmap_reg_range(GS101_APM_HCU_CTRL, GS101_APM_HCU_CTRL),
> +       regmap_reg_range(GS101_APM_NMI_ENABLE, GS101_RST_STAT_PMU),
> +       regmap_reg_range(GS101_HPM_INT_IN, GS101_BOOT_STAT),
> +       regmap_reg_range(GS101_PMLINK_OUT, GS101_PMLINK_AOC_CTRL),
> +       regmap_reg_range(GS101_TCXO_BUF_CTRL, GS101_ADD_CTRL),
> +       regmap_reg_range(GS101_HCU_TIMEOUT_RESET, GS101_HCU_TIMEOUT_SCAN2=
DRAM),
> +       regmap_reg_range(GS101_TIMER(0), GS101_TIMER(3)),
> +       regmap_reg_range(GS101_PPC_MIF(0), GS101_PPC_EH),
> +       /* PPC_OFFSET, skip PPC_CPUCL1_0 PPC_CPUCL1_1 */
> +       regmap_reg_range(GS101_EXT_REGULATOR_MIF_DURATION, GS101_TCXO_DUR=
ATION),
> +       regmap_reg_range(GS101_BURNIN_CTRL, GS101_TMU_SUB_TRIP),
> +       regmap_reg_range(GS101_MEMORY_CEN, GS101_MEMORY_SMX_FEEDBACK),
> +       regmap_reg_range(GS101_SLC_PCH_CHANNEL, GS101_SLC_PCH_CB),
> +       regmap_reg_range(GS101_FORCE_NOMC, GS101_FORCE_NOMC),
> +       regmap_reg_range(GS101_FORCE_BOOST, GS101_PMLINK_SLC_BUSY),
> +       regmap_reg_range(GS101_BOOTSYNC_OUT, GS101_CTRL_SECJTAG_ALIVE),
> +       regmap_reg_range(GS101_CTRL_DIV_PLL_ALV_DIVLOW, GS101_CTRL_CLKDIV=
__CLKRTC),
> +       regmap_reg_range(GS101_CTRL_SOC32K, GS101_CTRL_SBU_SW_EN),
> +       regmap_reg_range(GS101_PAD_CTRL_CLKOUT0, GS101_PAD_CTRL_WRESETO_n=
),
> +       regmap_reg_range(GS101_PHY_CTRL_USB20, GS101_PHY_CTRL_UFS),
> +};
> +
> +static const struct regmap_range gs101_pmu_ro_registers[] =3D {
> +       regmap_reg_range(GS101_OM_STAT, GS101_VERSION),
> +       regmap_reg_range(GS101_OTP_STATUS, GS101_OTP_STATUS),
> +
> +       regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(0),
> +                        GS101_PPMPURAM_STATE_SLC_CH(0)),
> +       regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(1),
> +                        GS101_PPMPURAM_STATE_SLC_CH(1)),
> +       regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(2),
> +                        GS101_PPMPURAM_STATE_SLC_CH(2)),
> +       regmap_reg_range(GS101_DATARAM_STATE_SLC_CH(3),
> +                        GS101_PPMPURAM_STATE_SLC_CH(3)),
> +
> +#define CLUSTER_CPU_RANGE(cl, cpu)                                     \
> +       regmap_reg_range(GS101_CLUSTER_CPU_IN(cl, cpu),                 \
> +                        GS101_CLUSTER_CPU_IN(cl, cpu)),                \
> +       regmap_reg_range(GS101_CLUSTER_CPU_INT_IN(cl, cpu),             \
> +                        GS101_CLUSTER_CPU_INT_IN(cl, cpu))
> +
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 0),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 1),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 2),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER0_OFFSET, 3),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 0),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER1_OFFSET, 1),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 0),
> +       CLUSTER_CPU_RANGE(GS101_CLUSTER2_OFFSET, 1),
> +#undef CLUSTER_CPU_RANGE
> +
> +#define CLUSTER_NONCPU_RANGE(cl)                                       \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_IN(cl),                   \
> +                        GS101_CLUSTER_NONCPU_IN(cl)),                  \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_INT_IN(cl),               \
> +                        GS101_CLUSTER_NONCPU_INT_IN(cl)),              \
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl),     \
> +                        GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl))
> +
> +       CLUSTER_NONCPU_RANGE(0),
> +       CLUSTER_NONCPU_RANGE(1),
> +       CLUSTER_NONCPU_RANGE(2),
> +       regmap_reg_range(GS101_CLUSTER_NONCPU_INT_EN(2),
> +                        GS101_CLUSTER_NONCPU_INT_DIR(2)),
> +#undef CLUSTER_NONCPU_RANGE
> +
> +#define SUBBLK_RANGE(blk)                                              \

Reusing the same names for different macros seems a bit confusing. But
that might be just a matter of my taste, so no strong opinion.

> +       regmap_reg_range(GS101_SUBBLK_IN(blk), GS101_SUBBLK_IN(blk)),   \
> +       regmap_reg_range(GS101_SUBBLK_INT_IN(blk),                      \
> +                        GS101_SUBBLK_INT_IN(blk)),                     \
> +       regmap_reg_range(GS101_SUBBLK_MEMORY_IN(blk),                   \
> +                        GS101_SUBBLK_MEMORY_IN(blk))
> +
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ALIVE),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_AOC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_APM),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CMU),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BUS2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CORE),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EH),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CPUCL2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3D),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_CPUCL0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_EMBEDDED_G3D),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_HSI2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DPU),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DISP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G2D),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MFC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_CSIS),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PDP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_DNS),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_G3AA),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_IPP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_ITP),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MCSC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_GDC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TNR),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_BO),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_TPU),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF2),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MIF3),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_MISC),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC0),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_PERIC1),
> +       SUBBLK_RANGE(GS101_SUBBBLK_OFFSET_S2D),
> +#undef SUBBLK_RANGE
> +
> +#define SUBBLK_CPU_RANGE(blk)                                          \
> +       regmap_reg_range(GS101_SUBBLK_CPU_IN(blk),                      \
> +                        GS101_SUBBLK_CPU_IN(blk)),                     \
> +       regmap_reg_range(GS101_SUBBLK_CPU_INT_IN(blk),                  \
> +                        GS101_SUBBLK_CPU_INT_IN(blk))
> +
> +       SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_APM),
> +       SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_DBGCORE),
> +       SUBBLK_CPU_RANGE(GS101_SUBBBLK_CPU_OFFSET_SSS),
> +#undef SUBBLK_CPU_RANGE
> +
> +       regmap_reg_range(GS101_MIF_CONFIGURATION, GS101_MIF_CONFIGURATION=
),
> +       regmap_reg_range(GS101_MIF_IN, GS101_MIF_IN),
> +       regmap_reg_range(GS101_MIF_INT_IN, GS101_MIF_INT_IN),
> +       regmap_reg_range(GS101_TOP_IN, GS101_TOP_IN),
> +       regmap_reg_range(GS101_TOP_INT_IN, GS101_TOP_INT_IN),
> +       regmap_reg_range(GS101_WAKEUP2_INT_IN, GS101_WAKEUP2_INT_IN),
> +       regmap_reg_range(GS101_SYSTEM_IN, GS101_SYSTEM_IN),
> +       regmap_reg_range(GS101_SYSTEM_INT_IN, GS101_SYSTEM_INT_IN),
> +       regmap_reg_range(GS101_EINT_INT_IN, GS101_EINT_INT_IN),
> +       regmap_reg_range(GS101_EINT2_INT_IN, GS101_EINT2_INT_IN),
> +       regmap_reg_range(GS101_EINT3_INT_IN, GS101_EINT3_INT_IN),
> +       regmap_reg_range(GS101_USER_DEFINED_INT_IN, GS101_USER_DEFINED_IN=
T_IN),
> +       regmap_reg_range(GS101_SCAN2DRAM_INT_IN, GS101_SCAN2DRAM_INT_IN),
> +       regmap_reg_range(GS101_CUSTOM_IN, GS101_CUSTOM_IN),
> +       regmap_reg_range(GS101_CUSTOM_INT_IN, GS101_CUSTOM_INT_IN),
> +       regmap_reg_range(GS101_HCU_R(0), GS101_HCU_R(3)),
> +       regmap_reg_range(GS101_HCU_SP, GS101_HCU_PC),
> +       regmap_reg_range(GS101_NMI_SRC_IN, GS101_NMI_SRC_IN),
> +       regmap_reg_range(GS101_HPM_INT_IN, GS101_HPM_INT_IN),
> +       regmap_reg_range(GS101_MEMORY_PGEN_FEEDBACK, GS101_MEMORY_PGEN_FE=
EDBACK),
> +       regmap_reg_range(GS101_MEMORY_SMX_FEEDBACK, GS101_MEMORY_SMX_FEED=
BACK),
> +       regmap_reg_range(GS101_PMLINK_SLC_ACK, GS101_PMLINK_SLC_BUSY),
> +       regmap_reg_range(GS101_BOOTSYNC_IN, GS101_BOOTSYNC_IN),
> +       regmap_reg_range(GS101_SCAN_READY_IN, GS101_SCAN_READY_IN),
> +       regmap_reg_range(GS101_CTRL_PLL_ALV_LOCK, GS101_CTRL_PLL_ALV_LOCK=
),
> +};
> +

That's quite an extensive list of registers! Does this PMU driver
really have to cover all of those?

> +static const struct regmap_access_table gs101_pmu_rd_table =3D {
> +       .yes_ranges =3D gs101_pmu_registers,
> +       .n_yes_ranges =3D ARRAY_SIZE(gs101_pmu_registers),
> +};
> +
> +static const struct regmap_access_table gs101_pmu_wr_table =3D {
> +       .yes_ranges =3D gs101_pmu_registers,
> +       .n_yes_ranges =3D ARRAY_SIZE(gs101_pmu_registers),
> +       .no_ranges =3D gs101_pmu_ro_registers,
> +       .n_no_ranges =3D ARRAY_SIZE(gs101_pmu_ro_registers),
> +};
> +
>  const struct exynos_pmu_data gs101_pmu_data =3D {
>         .pmu_secure =3D true,
>         .pmu_cpuhp =3D true,
> +       .rd_table =3D &gs101_pmu_rd_table,
> +       .wr_table =3D &gs101_pmu_wr_table,
>  };
>
>  /*
> @@ -123,7 +427,7 @@ static bool tensor_is_atomic(unsigned int reg)
>                 return false;
>
>         switch (reg) {
> -       case GS101_SYSIP_DAT0:
> +       case GS101_SYSIP_DAT(0):
>         case GS101_SYSTEM_CONFIGURATION:
>                 return false;
>         default:
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/=
soc/samsung/exynos-regs-pmu.h
> index 71e0c09a49ebb8544d26081e97492665e5e9ec6a..532c6c2d11950c606576805ae=
eb38b4612cd2d44 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -672,14 +672,341 @@
>
>  /* For Tensor GS101 */
>  /* PMU ALIVE */
> -#define GS101_SYSIP_DAT0                                       (0x810)
> -#define GS101_CPU0_INFORM                                      (0x860)
> -#define GS101_CPU_INFORM(cpu)  \
> -                       (GS101_CPU0_INFORM + (cpu*4))
> -#define GS101_SYSTEM_CONFIGURATION                             (0x3A00)
> -#define GS101_EINT_WAKEUP_MASK                                 (0x3A80)
> -#define GS101_PHY_CTRL_USB20                                   (0x3EB0)
> -#define GS101_PHY_CTRL_USBDP                                   (0x3EB4)
> +#define GS101_OM_STAT                           0x0000
> +#define GS101_VERSION                           0x0004
> +#define GS101_PORESET_CHECK                     0x0008
> +#define GS101_OTP_STATUS                        0x000c
> +#define GS101_SYSTEM_INFO                       0x0010
> +#define GS101_IDLE_IP(n)                        (0x03e0 + ((n) & 3) * 4)
> +#define GS101_IDLE_IP_MASK(n)                   (0x03f0 + ((n) & 3) * 4)
> +#define GS101_SLC_CH_OFFSET(ch)                 (0x0400 + ((ch) & 3) * 0=
x10)
> +#define GS101_DATARAM_STATE_SLC_CH(ch)          (GS101_SLC_CH_OFFSET(ch)=
 + 0x00)
> +#define GS101_TAGRAM_STATE_SLC_CH(ch)           (GS101_SLC_CH_OFFSET(ch)=
 + 0x04)
> +#define GS101_LRURAM_STATE_SLC_CH(ch)           (GS101_SLC_CH_OFFSET(ch)=
 + 0x08)
> +#define GS101_PPMPURAM_STATE_SLC_CH(ch)         (GS101_SLC_CH_OFFSET(ch)=
 + 0x0c)
> +#define GS101_DATARAM_INFORM_SCL_CH(ch)         (GS101_SLC_CH_OFFSET(ch)=
 + 0x40)
> +#define GS101_TAGRAM_INFORM_SCL_CH(ch)          (GS101_SLC_CH_OFFSET(ch)=
 + 0x44)
> +#define GS101_LRURAM_INFORM_SCL_CH(ch)          (GS101_SLC_CH_OFFSET(ch)=
 + 0x48)
> +#define GS101_PPMPURAM_INFORM_SCL_CH(ch)        (GS101_SLC_CH_OFFSET(ch)=
 + 0x4c)
> +#define GS101_INFORM0                           0x0800
> +#define GS101_INFORM1                           0x0804
> +#define GS101_INFORM2                           0x0808
> +#define GS101_INFORM3                           0x080c
> +#define GS101_SYSIP_DAT(n)                      (0x0810 + ((n) & 3) * 4)
> +#define GS101_PWR_HOLD_HW_TRIP                  0x0820
> +#define GS101_PWR_HOLD_SW_TRIP                  0x0824
> +#define GS101_GSA_INFORM(n)                     (0x0830 + ((n) & 1) * 4)
> +#define GS101_INFORM4                           0x0840
> +#define GS101_INFORM5                           0x0844
> +#define GS101_INFORM6                           0x0848
> +#define GS101_INFORM7                           0x084c
> +#define GS101_INFORM8                           0x0850
> +#define GS101_INFORM9                           0x0854
> +#define GS101_INFORM10                          0x0858
> +#define GS101_INFORM11                          0x085c
> +#define GS101_CPU_INFORM(cpu)                   (0x0860 + ((cpu) & 7) * =
4)
> +#define GS101_IROM_INFORM                       0x0880
> +#define GS101_IROM_CPU_INFORM(cpu)              (0x0890 + ((cpu) & 7) * =
4)
> +#define GS101_PMU_SPARE(n)                      (0x0900 + ((n) & 3) * 4)
> +#define GS101_IROM_DATA_REG(n)                  (0x0980 + ((n) & 3) * 4)
> +#define GS101_IROM_PWRMODE                      0x0990
> +#define GS101_DREX_CALIBRATION(n)               (0x09a0 + ((n) & 7) * 4)
> +
> +#define GS101_CLUSTER0_OFFSET                   0x1000
> +#define GS101_CLUSTER1_OFFSET                   0x1300
> +#define GS101_CLUSTER2_OFFSET                   0x1500
> +#define GS101_CLUSTER_CPU_OFFSET(cl, cpu)       ((cl) + ((cpu) * 0x80))
> +#define GS101_CLUSTER_CPU_CONFIGURATION(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x00)
> +#define GS101_CLUSTER_CPU_STATUS(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x04)
> +#define GS101_CLUSTER_CPU_STATES(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x08)
> +#define GS101_CLUSTER_CPU_OPTION(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x0c)
> +#define GS101_CLUSTER_CPU_OUT(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x20)
> +#define GS101_CLUSTER_CPU_IN(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x24)
> +#define GS101_CLUSTER_CPU_INT_IN(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x40)
> +#define GS101_CLUSTER_CPU_INT_EN(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
> +#define GS101_CLUSTER_CPU_INT_TYPE(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x48)
> +#define GS101_CLUSTER_CPU_INT_DIR(cl, cpu) \
> +                       (GS101_CLUSTER_CPU_OFFSET(cl, cpu) + 0x4c)
> +
> +#define GS101_CLUSTER_NONCPU_OFFSET(cl)         (0x1200 + ((cl) * 0x200)=
)
> +#define GS101_CLUSTER_NONCPU_CONFIGURATION(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x00)
> +#define GS101_CLUSTER_NONCPU_STATUS(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x04)
> +#define GS101_CLUSTER_NONCPU_STATES(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x08)
> +#define GS101_CLUSTER_NONCPU_OPTION(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x0c)
> +#define GS101_CLUSTER_NONCPU_OUT(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x20)
> +#define GS101_CLUSTER_NONCPU_IN(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x24)
> +#define GS101_CLUSTER_NONCPU_INT_IN(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x40)
> +#define GS101_CLUSTER_NONCPU_INT_EN(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x44)
> +#define GS101_CLUSTER_NONCPU_INT_TYPE(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x48)
> +#define GS101_CLUSTER_NONCPU_INT_DIR(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x4c)
> +#define GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_OUT(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x60)
> +#define GS101_CLUSTER_NONCPU_DUALRAIL_POS_OUT(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x64)
> +#define GS101_CLUSTER_NONCPU_DUALRAIL_CTRL_IN(cl) \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(cl) + 0x6c)
> +#define GS101_CLUSTER0_NONCPU_DSU_PCH \
> +                       (GS101_CLUSTER_NONCPU_OFFSET(0) + 0x80)
> +
> +#define GS101_SUBBBLK_OFFSET_ALIVE              0x1800
> +#define GS101_SUBBBLK_OFFSET_AOC                0x1880
> +#define GS101_SUBBBLK_OFFSET_APM                0x1900
> +#define GS101_SUBBBLK_OFFSET_CMU                0x1980
> +#define GS101_SUBBBLK_OFFSET_BUS0               0x1a00
> +#define GS101_SUBBBLK_OFFSET_BUS1               0x1a80
> +#define GS101_SUBBBLK_OFFSET_BUS2               0x1b00
> +#define GS101_SUBBBLK_OFFSET_CORE               0x1b80
> +#define GS101_SUBBBLK_OFFSET_EH                 0x1c00
> +#define GS101_SUBBBLK_OFFSET_CPUCL0             0x1c80
> +#define GS101_SUBBBLK_OFFSET_CPUCL1             0x1d00
> +#define GS101_SUBBBLK_OFFSET_CPUCL2             0x1d80
> +#define GS101_SUBBBLK_OFFSET_G3D                0x1e00
> +#define GS101_SUBBBLK_OFFSET_EMBEDDED_CPUCL0    0x1e80
> +#define GS101_SUBBBLK_OFFSET_EMBEDDED_G3D       0x2000
> +#define GS101_SUBBBLK_OFFSET_HSI0               0x2080
> +#define GS101_SUBBBLK_OFFSET_HSI1               0x2100
> +#define GS101_SUBBBLK_OFFSET_HSI2               0x2180
> +#define GS101_SUBBBLK_OFFSET_DPU                0x2200
> +#define GS101_SUBBBLK_OFFSET_DISP               0x2280
> +#define GS101_SUBBBLK_OFFSET_G2D                0x2300
> +#define GS101_SUBBBLK_OFFSET_MFC                0x2380
> +#define GS101_SUBBBLK_OFFSET_CSIS               0x2400
> +#define GS101_SUBBBLK_OFFSET_PDP                0x2480
> +#define GS101_SUBBBLK_OFFSET_DNS                0x2500
> +#define GS101_SUBBBLK_OFFSET_G3AA               0x2580
> +#define GS101_SUBBBLK_OFFSET_IPP                0x2600
> +#define GS101_SUBBBLK_OFFSET_ITP                0x2680
> +#define GS101_SUBBBLK_OFFSET_MCSC               0x2700
> +#define GS101_SUBBBLK_OFFSET_GDC                0x2780
> +#define GS101_SUBBBLK_OFFSET_TNR                0x2800
> +#define GS101_SUBBBLK_OFFSET_BO                 0x2880
> +#define GS101_SUBBBLK_OFFSET_TPU                0x2900
> +#define GS101_SUBBBLK_OFFSET_MIF0               0x2980
> +#define GS101_SUBBBLK_OFFSET_MIF1               0x2a00
> +#define GS101_SUBBBLK_OFFSET_MIF2               0x2a80
> +#define GS101_SUBBBLK_OFFSET_MIF3               0x2b00
> +#define GS101_SUBBBLK_OFFSET_MISC               0x2b80
> +#define GS101_SUBBBLK_OFFSET_PERIC0             0x2c00
> +#define GS101_SUBBBLK_OFFSET_PERIC1             0x2c80
> +#define GS101_SUBBBLK_OFFSET_S2D                0x2d00
> +#define GS101_SUBBLK_CONFIGURATION(blk)         ((blk) + 0x00)
> +#define GS101_SUBBLK_STATUS(blk)                ((blk) + 0x04)
> +#define GS101_SUBBLK_STATES(blk)                ((blk) + 0x08)
> +#define GS101_SUBBLK_OPTION(blk)                ((blk) + 0x0c)
> +#define GS101_SUBBLK_CTRL(blk)                  ((blk) + 0x10)
> +#define GS101_SUBBLK_OUT(blk)                   ((blk) + 0x20)
> +#define GS101_SUBBLK_IN(blk)                    ((blk) + 0x24)
> +#define GS101_SUBBLK_INT_IN(blk)                ((blk) + 0x40)
> +#define GS101_SUBBLK_INT_EN(blk)                ((blk) + 0x44)
> +#define GS101_SUBBLK_INT_TYPE(blk)              ((blk) + 0x48)
> +#define GS101_SUBBLK_INT_DIR(blk)               ((blk) + 0x4c)
> +#define GS101_SUBBLK_MEMORY_OUT(blk)            ((blk) + 0x60)
> +#define GS101_SUBBLK_MEMORY_IN(blk)             ((blk) + 0x64)
> +
> +#define GS101_SUBBBLK_CPU_OFFSET_APM            0x3000
> +#define GS101_SUBBBLK_CPU_OFFSET_DBGCORE        0x3080
> +#define GS101_SUBBBLK_CPU_OFFSET_SSS            0x3100
> +#define GS101_SUBBLK_CPU_CONFIGURATION(blk)     ((blk) + 0x00)
> +#define GS101_SUBBLK_CPU_STATUS(blk)            ((blk) + 0x04)
> +#define GS101_SUBBLK_CPU_STATES(blk)            ((blk) + 0x08)
> +#define GS101_SUBBLK_CPU_OPTION(blk)            ((blk) + 0x0c)
> +#define GS101_SUBBLK_CPU_OUT(blk)               ((blk) + 0x20)
> +#define GS101_SUBBLK_CPU_IN(blk)                ((blk) + 0x24)
> +#define GS101_SUBBLK_CPU_INT_IN(blk)            ((blk) + 0x40)
> +#define GS101_SUBBLK_CPU_INT_EN(blk)            ((blk) + 0x44)
> +#define GS101_SUBBLK_CPU_INT_TYPE(blk)          ((blk) + 0x48)
> +#define GS101_SUBBLK_CPU_INT_DIR(blk)           ((blk) + 0x4c)
> +
> +#define GS101_MIF_CONFIGURATION                 0x3800
> +#define GS101_MIF_STATUS                        0x3804
> +#define GS101_MIF_STATES                        0x3808
> +#define GS101_MIF_OPTION                        0x380c
> +#define GS101_MIF_CTRL                          0x3810
> +#define GS101_MIF_OUT                           0x3820
> +#define GS101_MIF_IN                            0x3824
> +#define GS101_MIF_INT_IN                        0x3840
> +#define GS101_MIF_INT_EN                        0x3844
> +#define GS101_MIF_INT_TYPE                      0x3848
> +#define GS101_MIF_INT_DIR                       0x384c
> +#define GS101_TOP_CONFIGURATION                 0x3900
> +#define GS101_TOP_STATUS                        0x3904
> +#define GS101_TOP_STATES                        0x3908
> +#define GS101_TOP_OPTION                        0x390c
> +#define GS101_TOP_OUT                           0x3920
> +#define GS101_TOP_IN                            0x3924
> +#define GS101_TOP_INT_IN                        0x3940
> +#define GS101_TOP_INT_EN                        0x3944
> +#define GS101_TOP_INT_TYPE                      0x3948
> +#define GS101_TOP_INT_DIR                       0x394c
> +#define GS101_WAKEUP_STAT                       0x3950
> +#define GS101_WAKEUP2_STAT                      0x3954
> +#define GS101_WAKEUP2_INT_IN                    0x3960
> +#define GS101_WAKEUP2_INT_EN                    0x3964
> +#define GS101_WAKEUP2_INT_TYPE                  0x3968
> +#define GS101_WAKEUP2_INT_DIR                   0x396c
> +#define GS101_SYSTEM_CONFIGURATION              0x3a00
> +#define GS101_SYSTEM_STATUS                     0x3a04
> +#define GS101_SYSTEM_STATES                     0x3a08
> +#define GS101_SYSTEM_OPTION                     0x3a0c
> +#define GS101_SYSTEM_CTRL                       0x3a10
> +#define GS101_SPARE_CTRL                        0x3a14
> +#define GS101_USER_DEFINED_OUT                  0x3a18
> +#define GS101_SYSTEM_OUT                        0x3a20
> +#define GS101_SYSTEM_IN                         0x3a24
> +#define GS101_SYSTEM_INT_IN                     0x3a40
> +#define GS101_SYSTEM_INT_EN                     0x3a44
> +#define GS101_SYSTEM_INT_TYPE                   0x3a48
> +#define GS101_SYSTEM_INT_DIR                    0x3a4c
> +#define GS101_EINT_INT_IN                       0x3a50
> +#define GS101_EINT_INT_EN                       0x3a54
> +#define GS101_EINT_INT_TYPE                     0x3a58
> +#define GS101_EINT_INT_DIR                      0x3a5c
> +#define GS101_EINT2_INT_IN                      0x3a60
> +#define GS101_EINT2_INT_EN                      0x3a64
> +#define GS101_EINT2_INT_TYPE                    0x3a68
> +#define GS101_EINT2_INT_DIR                     0x3a6c
> +#define GS101_EINT3_INT_IN                      0x3a70
> +#define GS101_EINT3_INT_EN                      0x3a74
> +#define GS101_EINT3_INT_TYPE                    0x3a78
> +#define GS101_EINT3_INT_DIR                     0x3a7c
> +#define GS101_EINT_WAKEUP_MASK                  0x3a80
> +#define GS101_EINT_WAKEUP_MASK2                 0x3a84
> +#define GS101_EINT_WAKEUP_MASK3                 0x3a88
> +#define GS101_USER_DEFINED_INT_IN               0x3a90
> +#define GS101_USER_DEFINED_INT_EN               0x3a94
> +#define GS101_USER_DEFINED_INT_TYPE             0x3a98
> +#define GS101_USER_DEFINED_INT_DIR              0x3a9c
> +#define GS101_SCAN2DRAM_INT_IN                  0x3aa0
> +#define GS101_SCAN2DRAM_INT_EN                  0x3aa4
> +#define GS101_SCAN2DRAM_INT_TYPE                0x3aa8
> +#define GS101_SCAN2DRAM_INT_DIR                 0x3aac
> +#define GS101_HCU_START                         0x3ab0
> +#define GS101_CUSTOM_OUT                        0x3ac0
> +#define GS101_CUSTOM_IN                         0x3ac4
> +#define GS101_CUSTOM_INT_IN                     0x3ad0
> +#define GS101_CUSTOM_INT_EN                     0x3ad4
> +#define GS101_CUSTOM_INT_TYPE                   0x3ad8
> +#define GS101_CUSTOM_INT_DIR                    0x3adc
> +#define GS101_ACK_LAST_CPU                      0x3afc
> +#define GS101_HCU_R(n)                          (0x3b00 + ((n) & 3) * 4)
> +#define GS101_HCU_SP                            0x3b14
> +#define GS101_HCU_PC                            0x3b18
> +#define GS101_PMU_RAM_CTRL                      0x3b20
> +#define GS101_APM_HCU_CTRL                      0x3b24
> +#define GS101_APM_NMI_ENABLE                    0x3b30
> +#define GS101_DBGCORE_NMI_ENABLE                0x3b34
> +#define GS101_HCU_NMI_ENABLE                    0x3b38
> +#define GS101_PWR_HOLD_WDT_ENABLE               0x3b3c
> +#define GS101_NMI_SRC_IN                        0x3b40
> +#define GS101_RST_STAT                          0x3b44
> +#define GS101_RST_STAT_PMU                      0x3b48
> +#define GS101_HPM_INT_IN                        0x3b60
> +#define GS101_HPM_INT_EN                        0x3b64
> +#define GS101_HPM_INT_TYPE                      0x3b68
> +#define GS101_HPM_INT_DIR                       0x3b6c
> +#define GS101_S2D_AUTH                          0x3b70
> +#define GS101_BOOT_STAT                         0x3b74
> +#define GS101_PMLINK_OUT                        0x3c00
> +#define GS101_PMLINK_AOC_OUT                    0x3c04
> +#define GS101_PMLINK_AOC_CTRL                   0x3c08
> +#define GS101_TCXO_BUF_CTRL                     0x3c10
> +#define GS101_ADD_CTRL                          0x3c14
> +#define GS101_HCU_TIMEOUT_RESET                 0x3c20
> +#define GS101_HCU_TIMEOUT_SCAN2DRAM             0x3c24
> +#define GS101_TIMER(n)                          (0x3c80 + ((n) & 3) * 4)
> +#define GS101_PPC_MIF(n)                        (0x3c90 + ((n) & 3) * 4)
> +#define GS101_PPC_CORE                          0x3ca0
> +#define GS101_PPC_EH                            0x3ca4
> +#define GS101_PPC_CPUCL1_0                      0x3ca8
> +#define GS101_PPC_CPUCL1_1                      0x3cac
> +#define GS101_EXT_REGULATOR_MIF_DURATION        0x3cb0
> +#define GS101_EXT_REGULATOR_TOP_DURATION        0x3cb4
> +#define GS101_EXT_REGULATOR_CPUCL2_DURATION     0x3cb8
> +#define GS101_EXT_REGULATOR_CPUCL1_DURATION     0x3cbc
> +#define GS101_EXT_REGULATOR_G3D_DURATION        0x3cc0
> +#define GS101_EXT_REGULATOR_TPU_DURATION        0x3cc4
> +#define GS101_TCXO_DURATION                     0x3cc8
> +#define GS101_BURNIN_CTRL                       0x3cd0
> +#define GS101_JTAG_DBG_DET                      0x3cd4
> +#define GS101_MMC_CONWKUP_CTRL                  0x3cd8
> +#define GS101_USBDPPHY0_USBDP_WAKEUP            0x3cdc
> +#define GS101_TMU_TOP_TRIP                      0x3ce0
> +#define GS101_TMU_SUB_TRIP                      0x3ce4
> +#define GS101_MEMORY_CEN                        0x3d00
> +#define GS101_MEMORY_PGEN                       0x3d04
> +#define GS101_MEMORY_RET                        0x3d08
> +#define GS101_MEMORY_PGEN_FEEDBACK              0x3d0c
> +#define GS101_MEMORY_SMX                        0x3d10
> +#define GS101_MEMORY_SMX_FEEDBACK               0x3d14
> +#define GS101_SLC_PCH_CHANNEL                   0x3d20
> +#define GS101_SLC_PCH_CB                        0x3d24
> +#define GS101_FORCE_NOMC                        0x3d3c
> +#define GS101_FORCE_BOOST                       0x3d4c
> +#define GS101_PMLINK_SLC_REQ                    0x3d50
> +#define GS101_PMLINK_SLC_ACK                    0x3d54
> +#define GS101_PMLINK_SLC_BUSY                   0x3d58
> +#define GS101_BOOTSYNC_OUT                      0x3d80
> +#define GS101_BOOTSYNC_IN                       0x3d84
> +#define GS101_SCAN_READY_OUT                    0x3d88
> +#define GS101_SCAN_READY_IN                     0x3d8c
> +#define GS101_GSA_RESTORE                       0x3d90
> +#define GS101_ALIVE_OTP_LATCH                   0x3d94
> +#define GS101_DEBUG_OVERRIDE                    0x3d98
> +#define GS101_WDT_OPTION                        0x3d9c
> +#define GS101_AOC_WDT_CFG                       0x3da0
> +#define GS101_CTRL_SECJTAG_ALIVE                0x3da4
> +#define GS101_CTRL_DIV_PLL_ALV_DIVLOW           0x3e00
> +#define GS101_CTRL_MUX_CLK_APM_REFSRC_AUTORESTORE 0x3e04
> +#define GS101_CTRL_MUX_CLK_APM_REFSRC           0x3e08
> +#define GS101_CTRL_MUX_CLK_APM_REF              0x3e0c
> +#define GS101_CTRL_MUX_PLL_ALV_DIV4             0x3e10
> +#define GS101_CTRL_PLL_ALV_DIV4                 0x3e14
> +#define GS101_CTRL_OSCCLK_APMGSA                0x3e18
> +#define GS101_CTRL_BLK_AOC_CLKS                 0x3e1c
> +#define GS101_CTRL_PLL_ALV_LOCK                 0x3e20
> +#define GS101_CTRL_CLKDIV__CLKRTC               0x3e24
> +#define GS101_CTRL_SOC32K                       0x3e30
> +#define GS101_CTRL_STM_PMU                      0x3e34
> +#define GS101_CTRL_PMU_DEBUG                    0x3e38
> +#define GS101_CTRL_DEBUG_UART                   0x3e3c
> +#define GS101_CTRL_TCK                          0x3e40
> +#define GS101_CTRL_SBU_SW_EN                    0x3e44
> +#define GS101_PAD_CTRL_CLKOUT0                  0x3e80
> +#define GS101_PAD_CTRL_CLKOUT1                  0x3e84
> +#define GS101_PAD_CTRL_APM_24MOUT_0             0x3e88
> +#define GS101_PAD_CTRL_APM_24MOUT_1             0x3e8c
> +#define GS101_PAD_CTRL_IO_FORCE_RETENTION       0x3e90
> +#define GS101_PAD_CTRL_APACTIVE_n               0x3e94
> +#define GS101_PAD_CTRL_TCXO_ON                  0x3e98
> +#define GS101_PAD_CTRL_PWR_HOLD                 0x3e9c
> +#define GS101_PAD_CTRL_RESETO_n                 0x3ea0
> +#define GS101_PAD_CTRL_WRESETO_n                0x3ea4
> +#define GS101_PHY_CTRL_USB20                    0x3eb0
> +#define GS101_PHY_CTRL_USBDP                    0x3eb4
> +#define GS101_PHY_CTRL_MIPI_DCPHY_M4M4          0x3eb8
> +#define GS101_PHY_CTRL_MIPI_DCPHY_S4S4S4S4      0x3ebc
> +#define GS101_PHY_CTRL_PCIE_GEN4_0              0x3ec0
> +#define GS101_PHY_CTRL_PCIE_GEN4_1              0x3ec4
> +#define GS101_PHY_CTRL_UFS                      0x3ec8
>
>  /* PMU INTR GEN */
>  #define GS101_GRP1_INTR_BID_UPEND                              (0x0108)
>
> --
> 2.51.0.618.g983fd99d29-goog
>
>
