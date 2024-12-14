Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727818FC92;
	Sat, 14 Dec 2024 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734177983; cv=none; b=owjTG4ZvPL6Iowe0M6vI5MRTd+kGEDv4pud4k8tOeUJzlQqgNLJ5kiYgGRbpPujYiQLoNpDcNFSHBjJXSexy+8WsP8xfpUDhTOXXDY76/JtVOHJ+hfGTh/JXv27DJgk3d2UODTeb0TfB5wndA7Pzmwsvbnz2xjS3Eyrq2GC/55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734177983; c=relaxed/simple;
	bh=BJmTgVvLl8ml8YBBTUmBeNxA5J1D32cpH5oF7U9HrKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+1/MT/sHFPzdYmiJ82ihuvchcs/PMGfamVYhdTPmtIFS9e6MpzYThV31RkD1fs7qyM4Hjc2EnwoqiECOgOEIQTalhph3VsWsRQpnm7oPej83/+eZz22w6WxPmtiEl4hELF3MkKSIXlEad0oyctuhqMIyUDjzH46mbXVwYOWHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azbJc21O; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azbJc21O"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso344710766b.2;
        Sat, 14 Dec 2024 04:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734177979; x=1734782779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lj7TAViOyhM5Tz9DtHTaXE0RXb+8s+NSvyJXc3PyvFA=;
        b=azbJc21OHuv+GpOolYb/6z+DKN53ZUH7NkgCJ8X/ebsw4fN1DSvkADPIbOUWnL3Rqz
         4XmAqGmqYhbPsSvtcFtu3DCFvB44x9Czl69FWovmwNqaVSb+Tp+FpByd9SDMALfaiVoH
         UwtUpBreWKClI/03BrW4QmxlhGC7JmpEl9+0uCfO6NekoN3+kV+jKi9kjSVDvPN1aNFX
         IPk0sUhl9wOrZylG51dFDT0EVaYbaXFDcBKf8xYGbMgj1a6+BlVOR/9OjhqwI59FPEw2
         W+OlPk5WvD1jvkP6ZvFPl4AG2Mr87ei5K5+vRWJCzoETGx1ri/96wByurwr+Py72Bj+D
         v1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734177979; x=1734782779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj7TAViOyhM5Tz9DtHTaXE0RXb+8s+NSvyJXc3PyvFA=;
        b=p14Mq/j8mc7eEx6SbgpKulDxxBXWdu7iLBwlJbvFs7dEbs//AjKx2b4vLnlrNA1ulR
         dLO6eyYOOKR/fVW9JyEFeU6sjfiOB9L8Qpd9wb3bPmDkcLwUVbgBZIR9QQYPnMVHROCE
         JXJt9GT9g9yZNbsExT6n+5wKgfGubrQ8Zaylx8vljA5TbWrfuXxHti2jNu/CQe23neOC
         HXos9qwu+Q/lN0T8gbuC5dJm5REZD3eH8xTn/qo0SQfqQnHZ7QzI+VLmHscbhYI7el6D
         85ncjlrn1lmL42CQium4G7jzrb6RakXNCK+Xs6G7daplAGZ/x6K7maLAP5wHmREzzkA9
         CkrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVogOGIdaUg20zlaW/ci43iFZUX+n9t7cxqPovlvVt2nn1BnIDgi4SAfww058tG6GOJpjATRYzSvVW1@vger.kernel.org, AJvYcCWYm6iT0i7IWV12QuQ8zPKbhkTyAHIzwHTN46Xi/oXOJiRUvKDL+NzhwffsFU9R7rFH2432d3XIXk5Uquij@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzo+Uspkfsv2X6Txx+1Ab2yp4Q0OmS1u6YwSjGDibDanqQg78J
	KQHafU/kDkMnAXnRH3pC558eknMrf8f+YO8eGrbheTBfEnO/D182
