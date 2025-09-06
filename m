Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D158266EF1;
	Sat,  6 Sep 2025 12:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757161177; cv=none; b=pKao/Sf+3SEI2K/2/b4LHbnRys0p/jTQLmHMasnnxAPr1Tgt5Up9yuJvtcljZ5RxCrq7VCfJVFkSVqY/KqNUMiTVWUrLQTsRdETAQExxJNSvpohxBPGvqVVgvJ5wkOlgpWcRC9nZkNLnFC1P9QrPbBgVftETZAfzsT9jZLZG3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757161177; c=relaxed/simple;
	bh=d66CE2BRrsDc0bqtOkhjXylbJKf0aWTKrq3qcYiY2E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMXBayumPgW71R/V2HNhASNc2o18wpgeD5dbF4vbmOER8+KM4SWw5FJrS9Gt34wXvL/Rr2vRFEP+kSr3SRgZi/Ms7Tkq0Af8L8oCoTgOuqe4Bp6tqGt6d6auUjwD/LJr2VZsURoF2ifj/QXStxRz3C04HhHZyvm+Hc0O+jLL8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g44EHU0e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g44EHU0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35922C4CEE7;
	Sat,  6 Sep 2025 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757161176;
	bh=d66CE2BRrsDc0bqtOkhjXylbJKf0aWTKrq3qcYiY2E4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g44EHU0ehuspt3mnBw9EvdTY81A2GC/jYf7Yvf30uz14xdN9jMbhoueLvworsLcoB
	 jeB/FJOhbGAMWWa98RJi3gjjmYOU8gfLr9OyRNovm+uNTV1CkuZaMDJuUfTWzDyJMI
	 HIFUd63kPWIw+uTrguwVsoCKPIpGLISKP+XRDv0UkVTzcHk7CYLRb7LTG+2LeZqZQv
	 ePOJa/5MREA6yDLWSjodn0Yx7oFVEWwcUWNIrhruqNobBxi4YdBnpTbKphs2Xn6gn8
	 +uN87UloA7oLdfuqdZRenQ1Bhy2yF8HSTss/5DBcU9tfMYR3vkcI4ON9qkkVbYvXmO
	 tPxD6qTdbF7BQ==
Message-ID: <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
Date: Sat, 6 Sep 2025 14:19:30 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
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
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/2025 15:56, Tudor Ambarus wrote:
> +
> +static int acpm_clk_probe(struct platform_device *pdev)
> +{
> +	enum acpm_clk_dev_type type = platform_get_device_id(pdev)->driver_data;
> +	const struct acpm_clk_driver_data *drv_data;
> +	const struct acpm_handle *acpm_handle;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct clk_hw **hws;
> +	struct device *dev = &pdev->dev;
> +	struct acpm_clk *aclks;
> +	unsigned int mbox_chan_id;
> +	int i, err, count;
> +
> +	switch (type) {
> +	case GS101_ACPM_CLK_ID:
> +		drv_data = &acpm_clk_gs101;

Just use acpm_clk_gs101 directly (see also further comment).

> +		break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL, "Invalid device type\n");
> +	}
> +
> +	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
> +	if (IS_ERR(acpm_handle))
> +		return dev_err_probe(dev, PTR_ERR(acpm_handle),
> +				     "Failed to get acpm handle.\n");
> +
> +	count = drv_data->nr_clks;
> +	mbox_chan_id = drv_data->mbox_chan_id;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	clk_data->num = count;
> +	hws = clk_data->hws;
> +
> +	aclks = devm_kcalloc(dev, count, sizeof(*aclks), GFP_KERNEL);
> +	if (!aclks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < count; i++) {
> +		const struct acpm_clk_variant *variant = &drv_data->clks[i];
> +		unsigned int id = variant->id;
> +		struct acpm_clk *aclk;
> +
> +		if (id >= count)

This is not possible. You control the IDs build time, so this must be
either build time check or no check. I vote for no check, because I
don't think the ID is anyhow related to number of clocks. What if (not
recommended but what if) the IDs have a gap and next ID is 1000. I see
your code using ID:


> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid ACPM clock ID.\n");
> +
> +		aclk = &aclks[id];
> +		aclk->id = id;
> +		aclk->handle = acpm_handle;
> +		aclk->mbox_chan_id = mbox_chan_id;
> +
> +		hws[id] = &aclk->hw;

^^^ here, but why do you need it? Why it cannot be hws[i]?

> +
> +		err = acpm_clk_ops_init(dev, aclk, variant->name);
> +		if (err)
> +			return dev_err_probe(dev, err,
> +					     "Failed to register clock.\n");
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   clk_data);
> +}
> +
> +static const struct platform_device_id acpm_clk_id[] = {
> +	{ "gs101-acpm-clk", GS101_ACPM_CLK_ID },

Please drop GS101_ACPM_CLK_ID here and in other places. It's dead code
now. It should be introduced with next users/devices.

> +	{},
> +};
> +MODULE_DEVICE_TABLE(platform, acpm_clk_id);

Best regards,
Krzysztof
