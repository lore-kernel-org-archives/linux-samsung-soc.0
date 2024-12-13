Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373641B21A6;
	Fri, 13 Dec 2024 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734082932; cv=none; b=f3e8ygFtpwdbSKpZbYOhaW0znu5PqDv4xHrR93pzazNRXsNJaji06UpYvD2GQtd5aJBtPnW5meamcmfiuYLEWrMuC9mndPNc5HBQLrQ1AdEAmvoENi8Y1bHhaNv8h1rW//RCI02K7Hx7OL6BRVfc99qSrgEPaVDoB0yVXklYAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734082932; c=relaxed/simple;
	bh=4RnlJT30MNVSDzobWPW2fLEJBCZylZkabGowA2fGtSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVEQC6guoV85rHFwkvKi8QBxNfG4wQ19PUyZ0l+JfB8ZyPaOuOt6tZiP5+icXaXTfjhR45O5T0yxeqgeSSI2Xw8L+O3Bo80XBBd+nv5pmARNIH9UwK2D17GT4qtjo6yYsID5NkZ6uQX7ARiIdShA2av7VmR5FlVXPvQzL5OnE6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khz3BdDO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khz3BdDO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso260462666b.1;
        Fri, 13 Dec 2024 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734082928; x=1734687728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2++DaGNihPLgEq9BWuayqmu/bK1oH8xdW4tWgQL3QcY=;
        b=khz3BdDOlqJ869q6gwqT9zSFYZvRnzix3tPDesvz0sf2P46pluldfrsZzXlIM7of8N
         Y/TIiS1XHdVg610OGmRnWUtqGPLc7LZPOx4ddg5VhGYIP5UWP0YSYGeiBUlinztNDw/f
         uzpwKL6HMzQZyiy7ucuKsz5xT5hoxDe6HODr7BtroYOzsxzD42jNQAX6WUkIA7RKQsBC
         YpQBa0JLFfxqkQVh1cQpBJy8JUhSsnrlM6nA0naI7IZaeQAnV23qpE0O/2OXP0mION0P
         cahSFYSn2fLdRJlSpWq1MkuQFl6Y+q48HGN97dUGHb/uG6yCAih0kKmtx7mGGHlS3SE7
         jF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734082928; x=1734687728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2++DaGNihPLgEq9BWuayqmu/bK1oH8xdW4tWgQL3QcY=;
        b=sbFN3exWHEB7UD8SJxWNb+l/qfxXZ2Aqx4CIRXZStb+5uPbOnfbMKthnYrN+LbKS15
         HzEUyHBl9op/o7wlGKCJtxpW5kwaNDp1dd3maeGjMJZg6aBcTlKCjg4gZuBIIhST6EDY
         wZCzDSOaULTZ/jBEQ3jNjfaCAMlAAIijSyJcEe12s5TMfRcc6dV0ywLTGsDikhBTCbxL
         FmY/Msyasbzu/qgQaHj46eDRbTjHE5PTmILKhcD+DAOOCXyuNqSBmrjYPA5okdAp0FB5
         +WqDAY3OSxDJvtXcQeHQ5FjehgXk6oOwB/4+CYSRi3WbqCatzAwh9t6ex4BCoTIQ54is
         rhlg==
X-Forwarded-Encrypted: i=1; AJvYcCV75q8szG7Rbt8x2d3JjkdIfEvEc6JceHZVK+t27vSDSmHIFUStNgsAfQOByjV3lKdgwy4n39BBTK7Q@vger.kernel.org, AJvYcCXgGVVkNK3ZeLRlDM/f4bp59jhXTw/rDp1GTViUzMUro4gqLWK0HCd6JLDc3AMI/fjo0XOZBInfYn1p5xd3@vger.kernel.org
X-Gm-Message-State: AOJu0YyNW/kXSQI1NhSkEs1TdCGm3EFuHmt6UHiWq+Uz8C1Q1WUacbWA
	4cRyemzNRiE8JxT9xzyG49PhOa682hXlsRM1swCv3M9+LlB0KQY5
