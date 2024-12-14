Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB65101DE;
	Sat, 14 Dec 2024 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734191566; cv=none; b=RgFNFPpl00G6e4/Vyadcj3iz4xrtiyhnV3pmGo8P3+0wUgnKLQrtivwNB4+MVh4mz41mzRi6off0WAOzwkq7iLbPPaIdnHNHfO3oMzIM+/HCbxkMzwxWgfkK/y6oz3s903EJyKRcJ6b//DECRJoF2MBdP4Ve7u5A7+OepTWwOSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734191566; c=relaxed/simple;
	bh=KPzoGkvzcbahsNrPZZ5TRDoa7zLT2SLuDOoN0FbaijM=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=uNF4KV8V2ZM69kZontw89o9p+c5auV7bd1jpb6Q7bkX93fUru2ZzZjgTXrLMKPGnp4oqaTPvCOkR+lIs2wfVZviki+peTMg+3gzOez6nWIhG8fBAYBURTD0MKWNuhY2lH3xNxUsNtRjftjsdP8j+/x2nn4E42ncwLPQ4n8xrHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=pbnN5hbt; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="pbnN5hbt"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id MURZtVKNtJaUfMURatNGQD; Sat, 14 Dec 2024 16:52:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1734191561;
	bh=FFahc2HzyCvXQnoK6BCINAM58qqaizbdQbpLVvV+TfI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=pbnN5hbtPGBiUlDVfQxFoZlGPM2Xm9VGhYHo0xpuItIfovPjV/Y4NFbQ/UledN0nv
	 1621E1Knoz3U6X2kC9u5FaEDCbdQIjsq62uK4u5PWrDVtEXpsVPu+vXd1sAcEM8aix
	 T+HUPr/wIK62pRB/LgN/sRNueIE1d1ZgMhfMci7EiPqJrbI2RLCsmZvBaswn2DxPwA
	 nnwsjbntCdVHH+6XwloqzIBDsPIzQ7n6GEwATbWP52zxwrhoA8nMZoL4neL9pSTYkk
	 sn7Ib9eSjPVxe+aVtwDh3Y6dXsf/LScFIzqANi4EuVrpHSTh7SqUbcze16lHUeINeq
	 PEtRrKCXJcz9Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 14 Dec 2024 16:52:41 +0100
X-ME-IP: 90.11.132.44
Message-ID: <3c067b26-cfe8-4939-afce-5c8753767715@wanadoo.fr>
Date: Sat, 14 Dec 2024 16:52:35 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Markuss Broks <markuss.broks@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/12/2024 à 22:09, Markuss Broks a écrit :
> Add a driver for Samsung SPEEDY serial bus host controller.
> SPEEDY is a proprietary 1 wire serial bus used by Samsung
> in various devices (usually mobile), like Samsung Galaxy
> phones. It is usually used for connecting PMIC or various
> other peripherals, like audio codecs or RF components.
> 
> This bus can address at most 1MiB (4 bit device address,
> 8 bit registers per device, 8 bit wide registers:
> 256*256*16 = 1MiB of address space.

...

> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, u32 addr, u32 *val)
> +{
> +	int ret;
> +	u32 cmd, int_ctl, int_status;
> +
> +	mutex_lock(&speedy->io_lock);

All error handling paths fail to release the mutex.
guard(mutex) would help here.

> +
> +	ret = speedy_fifo_reset(speedy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
> +			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
> +	if (ret)
> +		return ret;
> +
> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
> +
> +	int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
> +		  SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
> +		  SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
> +		  SPEEDY_REMOTE_RESET_REQ_EN;
> +
> +	ret = speedy_int_clear(speedy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for xfer done */
> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = speedy_int_clear(speedy);
> +
> +	mutex_unlock(&speedy->io_lock);
> +
> +	return ret;
> +}

...

> +static int _speedy_write(struct speedy_controller *speedy, u32 reg, u32 addr, u32 val)
> +{
> +	int ret;
> +	u32 cmd, int_ctl, int_status;
> +
> +	mutex_lock(&speedy->io_lock);
> +
> +	ret = speedy_fifo_reset(speedy);
> +	if (ret)
> +		return ret;

All error handling paths fail to release the mutex.
guard(mutex) would help here.

> +
> +	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
> +			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
> +	if (ret)
> +		return ret;
> +
> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_WRITE |
> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
> +
> +	int_ctl = (SPEEDY_TRANSFER_DONE_EN |
> +		   SPEEDY_FIFO_TX_ALMOST_EMPTY_EN |
> +		   SPEEDY_TX_LINE_BUSY_ERR_EN |
> +		   SPEEDY_TX_STOPBIT_ERR_EN |
> +		   SPEEDY_REMOTE_RESET_REQ_EN);
> +
> +	ret = speedy_int_clear(speedy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_TX_DATA, val);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for xfer done */
> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
> +	if (ret)
> +		return ret;
> +
> +	speedy_int_clear(speedy);
> +
> +	mutex_unlock(&speedy->io_lock);
> +
> +	return 0;
> +}

...

> +/**
> + * speedy_get_by_phandle() - internal get speedy device handle
> + * @np:	pointer to OF device node of device
> + *
> + * Return: 0 on success, -errno otherwise

On success, a handle is returned, not 0.

> + */
> +static const struct speedy_device *speedy_get_device(struct device_node *np)
> +{
...

> +out:
> +	of_node_put(speedy_np);
> +	return handle;
> +}

...

> +static int speedy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct speedy_controller *speedy;
> +	void __iomem *mem;
> +	int ret;
> +
> +	speedy = devm_kzalloc(dev, sizeof(struct speedy_controller), GFP_KERNEL);
> +	if (!speedy)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, speedy);
> +	speedy->pdev = pdev;
> +
> +	mutex_init(&speedy->io_lock);
> +
> +	mem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mem))
> +		return dev_err_probe(dev, PTR_ERR(mem), "Failed to ioremap memory\n");
> +
> +	speedy->map = devm_regmap_init_mmio(dev, mem, &speedy_map_cfg);
> +	if (IS_ERR(speedy->map))
> +		return dev_err_probe(dev, PTR_ERR(speedy->map), "Failed to init the regmap\n");
> +
> +	/* Clear any interrupt status remaining */
> +	ret = speedy_int_clear(speedy);
> +	if (ret)
> +		return ret;
> +
> +	/* Reset the controller */
> +	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_SW_RST);
> +	if (ret)
> +		return ret;
> +
> +	msleep(20);
> +
> +	/* Enable the hw */
> +	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	msleep(20);
> +
> +	/* Probe child devices */
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, dev);
> +	if (ret)
> +		dev_err(dev, "Failed to populate child devices: %d\n", ret);

Could be dev_err_probe() as well, at least for consistency.

> +
> +	return ret;
> +}

...

CJ
