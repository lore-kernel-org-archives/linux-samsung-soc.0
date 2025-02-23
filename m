Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62E202C42;
	Sun, 23 Feb 2025 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740307341; cv=none; b=bi707IaNYeAXU4Ey3MIuptCMqIzZMvG4Vv8ARtnUGxckQIvYTY22LZWXNmq6PtbyKDnq6VDlFeYkXDsikt38nyFqYwkPBe52hrK4DWEkOicUVd0AnAVayNkwlz7dwOaWpqVp/M4wv7rl4vfzz4+BwitIdMSOlwO4VOr7mqFomao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740307341; c=relaxed/simple;
	bh=VlCxJ/onimuCBN9n8QE/wVi/ddEg/1pU7IYdiwf282M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUQ8VenVV87IXtaCh9oP13Nv1WSO/odujpJoWpvkl0iNzTpeVr7YaiEvUVGV7fE8KmmYewbNBvRR8CpptUPqYjqojOR5IgScW0+wtwMa03/Alf0kwZchBad0zfb83Que/f5nM5QJGMqvsfLZDKFU7XEzqpRcg0jSj+oArO9lXmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzox7Koa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzox7Koa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781D1C4CEDD;
	Sun, 23 Feb 2025 10:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740307340;
	bh=VlCxJ/onimuCBN9n8QE/wVi/ddEg/1pU7IYdiwf282M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzox7Koao1pqyHlwm/SadZ11IoHUcv5Xiar2Z5/mb3vMAYC0QhKaEBvVybTWEVYP1
	 ebpL/iru7vAOYXKl5DgUuTKi4/E4EZWCQV1GO+1yNNUpz4hC6pRtSnZzy6Nw4k2fhC
	 0+wJ8sEHTrunqHNzlo8VPjmrqk9TCm97RDKaAPAoOnMoh2QsaI3JRk0r1bvZops4eE
	 vJ3uwOqWMcabbEZmr4TPwwdHkZIaZnlevdJ4iWTeKIfMUPXfmFejnrUHfUkM0F3ZMs
	 lqMFAXdbES1DiQL+EuxHmgANUMSetvSFHhng/doSi+duKKEQMtLz8hDC1L3Z44DZE3
	 jNCn23ps+yCZQ==
Date: Sun, 23 Feb 2025 11:42:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] regulator: s2mps11: Add support for S2MPU05
 regulators
Message-ID: <20250223-small-corgi-of-whirlwind-3e8db6@krzk-bin>
References: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
 <20250219-exynos7870-pmic-regulators-v2-3-1ea86fb332f7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmic-regulators-v2-3-1ea86fb332f7@disroot.org>

On Wed, Feb 19, 2025 at 12:19:51AM +0530, Kaustabh Chakraborty wrote:
> S2MPU05 is a PMIC by manufactured by Samsung, particularly used in
> Exynos7870 based devices. Add driver support for controlling its 21 LDO
> and 5 BUCK regulators.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/regulator/Kconfig   |  4 +-
>  drivers/regulator/s2mps11.c | 92 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 93 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 39297f7d8177193e51c99bc2b360c6d9936e62fe..e47ef257696e2ff3745affa1a403a29f086a2833 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -1330,10 +1330,10 @@ config REGULATOR_S2MPA01
>  	 via I2C bus. S2MPA01 has 10 Bucks and 26 LDO outputs.
>  
>  config REGULATOR_S2MPS11
> -	tristate "Samsung S2MPS11/13/14/15/S2MPU02 voltage regulator"
> +	tristate "Samsung S2MPS11/13/14/15/S2MPU02/05 voltage regulator"
>  	depends on MFD_SEC_CORE || COMPILE_TEST
>  	help
> -	 This driver supports a Samsung S2MPS11/13/14/15/S2MPU02 voltage
> +	 This driver supports a Samsung S2MPS11/13/14/15/S2MPU02/05 voltage
>  	 output regulator via I2C bus. The chip is comprised of high efficient
>  	 Buck converters including Dual-Phase Buck converter, Buck-Boost
>  	 converter, various LDOs.
> diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
> index 7dcf92af8f15e63fb634d978fba41df0ca09fd65..b54f9bba21a9c9af7d72449529e74e1445f7d455 100644
> --- a/drivers/regulator/s2mps11.c
> +++ b/drivers/regulator/s2mps11.c
> @@ -21,6 +21,7 @@
>  #include <linux/mfd/samsung/s2mps14.h>
>  #include <linux/mfd/samsung/s2mps15.h>
>  #include <linux/mfd/samsung/s2mpu02.h>
> +#include <linux/mfd/samsung/s2mpu05.h>
>  
>  /* The highest number of possible regulators for supported devices. */
>  #define S2MPS_REGULATOR_MAX		S2MPS13_REGULATOR_MAX
> @@ -254,6 +255,9 @@ static int s2mps11_regulator_enable(struct regulator_dev *rdev)
>  		else
>  			val = rdev->desc->enable_mask;
>  		break;
> +	case S2MPU05:
> +		val = rdev->desc->enable_mask;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1118,6 +1122,86 @@ static const struct regulator_desc s2mpu02_regulators[] = {
>  	regulator_desc_s2mpu02_buck7(7),
>  };
>  
> +#define regulator_desc_s2mpu05_ldo_reg(num, min, step, reg) {	\
> +	.name		= "LDO"#num,				\

lowercase

> +	.id		= S2MPU05_LDO##num,			\
> +	.ops		= &s2mpu02_ldo_ops,			\
> +	.type		= REGULATOR_VOLTAGE,			\
> +	.owner		= THIS_MODULE,				\
> +	.min_uV		= min,					\
> +	.uV_step	= step,					\
> +	.n_voltages	= S2MPU05_LDO_N_VOLTAGES,		\
> +	.vsel_reg	= reg,					\
> +	.vsel_mask	= S2MPU05_LDO_VSEL_MASK,		\
> +	.enable_reg	= reg,					\
> +	.enable_mask	= S2MPU05_ENABLE_MASK,			\
> +	.enable_time	= S2MPU05_ENABLE_TIME_LDO		\
> +}
> +
> +#define regulator_desc_s2mpu05_ldo(num, reg, min, step) \
> +	regulator_desc_s2mpu05_ldo_reg(num, min, step, S2MPU05_REG_L##num##reg)
> +
> +#define regulator_desc_s2mpu05_ldo1(num, reg) \
> +	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN1, S2MPU05_LDO_STEP1)
> +
> +#define regulator_desc_s2mpu05_ldo2(num, reg) \
> +	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN1, S2MPU05_LDO_STEP2)
> +
> +#define regulator_desc_s2mpu05_ldo3(num, reg) \
> +	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN2, S2MPU05_LDO_STEP2)
> +
> +#define regulator_desc_s2mpu05_ldo4(num, reg) \
> +	regulator_desc_s2mpu05_ldo(num, reg, S2MPU05_LDO_MIN3, S2MPU05_LDO_STEP2)
> +
> +#define regulator_desc_s2mpu05_buck(num, which) {	\
> +	.name		= "BUCK"#num,			\

Same here.

Best regards,
Krzysztof

