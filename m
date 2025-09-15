Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCAB3D984
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926794; cv=none; b=e2IBUtdKlmfhjwDVyYe6P0YKVVARWa6lDCAN8YLhvLM9GZ/3a8+c3X0jvFtfyayY9d9DRQqvRJFF3KHQhH+YxIg1Kz0tQEH4OAE7KryntjWjPkWUlcMSn0Y97dZ8svE+3yvyAWEbomTt0TwXt2GLry7f6iU1AWgoAs7quxK+ZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926794; c=relaxed/simple;
	bh=yVJ/zB7Za/xFJEFjpbiTAxy/vw2oveYhHxBNm1AwRBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNqLF+/3ZXUysNuGL75d+lVuFrvE9E0JNfQ9zl2pC03BTn8+FtgRxRwaDjKNW47MTHHF2gX0ETZmT1T+ehSDo5lEKU1tp8B0tOKJengrkDSABHFi4yLgcGEbE5g47BU2fvWV8stiICaySUv8Osdt1TFmtYxYOJrEWZfSt1z27UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRoAESXq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRoAESXq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dde353b47so23732415e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 01:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757926789; x=1758531589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LuFJVSHeAQHDn0+XSdf5A7eQdiJjAJ7onpQpF2BurQ=;
        b=DRoAESXqLoTt3GcqQY8DByh196cLEpm25YnHEOAaBWzrL0x5EXWekGVhOlEIf0XM5p
         6JtgeSn8gQ10ENaZf4mdHne1JPceqEtspVZACHmlSCkHFlWjW868WVDhcXKQ3sv1FLRC
         UQvJpOOblG301SvJXzUbDHO9R0T1D7atdJeESFPwp/LMB503gK7FwHBhbeObihQoZC8b
         hz06Uu9FJ1XOyLk6vrHUMcFEDA4+CyapcrG0vnal4ejZSHo44ESwWUSzNKQs/KYg2Qf+
         kg19wTByFfRFCXJWFuddFBbF/Ex2GNUsTXWrIReTsB3LBr4sxS9cOUZG3hcP6N3XeRRA
         hqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926789; x=1758531589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LuFJVSHeAQHDn0+XSdf5A7eQdiJjAJ7onpQpF2BurQ=;
        b=aeAy2XGyUytxuToNlO6+iTni/ylVJrtoDcvhQK8u1SsWDcselUxeqF4V5sLQtFoK8n
         uDGWLHYdUUMA9PW0IAU2LxB5hv07QpIL+MLvkBmFrUA5HC7+GkJpjj2ptaqbSkf79WSL
         1JBlPz13nEczjjVS+OSSz6MpnzMuLfk3ZkxT+1wjnauBWIQu5dxqXINVrO0X2ylFLaTy
         6E9iQ072ZHrWs816YiaYr5OIPru5KDHV0RNq+Z1HB+sMesUlSM3uC3Td2xOYdoPhcrfM
         r1du7zeSIlat2hgSCmFgAy7WJWw6QTFIOzrdMDrqCXst53m/MkFUaQSkzRlhiw63Jc3u
         D8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwfg4v8J0J0sRF5L9seBTwq8MXw0YIqTSoST0xq9XEZoCRsig10WHmy+F8mO/LYGnYi5HwmELQW0A41zpiydhKng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99Pc5tZWN4vDF5n15GQAncg8t250wlY6G1fmfi4PalfmmaQpu
	5TDLuTK3lIybAhRSO5p+5MFbX2roONBdQhgylovuHs263m4Dlj7uvG3z
