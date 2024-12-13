Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210BF1E0B82;
	Fri, 13 Dec 2024 13:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098145; cv=none; b=S2eXVMwNinQtka9sdiB0seWiAYSVaM+12QoYKyUzJSyZNUgQb6u9eiqhImmCNPf2Qufuj9zdmJ5MQo1Au/hJla6mbzcpwU7X1emqAvT2b69MXYo7hLQBeF9ZhMml/B54Nu1RUK3Iy7gVMdtiAKl2Pz2qeF0KTCLGgEPy9OjUoJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098145; c=relaxed/simple;
	bh=ths8MR1YNFWiuyBReULUqZ+xI05R3epwcT2UsMF7djg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntJLHWlwx8ugOpzg/emhCH8PTwd5MVvEH6pcgheEI6XbRtjGGFV4vDIgJHsEjRxzDOJeKK95kumekuHGW8lvybCfr6nFY/Fpgdw2lt/yAv3TXyyDKTNaj+Fi0tjBePO27vJEvGh+BZSIY2C9mhmgO0wa1Mm82p42+3VppKiX1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtYPRT/9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtYPRT/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C346C4CED0;
	Fri, 13 Dec 2024 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734098143;
	bh=ths8MR1YNFWiuyBReULUqZ+xI05R3epwcT2UsMF7djg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dtYPRT/9MYTfq4o3qAxdcfg5SUSYQA+tw0CJiqzO4lCZrjC9IXILEcmvRl5O5yO+8
	 jyKzUiLzkdY848+P1fWfqwqoakZmsz/esiRr/SINL+/uY4MeC9Vk32cswkpgXfiSgE
	 sMjohswL9df8CGaiYdVPmX2enBBg2434twjPjd/riPt5eGR6JGRb+3dnH0ZFBIFqtO
	 a9kpTgaQPo7/EpVcdOe/TkcI8oie/pes4QUDHWzKAqZBgiadAbmhv7a9s1oE7jF0x/
	 9npbpx0ftNShB5Rl8Br/sRhXqQGtBbYKYi0yc++QkqoaBpOHOI2DmQ7e+cKNI94jN7
	 tFUGGPAm6USbA==
Message-ID: <c0d58c4d-e3dc-445d-93c4-a2aed07af143@kernel.org>
Date: Fri, 13 Dec 2024 14:55:38 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
 <f08b068e-bc6b-4d9d-9839-370883309b88@kernel.org>
 <2a7f71b6-0967-40ee-9d0f-d7144eafcd5a@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <2a7f71b6-0967-40ee-9d0f-d7144eafcd5a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2024 10:42, Markuss Broks wrote:
