Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929834;
	b=bqg8LZOZkVx3jtqVEjky6wgYpqFH0StsheNcZPUK3Tvd4VDbjFETcv7X2n4xjxeLHJLo
	 AQDfkaMdRe6Op2267s+YQjyH1fq/AZnFehGU/o+pZp+ixEQsvbp3a4BFJtQUkj8LUx/+S
	 gPkeQwbHe/C8sQUmZmuaVZPwMVfogZozmFBDjskaU6Y2uW2mUnt6YubqmBFIAyRJXwqHu
	 OxQQOo5NRIPMqbwGZd1iw40lRoGdnb3RY2Q22xerbosmmgnd09rS/iAp9ROKvkAOj6Bek
	 y9ipWp8Nhaup48vXx4bI+dRh3RS28txbKaeZM6wqOHUrw7a/4ZSLjiuDUheKLGthOCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LKdLJQzk+hjbpuBIp8LKIvBrdSbWJhDuwBNnuQ3+E9Y=;
	b=P1LpzgsZH+APe4q9EdRNSbf4T3zZXxNsp/lIpJBZnB928WZKtOUIiNGEE/lG2CSVbKr1
	 P8abvLOXR8+YCqQXar0foi9Cle3XuXowz4T31Gw0rNBrQmqBdxCoVKv0Oy1CNnH29s6Fu
	 aOm7hQBbklfbyIrdrRaD90ePYHD/40iLKip0Q8uJDWxlax0r3e4HWXEuJqLwowcbccyxx
	 o6bM9c7E0MHhQGw95cfaP6r7LsIKk7JXkczDEJgDMibEp3WcOaI9JcHH3UKSFleFY7hUS
	 pfh68Cx9F8Do49gPu1oe1xHJCJR2sdk/OEo42PxpHfy8eJraEGA9rELNh0VwXOhRimA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Cl3+cJ/R";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE1606A330
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Nov 2026 15:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACAE1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cl3+cJ/R
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso254421466b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Nov 2026 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794929832; x=1795534632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKdLJQzk+hjbpuBIp8LKIvBrdSbWJhDuwBNnuQ3+E9Y=;
        b=Cl3+cJ/RdMLwMsHTsFXKq3E92HfrGSiunfW9rpYSxRvClZF0G/Umr9IzPAULUNCy/P
         +xNS6v7g1ViZQ6BwbJgfN/cqwz6fr7Nrrox4B/wEr94+/VoFCmFBuC0EwBNHU1GmDBJz
         MXeiPUk2PvMwrxaGNhclltfsKmhl+u55Ew35Pp3RfaeYesKgGmqZICzb5YkQPCdnaQlo
         GSv5o8x6IElafkcKY7tfj2BvG61ba8brJaaatvP1Q866auavXqRxt1CTfwhDTAd+v0Gc
         +nUTIsxAfZsBcBWm1x1httoFkvGdEomHcqcPOzWdlmI/KeaP7qn4yRwCv23Fgdu64YRz
         9wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929832; x=1795534632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKdLJQzk+hjbpuBIp8LKIvBrdSbWJhDuwBNnuQ3+E9Y=;
        b=ef0oB2N26ZLuGjyvrniQkDXYfAvnWmVVHTevt3oZkSxorHdKfsZ6AyjyjD4FT2k3qr
         zApbr/+0c+OuND4J7SEy6gLOp37J+zukH5HY9wHzCB+uh8JTg0AmHiM0z6kyw/OMYdiN
         r9dLE9oEOwbedDDIHXvFtHJdwkv78BFt0EeeHQOp91ncGasQJWH62N72bCTlcR12Eo27
         qy7Jm8EGk6HtZqZq2a2i0QrpACb0ysQjoG42SZBa4LT60U6aPdoJu914/qtGNieQUJH7
         YuIY7znUwfhyL55au25S+vewwVQAG3S8qQk3q/l/6XucYGENlQmGgKkrTUewyMd7dC27
         cKag==