X-Gm-Gg: ASbGncvzbO+GkPjVLFrJkDETksJZBczqpH7XUJZYOSNREegOiFjEvjW3wwvlZ+8e7x+
	oJgQYf7QaaUAxzj/63M182oBCiJfkBGz91PP2kmiazHLKi1Ao313wkmey3IxJfM04Nn0KCfB/gn
	bI2QBsSNBxudSUMe5Bz/meeBxDl6JkKSvxOcQ6sveG5bxPkIFL7dSuiwsnFqPOE1BtsBVM2WKXL
	bl/8oUWG7R4W8ZBUX/PLwHAt6BT/bj35ne4P3wZ4gNRzm4qhVj0JgM+VzHwcb8hMpo/vWw+np/e
	bB5W4nGAGZEZv+pBc3/Io3rJZjOaT6NIlLYz5iARztCs6unH1E5paSBVorEPL3y+x/l1MAZ7Gdh
	AraXrBjf7HtTu/d24XhYCYV84h3KA9cidToov1XSUqByKED7ROWznMNjpCXaShOpcZfNCsuHTyg
	9/qS4ieeG92kA=
X-Google-Smtp-Source: AGHT+IHPNlJyMCNv0p6hi8FUDXyC4LeGZ9hyO1d/g54G8GsV8O86kurfDHc3Bpeny255lVmyLx7p/w==
X-Received: by 2002:a05:6000:4021:b0:3b9:148b:e78 with SMTP id ffacd0b85a97d-3e7659f46f8mr9388551f8f.53.1757926789143;
        Mon, 15 Sep 2025 01:59:49 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e86602a7d5sm9370472f8f.62.2025.09.15.01.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 01:59:48 -0700 (PDT)
Message-ID: <d23885a5-6d42-443a-bf19-eb6747e8ec47@gmail.com>
Date: Mon, 15 Sep 2025 11:59:47 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] clk: samsung: introduce exynos8890 clock driver
Content-Language: en-US
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914122116.2616801-6-ivo.ivanov.ivanov1@gmail.com>
 <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250915074931.GD8224@nxa18884-linux.ap.freescale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/15/25 10:49, Peng Fan wrote:
> On Sun, Sep 14, 2025 at 03:21:16PM +0300, Ivaylo Ivanov wrote:
>> Introduce a clocks management driver for exynos8890, providing clocks
>> for the peripherals of that SoC.
>>
>> As exynos8890 is the first SoC to have HWACG, it differs a bit from the
> Hardware Auto Clock Gating(HWACG), if I understand correctly.
>
>> newer SoCs. Q-channel and Q-state bits are separate registers, unlike
>> the CLK_CON_GAT_* ones that feature HWACG bits in the same register
>> that controls manual gating. Hence, don't use the clk-exynos-arm64
>> helper, but implement logic that enforces manual gating according to
>> how HWACG is implemented here.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>> drivers/clk/samsung/Makefile         |    1 +
>> drivers/clk/samsung/clk-exynos8890.c | 8695 ++++++++++++++++++++++++++
>> 2 files changed, 8696 insertions(+)
>> create mode 100644 drivers/clk/samsung/clk-exynos8890.c
>>
>> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
>> index b77fe288e..982dc7c64 100644
>> --- a/drivers/clk/samsung/Makefile
>> +++ b/drivers/clk/samsung/Makefile
>> @@ -22,6 +22,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7870.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7885.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8890.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos8895.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos990.o
>> obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynosautov9.o
>> diff --git a/drivers/clk/samsung/clk-exynos8890.c b/drivers/clk/samsung/clk-exynos8890.c
>> new file mode 100644
>> index 000000000..670587bae
>> --- /dev/null
>> +++ b/drivers/clk/samsung/clk-exynos8890.c
>> @@ -0,0 +1,8695 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> + *
>> + * Common Clock Framework support for Exynos8890 SoC.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include <dt-bindings/clock/samsung,exynos8890-cmu.h>
>> +
>> +#include "clk.h"
>> +
>> +/* NOTE: Must be equal to the last clock ID increased by one */
>> +#define TOP_NR_CLK	(CLK_GOUT_TOP_SCLK_PROMISE_DISP + 1)
>> +#define PERIS_NR_CLK	(CLK_GOUT_PERIS_SCLK_PROMISE_PERIS + 1)
>> +#define APOLLO_NR_CLK	(CLK_GOUT_APOLLO_SCLK_PROMISE_APOLLO + 1)
>> +#define AUD_NR_CLK	(CLK_GOUT_AUD_SCLK_I2S_BCLK + 1)
>> +#define BUS0_NR_CLK	(CLK_GOUT_BUS0_ACLK_TREX_P_BUS0 + 1)
>> +#define BUS1_NR_CLK	(CLK_GOUT_BUS1_ACLK_TREX_P_BUS1 + 1)
>> +#define CCORE_NR_CLK	(CLK_GOUT_CCORE_SCLK_PROMISE + 1)
>> +#define DISP0_NR_CLK	(CLK_GOUT_DISP0_OSCCLK_DP_I_CLK_24M + 1)
>> +#define DISP1_NR_CLK	(CLK_GOUT_DISP1_SCLK_PROMISE_DISP1 + 1)
>> +#define FSYS0_NR_CLK	(CLK_GOUT_FSYS0_SCLK_USBHOST20_REF_CLK + 1)
>> +#define FSYS1_NR_CLK	(CLK_GOUT_FSYS1_SCLK_PROMISE_FSYS1 + 1)
>> +#define G3D_NR_CLK	(CLK_GOUT_G3D_SCLK_ASYNCAXI_G3D + 1)
>> +#define MIF0_NR_CLK	(CLK_GOUT_MIF0_RCLK_DREX + 1)
>> +#define MIF1_NR_CLK	(CLK_GOUT_MIF1_RCLK_DREX + 1)
>> +#define MIF2_NR_CLK	(CLK_GOUT_MIF2_RCLK_DREX + 1)
>> +#define MIF3_NR_CLK	(CLK_GOUT_MIF3_RCLK_DREX + 1)
>> +#define MNGS_NR_CLK	(CLK_GOUT_MNGS_SCLK_PROMISE0_MNGS + 1)
>> +#define PERIC0_NR_CLK	(CLK_GOUT_PERIC0_SCLK_PWM + 1)
>> +#define PERIC1_NR_CLK	(CLK_GOUT_PERIC1_SCLK_UART5 + 1)
>> +
>> +/*
>> + * As exynos8890 first introduced hwacg, cmu registers are mapped similarly
>> + * to exynos7, with the exception of the new q-state and q-ch registers that
>> + * can set the behavior of automatic gates.
>> + */
>> +
>> +/* decoded magic number from downstream */
>> +#define QCH_EN_MASK		BIT(0)
>> +#define QCH_MASK		(GENMASK(19, 16) | BIT(12))
>> +#define QCH_DIS			(QCH_MASK | FIELD_PREP(QCH_EN_MASK, 0))
> Nit: align code.

Aligned in my editor, patch files offset each line with a single symbol
so formatting gets broken...

>
>> +
>> +/* q-channel registers offsets range */
>> +#define QCH_OFF_START		0x2000
>> +#define QCH_OFF_END		0x23ff
>> +
>> +/* q-state registers offsets range */
>> +#define QSTATE_OFF_START	0x2400
>> +#define QSTATE_OFF_END		0x2fff
> Nit: Align.

What?

