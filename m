Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653D18A6B1;
	Fri, 27 Sep 2024 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727427260; cv=none; b=FA86OCZrsEx7qLvB60Goj4a4s7PRaBbyliHuRVU+xCNA23P1R0eK2t62sv/Y958EHz2iH082L2PasEkugBDLFJScXWDiUFGKyk3Yz9b5VBC0lC10V5BNqCfNh5iOOE9pz3s4QyY7cIo1QoLMWD9CMrqAhxCZffZXAPh7E/2O/ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727427260; c=relaxed/simple;
	bh=8KAxjXO3mmTiFLtw3ZUWx9PBsh+iM12e/NBkUdFLrl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tivxF2mJrnb61uWWCquRcWyFbwVouIqTMZT3QAlfd2UNJr1aGbuhJi7BCoG8u+rSquZAciRetA3Br8NUd6Lh0YCJE4s7X4u1V7p2tJYsUhUhOfz+sxVN3mrce6agMvNc4x2dFFh/gWEQzbXv3J0bws130RHIFCynduQlBUKnYNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAwb2574; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAwb2574"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E05C4CEC4;
	Fri, 27 Sep 2024 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727427260;
	bh=8KAxjXO3mmTiFLtw3ZUWx9PBsh+iM12e/NBkUdFLrl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAwb25741iic6gMt6VlLnRoUd6T7xw4SREVup7SKhSOyZBNpc87BSumTgaexDjRJQ
	 gwBpAZf3oEZ/xqkySYnHld9MGzSxzQzCvcbO3JWfbrhODYId3+UkPoDLdztzT3B0Z3
	 J8YblcuJ4UImr0jtJLDaLWBMH44+F6rEf6WM77dSW8ZCPujUlZ8UtBBUKIWyk0UVxn
	 G8GJhxuJSgUAUA51NJSSzj3mp3QE23LRBaPsXjRxNfA0WERosmCLo1eOHjW5lye2uJ
	 OAnukkj/rBQLRHTtE1rrJbWLBnUj/50dXiA4VtsG+m7mPhlrZ4LPkQp5mQIXP9pTcF
	 eetAvLINirz0Q==
Date: Fri, 27 Sep 2024 10:54:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] regulator: add s2dos05 regulator support
Message-ID: <j7ly4fzqiyw2umxepskd3bo6aithspkuvfu7au4qtybr2tmbgm@liwmxothkxax>
References: <20240617-starqltechn_integration_upstream-v5-0-ea1109029ba5@gmail.com>
 <20240617-starqltechn_integration_upstream-v5-3-ea1109029ba5@gmail.com>
 <4suhn7he2fpjagyw7suh4kthb3ti7i4ahnxixaeismv6fyj2wr@kt63ip6rs6bs>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4suhn7he2fpjagyw7suh4kthb3ti7i4ahnxixaeismv6fyj2wr@kt63ip6rs6bs>

On Fri, Sep 27, 2024 at 10:51:08AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 26, 2024 at 12:47:32PM +0300, Dzmitry Sankouski wrote:
> > +static int s2dos05_pmic_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
> > +	struct of_regulator_match *rdata = NULL;
> > +	struct s2dos05_data *s2dos05;
> > +	struct regulator_config config = { };
> > +	unsigned int rdev_num = ARRAY_SIZE(regulators);
> > +	int i, ret;
> > +
> > +	s2dos05 = devm_kzalloc(dev, sizeof(*s2dos05), GFP_KERNEL);
> > +	if (!s2dos05)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, s2dos05);
> > +
> > +	rdata = devm_kcalloc(dev, rdev_num, sizeof(*rdata), GFP_KERNEL);
> > +	if (!rdata)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < rdev_num; i++)
> > +		rdata[i].name = regulators[i].name;
> > +
> > +	s2dos05->regmap = iodev->regmap_pmic;
> > +	s2dos05->dev = dev;
> > +	if (!dev->of_node)
> > +		dev->of_node = dev->parent->of_node;
> > +
> > +	for (i = 0; i < rdev_num; i++) {
> > +		struct regulator_dev *regulator;
> > +
> > +		config.init_data = rdata[i].init_data;
> > +		config.of_node = rdata[i].of_node;
> > +		config.dev = dev;
> > +		config.driver_data = s2dos05;
> > +		regulator = devm_regulator_register(&pdev->dev,
> > +						&regulators[i], &config);
> > +		if (IS_ERR(regulator)) {
> > +			ret = PTR_ERR(regulator);
> > +			dev_err(&pdev->dev, "regulator init failed for %d\n",
> > +				i);
> > +		}
> > +	}
> > +
> > +	return ret;
> 
> ret is uninitialized. Please test your code with smatch and sparse.
> 
> Since I expect a new version, I will have a comment on the bindings as well.

Ah, no, looks fine. I was thinking you missed interrupts, but aparently
device is quite simple and I coould not find interrupts in downstream
source.

Still please investigate above 'ret' and run smatch and sparse.

Best regards,
Krzysztof

