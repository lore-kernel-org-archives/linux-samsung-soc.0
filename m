Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072872E03E1;
	Sun, 24 Aug 2025 18:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756058951; cv=none; b=F3bztTwPK6M751jePxdiOOTsUk6Ez/Yyc6eE4UI7XS/uha+68cRIUaDB+3/twYI8xtGDuVnEeLxDYLnPgDvRbm5G7Vm1dXAtdmQRpHVLlW670njbDbYYRysFeMUgdxT61vLtuXsCiz4jl6iYYTuQYWDP71wxm+rkjYzM1wd4AhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756058951; c=relaxed/simple;
	bh=tIb8TOaYFmDPG2l1skDR+dK6peTTauqAWzIqoeEul+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pF0QP7VcH6x1z8YCDY2vThzQTnEjpkV5ngRWCmGmJtBppotYHECTKu3zY6nCfH1xDtzDuOPGbHoYTF4N8d4S/y9XGF1zNRpcNr03rTdGaGVJnRIYbFLD0exq6MNluLY2yB7bZO8hthvSZrFqvFdkuO6e3BHiaOyEdhgcZ/DMHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4HZimzE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4HZimzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56CCC4CEEB;
	Sun, 24 Aug 2025 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756058950;
	bh=tIb8TOaYFmDPG2l1skDR+dK6peTTauqAWzIqoeEul+s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F4HZimzEDCxhs/tjlSR4cjBwj38UvzzONt2cA+xlCh3Bk1atrnT47m/sqAvRizXzR
	 7EV/dVhFUXmreDSwBtkitoAPltjvvyBUreUOqfsQWUw+x3KaZOc7JsbfTZrirlWUK+
	 EnXd2mMl4G5Hups2hPJ1+rdY8msSc6L27222OCIodAg+IRrdxlowiwSI5PGN6xoc8v
	 rDe5rq+iiRtmdaLrPIZ7snLhqR0fXzexyh1OyBvrESdgnHKGNoaTpPytrbZJE0M+GM
	 yWp4ZAI9++a3iGmtSlYjGT3VPGP+KHFsQH7N70qphpD2Zfb0o+BgFkDkQ3ySSWglYm
	 JPfdvXK8W1Lig==
Message-ID: <e17ea82b-fb3e-45d2-a168-3b917816fe7b@kernel.org>
Date: Sun, 24 Aug 2025 19:10:26 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2025 13:45, Tudor Ambarus wrote:
> +
> +static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct acpm_clk *clk = to_acpm_clk(hw);
> +
> +	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
> +					clk->acpm_chan_id, clk->id, rate);
> +}
> +
> +static const struct clk_ops acpm_clk_ops = {
> +	.recalc_rate = acpm_clk_recalc_rate,
> +	.round_rate = acpm_clk_round_rate,

This should be determine_rate. Check recent patchset from Brian Masney.
I applied the samsung bits from it to samsung soc tree.

...

> +
> +static int __init acpm_clk_probe(struct platform_device *pdev)

module probe for sure should not be __init.

> +{
> +	const struct acpm_clk_match_data *match_data;
> +	const struct acpm_handle *acpm_handle;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct clk_hw **hws;
> +	struct device *dev = &pdev->dev;
> +	struct acpm_clk *aclks;
> +	unsigned int acpm_chan_id;
> +	int i, err, count;
> +
> +	acpm_handle = devm_acpm_get_by_node(dev, dev->parent->of_node);
> +	if (IS_ERR(acpm_handle))
> +		return dev_err_probe(dev, PTR_ERR(acpm_handle),
> +				     "Failed to get acpm handle.\n");
> +
> +	match_data = of_device_get_match_data(dev);
> +	if (!match_data)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to get match data.\n");
> +
> +	count = match_data->nr_clks;
> +	acpm_chan_id = match_data->acpm_chan_id;
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
> +		const struct acpm_clk_variant *variant = &match_data->clks[i];
> +		struct acpm_clk *aclk = &aclks[i];
> +
> +		hws[i] = &aclk->hw;
> +
> +		aclk->id = variant->id;
> +		aclk->handle = acpm_handle;
> +		aclk->acpm_chan_id = acpm_chan_id;
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
> +#define ACPM_CLK(_id, cname)					\
> +	{							\
> +		.id		= _id,				\
> +		.name		= cname,			\
> +	}
> +
> +static const struct acpm_clk_variant gs101_acpm_clks[] __initconst = {

This goes to top of the file, after struct declarations.

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
> +
> +static const struct acpm_clk_match_data acpm_clk_gs101 __initconst = {

Are you going to have more of such clk_match_data? More variants?

> +	.clks = gs101_acpm_clks,
> +	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
> +	.acpm_chan_id = 0,
> +};
> +
> +static const struct of_device_id acpm_clk_ids[] __initconst = {
> +	{
> +		.compatible = "google,gs101-acpm-dvfs-clocks",
> +		.data =  &acpm_clk_gs101,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, acpm_clk_ids);
> +
> +static struct platform_driver acpm_clk_driver __refdata = {

__refdata feels wrong here. There is a long standing issue with Samsung
clock drivers - I sent a patchset for that but it did failed testing.

But your code is even simpler - no CLK_OFDECLARE - so why is this refdata?


Best regards,
Krzysztof