>
>> +
>> +/* check if the register offset is a QCH register */
>> +static bool is_qch_reg(unsigned long off)
>> +{
>> +	return off >= QCH_OFF_START && off <= QCH_OFF_END;
>> +}
>> +
>> +/* check if the register offset is a QSTATE register */
>> +static bool is_qstate_reg(unsigned long off)
>> +{
>> +	return off >= QSTATE_OFF_START && off <= QSTATE_OFF_END;
>> +}
>> +
>> +static void __init exynos8890_init_clocks(struct device_node *np,
>> +					  const struct samsung_cmu_info *cmu)
>> +{
>> +	const unsigned long *reg_offs = cmu->clk_regs;
>> +	size_t reg_offs_len = cmu->nr_clk_regs;
>> +	void __iomem *reg_base;
>> +	size_t i;
>> +
>> +	reg_base = of_iomap(np, 0);
>> +	if (!reg_base)
>> +		panic("%s: failed to map registers\n", __func__);
>> +
>> +	for (i = 0; i < reg_offs_len; ++i) {
>> +		void __iomem *reg = reg_base + reg_offs[i];
>> +		u32 val;
>> +
>> +		if (is_qch_reg(reg_offs[i])) {
>> +			val = QCH_DIS;
>> +			writel(val, reg);
>> +		} else if (is_qstate_reg(reg_offs[i])) {
>> +			val = 0;
>> +			writel(val, reg);
>> +		}
> This seems to disable qchannel and set qstate to 0 for disable HWACG.
> If this is true, a comment is preferred.

I believe the "DIS" part is pretty self explanatory, no?

>
>> +	}
>> +
>> +	iounmap(reg_base);
>> +}
>> +
>> +/* ---- CMU_TOP ------------------------------------------------------------- */
>> +
>> +#define MIF_CLK_CTRL1						0x1084
>> +#define MIF_CLK_CTRL2						0x1088
>> +#define MIF_CLK_CTRL3						0x108C
>> +#define MIF_CLK_CTRL4						0x1090
>> +#define ACD_PSCDC_CTRL_0					0x1094
>> +#define ACD_PSCDC_CTRL_1					0x1098
>> +#define ACD_PSCDC_STAT						0x109C
>> +#define CMU_TOP_SPARE0						0x1100
>> +#define CMU_TOP_SPARE1						0x1104
>> +#define CMU_TOP_SPARE2						0x1108
>> +#define CMU_TOP_SPARE3						0x110C
> Some of the registers not aligned.

How are they not, they're aligned both in editors and the patch. Please elaborate.

>
>> +
> [...]
>> +static void __init exynos8890_cmu_top_init(struct device_node *np)
>> +{
>> +	exynos8890_init_clocks(np, &top_cmu_info);
>> +	samsung_cmu_register_one(np, &top_cmu_info);
>> +}
>> +
>> +/* Register CMU_TOP early, as it's a dependency for other early domains */
>> +CLK_OF_DECLARE(exynos8890_cmu_top, "samsung,exynos8890-cmu-top",
>> +	       exynos8890_cmu_top_init);
> Not sure you need to run Android GKI, without module built, this platform
> will not able to support GKI.
>
> It would be better to update to use platform drivers.

Same as what Krzysztof said, design choice accross all samsung clock drivers.

>
>> +
>> +/* ---- CMU_PERIS ---------------------------------------------------------- */
>> +
>> +#define QSTATE_CTRL_TMU				0x2474
>> +#define QSTATE_CTRL_CHIPID			0x2484
>> +#define QSTATE_CTRL_PROMISE_PERIS		0x2488
> Not aligned.
>
>> +
>> +
>> +/* Register CMU_PERIS early, as it's needed for MCT timer */
>> +CLK_OF_DECLARE(exynos8890_cmu_peris, "samsung,exynos8890-cmu-peris",
>> +	       exynos8890_cmu_peris_init);
> Same as above.
>
>> +
>> +/* ---- CMU_APOLLO --------------------------------------------------------- */
>> +
>> +/* Register Offset definitions for CMU_APOLLO (0x11900000) */
>> +#define APOLLO_PLL_LOCK				0x0000
>> +#define APOLLO_PLL_CON0				0x0100
>> +#define APOLLO_PLL_CON1				0x0104
>> +#define APOLLO_PLL_FREQ_DET			0x010C
> Not align.

Same as the other comments about alignment.

Best regards,
Ivaylo

>
> Regards
> Peng
>

