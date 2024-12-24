Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D29454;
	Tue, 24 Dec 2024 14:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735052328; cv=none; b=GWt9ORD+IiGV3CDmt8IfAjc4xHwBgXBBr8TFw3vSiE6gUUhZrQsbMKHu9KlY2PBlvZshpXFvQ1hKbNqBpuI7fwhuerkPV7toV5/Xk5d+Zn8iSI+fPjx2CsJNEaMLtseZee0qre++oZT4CIU/MtSKc/D69TTkUeeoB/DvjJ/fh3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735052328; c=relaxed/simple;
	bh=IL8k5TnaFEm1Bm/5Y4+qSWs1V1KDfhx/ENWCcVabqBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfD4BX6nXvGYAUVD5wgwu9MyXVLHPr050C1hToxVBDWvUoM4Usf3TrIKw5yErYGk1UkhVVdfYcLnsMl7KSHO6TAlpNvei1RCVP0wPuJGArAn6G40uPdUB8vCGbgYB1zCV/SugGZkSDhMwPJAdpsuIQX1za0z4j3F998bqp5fRcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwmHiJC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwmHiJC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07BCC4CED0;
	Tue, 24 Dec 2024 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735052327;
	bh=IL8k5TnaFEm1Bm/5Y4+qSWs1V1KDfhx/ENWCcVabqBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwmHiJC5Y3Jv4k8pCQqvEe83/FTadUZvmjP8hFUslZygCaiy0bSkWWJV6X1koXLgs
	 RK4zjdtukqWfZsZD/4oa9XkAhCsdhbYLEB4SjDdnZANz3UWZGIwov0CCulMylGQ6dw
	 niQ3X6s1RcyLR0smldvVeRUOBe+FTEO2h3zA5rfaWgjHz8mkNZL7rzxckx2qmGd/Bx
	 6ub3bwvutK4yZZag+BqWX0EcUyW9Vff+vuGx01ZjFJMpT3Tg6wSALmK0BoXc1RPzvo
	 PoNUIZutsoWKELuSeSGjIUPHzFdbu6ZanOOkx7TQHhCODwW0LFFKV7Wvl5AZAXPRiA
	 sfdZTQ6avv0Yw==
Date: Tue, 24 Dec 2024 20:28:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sowon Na <sowon.na@samsung.com>
Cc: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] phy: samsung-ufs: support ExynosAutov920 ufs phy
 driver
Message-ID: <Z2rMI0RWvV5FAN+q@vaman>
References: <20241118021009.2858849-1-sowon.na@samsung.com>
 <CGME20241118021011epcas2p4b71dadce42a321213bdf8d445a312a8f@epcas2p4.samsung.com>
 <20241118021009.2858849-3-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118021009.2858849-3-sowon.na@samsung.com>

On 18-11-24, 11:10, Sowon Na wrote:
> Add support for ExynosAutov920 ufs phy driver.
> 
> Signed-off-by: Sowon Na <sowon.na@samsung.com>
> ---
>  drivers/phy/samsung/Makefile                 |   1 +
>  drivers/phy/samsung/phy-exynosautov920-ufs.c | 167 +++++++++++++++++++
>  drivers/phy/samsung/phy-samsung-ufs.c        |   9 +-
>  drivers/phy/samsung/phy-samsung-ufs.h        |   4 +
>  4 files changed, 178 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c
> 
> diff --git a/drivers/phy/samsung/Makefile b/drivers/phy/samsung/Makefile
> index fea1f96d0e43..342682638a87 100644
> --- a/drivers/phy/samsung/Makefile
> +++ b/drivers/phy/samsung/Makefile
> @@ -7,6 +7,7 @@ phy-exynos-ufs-y			+= phy-gs101-ufs.o
>  phy-exynos-ufs-y			+= phy-samsung-ufs.o
>  phy-exynos-ufs-y			+= phy-exynos7-ufs.o
>  phy-exynos-ufs-y			+= phy-exynosautov9-ufs.o
> +phy-exynos-ufs-y			+= phy-exynosautov920-ufs.o
>  phy-exynos-ufs-y			+= phy-fsd-ufs.o
>  obj-$(CONFIG_PHY_SAMSUNG_USB2)		+= phy-exynos-usb2.o
>  phy-exynos-usb2-y			+= phy-samsung-usb2.o
> diff --git a/drivers/phy/samsung/phy-exynosautov920-ufs.c b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> new file mode 100644
> index 000000000000..8a7ba159bbfe
> --- /dev/null
> +++ b/drivers/phy/samsung/phy-exynosautov920-ufs.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * UFS PHY driver data for Samsung ExynosAuto v920 SoC
> + *
> + * Copyright (C) 2024 Samsung Electronics Co., Ltd.
> + */
> +
> +#include "phy-samsung-ufs.h"
> +
> +#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL			0x708
> +#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK		0x1
> +#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN		BIT(0)
> +#define EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS	0x5e
> +
> +#define EXYNOSAUTOV920_CDR_LOCK_OFFSET				0xCE4

