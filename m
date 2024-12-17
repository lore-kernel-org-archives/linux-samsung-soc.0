Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4F1F8662;
	Tue, 17 Dec 2024 17:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734456543; cv=none; b=C4HkFEPHwjHQD3boGjCQ3UuvJuoFt5gYL1XGity2WzTHduVCNCg9GiTV1hsGayCx5SDGqlos5FQMIO0xUYsgF1g0LPZamwpcQeIb2wGYZYO/R1RDPz2/JiG4zfH60pGUv2B+FNxXFhvmTuTajSz0u/v5NtES15EEAW4RseoGIYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734456543; c=relaxed/simple;
	bh=SDZRwfqqgA3iPR9w6cAxcIntPx8BDYD/29C/D0Eiy+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZM4Wv3/goEUwXDauIiho+neQUU/5B7wvYKo7G8VfrLnYEFtpJGdD050VCIt4ruFxyj1n84auCem395azacygS7gJ1uKUoaBN7MmZ71PZVFsC776pIosFt4knaez3ajyiU7dG1z94OTmCk4EX7vOwYrcWxKZLILEpKQ6Bu9FsORo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNVN7xZ6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNVN7xZ6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so743666066b.3;
        Tue, 17 Dec 2024 09:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734456540; x=1735061340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MlT5awTGC4sIGCGXK5OnleS50Xtdr2YFtm48iJlzRFw=;
        b=cNVN7xZ6DS1lPp0u+OsIe2CdfCfKpozXPxZ1q++M1K2QyLO2YR1ts21A2lCUDhK5Vp
         GExMhu7X8axHsySilEcXevPy3FY6PgAol2JMmgiGa71IviXyjtLdhqPiOLTvwRuu2JDc
         bDjsIGlFwIBxNt61TQPq3yeKbn/51SA5wmDG8bXO9CCksITZmdgPD/jVZ8C5EhPjyhyD
         /6rKSIlWTfb9QJU8eymJKupfkzMeKlLZA3h5EfuHQC3n47W4S0VYtjKQCQnuyC2d85Bl
         dJZR7oI+fLQXtBBxAIdsPy+dJavaq3BcSP39sFBg8qbM3YCBGy+xu6/43dvTlZhQBz4s
         HIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734456540; x=1735061340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MlT5awTGC4sIGCGXK5OnleS50Xtdr2YFtm48iJlzRFw=;
        b=u8SxSKz7CbVXw7j2OC+gVju72pQY9jfgS9FVQcCdrIe4EGEmeNcZb9ymFmFgj7wxsb
         Rr2sNHOU8V7pDbEIy0anCvR+98NOPCsIZ0bZQU2TXXhG2eh4b1Hg6AL/eq7dmWU77Fu/
         4oKej78mjMhiSYpDlQq8VwFT6E1BPv4nsGvyWBO6BNU7r3iekMrZwrOWdt/lcsLB9cGP
         TciNstLaRCZCahy2W5CLaIGETMjF8+CJoB3Oqmz2mMQ9elUQZQ+RTgOLYrphTxooFKkv
         lgcY7Jn8b9vwTPCofdM1FqmqUNgpYh6umyuP1hOwKFbLm/amS2MkR6tYd0nY/rfvnxrK
         VPKg==
X-Forwarded-Encrypted: i=1; AJvYcCVDFumJTJmBfZK/WaPcckxou5x2yWAPtURwnKfKmU2ph2c760gdwMygppdzku3YnWgakx1mSR4QMqtFLsiL@vger.kernel.org, AJvYcCXyDIY1wn7fD1N6HqRcLvheySbdDmmboiH93ahTrorB8FEXE5y9R1rOV77UaO6lKaYar1C2NxGgcWH8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9krxU5GsyD2UdMEhWC4Mtywd5ectsXw4MEHRzyAjgNrf/i2C
	4FLAQyff2ouHujPxPMpc6oLIpD1wFM94ZMij4YTR6JJqaL0+RM/P
X-Gm-Gg: ASbGncsN2DTKjPjVQrvd7lGQ4R+qsSM14hshLTxcoY0YI73O2CgtmkMfPnSsNClY3bI
	pV3y5XMm4FUrVuqAHpkKBNpsSQgaFDGoeYMjeLfpftbBn5rb0EVDwGlGZ/+stpxTgPSTIezMGFf
	L7LafDJMeT7VFlEJlecnUQXAakAaruwq6ehejG46N4bCfpDrysOd6oRBn5VGTiYy02jWnMkRUeS
	ueE5f/fDoE3YIK7DNG2bmKtFQROzS2TButue9O6ALqrnvj7O/SbpCFprF/te8LzkObR
X-Google-Smtp-Source: AGHT+IHcp4XwIgo7xvt+0VSkrN3JB/JHOT9tNE7pzGU72V3oIVzWhQPJqUgLapq6hxpKnsF49TOc+A==
X-Received: by 2002:a05:6402:27d4:b0:5d0:d91d:c197 with SMTP id 4fb4d7f45d1cf-5d63c3db906mr42364362a12.27.1734456539501;
        Tue, 17 Dec 2024 09:28:59 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359831sm463073966b.95.2024.12.17.09.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:28:59 -0800 (PST)
