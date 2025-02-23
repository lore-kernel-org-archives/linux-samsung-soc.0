Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59387202C42;
	Sun, 23 Feb 2025 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740307259; cv=none; b=JjEVX4QU6XdTQw+LiIR62vIF1N3BNQ12WieG4ZLJb8yxNqqtrF+s73MZMPSckW1G5zQ/u/HYPF3vscseK9E2IVmTeFvV27ZcTDhsIG++J83e4LPe2vZqyhTAMz94WPqIfEULMPai6S6wgyxzIlMqubZ0IgxBVTdz5PUCl1Keu80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740307259; c=relaxed/simple;
	bh=xR26z0VY8X9WgeQowbGinKbN7pXHIyHRi2UxxvhtgEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyPMJAIZafyndLqlwVP6aBXOgey3AQf2uUyxR0Gbd/A8nk6j+JGwOVtpY2VT1M9uX9OxzeocxG+2IHpb+8QzOLtSHk1zCSm1UUNFkAou5jHi3G7LiZyp6GhI/9lpUVdmTxEX5WA7Y59OV85AGy/QxSPdXLp2qUYJ4qsSWOPdQZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWBVi0kE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWBVi0kE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F053C4CEDD;
	Sun, 23 Feb 2025 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740307258;
	bh=xR26z0VY8X9WgeQowbGinKbN7pXHIyHRi2UxxvhtgEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWBVi0kEyLP04wfkVcDbPV59wAvnjYvFHbZ1h7MyqxneJ9ISrmxum+DnX2yIfFxFR
	 FKiBvTOS+6L6N3WTK0ryJyt9gGMe5xBOTBtFZBZ6keKGmXm6Bg+01/2KFqu8RhbRuC
	 9VvApkXpk9yYxdwI/hrqepfpfO1KJe4ZLd03Ew/TN3I0kIl3FAe1JMILzDX07Mqrjt
	 Wpu4k74mk4LnO+cXT6T7DgplQyGJ785ZhDUaAVgLn21qraN8ufAhmx5TzIXamhNGkz
	 rBcMM1NPL2a2sclVIbodvJ0p0OvbWkmxfHkOSE9pyjaCB9F9IhwWPfmQO4WqUSVllG
	 YdAMK+K+LDuiQ==
Date: Sun, 23 Feb 2025 11:40:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mfd: sec: add support for S2MPU05 PMIC
Message-ID: <20250223-outrageous-bizarre-hedgehog-8a3bbd@krzk-bin>
References: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
 <20250219-exynos7870-pmic-regulators-v2-2-1ea86fb332f7@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219-exynos7870-pmic-regulators-v2-2-1ea86fb332f7@disroot.org>

On Wed, Feb 19, 2025 at 12:19:50AM +0530, Kaustabh Chakraborty wrote:
> Add support for Samsung's S2MPU05 PMIC. It's the primary PMIC used by
> Exynos7870 devices. It houses regulators (21 LDOs and 5 BUCKs) and a RTC
> clock device.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/mfd/sec-core.c              |  12 +++
>  drivers/mfd/sec-irq.c               |  34 +++++++
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/irq.h     |  44 +++++++++
>  include/linux/mfd/samsung/s2mpu05.h | 183 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 274 insertions(+)
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

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Missing bindings.

BTW, don't combine independent patches from different subsystems into
one patchset. It's not helping anyone especially without explaining
dependencies/merging in the cover letter or here in changelog.

Best regards,
Krzysztof

