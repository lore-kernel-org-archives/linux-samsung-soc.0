Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2A1DEFE8;
	Wed,  5 Feb 2025 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774345; cv=none; b=GGDTt11HQVVrTHtmuFDRJF4flYg7tv6rGsl1TXGU3xSkIwqQpB7aSkG3vdnlM01P2VSMcP0CZPtmKBfRQNl9Sz1j71zK/TvH+X8QSw4Xi81i/MW1ZH0hfs2GW9ach+lDgZoN4OxXmMjf8ptJlIdRPWC1CN6dCxOOzWqaN32FLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774345; c=relaxed/simple;
	bh=nsnrkEAh6apkb1p55WTRzCwnxP+iJHYtwXaFJjwk8wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRAp4V650P4akhAHJyx+YV/35rxmEuvlTH4YTYp0zDlM0+IdpiM2WIYcKUDvfyagi726DEzq9+LODozPVeysN/+IGD0x3KvB3zzfUNgVcqnwLzp9qwvyCPUTxY55XHt4f46ZYrFLiUX/RNG3rmNNLe6MmsnKxcP1h7sbMRHRvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnUL6xct; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnUL6xct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FE8C4CED6;
	Wed,  5 Feb 2025 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738774344;
	bh=nsnrkEAh6apkb1p55WTRzCwnxP+iJHYtwXaFJjwk8wU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZnUL6xct2U/KJ0Xf3vylUw4r76uvD5uy+SRDD2IXx2e1gdEBdPOjVdok5iw9mffqI
	 8S0yMCASWKjdbYiaf3DqjyBA+bTBA8mIOkKazC9BO+ivNfFhg+DsHz/owdfnzEdkfA
	 fo4zgcz6gF6OkJdtiCHPcx5t6FZzWRb6fttAaPDfTUgVbR5L60FOhzKfHKV+NApCi+
	 Xjv+gqgV0N0xdZMYYvhxCtxSiZc1ar48KopSEy7S8sCoYi9aTgvKZrxwIn8qIGRwgx
	 q6odsdux2GriwEvMPynEKjVFACJDWeHAQUtxFDEItlm6BYNGzEhgKliys5mf0Li+3e
	 JdmOQ+bGgft3g==
Message-ID: <f83ccdb0-4d22-441f-9311-d9a2c8cd3493@kernel.org>
Date: Wed, 5 Feb 2025 17:52:16 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] firmware: add Exynos ACPM protocol driver
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
 <20250116-gs101-acpm-v6-2-e3a2e1a3007c@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250116-gs101-acpm-v6-2-e3a2e1a3007c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2025 15:00, Tudor Ambarus wrote:
> +
> +/**
> + * acpm_put_handle() - release the handle acquired by acpm_get_by_phandle.
> + * @handle:	Handle acquired by acpm_get_by_phandle.
> + */
> +static void acpm_handle_put(const struct acpm_handle *handle)
> +{
> +	struct acpm_info *acpm = handle_to_acpm_info(handle);
> +	struct device *dev = acpm->dev;
> +
> +	module_put(dev->driver->owner);
> +	/* Drop reference taken with of_find_device_by_node(). */
> +	put_device(dev);
> +}
> +
> +/**
> + * devm_acpm_release() - devres release method.
> + * @dev: pointer to device.
> + * @res: pointer to resource.
> + */
> +static void devm_acpm_release(struct device *dev, void *res)
> +{
> +	acpm_handle_put(*(struct acpm_handle **)res);
> +}
> +
> +/**
> + * acpm_get_by_phandle() - get the ACPM handle using DT phandle.
> + * @dev:	device pointer for the consumer device.
> + *
> + * Return: pointer to handle on success, ERR_PTR(-errno) otherwise.
> + */
> +static const struct acpm_handle *acpm_get_by_phandle(struct device *dev)

"by_phandle" takes the name of the property with phandle as an argument,
because otherwise you do not have here phandle part at all in the
interface (see syscon API).

Other option would be by actual phandle - see of_find_node_by_phandle().

I would propose in such case only acpm_get() or maybe better of_acpm_get()?




> +{
> +	struct device_node *np __free(device_node);

That's not the expected syntax. You miss here initializer/constructor or
this should be placed in place of initialization (just like everywhere)
... or just drop cleanup because it does not make things much
smaller/easier.

> +	struct platform_device *pdev;
> +	struct device_link *link;
> +	struct acpm_info *acpm;
> +
> +	if (!dev || !dev->of_node)
> +		return ERR_PTR(-ENODEV);
> +
> +	np = of_parse_phandle(dev->of_node, "exynos,acpm_ipc", 0);

You need bindings for this somewhere and fix the underscore->hyphen...
and vendor prefix. It really would not be accepted that way so please
post consumer bindings anywhere.


> +	if (!np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev) {
> +		dev_err(dev, "Cannot find device node %s\n", np->name);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	acpm = platform_get_drvdata(pdev);
> +	if (!acpm) {
> +		dev_err(dev, "Cannot get drvdata from %s\n",
> +			dev_name(&pdev->dev));
> +		platform_device_put(pdev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	if (!try_module_get(pdev->dev.driver->owner)) {
> +		dev_err(dev, "Cannot get module reference.\n");
> +		platform_device_put(pdev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
> +	if (!link) {
> +		dev_err(&pdev->dev,
> +			"Failed to create device link to consumer %s.\n",
> +			dev_name(dev));
> +		platform_device_put(pdev);
> +		module_put(pdev->dev.driver->owner);

If you keep usage of __free(), it is fine. If you drop it, then
implement common exit/error handling path with gotos.

> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return &acpm->handle;
> +}
> +

Rest looked good to me.

Best regards,
Krzysztof
