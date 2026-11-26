Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710199;
	b=ijtaWhoDmkzbBk66ig5Abd6Yz0LUzh1gHID6eTKNXC+eYRuikVSrFLkRpJZBrxu0Y78M
	 qWLwuE2ccidtLh2P5lOytiKFSqO4mytZ0MZh9ygjuP438iFHzI9PVqZoRhNfuEkTUwqwL
	 Tb+zFPI43EoQUf1zP3nt2yKLhVYfPc3vLnp7iRzhPS0E/C9B17epnf+JCbo+dt084fvNC
	 NK0AFttX/t/F280FDx/+WTkDOlC19xXX1FkphLftVOeMksWQe2F+bLm6SddtGNrUWthRg
	 67lTwzjRTwOeISRv5E/3G4CVfuNSOn1OrB4rPLwN9uBZvwLgXpSUvAyCGjCxG98tR6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
	b=i6txsDuy01+b7yG2oHDW/q2D3jajEoHw7FN+vnG+YMgxN9BwZaP5XYy3MFlNLGWzFRe3
	 Yy9ODHnXjY9fCylhhLZ09XJIa8qw2EZnkUpMP+JPi1yFVEaAWwP4ciWpomRFsfjAoH/uV
	 duz/ZYgZz3HfSuXDgFAIwUABR/eriPiAanY5bN528yKWqi1y44rNVUskKavUn3Rm+ur1H
	 Quemj30qVavuBTUO4z3RantsNjvAFN9EdH88+7QUUOowwl29OwteP0OuPfHCVoCDF3Mi1
	 GloHzvAlRMgHqgZqsE+hF+SDpwRFmNfmlXevGUChuyhM9eDcUgctYXSq28K3kJYKL2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=za0tUy5b;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA365606A31C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 16:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA365606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=za0tUy5b
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so58461005e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Nov 2026 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795710197; x=1796314997; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
        b=za0tUy5bDG6DeUVR8UOXXFv4wekZtvi6jD1JMYNdlmu6vgxWoOIVdG40c4k0jCsCkK
         0xrpNS2Gr246iS5McYjs/kKq5cJoMhAKBpSuABY3v4SjI0/Bw2qPrI5ctzZU6zA5gz7A
         T1eJ/jaQVTaete8XKxHl8kQ5iVOUahGjaAHEOo9RlkBpDqg3bxGiwUsSn044wn1G2WOc
         YVYwc8ct7Y72VqPk/7/lDtZJ3TKMRQw6TrJWogVwJ1i1H1/3Gba2Nv7Hgp+GJLr+NlNe
         V9ulQozkpE7KCSuOnrg86Fea1O+9JN+xkj6y/9EMeALFZwDYDF+Rgu5Hs1XuN+k6C0Bw
         BTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795710197; x=1796314997;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg1T9Dulq0nwdntFgrBA2i597/7t38j7zfu/CiMvEbE=;
        b=q1v2Ojlx6UcVOFspJoYzOuHN30ZuL9XnM3SSgWF5Aabd6T6MQPF09OJwFhgSDs62wV
         viH4WdFL/BSzG4K4DIOVZ4YsDLLfMo8UARiA1Vn0ldulVmNvm6BQb+cQbPgoXC6KQ+oS
         iEqMtI+DKmqe96v//qRXAvVoCGNrOF2D4mfDpfyNoj0yAQZBHQpLMl4Z/pSpnPO7B/68
         VM2vKLvKWkdOVlvihzKrnGupECQWHR022twh+gJTL5f7UVKe84FbZTHQdaF/kCXWqHQs
         bVc6AjYTpEZd5ghlYMvICcnWP4eZS/Y+YoTHIjepPqDqcqonMRpCWPQ1FTJNzwJVs6Hr
         8zdg==
X-Forwarded-Encrypted: i=1; AL+hErHH9eY719UnlQ85jUuQi20l5bgvQ6p6W5gSclkTnaFI0w3Wy3iFJFJdYVIjqBz7CAtaJl4VyjUZBqK7bVLCBNXcsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hVQggcwSl5lKN4pr8cQHfymWZlLFHgLtE8G+hT4MXsZXlJ8AQ
	tnV8m6oM0z5VRizQIwVRrS38sOSRUZLiFnNSEv+9anBHAGmnJ8NpfYuLPo7s+BudkFo=