Lower case please, here and everywhere else

> +
> +#define PHY_EXYNOSAUTOV920_LANE_OFFSET				0x200
> +#define PHY_TRSV_REG_CFG_AUTOV920(o, v, d) \
> +	PHY_TRSV_REG_CFG_OFFSET(o, v, d, PHY_EXYNOSAUTOV920_LANE_OFFSET)
> +
> +/* Calibration for phy initialization */
> +static const struct samsung_ufs_phy_cfg exynosautov920_pre_init_cfg[] = {
> +	PHY_COMN_REG_CFG(0x29, 0x22, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x43, 0x10, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x3C, 0x14, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x46, 0x48, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x04, 0x95, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x06, 0x30, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x200, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x201, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x202, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x203, 0x0A, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x204, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x205, 0x10, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x207, 0x0C, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2E1, 0xC0, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x22D, 0xF8, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x234, 0x60, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x238, 0x13, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x239, 0x48, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23A, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23B, 0x29, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23C, 0x2A, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23D, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23E, 0x14, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x23F, 0x13, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x240, 0x4A, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x243, 0x40, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x244, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x25D, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x25E, 0x3F, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x25F, 0xFF, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x26F, 0xF0, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x273, 0x33, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x274, 0x50, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x284, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x285, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2A2, 0x04, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x27D, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2FA, 0x01, PWR_MODE_ANY),
> +
> +	PHY_TRSV_REG_CFG_AUTOV920(0x286, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x287, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x288, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x289, 0x03, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B3, 0x04, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B6, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B7, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B8, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2B9, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BA, 0x0B, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BB, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BC, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BD, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x2BE, 0x06, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34B, 0x01, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34C, 0x24, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34D, 0x23, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34E, 0x45, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x34F, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x350, 0x31, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x351, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x352, 0x02, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x353, 0x00, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x354, 0x01, PWR_MODE_ANY),
> +
> +	PHY_COMN_REG_CFG(0x43, 0x18, PWR_MODE_ANY),
> +	PHY_COMN_REG_CFG(0x43, 0x00, PWR_MODE_ANY),
> +
> +	END_UFS_PHY_CFG,
> +};
> +
> +/* Calibration for HS mode series A/B */
> +static const struct samsung_ufs_phy_cfg exynosautov920_pre_pwr_hs_cfg[] = {
> +	PHY_TRSV_REG_CFG_AUTOV920(0x369, 0x11, PWR_MODE_ANY),
> +	PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x03, PWR_MODE_ANY),
> +
> +	END_UFS_PHY_CFG,
> +};
> +
> +static const struct samsung_ufs_phy_cfg exynosautov920_post_pwr_hs_cfg[] = {
> +	END_UFS_PHY_CFG,
> +};
> +
> +#define DELAY_IN_US	40
> +#define RETRY_CNT	100
> +#define EXYNOSAUTOV920_CDR_LOCK_MASK	0x8

empty line here please