X-Gm-Gg: ASbGncs4+nBLPLtyx+hsYd2vwr2O2LrbW2Ss8rAomjGsDLh+vcveNhiKlk1cgRYzdsj
	lhb0kjyby9mXSYDJefHBJvA5/xYTe9q02WZuIoSVYA50dmHFRy9ks3j/6CIgtjANJ3a2Pd75/Bx
	4vlSkZjFBWOGSN11rf0dmzZnLPgoXZECsTNjSe5Zx1SjnhFHXYzSWWWX1zl/uzTrPXadS3qzmvq
	yYUuOo93zHWSRE0SOWrsZUBRLTyGj4XXGKHcTNh8Xb9ga454z21QezMIHIVNJW6ScGr
X-Google-Smtp-Source: AGHT+IGheOwCe2Fckm4wGg8Nxl3EPKxiw37V6nphHSmYMUmfG8XndD5bd3SZ44kj478TmkrKb+7teA==
X-Received: by 2002:a17:907:9557:b0:aa6:63e2:535c with SMTP id a640c23a62f3a-aab779b4b78mr162848066b.28.1734082928056;
        Fri, 13 Dec 2024 01:42:08 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66ef6409esm825909366b.149.2024.12.13.01.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 01:42:07 -0800 (PST)
Message-ID: <2a7f71b6-0967-40ee-9d0f-d7144eafcd5a@gmail.com>
Date: Fri, 13 Dec 2024 11:42:04 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
 <f08b068e-bc6b-4d9d-9839-370883309b88@kernel.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <f08b068e-bc6b-4d9d-9839-370883309b88@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 12/13/24 9:49 AM, Krzysztof Kozlowski wrote:
