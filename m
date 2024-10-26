Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6961D4618;
	Sat, 26 Oct 2024 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729944001; cv=none; b=pInsYP2SB00W8uZ4Ws7yXA3Zlk4Jz6Dq4W5YjsmXG/0QAliwpknKAU+r+ZNXTB/+HvZtWvy54WRwuFF8Bm+vh/EuPpJ94s7lrlwtRqV6F1znrIT99/HQRd8zuZsk8zj5pN8HUCbJmoylAhQ7eDVbGdPiQTU2XupE3+vG5i1+yFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729944001; c=relaxed/simple;
	bh=3hRvwX8abU6mhUzcO7BdyglpggcaxGQag0aNV4NkYU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9niaI6EodlNIaia0tk2/y8NlbHJPVdmR/qojBkA/c1HhWEckKFkLQEVkGFA/5ah4g0d5SRRhYpPO2MQTfo5ffx01BfMW9HUxD0UAdf4NUcqCOEmdPClfNHhshmp0TweSmiBj+ArAHTceS40A5tlzTR9+t/smRMAgeNkZBpNMZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP5DkZr9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP5DkZr9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso385600266b.3;
        Sat, 26 Oct 2024 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729943998; x=1730548798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hRvwX8abU6mhUzcO7BdyglpggcaxGQag0aNV4NkYU0=;
        b=AP5DkZr954yhweGw/BjmeF+DSjiV+oiormKnqO8Gtf520sCQCMs+P0qSAMRmxsnphZ
         kEx6pxtTjaw3v/VFoBq95toPK2Ahkim5BqJqK4YiTPNQN8yP7MhZX6eleAWfytbQPKWG
         nnAo8hREtVlhoZYccXG9Kv4ndJcV2/x8upNDMdYKlesrc5tPYXR+5Ex4DoJgqJRSgXMw
         Jkw83EfSkjx3NyvatIBkQDPjM+f3xyUR7WV7Wxu0QBqhpQ4e7gZAjQoDLQJ5fV01Km9g
         nYH1vrtPih7vWWt+8GFb8uG3VSpYr7aylm2eQK11vDKz3d4sGoVrF7WQ+snEakDmUb9j
         4KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729943998; x=1730548798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hRvwX8abU6mhUzcO7BdyglpggcaxGQag0aNV4NkYU0=;
        b=M7etBctLZnlTUuWDUmIMWawT5kVz2Z1NaI0hAY16EAopK7RKN7GFg3oZLTc4g/FuZZ
         EPi4tBrzLQiFnBdjlAnC2TRVB3nhbHSewmeLXozOQ4lJsRbP3x9C8WM8q2pthb+ZHT8p
         ghz9ixWlzZUFhCccgxzVtahpVEO7Ljt8/YtJ5WifRA3vudHRUuZaLTBov0MqKBFAJ/o1
         QhgY3UHyJzgPWSG3Gzpjkihbcu0YG5RBfjOEyXzeapzYfxB3qIvbt7XdxIM+YdpbhBmV
         HLZ3baXP8vqm6RhEQX9vYtxsRJ/ObC8ecbLClEPvKyC2i9THzZoBMK1mY3Xnq1UFPrYv
         ZhLg==
X-Forwarded-Encrypted: i=1; AJvYcCX9GG7jG2aVO2sfB+cCJRXr8HP2OPcSfXUShuIm5Qrh++CE/l8+sqZaHlcVQzjAYjsI4K7x7A7xW5yK@vger.kernel.org, AJvYcCXPTwdT/bZbBnObvnPIr9c7949nBBhO7bC3kAedadq44/qwbFGWt3zwsFQgvuS5WoivClNGFrwKOTOqkVv1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx48H3yXwZRR6cBeNdg9MJy3JmyXgNZ+xPNRoyjOJOGRxX6Wgsz
	E8NYQrapiBXf9i/Vz8vR+zl7pdxOl5DZ+qkXhlAkXO8K3DXJkba2
X-Google-Smtp-Source: AGHT+IETv0EHj3RY4NKxX4kQx37sy1UdTF3SyBHlZtuMNE+HoPSPWxbCv/DN5djcxSrl9V5JqeBi7A==
X-Received: by 2002:a17:907:86a6:b0:a99:f833:ca32 with SMTP id a640c23a62f3a-a9de5cea32amr184020166b.18.1729943997814;
        Sat, 26 Oct 2024 04:59:57 -0700 (PDT)
Received: from [192.168.1.102] ([94.131.202.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7d69sm168167066b.7.2024.10.26.04.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 04:59:57 -0700 (PDT)
Message-ID: <8e6810f2-366a-4c52-8406-79ea3970b530@gmail.com>
Date: Sat, 26 Oct 2024 14:59:56 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] arm64: dts: exynos8895: Add cmu, mct, serial_0/1
 and spi_0/1
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241023091734.538682-1-ivo.ivanov.ivanov1@gmail.com>
 <8240d3b4-3367-4f13-a42f-0f40da08e371@kernel.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <8240d3b4-3367-4f13-a42f-0f40da08e371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




On 10/26/24 14:53, Krzysztof Kozlowski wrote:
> On 23/10/2024 11:17, Ivaylo Ivanov wrote:
>> Hey folks,
>>
>> This patchset adds device tree nodes for multiple clock management unit
>> blocks, MCT, SPI and UART for Exynos8895.
>>
>> Exynos8895 uses USIv1 for most of its serial buses, except a few that
>> have been implemented in this series. Support for USIv1 and HSI2C will
>> be added in the future.
>>
>> This patchset is dependent on [1] and [2], which add driver support for
>> CMU and UART.
>>
>> [1] https://lore.kernel.org/all/20241023090136.537395-1-ivo.ivanov.ivanov1@gmail.com/
> I cannot merge driver changes into DTS. Are you sure you have driver
> dependency?
>
>> [2] https://lore.kernel.org/all/20241023090902.538040-1-ivo.ivanov.ivanov1@gmail.com/
> I cannot merge this either. This is serial tree.
>
> Maybe you these are not really dependencies? What is here depending on
> what, specifically? What prevents me from applying it?

The specified patchsets add driver functionality, as well as bindings,
for serial and clocks. This patchset makes 8895's device tree a user
of them. I guess it's not really a dependency, as 8895 devices should
still function without the driver compatibles merged, but there's gonna
be missing bindings.

Best regards, Ivo.

> Best regards,
> Krzysztof
>

