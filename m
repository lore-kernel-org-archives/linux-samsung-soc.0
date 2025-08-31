Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B049F1BC58;
	Sun, 31 Aug 2025 10:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637443; cv=none; b=S14PKXyN47mtWkfvj5xyVKqVk/QdTSIHFr7OiFOEHrP+DyLIw2HeM/xHLBpXC/a72XVrxNqQo0aPQGLbtZbdSG6p9xPCJJd/k7mFh4PwOe9q44VXmOcoHi0kxxwcN7fUD72qHnx9LgkWeZ+yPv2DYaDEKjY1/syoIEnTSlIHxYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637443; c=relaxed/simple;
	bh=8Ux488ZO3JpS0NhQiMHmXYrDdFjO370XPpgnu/QOm9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf2yadhRHoqs2t4I/6cISNoB0Xb6eyowj25Il+uJj7Vr4rWBXHgfsmM6TUBtjEyeMJ5AC6OVPGaoa2fbrR4OH5+uPfcMJdEd3rGe5lD4K9VIoHcolvc2Hs7Xgrp9/Cv2+V8cQ0Gn39TId8KTHlvF67BuWWjHWq+V4Yx5MX/BJQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWobBYBH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWobBYBH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D26CC4CEED;
	Sun, 31 Aug 2025 10:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756637443;
	bh=8Ux488ZO3JpS0NhQiMHmXYrDdFjO370XPpgnu/QOm9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JWobBYBH3Lvd3v6TEhtVVVcGy2ANQyf64v4tYyp9cbgli3DWHrty/3gL4E0U+ItG7
	 m8lLr+tmQ1w9B/wja9XnctVBIEhYXSfiI7+XU/cV299M2Y4Y3dLtbPhpodJJyrIvW0
	 X4rBOiuI9j3McD5sS8iO67mvkXuZcDvWMuDbRI9gAKx//GrgrdT9KphTdQ/CupqEqt
	 tKe/bR3cRpFPi+zwHYP59th+NbTnOq2AmqJA35pM0UzAS3kha+IM2tdsVkvcdV83Rt
	 IMV2cManh22A7uCsHg5S+UN2/ad2dMe9wBGMnsQjFZpchya1uicxia1vALxxusJ5Vw
	 96cPcz3UrAU1g==
Message-ID: <e8346a38-fef7-482f-81ab-20621988b047@kernel.org>
Date: Sun, 31 Aug 2025 12:50:36 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] firmware: exynos-acpm: register ACPM clocks dev
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org>
 <20250827-acpm-clk-v2-4-de5c86b49b64@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250827-acpm-clk-v2-4-de5c86b49b64@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/08/2025 14:42, Tudor Ambarus wrote:
> +
> +static const struct acpm_clk_variant gs101_acpm_clks[] = {
> +	ACPM_CLK(CLK_ACPM_DVFS_MIF, "mif"),
> +	ACPM_CLK(CLK_ACPM_DVFS_INT, "int"),
> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL0, "cpucl0"),
> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL1, "cpucl1"),
> +	ACPM_CLK(CLK_ACPM_DVFS_CPUCL2, "cpucl2"),
> +	ACPM_CLK(CLK_ACPM_DVFS_G3D, "g3d"),
> +	ACPM_CLK(CLK_ACPM_DVFS_G3DL2, "g3dl2"),
> +	ACPM_CLK(CLK_ACPM_DVFS_TPU, "tpu"),
> +	ACPM_CLK(CLK_ACPM_DVFS_INTCAM, "intcam"),
> +	ACPM_CLK(CLK_ACPM_DVFS_TNR, "tnr"),
> +	ACPM_CLK(CLK_ACPM_DVFS_CAM, "cam"),
> +	ACPM_CLK(CLK_ACPM_DVFS_MFC, "mfc"),
> +	ACPM_CLK(CLK_ACPM_DVFS_DISP, "disp"),
> +	ACPM_CLK(CLK_ACPM_DVFS_BO, "b0"),
> +};

I don't understand why clocks are defined in the firmware driver, not in
the clock driver.

This creates dependency of this patch on the clock patch, so basically
there is no way I will take it in one cycle.

> +
>  /**
>   * acpm_get_saved_rx() - get the response if it was already saved.
>   * @achan:	ACPM channel info.
> @@ -606,6 +636,7 @@ static void acpm_setup_ops(struct acpm_info *acpm)
>  
>  static int acpm_probe(struct platform_device *pdev)
>  {
> +	const struct acpm_clk_platform_data *acpm_clk_pdata;
>  	const struct acpm_match_data *match_data;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *shmem;
> @@ -647,7 +678,30 @@ static int acpm_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, acpm);
>  
> -	return devm_of_platform_populate(dev);
> +	acpm_clk_pdata = match_data->acpm_clk_pdata;
> +	acpm->clk_pdev = platform_device_register_data(dev, "acpm-clocks",
> +						       PLATFORM_DEVID_NONE,
> +						       acpm_clk_pdata,
> +						       sizeof(*acpm_clk_pdata));
> +	if (IS_ERR(acpm->clk_pdev))
> +		return dev_err_probe(dev, PTR_ERR(acpm->clk_pdev),
> +				     "Failed to register ACPM clocks device.\n");
> +
> +	ret = devm_of_platform_populate(dev);
> +	if (ret) {
> +		platform_device_unregister(acpm->clk_pdev);

I think this should stick to devm-interfaces everywhere, not mix them,
to have exactly expected cleanup sequence. Now your remove() first
unregisters and then de-populates, which is different order than it was
done in probe(). Use devm-action handler for device unregistering.

Best regards,
Krzysztof