X-Gm-Gg: ASbGncsoPrUSbw1+ZSQFFz1OlD1aHFzooDWFTBR+uImAob0m5+u8QEpxv4k/2MPEc78
	xAwUmK8jKcuyXAEsMJb2s1++kMUF+7C+vi6cewRErsuyz96uwPxsu2LNVVuhCZfF+PmZJy8MhGl
	0JORkBl125GuzPWI+zAMi8Efst41m0Om06SscJI9AsTc8DYekKawzSV1Mp1cYt86+yXj1gxWQz8
	RIn8CJcxlTZoo2+MlzfjhhLJgvF0SS+phtEqOmxcDTOvvguNc6lV0tQnFNH4LfTEdHj
X-Google-Smtp-Source: AGHT+IGfT/JSldciDYB6xIhVrdHrFi4SkBM0ogEz4ga6uzF6VHrATNJ4Iwm9FIoOV/SLO9gRjsnSiA==
X-Received: by 2002:a05:6402:3808:b0:5d4:35c7:cd7a with SMTP id 4fb4d7f45d1cf-5d63c318fd5mr13274071a12.10.1734177978997;
        Sat, 14 Dec 2024 04:06:18 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5198sm909183a12.8.2024.12.14.04.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 04:06:18 -0800 (PST)
Message-ID: <0fdc56cc-c912-45c8-b90d-e5bc1d7c1e35@gmail.com>
Date: Sat, 14 Dec 2024 14:06:14 +0200
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
 <2a7f71b6-0967-40ee-9d0f-d7144eafcd5a@gmail.com>
 <c0d58c4d-e3dc-445d-93c4-a2aed07af143@kernel.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <c0d58c4d-e3dc-445d-93c4-a2aed07af143@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 12/13/24 3:55 PM, Krzysztof Kozlowski wrote:
> On 13/12/2024 10:42, Markuss Broks wrote:
>> Hi Krzysztof,
>>
>> On 12/13/24 9:49 AM, Krzysztof Kozlowski wrote:
>>> On 12/12/2024 22:09, Markuss Broks wrote:
>>>> Add a driver for Samsung SPEEDY serial bus host controller.
>>>> SPEEDY is a proprietary 1 wire serial bus used by Samsung
>>>> in various devices (usually mobile), like Samsung Galaxy
>>>> phones. It is usually used for connecting PMIC or various
>>>> other peripherals, like audio codecs or RF components.
>>>>
>>>> This bus can address at most 1MiB (4 bit device address,
>>>> 8 bit registers per device, 8 bit wide registers:
>>>> 256*256*16 = 1MiB of address space.
>>>>
>>>> Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
>>>> Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
>>>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>>>> ---
>>>>    drivers/soc/samsung/Kconfig               |  13 +
>>>>    drivers/soc/samsung/Makefile              |   2 +
>>>>    drivers/soc/samsung/exynos-speedy.c       | 457 ++++++++++++++++++++++++++++++
>>>>    include/linux/soc/samsung/exynos-speedy.h |  56 ++++
>>>>    4 files changed, 528 insertions(+)
>>>>
>>>> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
>>>> index 1a5dfdc978dc4069eb71c4e8eada7ff1913b86b3..a38150fc9999ded1e1e93e2a9ef43b88175d34bd 100644
>>>> --- a/drivers/soc/samsung/Kconfig
>>>> +++ b/drivers/soc/samsung/Kconfig
>>>> @@ -49,6 +49,19 @@ config EXYNOS_PMU_ARM_DRIVERS
>>>>    	bool "Exynos PMU ARMv7-specific driver extensions" if COMPILE_TEST
>>>>    	depends on EXYNOS_PMU
>>>>    
>>>> +config EXYNOS_SPEEDY
>>>> +	tristate "Exynos SPEEDY host controller driver"
>>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>>> +	depends on OF
>>>> +	depends on REGMAP_MMIO
>>>> +	help
>>>> +	  Enable support for Exynos SPEEDY host controller block.
>>>> +	  SPEEDY is a 1 wire proprietary Samsung serial bus, found in
>>>> +	  modern Samsung Exynos SoCs, like Exynos8895 and newer.
>>> I did not check that much but this looks like 1wire for which we have
>>> subsystem. Please investigate more and figure out the differences.
>> This is not compatible with Dallas Semi 1-Wire bus. There are several
>> differences but the phy level is not compatible, looking at the Samsung
>> patent. [1] The most obvious difference is that 1-Wire is discoverable,
>> and this bus isn't. I'm pretty sure this is Samsung's own solution to a
>> serial interface through only one wire.
>>
> It's fine then.
>
>>>> +
>>>> +	  Select this if you have a Samsung Exynos device which uses
>>>> +	  SPEEDY bus.
>>>> +
>>>> +
>>>> +/* SPEEDY_PACKET_GAP_TIME register bits */
>>>> +#define SPEEDY_FIFO_TX_ALMOST_EMPTY			(1 << 4)
>>>> +#define SPEEDY_FIFO_RX_ALMOST_FULL			(1 << 8)
>>>> +#define SPEEDY_FSM_INIT					(1 << 1)
>>>> +#define SPEEDY_FSM_TX_CMD				(1 << 2)
>>>> +#define SPEEDY_FSM_STANDBY				(1 << 3)
>>>> +#define SPEEDY_FSM_DATA					(1 << 4)
>>>> +#define SPEEDY_FSM_TIMEOUT				(1 << 5)
>>>> +#define SPEEDY_FSM_TRANS_DONE				(1 << 6)
>>>> +#define SPEEDY_FSM_IO_RX_STAT_MASK			(3 << 7)
>>>> +#define SPEEDY_FSM_IO_TX_IDLE				(1 << 9)
>>>> +#define SPEEDY_FSM_IO_TX_GET_PACKET			(1 << 10)
>>>> +#define SPEEDY_FSM_IO_TX_PACKET				(1 << 11)
>>>> +#define SPEEDY_FSM_IO_TX_DONE				(1 << 12)
>>>> +
>>>> +#define SPEEDY_RX_LENGTH(n)				((n) << 0)
>>>> +#define SPEEDY_TX_LENGTH(n)				((n) << 8)
>>>> +
>>>> +#define SPEEDY_DEVICE(x)				((x & 0xf) << 15)
>>>> +#define SPEEDY_ADDRESS(x)				((x & 0xff) << 7)
>>>> +
>>>> +static const struct of_device_id speedy_match[] = {
>>>> +	{ .compatible = "samsung,exynos9810-speedy" },
>>>> +	{ /* Sentinel */ }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, speedy_match);
>>> This is never at top of the file, but immediately before driver
>>> structure. Look at other drivers.
>> The function speedy_get_device uses this to match the compatible, do I
>> just leave the prototype here?
>
> 1. Entire speedy_get_device() is unused so it will be removed.
> 2. Even if it stays, speedy_get_device() is not supposed to match
> anything. How are you supposed to use Samsung PMIC on different
> controller? These things should not be tied.


speedy_get_device was my approach to not make it a proper bus driver, 
since I've thought it would be overkill for the purposes. 
speedy_get_device() is supposed to be called by a child device through 
the devm_ helper, and what it does is: it gets the parent node, verifies 
if that node matches the speedy compatible, then if it does it gets the 
platform_device and crafts a new struct speedy_device for the child 
device to use. This approach is perhaps hacky, but it helps simplify 
things a bit by not implementing the whole bus logic properly, let me 
know if it's too hacky...

Actually, one of my other concerns is that S2MPS18 has both SPEEDY and 
I2C interface for communicating with host, and with current approach 
it's going to be hacky if we want to support both. I've not seen S2MPS18 
used with I2C on any real boards, but it should really be trivial to 
support both, and with current hacky approach it might be not trivial at 
all...

>
>
>>>> +
>>>> +static const struct regmap_config speedy_map_cfg = {
>>>> +	.reg_bits = 32,
>>>> +	.val_bits = 32,
>>>> +};
>
> ...
>
>>>> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
>>>> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>>>> +
>>>> +	int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
>>>> +		  SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
>>>> +		  SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
>>>> +		  SPEEDY_REMOTE_RESET_REQ_EN;
>>>> +
>>>> +	ret = speedy_int_clear(speedy);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Wait for xfer done */
>>>> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
>>>> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = speedy_int_clear(speedy);
>>>> +
>>>> +	mutex_unlock(&speedy->io_lock);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +int exynos_speedy_read(const struct speedy_device *device, u32 addr, u32 *val)
>>>> +{
>>>> +	return _speedy_read(device->speedy, device->reg, addr, val);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(exynos_speedy_read);
>>> Nope, drop, unused.
>> This is intended to be used with other device drivers, this driver in
>> itself doesn't do anything, it only configures the controller and makes
>> it ready for transmitting data, it's other drivers that will come (e.g.
>> S2MPS18 PMIC, which uses SPEEDY for communication with the SoC) that
>> will utilize those functions.
> Post entire series, so we see users of this API. If you post API without
> users, it won't be accepted simply because there are no users and we do
> not want dead, unused code.
>
> Anyway we must see how you intend to use that interface to properly
> review it.


Sure!

>
>>>> +
>>>> +/**
>>>> + * _speedy_write() - internal speedy write operation
>>>> + * @speedy:	pointer to speedy controller struct
>>>> + * @reg:	address of device on the bus
>>>> + * @addr:       address to write
>>>> + * @val:        value to write
>>>> + *
>
> ...
>
>>>> +}
>>>> +
>>>> +static struct platform_driver speedy_driver = {
>>>> +	.probe = speedy_probe,
>>>> +	.driver = {
>>>> +		.name = "exynos-speedy",
>>>> +		.of_match_table = speedy_match,
>>>> +	},
>>>> +};
>>>> +
>>>> +module_platform_driver(speedy_driver);
>>>> +
>>>> +MODULE_DESCRIPTION("Samsung Exynos SPEEDY host controller driver");
>>>> +MODULE_AUTHOR("Markuss Broks <markuss.broks@gmail.com>");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/include/linux/soc/samsung/exynos-speedy.h b/include/linux/soc/samsung/exynos-speedy.h
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..b2857d65d3b50927373866dd8ae1c47e98af6d7b
>>>> --- /dev/null
>>>> +++ b/include/linux/soc/samsung/exynos-speedy.h
>>> Drop the header, not used.
>> Same here, please clarify how this should be handled. This driver
>> implements the devm_speedy_get_device and read/write functions for its
>> child devices in that header, future drivers for e.g. PMIC would use
>> this header and call devm_speedy_get_device to get a speedy_device
>> pointer and then use read/write functions to read/write from the bus.
> This needs to be proper bus with proper speedy_driver clients. See how
> other buses - struct bus_type. Recent example of bus using platform
> drivers for devices would be pwrseq (power/sequence). Not so old other
> bus using its own xxx_driver for devices could be cxl or ffa (arm_ffa).
> This current non-bus approach, could also work if this is really Samsung
> specific. See memory/ for examples of MMIO buses and MMIO clients.


Let me know if the current approach is acceptable or not, it is fine in 
my eyes if it needs to be a full-fledged bus driver, but in my opinion 
it's a lot of effort and additional logic for a niche samsung-specific 
usecase. Although I've heard that they're still using SPEEDY in newer 
devices as well, perhaps for more advanced purposes than just an 
interface for PMIC, which would mean additional things to consider...

I'll be glad to hear how you think it should be implemented, because I 
myself do not know a lot about kernel drivers like this...

>
> I don't know good examples of non-MMIO buses not using bus_type and I am
> not sure whether this is accepted in general. I'll ask on IRC, maybe
> someone will give some hints.
>
>
> Best regards,
> Krzysztof

Thanks,

- Markuss