X-Gm-Gg: AZFdTZfbPrV0QtqjskH/MohOng/aK29vzLRyi0Ps/+x3vusuuknGsR3hVghwbbNl0nx
	WYmcFY4K+3hX9nTjBPlrzgBUWwtcKGHRFpnYa1/ucCiyhbghH/J6ilC7rk6n4xjaHdLE0KLy9Zu
	YjYB8uG3Xqfos9cKlSpZ5mMzXnx1GYFKrZJh8YkmPNnfRKxVjjgozXRKyva7KHAmplZjNtbvx9C
	FuSzCrYvUBTGdhT8l+sImEK8BJ3h7tVR1fI32anZmEiejUxigwBSrvahFWDt+DhKjGOy0AtQ2vI
	7zL/avVCSbWx8tz5Mkc3YUhWajQgTkE5IJfj5B9AhPGJ4zNnKC7JsqBIpNUky+BSY08D04Q9oOo
	ixGocgLd34OZG6kyWfkwOllnsIyhjEjnmUDSuxqWRaxej5mD6ZY56bQUR/dwBbvVhZfj8HppHXJ
	mvr8ugoOjwhYlqH2JM2cdvJt9pNLZU7ACywo8IrrcMOWKNsKTZsUYX69xNQ0IslihRP5Y/RTKdS
	UBunWHfrBfPb+y8j5o7fMMA5+xlqLcdPSACuSTtQ0eBRufidrdUtdSir0QyToEoe9DL9vxojliB
	YVLB7gJpfE6Sa0tkhkA0tqbuH4+hCwoWNVd4DE6UmOqNStTXB2mSNV6Qk500LM6yYoSJzN3HXx6
	IvWF0lDMVZv5bEk223eM=
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr461737765e9.30.1795710197214;
        Thu, 26 Nov 2026 08:23:17 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:11a1:dfac:b1c2:1000])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm34026626f8f.35.2026.11.26.08.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:23:16 -0800 (PST)
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 16:23:15 +0000
Message-Id: <DN5A4ZMSEDUO.FUSGQTLBRYFN@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] Exynos850 ADC support and soc thermistor
X-Mailer: aerc 0.20.0
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
 <20261125193122.747908-2-tadilhusrev@gmail.com>
In-Reply-To: <20261125193122.747908-2-tadilhusrev@gmail.com>

Hi Adil,

On Wed Nov 25, 2026 at 7:31 PM GMT, Adil H=C3=BCsrev Tepe wrote:
> On Wed, Nov 25, 2026 at 02:23:32PM +0000, Alexey Klimov wrote:
>> This small series adds support for the ADC block found in the Samsung
>> Exynos850 SoC and enables the Murata NTC thermistor on the WinLink E850-=
96
>> development board.
>
> I tested patches 1-3 on a Samsung Galaxy XCover5 (SM-G525F, Exynos850),
> with an ADC node equivalent to patch 4 (same reg, interrupt and clock)
> and the board's three NTC channels.
> Readings match what I get with the vendor-style sequence (re-init around
> every conversion, SOFT_NON_RESET after reset) to 1-2 LSB on the static
> channels, the NTC channels follow the temperature, and 200 back-to-back
> reads per channel show no stale values. So initialising once at probe
> works fine here.
>
> One small thing: channels 8 and 9 always read 0. The downstream driver
> uses 8 channels for this SoC, so MAX_ADC_V2_CHANNELS (10) may expose two
> channels that don't exist.
>
> For patches 1-3:
> Tested-by: Adil H=C3=BCsrev Tepe <tadilhusrev@gmail.com>

Thank you for the testing!

Regarding number of channels. The Exynos850 spec says that ADC has 10
channels and, looking at the registers, the ADC_CON2 register (offset 0x4)
lists 10 channels as acceptable ones.
ACH_SEL bits [3:0] field in this register wants to see numbers from 0b0000
to 0b1001 (from 0 to 9) and lists numbers 1010 to 1111 as "Reserved".

So, I tend to say it is fine to have it set to 10 if it doesn't trigger
any hw issues.

Best regards,
Alexey
