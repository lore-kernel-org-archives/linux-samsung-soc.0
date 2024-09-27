Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2E1AD3F9;
	Fri, 27 Sep 2024 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727427071; cv=none; b=keXZygi7idLNV+7IUywFNQ/pvdn+f4cLSWR1upTAKM9/TAR9erOIWv5VMvIoVgQpTK9gTu+SWIiu0VwzcC2hLi1BQHI3QmBS/oMwnrN1YTqm+FB19gIsKZtaFzP6jekjGAZ9T/TZGc2s3YyziqQp/1Ot3ExmjQC8y1H+t1y+Ydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727427071; c=relaxed/simple;
	bh=uMKqyoTHPRYHS7W8CMdUgc6e4lS5AgCnRcOb0zb4OJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6wyxtFM5h4P/DXV3nxqrgfyZjw9O26cs74uZk8bTkiMocZo7QD4XnjGF4If9uC8UkrXEpwHeNbnODll+X3QZ+WcZA80se5EXGqXBj+0cARpzymEISnAlXw11TytkULNLwm4G9VYMQzM9a6KyVkT+CA0IBt4TMmcb5CNpct1Vg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJXRHo2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJXRHo2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A786AC4CEC4;
	Fri, 27 Sep 2024 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727427071;
	bh=uMKqyoTHPRYHS7W8CMdUgc6e4lS5AgCnRcOb0zb4OJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJXRHo2lA+wslnB0DWIah/IbAIVzckR+8ayKRgD+JoIZSNxOkfczyFy5kzwwsT5AS
	 Pbz/eNeP2VTu95dKOOrnn6TfjEX54yqM1LZO12P8FocDXUrJsoc/fordWmVzYaJ0wC
	 teaZEsB0PtWiK5+3bCvFDKn4973B9LrU2/kOq2uumoTvVR4IpPBw49BrDKEmQbDFXz
	 sLBUY6kvxFlpv7jHpXgwM55WKVGdc1u1HsoDlGvIsF9eSQSjbpUIt9Q5i1MCjb32QE
	 Ta/FlL2TTTsCBd8TThWH820aI8kq6tpKV1pH2bnUEmIQpREWWw7wOvtI2Ej2kgsZt+
	 XpwnQodNIreUQ==
Date: Fri, 27 Sep 2024 10:51:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] regulator: add s2dos05 regulator support
Message-ID: <4suhn7he2fpjagyw7suh4kthb3ti7i4ahnxixaeismv6fyj2wr@kt63ip6rs6bs>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
 <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com>

On Thu, Sep 26, 2024 at 12:47:32PM +0300, Dzmitry Sankouski wrote:
> +static int s2dos05_pmic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
> +	struct of_regulator_match *rdata = NULL;
> +	struct s2dos05_data *s2dos05;
> +	struct regulator_config config = { };
> +	unsigned int rdev_num = ARRAY_SIZE(regulators);
> +	int i, ret;
> +
> +	s2dos05 = devm_kzalloc(dev, sizeof(*s2dos05), GFP_KERNEL);
> +	if (!s2dos05)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, s2dos05);
> +
> +	rdata = devm_kcalloc(dev, rdev_num, sizeof(*rdata), GFP_KERNEL);
> +	if (!rdata)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < rdev_num; i++)
> +		rdata[i].name = regulators[i].name;
> +
> +	s2dos05->regmap = iodev->regmap_pmic;
> +	s2dos05->dev = dev;
> +	if (!dev->of_node)
> +		dev->of_node = dev->parent->of_node;
> +
> +	for (i = 0; i < rdev_num; i++) {
> +		struct regulator_dev *regulator;
> +
> +		config.init_data = rdata[i].init_data;
> +		config.of_node = rdata[i].of_node;
> +		config.dev = dev;
> +		config.driver_data = s2dos05;
> +		regulator = devm_regulator_register(&pdev->dev,
> +						&regulators[i], &config);
> +		if (IS_ERR(regulator)) {
> +			ret = PTR_ERR(regulator);
> +			dev_err(&pdev->dev, "regulator init failed for %d\n",
> +				i);
> +		}
> +	}
> +
> +	return ret;

ret is uninitialized. Please test your code with smatch and sparse.

Since I expect a new version, I will have a comment on the bindings as well.

Best regards,
Krzysztof

