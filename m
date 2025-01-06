Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0131D7E45
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154615; cv=none; b=SNVhrsp8qUQK2gr3T3LN6ewwsUG+HP4u4P755h5HekOhsMj3FrRrR93gPZC4nfBUsRfeZ+mgcyCavliCfseDaIqTKLsukEACQMKPfWoXQahfkenmnABsObh7GfpRgZTJfpytNqPFw0DQ0u3e9xJeAcKC5N3KbZPaaAY7P/SJ+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154615; c=relaxed/simple;
	bh=IqQSZ4DIsbSb4L2V8YQ2RZyiVYA0wVhx3b1J6GY4zdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJUZA8fPdwlqDxZ39a5UHPs0ARHP6WrEB7ULM/unjZYVDWhfy8Fg9oG0P6BDowSYjc1g9w42nkPChTAEJyzcu8iNgH/PIWPpyJRWPO8/LrHnqe4plYvf/H/DjOKyUCfu49BYKBwU5QeMtBDclqXUWO8+efTYtjOkB2S7hSSAiMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueZdYo0s; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueZdYo0s"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385deda28b3so9345574f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 01:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736154612; x=1736759412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDNEsUfow91uTBH4QnhATUdWKOFKIni6Sk4yAbrFDmE=;
        b=ueZdYo0sg4GhPtsXbmD/qwclGeWhG3blbxBPilYH62am2ErlsdvbxcXWJFJVz6uj4b
         WXKLKXesl2+om0YJo4nqWb/23/0codepi63woP0zwGRV59TKCRlJW5x4LzuhyqmMRa2d
         WQvJhU0NY0jZU100nR6Th+4na6HO10I7MIr+RP5QeQM4aIS0y9kx1RmILoE5rY+Vv2Z3
         BbvO6meMKjtz29J5TIrzbGVT+Ib6ridoKWPz1lLk4wPM7PAdXgQIvz6j/+J+4aP3TL78
         aJZqrpH5mZLVhBT2QRVMHc+Le9lla1GyoelcVDLy2Ki4xDd1Sea45elzj6sgO5E5FYuk
         IViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154612; x=1736759412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDNEsUfow91uTBH4QnhATUdWKOFKIni6Sk4yAbrFDmE=;
        b=hbFNemH32KXT1Wq9OHGJyUcGytoJ0kVaxXLMgt8jr1K0QYH5DyTSweIWIoa8bWCvId
         EwB2xly5RYM0zzXvIVyPABYWw0ZIbP623VpmCN/+AxWZEehunINQBrEqhK212qocv/dW
         Yq2j7Z27YknpcklWYRxviEOIzSvxb0y3cncfUERz1kFOVl34HgSjmLkFxDDCCxA6vB7R
         uyUzcSLlGPQvsa/P3jVaO9PEBOmRXrHDXRoyrjt6UgnerEwcLZlsxZF2RDn2EGiSSAMC
         1k3wS/WjgmLMPk91jE3lpFvXubmm3edH5r380c5VlequgkzsBBMX2T2wodx8hf4bxP5+
         fbtA==
X-Forwarded-Encrypted: i=1; AJvYcCUwuwNeqNoVIAI/u2nudYK6clUM7sx+ui+6im478UIi19XKOqa3xjMubgrWEGpI+0sEraLBDuIm1pLK1uP4tp+bGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKemExuNgfkLKtU5fD21jDS1y+uw4xeacxYA6VswVoSUZkA8LT
	2jW0n9dO5CnqQ8Z1zijqRD+Oz0RjGSeycHznxSQeKEYsV+U6qGOEHAj/NdCnrg0=
X-Gm-Gg: ASbGncvoXjLHq6q7oFMiVpSZLUcrnWKYr6ZAl2YLcgpR8UR8bd2PXYO8Xs7fBzSWjcA
	x8JxTsMMSpqqUEk9gU9/gb7pOsxSLvuQoqlhYtFmN6jBmYCOox4QdhrZUiSTiFzSn3XKFOQBW+w
	m9mgtd1IIOLriYnJ4W7NyAa58ApjUsROXyOwT5J/XvZ5gNMoLCmL+nrTuK5L8qn7054YJ/v/69j
	1s5DNkhh4p+CfCqucOSP2x+bIhObGMXhj9hU7btzGZl1+JbqckXwNb/HJ0Iew0h
X-Google-Smtp-Source: AGHT+IHf0Kjy2F3wCk6C6D+WwXbOXA3J5Z7TYC7UuHxWyQDK+Pm2Zk/Zqy6o60oRO45YkwwQY81zIQ==
X-Received: by 2002:a05:6000:4024:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38a223f5d8cmr44100326f8f.45.1736154612545;
        Mon, 06 Jan 2025 01:10:12 -0800 (PST)
Received: from [192.168.0.14] ([188.26.61.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8288b8sm46989269f8f.11.2025.01.06.01.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 01:10:12 -0800 (PST)
Message-ID: <aaa12002-3922-428c-b595-2cad76e9ce2e@linaro.org>
Date: Mon, 6 Jan 2025 09:10:10 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in
 constants with USI_MODE
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
 <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
 <f0702bdb-846e-4817-a76c-5ce17dea38c8@linaro.org>
 <a7686593-ab07-4e18-912d-745576c6a450@gmail.com>
 <56e13a29-c087-4fe3-abf5-ebbad28ddfdb@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <56e13a29-c087-4fe3-abf5-ebbad28ddfdb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/6/25 8:50 AM, Krzysztof Kozlowski wrote:
> On 06/01/2025 08:41, Ivaylo Ivanov wrote:
>> On 1/6/25 09:36, Tudor Ambarus wrote:
>>> Hiya,
>>>
>>> On 1/5/25 4:03 PM, Ivaylo Ivanov wrote:
>>>> +#define USI_MODE_NONE		0
>>>> +#define USI_MODE_UART		1
>>>> +#define USI_MODE_SPI		2
>>>> +#define USI_MODE_I2C		3
>>> USI_CONFIG register refers to the protocol selection with USI_I2C,
>>> USI_SPI, USI_UART. How about getting rid of the MODE from the name?
>>
>> I thought about that too but I believe that mentioning that these constants
>> are for mode selection in their name is generally a good practice. Let me know
>> if dropping _MODE is really needed.

no strong requirement.

> I am fine with both, MODE feels a bit more descriptive indicating how
> the USI should be configured.

Fine by me to keep MODE in the name.
Cheers,
ta

