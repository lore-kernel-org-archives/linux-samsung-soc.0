Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2C1E511;
	Mon,  6 Jan 2025 07:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736149280; cv=none; b=QS7ASFgPfDb9hx7lt9GtShZF76hywqsTz442ukt0jR7BivVK0wtJCdDCZ2Bax7T5vS9wI4XcJ+07R7+eXrqYOEgL4L/uwvK/nkIri7mRgFzEtD2S9OvInVJFgdYLIVICTUukBs8ohLtMwVcQ588rGcrxtvJqjkohr4RpXQSbPyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736149280; c=relaxed/simple;
	bh=lqwJYDcuZuFuxeaLPzIQfQjfDbt5N/rNQ5VywSay5ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f20IF0QXIMCVWo3kDx8LFAuPtI9G6cOYF8s+OJx1gk8mHOt7x3crgoFodkLwcoHHmwnqzJ/ybNbmIi/XYNGzUsY5N2eBjUYpjwn8AhCrbEEtNM71bZOvy4Evlxoh9qv+9xectGm1ZHHIyKZtyIPVveSASgisUNidSjGtxApgid8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+Cb3guZ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+Cb3guZ"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaef00ab172so1524961666b.3;
        Sun, 05 Jan 2025 23:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736149277; x=1736754077; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7jyHK1qzo2RBuW8p7OwjlLlsp6SzR2X66LUKW3zBn4=;
        b=A+Cb3guZJ1lpn1Hiw+rn580NAThCS58SAmJkfOS6WO6BC/1LhadomOQhfJEdGHB1cC
         6KmvIWL3pt7sXhgr2hkJsiILSrDiSLmRZzjvQjgixUSbnH4AN/n2LP4uQLmHvKPGi70s
         LzOkA3xF/0o0VdptOyUXeHX8wW5mCcL6GaZDFO7T5WSm6b1P49LPC92Gp7pQ7g6cAoDa
         1vdeYdtqjND22b9oIIDI0A55oyGmR2B+UjQ4gZoIWMh2vdF9oiJJbU9gEK4VDH5KJvIp
         8XlHrIZ+EQkDZK0fcPAZGKegA1xqoJlWE+fmAeNlBX+PkIbCWzx/8m+UZtfZIuQXGVaR
         Gn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736149277; x=1736754077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7jyHK1qzo2RBuW8p7OwjlLlsp6SzR2X66LUKW3zBn4=;
        b=Hii4MQ/hk/r4iT+Dhmgrovu/gww0LI4V55y7mrQpc6C7dwuzNB+nXu/Lt97eEN9aWJ
         n1wnRc0mVHX8H5jxIMoRxfRA4CekcxsatyoBxzmnQX6YTSy/UyJ2zyCCJmnbPpMD4yXE
         MVv7lA5Ft2EXV6srYZQad4Ql1FAjGvCWf8PpdcxI+c/Pure4whs/psU37SPbhytF1fM3
         PEdW3wPY3XRdnCOgkgwS6qP/ipVa9aAqLAjrOZeDate3mlYO7ihnVD69n5aWReR0xBZH
         utmtWAz4QtwrYl1aQm9dulyEGUJq6d0oUlzYBJMKZaJR2o36CefnrMUYTP5NPiLzjB5g
         L3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPlhdj31gO4i5A8wsN2hPJf4M1i89yW4ReTYjGKQoIqJr9acd78bN3H+qjNbIKvNibOlwKB+SuP0M6Qgk=@vger.kernel.org, AJvYcCVVSFD+v6cSPdfJJcmCaKDs6ymk8CaLZlKvuD5voaJFDlKyTRO5GIpbSgUGg5NokHduO7uSbOoC1Q8d7ov12dtEkL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGXqI3gBXhNFFznvU6Vl7cjncfjNXB8QlIcZ/3B2tXl/fBV332
	PIzyIJhhtpLiG/AFcbt0VN4LnWOJM2Q8xZ4fh639Gnb5tifiSvZ3oqxJMQ==
X-Gm-Gg: ASbGncuSz2mRvjONAFiQdYqYngseXldY8QEEfeLx5H1S3VrPWsAXBlFbUkl/bPM+YlM
	JnfHyHqdPs2+bvo4zd88Ir3+i8q58fFBV2J7SSqMa13PW11uQLWSt3yFcDJ/gFY8R6s8NtuS6Uy
	1IXjoKsv4b9nR4ONd5cBphWIL6J9RwAv76YBvHOS3jJCcLyAN4AFZxbu4oKVeO9Wv1jED0B2ai4
	T/+o9YETuVaT+NMnYc72YYYMwWgoJXo9SCD1zZQ/dGssu1EdQULkaYrDnpcO+rEHK+8TL4=
X-Google-Smtp-Source: AGHT+IGUK/KAzsavO8RxgoMoX/fDzaMo3/KjbM9ldtNHhtumpl9cdoVvZA3QKNbl7UwUnBmIsW12Fw==
X-Received: by 2002:a05:6402:1588:b0:5d3:ba42:e9e3 with SMTP id 4fb4d7f45d1cf-5d81dd9ce81mr141034940a12.13.1736149276384;
        Sun, 05 Jan 2025 23:41:16 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8954bfsm2246158566b.60.2025.01.05.23.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 23:41:16 -0800 (PST)
Message-ID: <a7686593-ab07-4e18-912d-745576c6a450@gmail.com>
Date: Mon, 6 Jan 2025 09:41:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
 <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/6/25 09:36, Tudor Ambarus wrote:
> Hiya,
>
> On 1/5/25 4:03 PM, Ivaylo Ivanov wrote:
>> +#define USI_MODE_NONE		0
>> +#define USI_MODE_UART		1
>> +#define USI_MODE_SPI		2
>> +#define USI_MODE_I2C		3
> USI_CONFIG register refers to the protocol selection with USI_I2C,
> USI_SPI, USI_UART. How about getting rid of the MODE from the name?

I thought about that too but I believe that mentioning that these constants
are for mode selection in their name is generally a good practice. Let me know
if dropping _MODE is really needed.

Best regards,
Ivaylo

>
> Cheers,
> ta