Message-ID: <9d7b9ee1-9b45-4892-826b-e2802adff990@gmail.com>
Date: Tue, 17 Dec 2024 19:28:57 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
 <3c067b26-cfe8-4939-afce-5c8753767715@wanadoo.fr>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <3c067b26-cfe8-4939-afce-5c8753767715@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Christophe,

On 12/14/24 5:52 PM, Christophe JAILLET wrote:
> Le 12/12/2024 à 22:09, Markuss Broks a écrit :
>> Add a driver for Samsung SPEEDY serial bus host controller.
>> SPEEDY is a proprietary 1 wire serial bus used by Samsung
>> in various devices (usually mobile), like Samsung Galaxy
>> phones. It is usually used for connecting PMIC or various
>> other peripherals, like audio codecs or RF components.
>>
>> This bus can address at most 1MiB (4 bit device address,
>> 8 bit registers per device, 8 bit wide registers:
>> 256*256*16 = 1MiB of address space.
>
> ...
>
>> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, 
>> u32 addr, u32 *val)
>> +{
>> +    int ret;
>> +    u32 cmd, int_ctl, int_status;
>> +
>> +    mutex_lock(&speedy->io_lock);
>
> All error handling paths fail to release the mutex.
> guard(mutex) would help here.

True, I didn't know that such a thing existed, thanks for the tip! :)


>
>> +
>> +    ret = speedy_fifo_reset(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
>> +                  SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
>> +    if (ret)
>> +        return ret;
>> +
>> +    cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
>> +          SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>> +
>> +    int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
>> +          SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
>> +          SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
>> +          SPEEDY_REMOTE_RESET_REQ_EN;
>> +
>> +    ret = speedy_int_clear(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Wait for xfer done */
>> +    ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, 
>> int_status,
>> +                       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = speedy_int_clear(speedy);
>> +
>> +    mutex_unlock(&speedy->io_lock);
>> +
>> +    return ret;
>> +}
>
> ...
>
>> +static int _speedy_write(struct speedy_controller *speedy, u32 reg, 
>> u32 addr, u32 val)
>> +{
>> +    int ret;
>> +    u32 cmd, int_ctl, int_status;
>> +
>> +    mutex_lock(&speedy->io_lock);
>> +
>> +    ret = speedy_fifo_reset(speedy);
>> +    if (ret)
>> +        return ret;
>
> All error handling paths fail to release the mutex.
> guard(mutex) would help here.
>
>> +
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
>> +                  SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
>> +    if (ret)
>> +        return ret;
>> +
>> +    cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_WRITE |
>> +          SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
>> +
>> +    int_ctl = (SPEEDY_TRANSFER_DONE_EN |
>> +           SPEEDY_FIFO_TX_ALMOST_EMPTY_EN |
>> +           SPEEDY_TX_LINE_BUSY_ERR_EN |
>> +           SPEEDY_TX_STOPBIT_ERR_EN |
>> +           SPEEDY_REMOTE_RESET_REQ_EN);
>> +
>> +    ret = speedy_int_clear(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = regmap_write(speedy->map, SPEEDY_TX_DATA, val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Wait for xfer done */
>> +    ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, 
>> int_status,
>> +                       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
>> +    if (ret)
>> +        return ret;
>> +
>> +    speedy_int_clear(speedy);
>> +
>> +    mutex_unlock(&speedy->io_lock);
>> +
>> +    return 0;
>> +}
>
> ...
>
>> +/**
>> + * speedy_get_by_phandle() - internal get speedy device handle
>> + * @np:    pointer to OF device node of device
>> + *
>> + * Return: 0 on success, -errno otherwise
>
> On success, a handle is returned, not 0.
>
>> + */
>> +static const struct speedy_device *speedy_get_device(struct 
>> device_node *np)
>> +{
> ...
>
>> +out:
>> +    of_node_put(speedy_np);
>> +    return handle;
>> +}
>
> ...
>
>> +static int speedy_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct speedy_controller *speedy;
>> +    void __iomem *mem;
>> +    int ret;
>> +
>> +    speedy = devm_kzalloc(dev, sizeof(struct speedy_controller), 
>> GFP_KERNEL);
>> +    if (!speedy)
>> +        return -ENOMEM;
>> +
>> +    platform_set_drvdata(pdev, speedy);
>> +    speedy->pdev = pdev;
>> +
>> +    mutex_init(&speedy->io_lock);
>> +
>> +    mem = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(mem))
>> +        return dev_err_probe(dev, PTR_ERR(mem), "Failed to ioremap 
>> memory\n");
>> +
>> +    speedy->map = devm_regmap_init_mmio(dev, mem, &speedy_map_cfg);
>> +    if (IS_ERR(speedy->map))
>> +        return dev_err_probe(dev, PTR_ERR(speedy->map), "Failed to 
>> init the regmap\n");
>> +
>> +    /* Clear any interrupt status remaining */
>> +    ret = speedy_int_clear(speedy);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Reset the controller */
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_SW_RST);
>> +    if (ret)
>> +        return ret;
>> +
>> +    msleep(20);
>> +
>> +    /* Enable the hw */
>> +    ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_ENABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    msleep(20);
>> +
>> +    /* Probe child devices */
>> +    ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, dev);
>> +    if (ret)
>> +        dev_err(dev, "Failed to populate child devices: %d\n", ret);
>
> Could be dev_err_probe() as well, at least for consistency.


I agree, will fix in the next revision.


>
>> +
>> +    return ret;
>> +}
>
> ...
>
> CJ


- Markuss

