Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC62930AAC8
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Sep 2025 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336998; cv=none; b=hvjpbo1pKb+tTDCZgQN5AhiXtlIevXr6qx8TXPESW2xILzc2JlcCC/z64uMQ6/QzUW79w3+QuoChLvgEVnLWw0iBUL7be8jupEEpcqLqDT94+PnEMHCnb5Yt+CYYnhWyr1a2nqtyYps15zQ0HS7vks5LiFDVEdnR8zMW8Q03C8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336998; c=relaxed/simple;
	bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=J1DZqZPuUoA3VIy6by1NACOnvLcG87bIVML6LBki8IQ0y6SKR/uKPuRAfIj1+pZfC25jnkv0r7y7a4h+LG1SxhOz1cg5An+9cm0x3XYLZw0BkzEYo2gLAbalUR3uiDOEyonNIdt086cB2mnnXXcuX3jsO40ICKPfWAup92136YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ts2d9DBk; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ts2d9DBk"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3dea538b826so3737500f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2025 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757336995; x=1757941795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
        b=ts2d9DBkzqSdIz0teqB9nt106GFKiq/C/wCQjCJi2vZcnHlW/EZkXB+SQMnukTXpw4
         TRy4zBckKKoxcf0Bh3lj0YQkx4ZQS/eKo3Pd2+xz1Osmm8DJ7Ay7+Va38Ma2hyd7e7Lo
         oxli7edCr5oFtLEjlT14nFzTOgeafZIB5S/W1ztDdMoZz8VOzZtULZB3AwleB+mGptxH
         EpvqM9DsBkwrqeUi4oUhI+Eu51xuw50iWcdC5pIn/gJCzXFNhWXLWpH/oSc1/5dTmsba
         lrwbIdDEfZKbo74INQNqVaZGg9Vdf3prUtPx1xPTdVYOvLMul/oDMohtdLjTZ9zSkxLa
         NV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757336995; x=1757941795;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAfvTI2eDT3Y+iAtVMV5uRX+ZV51LceKOP+H0ibBlu8=;
        b=exINVc964wROO+1Xo/wPJf2DfwxC25zntm2DLgM4Er6RLONAyPGl1LPe0NjAkxeDYs
         gyxA0c00oN3RSn1lWjngjrAxnEn9XNhf3xndH90ZXxs5mWzQJ0cxqsgP7rcp40jRoskR
         JNQM0C6Bob/KTH8MEw9QQN+NpWk2CAEzxHNp7bvTZ4n/5V7A7Ylz/8W66gN0JRgwyNtQ
         Z3rWZBCjzx2r0dxwOKzlS4edK8QtHTUShDTUcBJ0SunHh4cUCiX+FDfxVSLHZjblEALV
         yk9EMZQOFhIBxgMkqIciajZ+QOZz8eIzz/4+fZWpPo0qOrKgp+a5ECYwPlByyu7xEZ41
         neFg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ5w7bqr71qAt+NfPlQYDJTJhn8AuZXj8Fgb+RCHX2jRtL7UUgUEkXV7Mu7O9Mie1ojD+ysSl+34lG+e795/Do/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTD0o4Tb+96Dcps4CDfHtWBuXoZxkmeSyCdFSo6v6BEP49ZPJ5
	drpUOTILPKvdw6B2c0n9Hax72bvf71CvQ5Xw24nXEJIIkxIeiT/ikHOrd+gAhYQeCOg=
X-Gm-Gg: ASbGncuF/th449BF0wyP+Ogv2g8H9Zigqy0ggC7vytjPGn7Z+PWWLj/h5sxWt1rtw2y
	3385l1O2JHfddCotB/viS0LJDuk2eE+TUXIvcRGtRiUXDttJ4XJ2ye1ENfVo1hGgGCI1ZtExxUN
	ah2Ck8SO9fukeWFhfNQN6UlNeAAKHIooZhty16rHNHOjg6NsWsz6TLB3SbldM539bUkUrwAMspK
	kUW8yIz590JPdJijHn7pZzQA8mDlAhoq2ktVZxVUj7OFmwL7EM5VAV/+Vwa3hSO5XLEorWFAO97
	KskU/V/0qVrk5dipQezgBTTBNZmAsV2kCmg0Y/R2FlaMuaaBqa9ZYfR0DPygeO+cYR4n2goykta
	VY87Y2Y2WSEwYw3nt5w8az+g8c/eYqkor69LIH95UMpw=
X-Google-Smtp-Source: AGHT+IGT3YByOFHcB6lC7G62qQvZRz06xWjMoRfPXsn5WeauTpW4Im04NQNHPZ7gXpFlsp4DKnDeXg==
X-Received: by 2002:a05:6000:2184:b0:3e7:47c7:9d5 with SMTP id ffacd0b85a97d-3e747c70e12mr2636788f8f.21.1757336995072;
        Mon, 08 Sep 2025 06:09:55 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb687fe4esm214421405e9.23.2025.09.08.06.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 06:09:54 -0700 (PDT)
Message-ID: <34b1ca27-8cff-496b-978f-24d2fb135c26@linaro.org>
Date: Mon, 8 Sep 2025 14:09:52 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] clk: samsung: add Exynos ACPM clock driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-3-65ecd42d88c7@linaro.org>
 <eafb409d-5b5f-4791-939a-5a3c1eb00b9b@kernel.org>
 <91407377-f586-4fd2-b8e4-d1fd54c1a52a@linaro.org>
 <32a28a8c-2429-4d61-88f0-b7e3e866f85e@kernel.org>
 <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Content-Language: en-US
In-Reply-To: <8eb616f2-32bc-4715-8775-b1e896cee908@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/8/25 11:55 AM, Tudor Ambarus wrote:
> I'll drop the sanity checks and use hws[i] instead of hws[id] so that at
> least there's no out of array accesses in case the writer really mangles
> the clock definitions.

Having the assumption that the clock IDs start form zero, are sequential
and do not have gaps makes the inclusion of
dt-bindings/clock/google,gs101-acpm.h unnecessary, so I removed that
as well in v4. The clocks are now defined solely by name in the driver.

Wanted to emphasize why the acpm-clk driver will no longer depend on the
bindings in v4 :)
