From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 3/9] drivers: memory: extend of_memory by LPDDR3 support
Date: Wed, 24 Jul 2019 13:39:48 +0200
Message-ID: <CAJKOXPdue75yF=v5vsawOdfvcCMBDP6HGVXdwngBWE264kGJwg@mail.gmail.com>
References: <CGME20190722094727eucas1p10041ba25819e6e62d639423a97435f2d@eucas1p1.samsung.com>
 <20190722094646.13342-1-l.luba@partner.samsung.com> <20190722094646.13342-4-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722094646.13342-4-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 22 Jul 2019 at 11:47, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> The patch adds AC timings information needed to support LPDDR3 and memory
> controllers. The structure is used in of_memory and currently in Exynos
> 5422 DMC. Add parsing data needed for LPDDR3 support.
> It is currently used in Exynos5422 Dynamic Memory Controller.
>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  drivers/memory/jedec_ddr.h |  61 +++++++++++++++
>  drivers/memory/of_memory.c | 154 +++++++++++++++++++++++++++++++++++++
>  drivers/memory/of_memory.h |  18 +++++
>  3 files changed, 233 insertions(+)
>
> diff --git a/drivers/memory/jedec_ddr.h b/drivers/memory/jedec_ddr.h
> index 4a21b5044ff8..38e26d461bdb 100644
> --- a/drivers/memory/jedec_ddr.h
> +++ b/drivers/memory/jedec_ddr.h
> @@ -29,6 +29,7 @@
>  #define DDR_TYPE_LPDDR2_S4     3
>  #define DDR_TYPE_LPDDR2_S2     4
>  #define DDR_TYPE_LPDDR2_NVM    5
> +#define DDR_TYPE_LPDDR3                6
>
>  /* DDR IO width */
>  #define DDR_IO_WIDTH_4         1
> @@ -169,4 +170,64 @@ extern const struct lpddr2_timings
>         lpddr2_jedec_timings[NUM_DDR_TIMING_TABLE_ENTRIES];
>  extern const struct lpddr2_min_tck lpddr2_jedec_min_tck;
>
> +/*
> + * Structure for timings for LPDDR3 based on LPDDR2 plus additional fields.
> + * All parameters are in pico seconds(ps) unless explicitly indicated
> + * with a suffix like tRAS_max_ns below
> + */
> +struct lpddr3_timings {
> +       u32 max_freq;
> +       u32 min_freq;
> +       u32 tRFC;
> +       u32 tRRD;
> +       u32 tRPab;
> +       u32 tRPpb;
> +       u32 tRCD;
> +       u32 tRC;
> +       u32 tRAS;
> +       u32 tWTR;
> +       u32 tWR;
> +       u32 tRTP;
> +       u32 tW2W_C2C;
> +       u32 tR2R_C2C;
> +       u32 tWL;
> +       u32 tDQSCK;
> +       u32 tRL;
> +       u32 tFAW;
> +       u32 tXSR;
> +       u32 tXP;
> +       u32 tCKE;
> +       u32 tCKESR;
> +       u32 tMRD;
> +};
> +
> +/*
> + * Min value for some parameters in terms of number of tCK cycles(nCK)
> + * Please set to zero parameters that are not valid for a given memory
> + * type
> + */
> +struct lpddr3_min_tck {
> +       u32 tRFC;
> +       u32 tRRD;
> +       u32 tRPab;
> +       u32 tRPpb;
> +       u32 tRCD;
> +       u32 tRC;
> +       u32 tRAS;
> +       u32 tWTR;
> +       u32 tWR;
> +       u32 tRTP;
> +       u32 tW2W_C2C;
> +       u32 tR2R_C2C;
> +       u32 tWL;
> +       u32 tDQSCK;
> +       u32 tRL;
> +       u32 tFAW;
> +       u32 tXSR;
> +       u32 tXP;
> +       u32 tCKE;
> +       u32 tCKESR;
> +       u32 tMRD;
> +};
> +
>  #endif /* __JEDEC_DDR_H */
> diff --git a/drivers/memory/of_memory.c b/drivers/memory/of_memory.c
> index 46539b27a3fb..4f5b8c81669f 100644
> --- a/drivers/memory/of_memory.c
> +++ b/drivers/memory/of_memory.c
> @@ -3,6 +3,12 @@
>   * OpenFirmware helpers for memory drivers
>   *
>   * Copyright (C) 2012 Texas Instruments, Inc.
> + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

What's this?

Please, get a independent review or ack for this patch.

Best regards,
Krzysztof
