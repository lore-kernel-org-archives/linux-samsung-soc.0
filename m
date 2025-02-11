Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236D12309AF;
	Tue, 11 Feb 2025 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281644; cv=none; b=Hh+oTMeGRR4YGEbL/psMAzvj5ae3hvUaTrmSuC/Yze58swvq4cBvfY01fXVk8OiGI+RViK+/wm36qN2JKayFEbw9oc6Mluow+QALrIWyhUnsVxlL+lGb9XQY/ISv9kL8MXVCjpr8lt2+huVCYwd1h16yN71s7vtGNcECOFXDDtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281644; c=relaxed/simple;
	bh=jXmLqj0DxlD/iMefHrX+sErtbRk5BzuKl+If9B+aing=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ky4ySyrFPKOP08Xl+eEdBBoMom1ku/Q9gRJgPDuskH7IkpVfnYQ6Oi2e0XBS7T4LjSbr3JJFOw5VIDNM6BcxFVglk4152IcBFev1hL5wjS9hRoEOoSmUIUBGrHkr8wRA6mtTspCROx8oosL0+YH95oE89QCkECkNDmyz5nEGoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cN5aU4iQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cN5aU4iQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1959C4CEDD;
	Tue, 11 Feb 2025 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739281643;
	bh=jXmLqj0DxlD/iMefHrX+sErtbRk5BzuKl+If9B+aing=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cN5aU4iQUGMj2aUlfan0MlZ4uY04GF5imbJi2Tsdg0cms9iVDKZxOgdZTshey8YKt
	 hZZt0qqj+8E8gtlhowfAJw8PM+kw8MtRyxca0ZOURhkI9SB2MHQZ89M/d9DZmpMKFb
	 c1eq0Ke2dOGp2xWBS+9LVrLtkbnX82xF4v3SmMMV+5kZGiJNQTkVbNyV2w6vhWk3/m
	 z63IxzTPpRuewxbWlSacp+h0EFuKKt9WCrMQ62lsj4yQeVBRxEbzs0wHgNwQaK2W8C
	 O+ILzVUoFLg4fdneWfrN2EIVGYjtMuWPEVzBon8e9iwP5lD3nxKuPHWPvTurZFVgWP
	 8pCTHJdk3QvVg==
Date: Tue, 11 Feb 2025 13:47:19 +0000
From: Lee Jones <lee@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] mfd: sec: add support for S2MPU05 PMIC
Message-ID: <20250211134719.GS1868108@google.com>
References: <20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org>
 <20250204-exynos7870-pmic-regulators-v1-3-05adad38102c@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204-exynos7870-pmic-regulators-v1-3-05adad38102c@disroot.org>

On Tue, 04 Feb 2025, Kaustabh Chakraborty wrote:

> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Add support for Samsung's S2MPU05 PMIC. It's the primary PMIC used by
> Exynos7870 devices. It houses regulators (21 LDOs and 5 BUCKs) and a RTC
> clock device.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/mfd/sec-core.c              |  12 +++
>  drivers/mfd/sec-irq.c               |  85 ++++++++++++++++++++
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/irq.h     |  44 +++++++++++
>  include/linux/mfd/samsung/s2mpu05.h | 152 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 294 insertions(+)
> 
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index cdfe738e1d76e63145e5888da1cecc122fbc3737..3e9b65c988a7f08bf16d3703004a3d60cfcb1c75 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -83,6 +83,11 @@ static const struct mfd_cell s2mpu02_devs[] = {
>  	{ .name = "s2mpu02-regulator", },
>  };
>  
> +static const struct mfd_cell s2mpu05_devs[] = {
> +	{ .name = "s2mpu05-regulator", },
> +	{ .name = "s2mps15-rtc", },
> +};
> +
>  static const struct of_device_id sec_dt_match[] = {
>  	{
>  		.compatible = "samsung,s5m8767-pmic",
> @@ -108,6 +113,9 @@ static const struct of_device_id sec_dt_match[] = {
>  	}, {
>  		.compatible = "samsung,s2mpu02-pmic",
>  		.data = (void *)S2MPU02,
> +	}, {
> +		.compatible = "samsung,s2mpu05-pmic",
> +		.data = (void *)S2MPU05,
>  	}, {
>  		/* Sentinel */
>  	},
> @@ -374,6 +382,10 @@ static int sec_pmic_probe(struct i2c_client *i2c)
>  		sec_devs = s2mpu02_devs;
>  		num_sec_devs = ARRAY_SIZE(s2mpu02_devs);
>  		break;
> +	case S2MPU05:
> +		sec_devs = s2mpu05_devs;
> +		num_sec_devs = ARRAY_SIZE(s2mpu05_devs);
> +		break;
>  	default:
>  		dev_err(&i2c->dev, "Unsupported device type (%lu)\n",
>  			sec_pmic->device_type);
> diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
> index e191aeb0c07c58a3bc4850d94af39dfe085a33e5..9ba8268fef01366d6b6dc88113e6d9b1e1701c39 100644
> --- a/drivers/mfd/sec-irq.c
> +++ b/drivers/mfd/sec-irq.c
> @@ -14,6 +14,7 @@
>  #include <linux/mfd/samsung/s2mps11.h>
>  #include <linux/mfd/samsung/s2mps14.h>
>  #include <linux/mfd/samsung/s2mpu02.h>
> +#include <linux/mfd/samsung/s2mpu05.h>
>  #include <linux/mfd/samsung/s5m8767.h>
>  
>  static const struct regmap_irq s2mps11_irqs[] = {
> @@ -225,6 +226,77 @@ static const struct regmap_irq s2mpu02_irqs[] = {
>  	},
>  };
>  
> +static const struct regmap_irq s2mpu05_irqs[] = {
> +	[S2MPU05_IRQ_PWRONF] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_PWRONF_MASK,
> +	},

Please make use of REGMAP_IRQ_REG().

> +	[S2MPU05_IRQ_PWRONR] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_PWRONR_MASK,
> +	},
> +	[S2MPU05_IRQ_JIGONBF] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_JIGONBF_MASK,
> +	},
> +	[S2MPU05_IRQ_JIGONBR] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_JIGONBR_MASK,
> +	},
> +	[S2MPU05_IRQ_ACOKF] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_ACOKF_MASK,
> +	},
> +	[S2MPU05_IRQ_ACOKR] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_ACOKR_MASK,
> +	},
> +	[S2MPU05_IRQ_PWRON1S] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_PWRON1S_MASK,
> +	},
> +	[S2MPU05_IRQ_MRB] = {
> +		.reg_offset = 0,
> +		.mask = S2MPU05_IRQ_MRB_MASK,
> +	},
> +	[S2MPU05_IRQ_RTC60S] = {
> +		.reg_offset = 1,
> +		.mask = S2MPU05_IRQ_RTC60S_MASK,
> +	},
> +	[S2MPU05_IRQ_RTCA1] = {
> +		.reg_offset = 1,
> +		.mask = S2MPU05_IRQ_RTCA1_MASK,
> +	},
> +	[S2MPU05_IRQ_RTCA0] = {
> +		.reg_offset = 1,
> +		.mask = S2MPU05_IRQ_RTCA0_MASK,
> +	},
> +	[S2MPU05_IRQ_SMPL] = {
> +		.reg_offset = 1,
> +		.mask = S2MPU05_IRQ_SMPL_MASK,
> +	},
> +	[S2MPU05_IRQ_RTC1S] = {
> +		.reg_offset = 1,
> +		.mask = S2MPU05_IRQ_RTC1S_MASK,
> +	},
> +	[S2MPU05_IRQ_WTSR] = {
> +		.reg_offset = 1,
> +		.mask = S2MPU05_IRQ_WTSR_MASK,
> +	},
> +	[S2MPU05_IRQ_INT120C] = {
> +		.reg_offset = 2,
> +		.mask = S2MPU05_IRQ_INT120C_MASK,
> +	},
> +	[S2MPU05_IRQ_INT140C] = {
> +		.reg_offset = 2,
> +		.mask = S2MPU05_IRQ_INT140C_MASK,
> +	},
> +	[S2MPU05_IRQ_TSD] = {
> +		.reg_offset = 2,
> +		.mask = S2MPU05_IRQ_TSD_MASK,
> +	},
> +};
> +
>  static const struct regmap_irq s5m8767_irqs[] = {
>  	[S5M8767_IRQ_PWRR] = {
>  		.reg_offset = 0,
> @@ -339,6 +411,16 @@ static const struct regmap_irq_chip s2mpu02_irq_chip = {
>  	.ack_base = S2MPU02_REG_INT1,
>  };
>  
> +static const struct regmap_irq_chip s2mpu05_irq_chip = {
> +	.name = "s2mpu05",
> +	.irqs = s2mpu05_irqs,
> +	.num_irqs = ARRAY_SIZE(s2mpu05_irqs),
> +	.num_regs = 3,
> +	.status_base = S2MPU05_REG_INT1,
> +	.mask_base = S2MPU05_REG_INT1M,
> +	.ack_base = S2MPU05_REG_INT1,
> +};
> +
>  static const struct regmap_irq_chip s5m8767_irq_chip = {
>  	.name = "s5m8767",
>  	.irqs = s5m8767_irqs,
> @@ -383,6 +465,9 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
>  	case S2MPU02:
>  		sec_irq_chip = &s2mpu02_irq_chip;
>  		break;
> +	case S2MPU05:
> +		sec_irq_chip = &s2mpu05_irq_chip;
> +		break;
>  	default:
>  		dev_err(sec_pmic->dev, "Unknown device type %lu\n",
>  			sec_pmic->device_type);
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
> index 750274d41fc06b0411dbfea6d5efa6092214100d..f35314458fd22e43fa13034439406bea17a155c9 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -44,6 +44,7 @@ enum sec_device_type {
>  	S2MPS14X,
>  	S2MPS15X,
>  	S2MPU02,
> +	S2MPU05,
>  };
>  
>  /**
> diff --git a/include/linux/mfd/samsung/irq.h b/include/linux/mfd/samsung/irq.h
> index 3fd2775eb9bbf86ac227810f49d24ae815bb3fcb..f8559e2198a53d28910e0f431f7b8b7cccec6289 100644
> --- a/include/linux/mfd/samsung/irq.h
> +++ b/include/linux/mfd/samsung/irq.h
> @@ -150,6 +150,50 @@ enum s2mpu02_irq {
>  /* Masks for interrupts are the same as in s2mps11 */
>  #define S2MPS14_IRQ_TSD_MASK		(1 << 2)
>  
> +enum s2mpu05_irq {
> +	S2MPU05_IRQ_PWRONF,
> +	S2MPU05_IRQ_PWRONR,
> +	S2MPU05_IRQ_JIGONBF,
> +	S2MPU05_IRQ_JIGONBR,
> +	S2MPU05_IRQ_ACOKF,
> +	S2MPU05_IRQ_ACOKR,
> +	S2MPU05_IRQ_PWRON1S,
> +	S2MPU05_IRQ_MRB,
> +
> +	S2MPU05_IRQ_RTC60S,
> +	S2MPU05_IRQ_RTCA1,
> +	S2MPU05_IRQ_RTCA0,
> +	S2MPU05_IRQ_SMPL,
> +	S2MPU05_IRQ_RTC1S,
> +	S2MPU05_IRQ_WTSR,
> +
> +	S2MPU05_IRQ_INT120C,
> +	S2MPU05_IRQ_INT140C,
> +	S2MPU05_IRQ_TSD,
> +
> +	S2MPU05_IRQ_NR,
> +};
> +
> +#define S2MPU05_IRQ_PWRONF_MASK		(1 << 0)
> +#define S2MPU05_IRQ_PWRONR_MASK		(1 << 1)
> +#define S2MPU05_IRQ_JIGONBF_MASK	(1 << 2)
> +#define S2MPU05_IRQ_JIGONBR_MASK	(1 << 3)
> +#define S2MPU05_IRQ_ACOKF_MASK		(1 << 4)
> +#define S2MPU05_IRQ_ACOKR_MASK		(1 << 5)
> +#define S2MPU05_IRQ_PWRON1S_MASK	(1 << 6)
> +#define S2MPU05_IRQ_MRB_MASK		(1 << 7)
> +
> +#define S2MPU05_IRQ_RTC60S_MASK		(1 << 0)
> +#define S2MPU05_IRQ_RTCA1_MASK		(1 << 1)
> +#define S2MPU05_IRQ_RTCA0_MASK		(1 << 2)
> +#define S2MPU05_IRQ_SMPL_MASK		(1 << 3)
> +#define S2MPU05_IRQ_RTC1S_MASK		(1 << 4)
> +#define S2MPU05_IRQ_WTSR_MASK		(1 << 5)
> +
> +#define S2MPU05_IRQ_INT120C_MASK	(1 << 0)
> +#define S2MPU05_IRQ_INT140C_MASK	(1 << 1)
> +#define S2MPU05_IRQ_TSD_MASK		(1 << 2)

BIT()?

>  enum s5m8767_irq {
>  	S5M8767_IRQ_PWRR,
>  	S5M8767_IRQ_PWRF,
> diff --git a/include/linux/mfd/samsung/s2mpu05.h b/include/linux/mfd/samsung/s2mpu05.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..fa450e4352a178a6a996bbd723f1fc1fa827c167
> --- /dev/null
> +++ b/include/linux/mfd/samsung/s2mpu05.h
> @@ -0,0 +1,152 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (c) 2015 Samsung Electronics Co., Ltd

No changes have happened in 10 years?

> + *              http://www.samsung.com
> + */
> +
> +#ifndef __LINUX_MFD_S2MPU05_H
> +#define __LINUX_MFD_S2MPU05_H
> +
> +/* S2MPU05 registers */
> +enum S2MPU05_reg {
> +	S2MPU05_REG_ID,
> +	S2MPU05_REG_INT1,
> +	S2MPU05_REG_INT2,
> +	S2MPU05_REG_INT3,
> +	S2MPU05_REG_INT1M,
> +	S2MPU05_REG_INT2M,
> +	S2MPU05_REG_INT3M,
> +	S2MPU05_REG_ST1,
> +	S2MPU05_REG_ST2,
> +	S2MPU05_REG_PWRONSRC,
> +	S2MPU05_REG_OFFSRC,
> +	S2MPU05_REG_BU_CHG,
> +	S2MPU05_REG_RTC_BUF,
> +	S2MPU05_REG_CTRL1,
> +	S2MPU05_REG_CTRL2,
> +	S2MPU05_REG_ETC_TEST,
> +	S2MPU05_REG_OTP_ADRL,
> +	S2MPU05_REG_OTP_ADRH,
> +	S2MPU05_REG_OTP_DATA,
> +	S2MPU05_REG_MON1SEL,
> +	S2MPU05_REG_MON2SEL,
> +	S2MPU05_REG_CTRL3,
> +	S2MPU05_REG_ETC_OTP,
> +	S2MPU05_REG_UVLO,
> +	S2MPU05_REG_TIME_CTRL1,
> +	S2MPU05_REG_TIME_CTRL2,
> +	S2MPU05_REG_B1CTRL1,
> +	S2MPU05_REG_B1CTRL2,
> +	S2MPU05_REG_B2CTRL1,
> +	S2MPU05_REG_B2CTRL2,
> +	S2MPU05_REG_B2CTRL3,
> +	S2MPU05_REG_B2CTRL4,
> +	S2MPU05_REG_B3CTRL1,
> +	S2MPU05_REG_B3CTRL2,
> +	S2MPU05_REG_B3CTRL3,
> +	S2MPU05_REG_B4CTRL1,
> +	S2MPU05_REG_B4CTRL2,
> +	S2MPU05_REG_B5CTRL1,
> +	S2MPU05_REG_B5CTRL2,
> +	S2MPU05_REG_BUCK_RAMP,
> +	S2MPU05_REG_LDO_DVS1,
> +	S2MPU05_REG_LDO_DVS9,
> +	S2MPU05_REG_LDO_DVS10,
> +	S2MPU05_REG_L1CTRL,
> +	S2MPU05_REG_L2CTRL,
> +	S2MPU05_REG_L3CTRL,
> +	S2MPU05_REG_L4CTRL,
> +	S2MPU05_REG_L5CTRL,
> +	S2MPU05_REG_L6CTRL,
> +	S2MPU05_REG_L7CTRL,
> +	S2MPU05_REG_L8CTRL,
> +	S2MPU05_REG_L9CTRL1,
> +	S2MPU05_REG_L9CTRL2,
> +	S2MPU05_REG_L10CTRL, /* LDO11~24 for CP */
> +	S2MPU05_REG_L25CTRL = 0x47,
> +	S2MPU05_REG_L26CTRL,
> +	S2MPU05_REG_L27CTRL,
> +	S2MPU05_REG_L28CTRL,
> +	S2MPU05_REG_L29CTRL,
> +	S2MPU05_REG_L30CTRL,
> +	S2MPU05_REG_L31CTRL,
> +	S2MPU05_REG_L32CTRL,
> +	S2MPU05_REG_L33CTRL,
> +	S2MPU05_REG_L34CTRL,
> +	S2MPU05_REG_L35CTRL,
> +	S2MPU05_REG_LDO_DSCH1,
> +	S2MPU05_REG_LDO_DSCH2,
> +	S2MPU05_REG_LDO_DSCH3,
> +	S2MPU05_REG_LDO_DSCH4,
> +	S2MPU05_REG_LDO_DSCH5,
> +	S2MPU05_REG_LDO_CTRL1,
> +	S2MPU05_REG_LDO_CTRL2,
> +	S2MPU05_REG_TCXO_CTRL,
> +	S2MPU05_REG_SELMIF,
> +};
> +
> +/* S2MPU05 regulator ids */
> +enum S2MPU05_regulators {
> +	S2MPU05_LDO1,
> +	S2MPU05_LDO2,
> +	S2MPU05_LDO3,
> +	S2MPU05_LDO4,
> +	S2MPU05_LDO5,
> +	S2MPU05_LDO6,
> +	S2MPU05_LDO7,
> +	S2MPU05_LDO8,
> +	S2MPU05_LDO9,
> +	S2MPU05_LDO10, /* LDO11~24 for CP */
> +	S2MPU05_LDO25,
> +	S2MPU05_LDO26,
> +	S2MPU05_LDO27,
> +	S2MPU05_LDO28,
> +	S2MPU05_LDO29,
> +	S2MPU05_LDO30,
> +	S2MPU05_LDO31,
> +	S2MPU05_LDO32,
> +	S2MPU05_LDO33,
> +	S2MPU05_LDO34,
> +	S2MPU05_LDO35,
> +	S2MPU05_BUCK1,
> +	S2MPU05_BUCK2,
> +	S2MPU05_BUCK3,
> +	S2MPU05_BUCK4,
> +	S2MPU05_BUCK5,
> +
> +	S2MPU05_REGULATOR_MAX,
> +};
> +
> +#define S2MPU05_SW_ENABLE_MASK	0x03
> +
> +#define S2MPU05_ENABLE_TIME_LDO		128
> +#define S2MPU05_ENABLE_TIME_BUCK1	110
> +#define S2MPU05_ENABLE_TIME_BUCK2	110
> +#define S2MPU05_ENABLE_TIME_BUCK3	110
> +#define S2MPU05_ENABLE_TIME_BUCK4	150
> +#define S2MPU05_ENABLE_TIME_BUCK5	150
> +
> +#define S2MPU05_LDO_MIN1	800000
> +#define S2MPU05_LDO_STEP1	12500
> +#define S2MPU05_LDO_MIN2	1800000
> +#define S2MPU05_LDO_STEP2	25000
> +#define S2MPU05_LDO_MIN3	400000
> +
> +#define S2MPU05_BUCK_MIN1	400000
> +#define S2MPU05_BUCK_STEP1	6250
> +#define S2MPU05_BUCK_MIN2	600000
> +#define S2MPU05_BUCK_STEP2	12500
> +
> +#define S2MPU05_RAMP_DELAY	12000	/* uV/uS */
> +
> +#define S2MPU05_ENABLE_SHIFT	6
> +#define S2MPU05_ENABLE_MASK	(0x03 << S2MPU05_ENABLE_SHIFT)
> +
> +#define S2MPU05_LDO_VSEL_MASK	0x3F
> +#define S2MPU05_BUCK_VSEL_MASK	0xFF
> +#define S2MPU05_LDO_N_VOLTAGES	(S2MPU05_LDO_VSEL_MASK + 1)
> +#define S2MPU05_BUCK_N_VOLTAGES (S2MPU05_BUCK_VSEL_MASK + 1)
> +
> +#define S2MPU05_PMIC_EN_SHIFT	6
> +
> +#endif /*  __LINUX_MFD_S2MPU05_H */
> 
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]