> On 12/12/2024 22:09, Markuss Broks wrote:
>> Add a driver for Samsung SPEEDY serial bus host controller.
>> SPEEDY is a proprietary 1 wire serial bus used by Samsung
>> in various devices (usually mobile), like Samsung Galaxy
>> phones. It is usually used for connecting PMIC or various
>> other peripherals, like audio codecs or RF components.
>>
>> This bus can address at most 1MiB (4 bit device address,
>> 8 bit registers per device, 8 bit wide registers:
>> 256*256*16 = 1MiB of address space.
>>
>> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
>> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>> ---
>>   drivers/soc/samsung/Kconfig               |  13 +
>>   drivers/soc/samsung/Makefile              |   2 +
>>   drivers/soc/samsung/exynos-speedy.c       | 457 ++++++++++++++++++++++++++++++
>>   include/linux/soc/samsung/exynos-speedy.h |  56 ++++
>>   4 files changed, 528 insertions(+)
>>
>> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
>> index 1a5dfdc978dc4069eb71c4e8eada7ff1913b86b3..a38150fc9999ded1e1e93e2a9ef43b88175d34bd 100644
>> --- a/drivers/soc/samsung/Kconfig
>> +++ b/drivers/soc/samsung/Kconfig
>> @@ -49,6 +49,19 @@ config EXYNOS_PMU_ARM_DRIVERS
>>   	bool "Exynos PMU ARMv7-specific driver extensions" if COMPILE_TEST
>>   	depends on EXYNOS_PMU
>>   
>> +config EXYNOS_SPEEDY
>> +	tristate "Exynos SPEEDY host controller driver"
>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>> +	depends on OF
>> +	depends on REGMAP_MMIO
>> +	help
>> +	  Enable support for Exynos SPEEDY host controller block.
>> +	  SPEEDY is a 1 wire proprietary Samsung serial bus, found in
>> +	  modern Samsung Exynos SoCs, like Exynos8895 and newer.
>
> I did not check that much but this looks like 1wire for which we have
> subsystem. Please investigate more and figure out the differences.

This is not compatible with Dallas Semi 1-Wire bus. There are several 
differences but the phy level is not compatible, looking at the Samsung 
patent. [1] The most obvious difference is that 1-Wire is discoverable, 
and this bus isn't. I'm pretty sure this is Samsung's own solution to a 
serial interface through only one wire.

>
>> +
>> +	  Select this if you have a Samsung Exynos device which uses
>> +	  SPEEDY bus.
>> +
>
>> +
>> +/* SPEEDY_PACKET_GAP_TIME register bits */
>> +#define SPEEDY_FIFO_TX_ALMOST_EMPTY			(1 << 4)
>> +#define SPEEDY_FIFO_RX_ALMOST_FULL			(1 << 8)
>> +#define SPEEDY_FSM_INIT					(1 << 1)
>> +#define SPEEDY_FSM_TX_CMD				(1 << 2)
>> +#define SPEEDY_FSM_STANDBY				(1 << 3)
>> +#define SPEEDY_FSM_DATA					(1 << 4)
>> +#define SPEEDY_FSM_TIMEOUT				(1 << 5)
>> +#define SPEEDY_FSM_TRANS_DONE				(1 << 6)
>> +#define SPEEDY_FSM_IO_RX_STAT_MASK			(3 << 7)
>> +#define SPEEDY_FSM_IO_TX_IDLE				(1 << 9)
>> +#define SPEEDY_FSM_IO_TX_GET_PACKET			(1 << 10)
>> +#define SPEEDY_FSM_IO_TX_PACKET				(1 << 11)
>> +#define SPEEDY_FSM_IO_TX_DONE				(1 << 12)
>> +
>> +#define SPEEDY_RX_LENGTH(n)				((n) << 0)
>> +#define SPEEDY_TX_LENGTH(n)				((n) << 8)
>> +
>> +#define SPEEDY_DEVICE(x)				((x & 0xf) << 15)
>> +#define SPEEDY_ADDRESS(x)				((x & 0xff) << 7)
>> +
>> +static const struct of_device_id speedy_match[] = {
>> +	{ .compatible = "samsung,exynos9810-speedy" },
>> +	{ /* Sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, speedy_match);
> This is never at top of the file, but immediately before driver
> structure. Look at other drivers.
The function speedy_get_device uses this to match the compatible, do I 
just leave the prototype here?
>
>> +
>> +static const struct regmap_config speedy_map_cfg = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +};
>> +
>> +/**
>> + * speedy_int_clear() - clear interrupt status
>> + * @speedy:	pointer to speedy controller struct
>> + *
>> + * Return: 0 on success, -errno otherwise
>> + */
>> +static int speedy_int_clear(struct speedy_controller *speedy)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_set_bits(speedy->map, SPEEDY_INT_STATUS, 0xffffffff);
>> +	if (ret)
>> +		return ret;
>> +
>> +	udelay(10);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * speedy_fifo_reset() - reset FIFO of the controller
>> + * @speedy:	pointer to speedy controller struct
>> + *
>> + * Return: 0 on success, -errno otherwise
>> + */
>> +static int speedy_fifo_reset(struct speedy_controller *speedy)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL, SPEEDY_FIFO_RESET);
>> +	if (ret)
>> +		return ret;
>> +
>> +	udelay(10);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * _speedy_read() - internal speedy read operation
>> + * @speedy:	pointer to speedy controller struct
>> + * @reg:	address of device on the bus
>> + * @addr:       address to read
>> + * @val:        pointer to store result
>> + *
>> + * Return: 0 on success, -errno otherwise
>> + */
>> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, u32 addr, u32 *val)
>> +{
>> +	int ret;
>> +	u32 cmd, int_ctl, int_status;
>> +
>> +	mutex_lock(&speedy->io_lock);
>> +
>> +	ret = speedy_fifo_reset(speedy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
>> +			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
>> +	if (ret)
>> +		return ret;
>> +
>> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
>> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>> +
>> +	int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
>> +		  SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
>> +		  SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
>> +		  SPEEDY_REMOTE_RESET_REQ_EN;
>> +
>> +	ret = speedy_int_clear(speedy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Wait for xfer done */
>> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
>> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = speedy_int_clear(speedy);
>> +
>> +	mutex_unlock(&speedy->io_lock);
>> +
>> +	return ret;
>> +}
>> +
>> +int exynos_speedy_read(const struct speedy_device *device, u32 addr, u32 *val)
>> +{
>> +	return _speedy_read(device->speedy, device->reg, addr, val);
>> +}
>> +EXPORT_SYMBOL_GPL(exynos_speedy_read);
> Nope, drop, unused.
This is intended to be used with other device drivers, this driver in 
itself doesn't do anything, it only configures the controller and makes 
it ready for transmitting data, it's other drivers that will come (e.g. 
S2MPS18 PMIC, which uses SPEEDY for communication with the SoC) that 
will utilize those functions.
>
>> +
>> +/**
>> + * _speedy_write() - internal speedy write operation
>> + * @speedy:	pointer to speedy controller struct
>> + * @reg:	address of device on the bus
>> + * @addr:       address to write
>> + * @val:        value to write
>> + *
>> + * Return: 0 on success, -errno otherwise
>> + */
>> +static int _speedy_write(struct speedy_controller *speedy, u32 reg, u32 addr, u32 val)
>> +{
>> +	int ret;
>> +	u32 cmd, int_ctl, int_status;
>> +
>> +	mutex_lock(&speedy->io_lock);
>> +
>> +	ret = speedy_fifo_reset(speedy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
>> +			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
>> +	if (ret)
>> +		return ret;
>> +
>> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_WRITE |
>> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>> +
>> +	int_ctl = (SPEEDY_TRANSFER_DONE_EN |
>> +		   SPEEDY_FIFO_TX_ALMOST_EMPTY_EN |
>> +		   SPEEDY_TX_LINE_BUSY_ERR_EN |
>> +		   SPEEDY_TX_STOPBIT_ERR_EN |
>> +		   SPEEDY_REMOTE_RESET_REQ_EN);
>> +
>> +	ret = speedy_int_clear(speedy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(speedy->map, SPEEDY_TX_DATA, val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Wait for xfer done */
>> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
>> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>> +	if (ret)
>> +		return ret;
>> +
>> +	speedy_int_clear(speedy);
>> +
>> +	mutex_unlock(&speedy->io_lock);
>> +
>> +	return 0;
>> +}
>> +
>> +int exynos_speedy_write(const struct speedy_device *device, u32 addr, u32 val)
>> +{
>> +	return _speedy_write(device->speedy, device->reg, addr, val);
> Just write the function here and drop _.
>
>> +}
>> +EXPORT_SYMBOL_GPL(exynos_speedy_write);
>> +
>> +static void devm_speedy_release(struct device *dev, void *res)
>> +{
>> +	const struct speedy_device **ptr = res;
>> +	const struct speedy_device *handle = *ptr;
>> +
>> +	kfree(handle);
>> +}
>> +
>> +/**
>> + * speedy_get_by_phandle() - internal get speedy device handle
>> + * @np:	pointer to OF device node of device
>> + *
>> + * Return: 0 on success, -errno otherwise
>> + */
>> +static const struct speedy_device *speedy_get_device(struct device_node *np)
>> +{
>> +	const struct of_device_id *speedy_id;
>> +	struct device_node *speedy_np;
>> +	struct platform_device *speedy_pdev;
>> +	struct speedy_controller *speedy = NULL;
>> +	struct speedy_device *handle;
>> +	int ret;
>> +
>> +	if (!np) {
>> +		pr_err("I need a device pointer\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	speedy_np = of_get_parent(np);
>> +	if (!speedy_np)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	/* Verify if parent node is a speedy controller */
>> +	speedy_id = of_match_node(speedy_match, speedy_np);
>> +	if (!speedy_id) {
>> +		handle = ERR_PTR(-EINVAL);
>> +		goto out;
>> +	}
>> +
>> +	/* Get platform device of the speedy controller */
>> +	speedy_pdev = of_find_device_by_node(speedy_np);
>> +	if (!speedy_pdev) {
>> +		handle = ERR_PTR(-EPROBE_DEFER);
>> +		goto out;
>> +	}
>> +
>> +	/* Get drvdata of speedy controller */
>> +	speedy = platform_get_drvdata(speedy_pdev);
>> +	if (!speedy) {
>> +		handle = ERR_PTR(-EINVAL);
>> +		goto out;
>> +	}
>> +
>> +	handle = kzalloc(sizeof(struct speedy_device), GFP_KERNEL);
>> +	if (!handle) {
>> +		handle = ERR_PTR(-ENOMEM);
>> +		goto out;
>> +	}
>> +	handle->speedy = speedy;
>> +	ret = of_property_read_u32(np, "reg", &handle->reg);
>> +	if (ret) {
>> +		kfree(handle);
>> +		handle = ERR_PTR(-EINVAL);
>> +		goto out;
>> +	}
>> +
>> +out:
>> +	of_node_put(speedy_np);
>> +	return handle;
>> +}
>> +
>> +const struct speedy_device *devm_speedy_get_device(struct device *dev)
> Not used, drop function.
>
>> +{
>> +	const struct speedy_device *handle;
>> +	const struct speedy_device **ptr;
>> +
>> +	ptr = devres_alloc(devm_speedy_release, sizeof(*ptr), GFP_KERNEL);
>> +	if (!ptr)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	handle = speedy_get_device(dev_of_node(dev));
>> +	if (!IS_ERR(handle)) {
>> +		*ptr = handle;
>> +		devres_add(dev, ptr);
>> +	} else {
>> +		devres_free(ptr);
>> +	}
>> +
>> +	return handle;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_speedy_get_device);
> Not used, drop.
>
>
>
>> +
>> +static int speedy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct speedy_controller *speedy;
>> +	void __iomem *mem;
>> +	int ret;
>> +
>> +	speedy = devm_kzalloc(dev, sizeof(struct speedy_controller), GFP_KERNEL);
> sizeof(*) everywhere. You need to clean the downstream code when
> upstreaming.
Oh, okay, sorry, missed it.
>
>> +	if (!speedy)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, speedy);
>> +	speedy->pdev = pdev;
>> +
>> +	mutex_init(&speedy->io_lock);
>> +
>> +	mem = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(mem))
>> +		return dev_err_probe(dev, PTR_ERR(mem), "Failed to ioremap memory\n");
>> +
>> +	speedy->map = devm_regmap_init_mmio(dev, mem, &speedy_map_cfg);
>> +	if (IS_ERR(speedy->map))
>> +		return dev_err_probe(dev, PTR_ERR(speedy->map), "Failed to init the regmap\n");
> Wrap at 80.
>
>> +
>> +	/* Clear any interrupt status remaining */
>> +	ret = speedy_int_clear(speedy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Reset the controller */
>> +	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_SW_RST);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msleep(20);
>> +
>> +	/* Enable the hw */
>> +	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_ENABLE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msleep(20);
>> +
>> +	/* Probe child devices */
>> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, dev);
>> +	if (ret)
>> +		dev_err(dev, "Failed to populate child devices: %d\n", ret);
>> +
>> +	return ret;
> Missing cleanup in remove().
Will be done.
>
>> +}
>> +
>> +static struct platform_driver speedy_driver = {
>> +	.probe = speedy_probe,
>> +	.driver = {
>> +		.name = "exynos-speedy",
>> +		.of_match_table = speedy_match,
>> +	},
>> +};
>> +
>> +module_platform_driver(speedy_driver);
>> +
>> +MODULE_DESCRIPTION("Samsung Exynos SPEEDY host controller driver");
>> +MODULE_AUTHOR("Markuss Broks <markuss.broks@gmail.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/soc/samsung/exynos-speedy.h b/include/linux/soc/samsung/exynos-speedy.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b2857d65d3b50927373866dd8ae1c47e98af6d7b
>> --- /dev/null
>> +++ b/include/linux/soc/samsung/exynos-speedy.h
> Drop the header, not used.
Same here, please clarify how this should be handled. This driver 
implements the devm_speedy_get_device and read/write functions for its 
child devices in that header, future drivers for e.g. PMIC would use 
this header and call devm_speedy_get_device to get a speedy_device 
pointer and then use read/write functions to read/write from the bus.
>
>
>
> Best regards,
> Krzysztof

- Markuss


[1] https://patents.google.com/patent/US9882711B1/en