> Hi Krzysztof,
> 
> On 12/13/24 9:49 AM, Krzysztof Kozlowski wrote:
>> On 12/12/2024 22:09, Markuss Broks wrote:
>>> Add a driver for Samsung SPEEDY serial bus host controller.
>>> SPEEDY is a proprietary 1 wire serial bus used by Samsung
>>> in various devices (usually mobile), like Samsung Galaxy
>>> phones. It is usually used for connecting PMIC or various
>>> other peripherals, like audio codecs or RF components.
>>>
>>> This bus can address at most 1MiB (4 bit device address,
>>> 8 bit registers per device, 8 bit wide registers:
>>> 256*256*16 = 1MiB of address space.
>>>
>>> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
>>> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>>> ---
>>>   drivers/soc/samsung/Kconfig               |  13 +
>>>   drivers/soc/samsung/Makefile              |   2 +
>>>   drivers/soc/samsung/exynos-speedy.c       | 457 ++++++++++++++++++++++++++++++
>>>   include/linux/soc/samsung/exynos-speedy.h |  56 ++++
>>>   4 files changed, 528 insertions(+)
>>>
>>> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
>>> index 1a5dfdc978dc4069eb71c4e8eada7ff1913b86b3..a38150fc9999ded1e1e93e2a9ef43b88175d34bd 100644
>>> --- a/drivers/soc/samsung/Kconfig
>>> +++ b/drivers/soc/samsung/Kconfig
>>> @@ -49,6 +49,19 @@ config EXYNOS_PMU_ARM_DRIVERS
>>>   	bool "Exynos PMU ARMv7-specific driver extensions" if COMPILE_TEST
>>>   	depends on EXYNOS_PMU
>>>   
>>> +config EXYNOS_SPEEDY
>>> +	tristate "Exynos SPEEDY host controller driver"
>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>> +	depends on OF
>>> +	depends on REGMAP_MMIO
>>> +	help
>>> +	  Enable support for Exynos SPEEDY host controller block.
>>> +	  SPEEDY is a 1 wire proprietary Samsung serial bus, found in
>>> +	  modern Samsung Exynos SoCs, like Exynos8895 and newer.
>>
>> I did not check that much but this looks like 1wire for which we have
>> subsystem. Please investigate more and figure out the differences.
> 
> This is not compatible with Dallas Semi 1-Wire bus. There are several 
> differences but the phy level is not compatible, looking at the Samsung 
> patent. [1] The most obvious difference is that 1-Wire is discoverable, 
> and this bus isn't. I'm pretty sure this is Samsung's own solution to a 
> serial interface through only one wire.
> 

It's fine then.

>>
>>> +
>>> +	  Select this if you have a Samsung Exynos device which uses
>>> +	  SPEEDY bus.
>>> +
>>
>>> +
>>> +/* SPEEDY_PACKET_GAP_TIME register bits */
>>> +#define SPEEDY_FIFO_TX_ALMOST_EMPTY			(1 << 4)
>>> +#define SPEEDY_FIFO_RX_ALMOST_FULL			(1 << 8)
>>> +#define SPEEDY_FSM_INIT					(1 << 1)
>>> +#define SPEEDY_FSM_TX_CMD				(1 << 2)
>>> +#define SPEEDY_FSM_STANDBY				(1 << 3)
>>> +#define SPEEDY_FSM_DATA					(1 << 4)
>>> +#define SPEEDY_FSM_TIMEOUT				(1 << 5)
>>> +#define SPEEDY_FSM_TRANS_DONE				(1 << 6)
>>> +#define SPEEDY_FSM_IO_RX_STAT_MASK			(3 << 7)
>>> +#define SPEEDY_FSM_IO_TX_IDLE				(1 << 9)
>>> +#define SPEEDY_FSM_IO_TX_GET_PACKET			(1 << 10)
>>> +#define SPEEDY_FSM_IO_TX_PACKET				(1 << 11)
>>> +#define SPEEDY_FSM_IO_TX_DONE				(1 << 12)
>>> +
>>> +#define SPEEDY_RX_LENGTH(n)				((n) << 0)
>>> +#define SPEEDY_TX_LENGTH(n)				((n) << 8)
>>> +
>>> +#define SPEEDY_DEVICE(x)				((x & 0xf) << 15)
>>> +#define SPEEDY_ADDRESS(x)				((x & 0xff) << 7)
>>> +
>>> +static const struct of_device_id speedy_match[] = {
>>> +	{ .compatible = "samsung,exynos9810-speedy" },
>>> +	{ /* Sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, speedy_match);
>> This is never at top of the file, but immediately before driver
>> structure. Look at other drivers.
> The function speedy_get_device uses this to match the compatible, do I 
> just leave the prototype here?


1. Entire speedy_get_device() is unused so it will be removed.
2. Even if it stays, speedy_get_device() is not supposed to match
anything. How are you supposed to use Samsung PMIC on different
controller? These things should not be tied.


>>
>>> +
>>> +static const struct regmap_config speedy_map_cfg = {
>>> +	.reg_bits = 32,
>>> +	.val_bits = 32,
>>> +};


...

>>> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
>>> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>>> +
>>> +	int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
>>> +		  SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
>>> +		  SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
>>> +		  SPEEDY_REMOTE_RESET_REQ_EN;
>>> +
>>> +	ret = speedy_int_clear(speedy);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Wait for xfer done */
>>> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
>>> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = speedy_int_clear(speedy);
>>> +
>>> +	mutex_unlock(&speedy->io_lock);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +int exynos_speedy_read(const struct speedy_device *device, u32 addr, u32 *val)
>>> +{
>>> +	return _speedy_read(device->speedy, device->reg, addr, val);
>>> +}
>>> +EXPORT_SYMBOL_GPL(exynos_speedy_read);
>> Nope, drop, unused.
> This is intended to be used with other device drivers, this driver in 
> itself doesn't do anything, it only configures the controller and makes 
> it ready for transmitting data, it's other drivers that will come (e.g. 
> S2MPS18 PMIC, which uses SPEEDY for communication with the SoC) that 
> will utilize those functions.

Post entire series, so we see users of this API. If you post API without
users, it won't be accepted simply because there are no users and we do
not want dead, unused code.

Anyway we must see how you intend to use that interface to properly
review it.

>>
>>> +
>>> +/**
>>> + * _speedy_write() - internal speedy write operation
>>> + * @speedy:	pointer to speedy controller struct
>>> + * @reg:	address of device on the bus
>>> + * @addr:       address to write
>>> + * @val:        value to write
>>> + *


...

>>> +}
>>> +
>>> +static struct platform_driver speedy_driver = {
>>> +	.probe = speedy_probe,
>>> +	.driver = {
>>> +		.name = "exynos-speedy",
>>> +		.of_match_table = speedy_match,
>>> +	},
>>> +};
>>> +
>>> +module_platform_driver(speedy_driver);
>>> +
>>> +MODULE_DESCRIPTION("Samsung Exynos SPEEDY host controller driver");
>>> +MODULE_AUTHOR("Markuss Broks <markuss.broks@gmail.com>");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/include/linux/soc/samsung/exynos-speedy.h b/include/linux/soc/samsung/exynos-speedy.h
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..b2857d65d3b50927373866dd8ae1c47e98af6d7b
>>> --- /dev/null
>>> +++ b/include/linux/soc/samsung/exynos-speedy.h
>> Drop the header, not used.
> Same here, please clarify how this should be handled. This driver 
> implements the devm_speedy_get_device and read/write functions for its 
> child devices in that header, future drivers for e.g. PMIC would use 
> this header and call devm_speedy_get_device to get a speedy_device 
> pointer and then use read/write functions to read/write from the bus.

This needs to be proper bus with proper speedy_driver clients. See how
other buses - struct bus_type. Recent example of bus using platform
drivers for devices would be pwrseq (power/sequence). Not so old other
bus using its own xxx_driver for devices could be cxl or ffa (arm_ffa).
This current non-bus approach, could also work if this is really Samsung
specific. See memory/ for examples of MMIO buses and MMIO clients.

I don't know good examples of non-MMIO buses not using bus_type and I am
not sure whether this is accepted in general. I'll ask on IRC, maybe
someone will give some hints.


Best regards,
Krzysztof