> +int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane)
> +{
> +	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
> +	u32 reg, i;
> +
> +	struct samsung_ufs_phy_cfg cfg[4] = {
> +		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x10, PWR_MODE_ANY),
> +		PHY_TRSV_REG_CFG_AUTOV920(0x222, 0x18, PWR_MODE_ANY),
> +		PHY_TRSV_REG_CFG_AUTOV920(0x246, 0x01, PWR_MODE_ANY),
> +		END_UFS_PHY_CFG,
> +	};
> +
> +	for (i = 0; i < RETRY_CNT; i++) {
> +		udelay(DELAY_IN_US);
> +
> +		reg = readl(ufs_phy->reg_pma + EXYNOSAUTOV920_CDR_LOCK_OFFSET +
> +			(PHY_APB_ADDR(PHY_EXYNOSAUTOV920_LANE_OFFSET) * lane));
> +
> +		if ((reg & EXYNOSAUTOV920_CDR_LOCK_MASK)
> +					== EXYNOSAUTOV920_CDR_LOCK_MASK) {
> +			samsung_ufs_phy_config(ufs_phy, &cfg[2], lane);
> +			return 0;
> +		}
> +
> +		udelay(DELAY_IN_US);
> +
> +		/* Disable and enable CDR */
> +		samsung_ufs_phy_config(ufs_phy, &cfg[0], lane);
> +		samsung_ufs_phy_config(ufs_phy, &cfg[1], lane);
> +	}
> +
> +	dev_err(ufs_phy->dev, "failed to get phy cdr lock\n");
> +	return -ETIMEDOUT;
> +}
> +
> +static const struct samsung_ufs_phy_cfg *exynosautov920_ufs_phy_cfgs[CFG_TAG_MAX] = {
> +	[CFG_PRE_INIT]          = exynosautov920_pre_init_cfg,
> +	[CFG_PRE_PWR_HS]        = exynosautov920_pre_pwr_hs_cfg,
> +	[CFG_POST_PWR_HS]       = exynosautov920_post_pwr_hs_cfg,
> +};
> +
> +static const char * const exynosautov920_ufs_phy_clks[] = {
> +	"ref_clk",
> +};
> +
> +const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy = {
> +	.cfgs = exynosautov920_ufs_phy_cfgs,
> +	.isol = {
> +		.offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL,
> +		.mask = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_MASK,
> +		.en = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CTRL_EN,
> +	},
> +	.clk_list = exynosautov920_ufs_phy_clks,
> +	.num_clks = ARRAY_SIZE(exynosautov920_ufs_phy_clks),
> +	.cdr_lock_status_offset = EXYNOSAUTOV920_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
> +	.wait_for_cdr = exynosautov920_ufs_phy_wait_cdr_lock,
> +};
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
> index 6c5d41552649..c13fe149bc75 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -28,9 +28,9 @@
>  
>  #define PHY_DEF_LANE_CNT	1
>  
> -static void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> -				   const struct samsung_ufs_phy_cfg *cfg,
> -				   u8 lane)
> +void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> +			    const struct samsung_ufs_phy_cfg *cfg,
> +			    u8 lane)
>  {
>  	enum {LANE_0, LANE_1}; /* lane index */
>  
> @@ -323,6 +323,9 @@ static const struct of_device_id samsung_ufs_phy_match[] = {
>  	}, {
>  		.compatible = "samsung,exynosautov9-ufs-phy",
>  		.data = &exynosautov9_ufs_phy,
> +	}, {
> +		.compatible = "samsung,exynosautov920-ufs-phy",
> +		.data = &exynosautov920_ufs_phy,
>  	}, {
>  		.compatible = "tesla,fsd-ufs-phy",
>  		.data = &fsd_ufs_phy,
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
> index 9b7deef6e10f..a28f148081d1 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.h
> +++ b/drivers/phy/samsung/phy-samsung-ufs.h
> @@ -143,9 +143,13 @@ static inline void samsung_ufs_phy_ctrl_isol(
>  }
>  
>  int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
> +int exynosautov920_ufs_phy_wait_cdr_lock(struct phy *phy, u8 lane);
> +void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
> +			    const struct samsung_ufs_phy_cfg *cfg, u8 lane);
>  
>  extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;
>  extern const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
> +extern const struct samsung_ufs_phy_drvdata exynosautov920_ufs_phy;
>  extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;
>  extern const struct samsung_ufs_phy_drvdata tensor_gs101_ufs_phy;
>  
> -- 
> 2.45.2

-- 
~Vinod
