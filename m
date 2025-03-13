Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D442052;
	Thu, 13 Mar 2025 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741870020; cv=none; b=idv/BUvzp+tsyfS47ezF+QCOtUAN/Nvgk7tEI1H6E1jwjrfoma2d2M/nzVZBulBKXZn5jHR/rZhtLSwkRWrC5tqJclzPEWB72kskGVaHc+eYtym4GQqNDoQ38QsKNy/3MawsBaN3DR7nI76ac3SxxGG1stzg4PDRfdYVjXd9HwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741870020; c=relaxed/simple;
	bh=VqBuO17pl29b/mkdF8heRUrB5SFzPUHE+ouSwBXTJ5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmOPVsDtUvMUAhPu0JfQFSBvvgcgM1ngPRcr/gIRm+YBAZ6NF16NOilDYmBVxi+TvAzks7izDhWxISrz7k/V2PsIJ24wq8OECMug04wvP9DCqnek1oRz8PdRyqRcSyBLMr/WEGQuH5OAiGaWI2w76oURWZfS8Dugm5X0jVkujKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTxxhWK+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTxxhWK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC11C4CEEB;
	Thu, 13 Mar 2025 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741870019;
	bh=VqBuO17pl29b/mkdF8heRUrB5SFzPUHE+ouSwBXTJ5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTxxhWK+8hW2wd5kyTgn1URPiP6HIC9f2US+F+12U4PfbasZMRsEVOB0rVUBlr2Aw
	 fsJXbJkbiOjgWhoqb0/Tsi7mtzmQIXPgSC3uP9v8WWyDFHwFFHQyTWHMI3RRzxoc2m
	 xVSEdt40Tonk82Ofwgk5qVm9Iq2x5kJZnm7JAf7GAdb/FXM+9nKbRUKAW9G7rI2TQn
	 WP1c4u7NyynohapNlxjro4TqEuu/OoFezKz27D7PxSktuU6BMZaXFCzsSCCs/xujnd
	 poc2tlsiHt2wqDv7kD5HXTVqSwrsgMtqUdxP37MUtHtLqu/ZtDBhLjHa3VO0KhUJ/s
	 w8xt0J13olXgw==
Date: Thu, 13 Mar 2025 12:46:55 +0000
From: Lee Jones <lee@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Introduce support for Exynos7870's S2MPU05 PMIC
 and its regulators
Message-ID: <20250313124655.GA3616286@google.com>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>

On Sat, 01 Mar 2025, Kaustabh Chakraborty wrote:

> Exynos7870 devices use Samsung S2MPU05 as its primary PMIC. Add support
> for it in the existing PMIC driver. Additionally, also add support for
> voltage regulators which can be accessed and controlled from the PMIC
> itself.
> 
> Patches from mfd and regulator subsystems have been placed together in
> this series. Here, both patches from both subsystems depend on the other:
> 1. The regulator driver patch includes a header file which describes the
>    PMIC registers. This header is introduced in a PMIC patch.
> 2. The PMIC dt-binding patch references the regulator documentation.
> 
> Note that 1. is a build dependency, but 2. is not.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v3:
> - Lowercase "ldo" and "buck" in regulator dt-bindings and driver patches.
> - Add back missing Reviewed-by: tag in [PATCH v2 2/3].
> - Link to v2: https://lore.kernel.org/r/20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org
> 
> Changes in v2:
> - Drop applied [PATCH 2/4].
> - Added myself as maintainer in s2mpu05-pmic DT docs.
> - Edited LDO description to explain missing LDOs.
> - Added all missing regulator control registers intended for CP.
> - Modify regulator_desc_s2mpu05_ldo* macros to allow choosing register
>   suffixes (CTRL, CTRL1, etc). Subsequently, drop Reviewed-by: tag in
>   [PATCH 4/4].
> - Take over ownership of patches by the co-author, upon their request.
> - Link to v1: https://lore.kernel.org/r/20250204-exynos7870-pmic-regulators-v1-0-05adad38102c@disroot.org
> 
> ---
> Kaustabh Chakraborty (3):
>       regulator: dt-bindings: add documentation for s2mpu05-pmic regulators
>       mfd: sec: add support for S2MPU05 PMIC
>       regulator: s2mps11: Add support for S2MPU05 regulators
> 
>  .../bindings/regulator/samsung,s2mpu05.yaml        |  47 ++++++
>  drivers/mfd/sec-core.c                             |  12 ++
>  drivers/mfd/sec-irq.c                              |  34 ++++
>  drivers/regulator/Kconfig                          |   4 +-
>  drivers/regulator/s2mps11.c                        |  92 ++++++++++-
>  include/linux/mfd/samsung/core.h                   |   1 +
>  include/linux/mfd/samsung/irq.h                    |  44 +++++
>  include/linux/mfd/samsung/s2mpu05.h                | 183 +++++++++++++++++++++
>  8 files changed, 414 insertions(+), 3 deletions(-)
> ---
> base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
> change-id: 20250203-exynos7870-pmic-regulators-26512b79a29b
> 
> Best regards,
> -- 
> Kaustabh Chakraborty <kauschluss@disroot.org>

Applied the set.

I'll send out a pull-request if all goes well with build testing.

Note to self: ib-mfd-regulator-6.15

-- 
Lee Jones [李琼斯]