X-Forwarded-Encrypted: i=1; AL+hErHANaRxfGYo376Za1BtvjZoaXHdeNzQbQ3s+FEDGDYkLvFW1rtQPDd/7KV+KP/uc74sKnJXlhEUJKN04JpSJeVc+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DQOlWAcgNfMJljTROwX3MIKR2mq/kLyhp1ecZF9kujPv3B2Ax
	RVk9tXjFelmmGrbwd0Dqg5g6VbIAGj+EQ/RPeGyLw7U8qq5reikGLAkZvLZXneRbPp8cZKai9+L
	qWfTQ
X-Gm-Gg: AYBFou0UZ05nigibhhcoSTjzoIEo0gvSUP6e00jXOwvR28SdmKnrU35dyoIyD82c0OG
	DxEWFgGG4955DWEtTwmY1S2MKsos8/79PofOuUxZki8yUjb9kF98en4UXQarAxSNbbuYewQJXxk
	HsMGzxRk0jPLs9uOlO9GHXTKZk7sJRp9i28S986OEmPZQ3xE6wZPFo//TZ7Hubr+gXve3jSoNt7
	wob5h/gKP5ZPP6baVrA0wrBjSHuwLqc/trIiJ8SmgpGKFHYyF0m7ssXKsL32qaqtEVVtVRHJuZA
	UHdI2e5J/JojumnjZI+WK08sjdbS79Ms7Eb9YzbmRZUae0Y8h89kD6yR0NTCqzRtNaHl5ijLvEW
	uetpRSBHhzkthVGQca648zZh9qXhYIdJJCRuwZ3drZVk+zHccLZ5fSylH7i+YUNt8IwyZx0TaQs
	lVwknC5lIYn9Pyt23uoPZEeQsetNGmQkjnci8gfxRJCk7ejpFYw2kN7OQmuSSqYZAxYVCdcmJ3t
	CACI4PDrnioq+u5iUUimOeFOnNlxHXg5EyW1d9GBvvvWvDDDFtKoqG3ipiI05U4/Y6EVkmb+6Sx
	E8WjIvgiy3h53mi2d23X3hUn8pHsDrjGCk4utnVMmUYk53/YnOSmnmTytuoB
X-Received: by 2002:a17:907:18c3:b0:c2a:ac35:95fb with SMTP id a640c23a62f3a-c50f3781084mr288834466b.24.1794929831875;
        Tue, 17 Nov 2026 07:37:11 -0800 (PST)
Received: from [192.168.0.252] ([82.76.204.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a32155283bsm6407600f8f.37.2026.11.17.07.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 07:37:11 -0800 (PST)
Message-ID: <3ea5d94b-6913-4534-816a-3935c689225b@linaro.org>
Date: Tue, 17 Nov 2026 17:37:09 +0200
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: samsung: acpm-tmu: Fix spurious CPU throttling
To: Christian Loehle <christian.loehle@arm.com>, bzolnier@gmail.com
Cc: krzk@kernel.org, rafael@kernel.org, daniel.lezcano@kernel.org,
 lukasz.luba@arm.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 Juan Yescas <jyescas@google.com>
References: <20261117083442.830549-1-christian.loehle@arm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261117083442.830549-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Christian,

Thanks for the patch!

On 11/17/26 10:34 AM, Christian Loehle wrote:
> acpm_tmu_set_trips() supplies two thresholds, but the ACPM command
> writes all eight slots, zero-filling the rest. On GS101, slot 7
> controls autonomous CPU throttling even when its interrupt is masked.
> Programming it to 0 C limits all three CPU clusters to about 200 MHz
> on Pixel 6, while cpufreq continues to report the requested
> frequencies.

Could you share how you discovered this? I don't have access to the
ACPM firmware sources, and the downstream driver doesn't state it
either.

How did you measure the actual CPU frequency, given that cpufreq
keeps reporting the requested one?

Do you know whether slots 2-6 have any side effects as well?

Also note that Daniel has already queued a set of acpm-tmu fixes in
thermal/linux-next, so this patch will need to be reworked on top of
them.

> 
> Program slot 7 from the zone's critical trip before enabling the
> sensor and preserve it when updating the low/high interrupt window.
> Cache the three temperatures so a writable critical trip can update
> the hardware without changing that window.

I think this can be handled with a smaller change: look up the
critical trip in .set_trips() itself. The zone lock is held there, so
for_each_thermal_trip() can be used. That avoids caching
low/high/critical, the .set_trip_temp() callback and the probe changes.


Cheers,
ta
