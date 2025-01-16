Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5124A7C2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737027707; cv=none; b=MGunlD3VQj3I7PhGmvb6wzBqv48CmNUZnHJ57L12imn5H2UAVTl5T+imoEBPpJEho/ZPerzHCuA1t+U3g9b7ay/DWzWkpakNZmWmWuYFau1sBrf/uysJo1WqojgxsJ2lca0kFh2VyTnHYfIkk/GEd/084ZHloP7Eza+uyLeooTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737027707; c=relaxed/simple;
	bh=grVoZNVjcvy9MCcSf9CkrEgnrvso4XYxU656pIV7e5E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=R34AXmagaA1tpZ3QN8b3s1dIpFiSf7Av/iJfMUz3DhKQN8B5wGiUae9sLnEIe5FNkUsaU/HgpRCaIxtoZD6pobvvpewzqgw6HQp/7VawyglwO5Nk4ZWwtvoytF5MnxywhSE6fxSvxjxhfE9czvk4rmfsxEf8Lq3jK9iyv+j/BhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Az1JkgPU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Az1JkgPU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d6d5765so477382f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 03:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737027704; x=1737632504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bKtUMEoqDHLTfhHmG3inCWsYClLTJL5ZLVp5zayXN6U=;
        b=Az1JkgPURBxpMk2FaVwXIK6P2JWoRJf6sXZ39rB3DozZBZxgpBIjvEkVVwB2Kqz0IU
         I0a1ed9CWyXwdezV9U+7Z/HObjfGYQt8jyWLJ9xyhtRQSAK8vNnXEGzs6ybl0hwE8yM1
         +F+W51Lw9/Lwko9m6YcADY11v04rUMQ0+GCHiHqsKrQ+myzIWJOhoIPRQw1qeZLA81I2
         ftcE2CwXtArX9KaEYb1SXkEmrrXg23/fAWHdGs1zuswXAj7fcKRc8CMgswL5S5q28CAK
         DBgLs7kBMfxwWsft8Okbuhf9anLvYhzlWqF4ENMjhcVUCrF1p6faEcxVhUJgnggymq1U
         1iDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737027704; x=1737632504;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bKtUMEoqDHLTfhHmG3inCWsYClLTJL5ZLVp5zayXN6U=;
        b=gARRn+6gIn4viJIO2SPL+MtprezMcN9RtI8e9et0xKb76rwixOun14fQpcYnD4MRzN
         NboNytQTSnAQC0gOUPzFufDx+Utd1o6LXjHP3JXHy2yyuLVJjmDGMJtAizHgcIVjeWFp
         vj4UXqZW0443m7JqgcNOoNqffD9wcs2BVZRVCvDu6eiSt0jPQb71D7JqiZ9WkdI+b43S
         f1Z9fZTA2bX0ui8IKX98v+BBsoRIZ1nE6IP1Hl53nnyMhvEYgmtGkFNE4LwJwyctzLrW
         mACen4FdcY0jVfnfi7rmPQY8mxlhQgsLkytI1piAMQlC8CzDPhSwtgI+9u0KjjCUPrA0
         qbow==
X-Forwarded-Encrypted: i=1; AJvYcCW61pWm+6agSBFYiu8xAWpDqTzJQ+Xnd1vcl7kAyWSkNHLSMKmku6YtX9FJ0Y9FgTGik3sjyS3grg1BcVxqCe4ITg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZTverWSouoyHUyUAK0JJCEjgJmp+ciK7Dq28bNlCU0fKhJcI
	Fi1T5jjq9h+mLHHOd7PUK0et5/C5vjWxyTkVzOeCx4ZPqVXG8uWltpu86j1bSpQ=
X-Gm-Gg: ASbGncst1D6P+vWg0BrLy0Xg5KljhGhS7JHY9hgL4EJdUKJIKKbKMa1aYTdvU0/gGv/
	hLe4/2YBEGHDlE0XBygTrckNUTWRp+u4aoU0ruxpj+nOp30c74ZxaOu8cMCzvsv/v5wWk9QsDIO
	21nmwE1eW1KdjYT4luU8suTS/BDcySNEZEm31p4Oz2i/7v9aMLrXoTQGl16oikUC9wqQdPuDdWz
	jE/BsIztPXQEYnN42QzWa5X2sK7W0LB+BT7L5aAvwj6IOptxaaIEuXA4DUeYll+MQ==
X-Google-Smtp-Source: AGHT+IFueE/gZTYtweq/GR16SLOOq+RSDS7PYuc5QwoykXqiYGNy+orWNKBAzKyMcjXwFzsBcfLt3A==
X-Received: by 2002:a05:6000:401f:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38a872f6193mr33619540f8f.35.1737027704561;
        Thu, 16 Jan 2025 03:41:44 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74aca93sm57515965e9.13.2025.01.16.03.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 03:41:44 -0800 (PST)
Message-ID: <77eeed18-4a48-4407-ae83-7a922045b29a@linaro.org>
Date: Thu, 16 Jan 2025 11:41:42 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] firmware: add Exynos ACPM protocol driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 peter.griffin@linaro.org, daniel.lezcano@linaro.org,
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de
References: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
 <20241220-gs101-acpm-v5-2-4f26b7fb3f5f@linaro.org>
 <8e6bade0-5184-4bf7-b1f0-103a77d0f98b@kernel.org>
 <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Language: en-US
In-Reply-To: <060c7a96-c1ed-4c97-8a3f-f510102466f9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/31/24 2:32 PM, Tudor Ambarus wrote:
>>> +config EXYNOS_ACPM_PROTOCOL
>>> +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
>>> +	depends on ARCH_EXYNOS || COMPILE_TEST
>>> +	depends on EXYNOS_MBOX
>> Is it build time dependency? No || COMPILE_TEST?
> There's no build time dependency, I'll drop this line.

There's no build time dependency on EXYNOS_MBOX, but there is on MAILBOX:

ERROR: modpost: "mbox_request_channel"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!
ERROR: modpost: "mbox_free_channel"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!
ERROR: modpost: "mbox_send_message"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!
ERROR: modpost: "mbox_client_txdone"
[drivers/firmware/samsung/acpm-protocol.ko] undefined!

Will replace the line with "depends on MAILBOX".

Thanks!
ta
