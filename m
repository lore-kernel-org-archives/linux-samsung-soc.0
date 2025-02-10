Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B5C1B6547
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177951; cv=none; b=FdDrsrPpP7utsrZPCDisWbh8DTgfUgbAk9Cv4FnFb6mW7Wx9q0P/Qor+WoZVt+EqiEUM+Yute7i4Yoy85K18TtSgTdYt2EREHEk+EcBxoALgPv2iOkllG182r0Qd/f5iXMU00RnGsuH34gO33HioTiqkJqhygZvKm53KjGPUwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177951; c=relaxed/simple;
	bh=r9kfscMu2nQ0HRBU8e9l53pIAaPhrUF5mA9gkyOUvGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxZCBUvzMioAHDaQv6yTyxMHS5I9uo4eQ/Hsruhb4CZN3tkT5FfAa4dgU6QlooHdqVFoWKOTgMWjf/HYO22A7+VnFBvkxYlFnCfSFxBXREsp8MnJLkDl+MQfzk6xLLQWtB/VIquDNCoBoyTxjDwk3JTPDoKskS3fkB8SquZM5Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QKQz9lJh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QKQz9lJh"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so2201641f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 00:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739177947; x=1739782747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgguTSFnjwWEUxBDa2C5Pf4WCfOFI/5UFo5VErVUJi0=;
        b=QKQz9lJh4MU4d7M+yyZEL3U+fQY/fZe7sKfb1tWuatdbn/tbxwx31c8q8S4Cvc/IdJ
         4H2RgNasN2geJh+pWXv3I6FXwTffx9T2SpweypnvLKQ7nQUarr2sZrNZ8FQLhv7jzfde
         hev4NIWOf1iprkZbItLcR0ynUBiCPMLPoNGUocwu3I+GEekr7420rdfP9y5saow3ekuc
         FHGvQ/hOo3fyDEzfpjhWvulSguero1dQiYg57qQ/DwvWKgXnDWUyeSnJIgIQ926mozve
         F9Ms0+kQCfn6KsWqfIndBEveIe1Ovb6Tc4dtR6HaLd5+SlGL9A3TdsKRcWMXvu22zND1
         vhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177947; x=1739782747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgguTSFnjwWEUxBDa2C5Pf4WCfOFI/5UFo5VErVUJi0=;
        b=k48VrjZmJ2SmBhjNSQNTEC6B93G4Knwl2oxFmKGI5IIwljcSy7Yrw4qmOODZYHp9TE
         Qqu01pZfbCB5/JWTi47HID5JgoiOgJUxNnbG+91X4VycW7pt8q4/avdRU7zQrZnDrfkW
         T90cN2UirgY8g84Y2agvL+ES8vI+UkO3tU/BNlxIOUQ+XJZzP3+IDasZEEbldmQRwL2j
         UNZtuh6vlA8PaBq7CEq2yB253u93z3acMbpkVDj0VxpR51AA7w+4KaDQl0V3LM4tiv21
         yxR5EbnGrx25IdCBphpZpPM6mmRIM1G9X8Cja27OKC67HttIQWV17tvXWPqZhkdkOR01
         7rjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA8KLYa/8xIcGxacGKvQlIQBbZ93lQEuq8+0iDxyEjQDxFwBmXcKsvf29en89rJB8Gv241Tyg2kH5xDW1KAEcgag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1rBV8zelIUscQvATQE/0L/BZVAUwGu+REtQH1/EBQWYw/zeT
	RL2VcmJ90n6fgucbebBnOHzkHN6VZkTJh4bLLVZA7fGoVU7BxcjxAP7VSB8e+WI=
X-Gm-Gg: ASbGnctN/0VaDmMiODwyosuV2ZkD8nZeuNBr3+Y/kESpC85SYeIUia2kX3/y4QJNITf
	89R7HDDGCOtaoA4GB7Pci6W0w9zRUJzQ/fM7CGDQ5WZuCO3bzqW+cGBaQfBaPm6/ya+6LC7r+nC
	xunKJhTGs9h6UdMU15/7YRRKms+4wWHJBOGlrGaLkCMGLR2X2xDE/IIlGkFVmIhJ2dTvgCpYqIb
	SfMGFiC34Zjt71McQCLRHcMDgAe+V+fzwcMI0Hu2Btlr96XlTmGAYriSkXvydJcHYj+YVzx8FRP
	BiMQaHtn/AHyQU87qZXiRg2Y
X-Google-Smtp-Source: AGHT+IHW35O2w+OVAfjf6xNzfb+RSzDit7DIG4eCcKdu75kyP3tGrbONMFt1iHptvel8q6LbiT3P3Q==
X-Received: by 2002:a5d:6d8d:0:b0:38d:dac3:482f with SMTP id ffacd0b85a97d-38ddac34a13mr3776794f8f.20.1739177946954;
        Mon, 10 Feb 2025 00:59:06 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4d826c6sm6159674f8f.69.2025.02.10.00.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:59:06 -0800 (PST)
Message-ID: <503b7ec9-e0b1-4351-aa34-3089b2055eb9@linaro.org>
Date: Mon, 10 Feb 2025 08:59:04 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] firmware: add Exynos ACPM protocol driver
To: Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Will McVicker <willmcvicker@google.com>
References: <20250207-gs101-acpm-v7-2-ffd7b2fb15ae@linaro.org>
 <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <e1fffd3b-d3dd-4f46-b7b6-1f03f934dd30@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/8/25 3:31 PM, Markus Elfring wrote:
> …
>> +++ b/drivers/firmware/samsung/exynos-acpm.c
>> @@ -0,0 +1,771 @@
> …
>> +static int acpm_dequeue_by_polling(struct acpm_chan *achan,
>> +				   const struct acpm_xfer *xfer)
>> +{
> …
>> +	do {
>> +		mutex_lock(&achan->rx_lock);
>> +		ret = acpm_get_rx(achan, xfer);
>> +		mutex_unlock(&achan->rx_lock);
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&achan->rx_lock);”?
> https://elixir.bootlin.com/linux/v6.13.1/source/include/linux/mutex.h#L201

I'll replace the open-coded mutex handling with cleanup.h guard(mutex)
and scoped_guard(mutex, ...), thanks.

Cheers,
ta
