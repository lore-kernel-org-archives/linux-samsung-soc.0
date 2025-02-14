Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5765A1E1C2B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Feb 2025 06:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739515150; cv=none; b=QDYnO4xHx0hReIdXG7pF/WSYlHdePpPQF5fhzKxnAGAJ+Tg/b6cgYpQShmCwoPr0MxgEwPs3qjeTKtJ7qliDy+UvgXpBZWt4FApZScstee/lzKQVaELRv4UGytYT4ZPbk6p+r8p26QnyaiNmlre0xDU6vv8oS8L9uBWg9LNlnTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739515150; c=relaxed/simple;
	bh=wM4tKt7wnAjL5plOI4BRiyB+09XoZe0tKNq0DJSi+xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UErYUsN5vojO/CBs0McrIgUg7bocwlADDczzoy3DFV4m25JJpbBNpWy966mVBtAYzvve7jEP+M6a9RSqlazsIDjlmLepFVBZmM6AntsJXoIPOXkI+SPKPGBGL3U4o1DHS/9RU1srYNwhuZNUrv9AQ1ndHPqGfE/Q4K7+nPXNIHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpQ3el9J; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpQ3el9J"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so260088666b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Feb 2025 22:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739515147; x=1740119947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0sU8UuAz6zX29kmBzzz54CB+mIZrBU5m5rlPw1QPe4=;
        b=YpQ3el9JyDtytDF1ggQ59bMI/wJQEtgyGxBm3ugSRebGJwOkMKScLcV/ZPTLNdfGKZ
         X4HhcHT3UXlhmo6XJUAiAz5tu5Jvnc754r781IrG7fQEHRkNJ+pf833Awa7TCZetbO1n
         WnWKWI6Q/OMDO+toSnncco1gCpHsfSwbAtCZra3BGDF/yS9c1gCPxmdON0fQ7aBIXjFZ
         eS6u4h8pTNHBp4qKoNWRrEsClILIytW9miaBkEyyhaRdcxBYZVl/RFSf06Ras5CYs8QR
         b4I1rOP7WvCA8uoI3dqm1j6LZUMI7mG86gwsoukeXcrqQcRTeL18ijBiwO6057QgcH85
         TzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739515147; x=1740119947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0sU8UuAz6zX29kmBzzz54CB+mIZrBU5m5rlPw1QPe4=;
        b=YqCc9WAMMUlM6aOjqu2tIlD0clEjqEQ/QhAsl0LwtV2qt4/2iWfUCiscpMObsMKwWe
         WM3TueyN+bfoEjRsvKVszVlPHS2mOitH9lzkulQK2I8nzN36nmaTGJE7/vlkdsdkHOW5
         BtaTHl6IJj4AukQPfLhkJBHWeyP2XO9IACs3YrO+oseO6b8VCp48L5tFLZDblbG2VTwa
         3IDAOQWtL+dUCePwVMqQbMIhMYO6zKdJkRkzWZG/loIG4w0KgLUGPwnoOWOAo5uqyWJw
         kqy/+5h2F8bgmOj/3dIatyBkrz47TUu7vcUE/QICdnofbRGgRPEzEEhjqcyW7OUBYy94
         AI6A==
X-Forwarded-Encrypted: i=1; AJvYcCXkTDf/WFPPmk6TK3t705I4oEhAPXVYyeMrolU6xtB7/TwXUrhf/pmi3Y6UTsSWGoE/YhOAa5qMv1Zkq+KhCna5RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqUQgipOWbKGyrWL3LfJWLagCSY94j3vVXajXVV7ZUeoS3O9Z
	1NaY4SE1vNFje1FUn1GnX9kLBPhlwkPeO37YfHXk3b60yU6oUuBn93oIxDQ4ZEE=
X-Gm-Gg: ASbGncsHM5CUNsw1UL0N7O/L7fi5qHjNzopvqULsdnydrG30QMQh8IwgVzjNCJkn6u3
	tyoePPWAyhyvaQQL6nr53djdourPx8qkQNNjJNxei3tc94px92i29Ae5AdCgKpRDegEjOM/SUt6
	naELDgQIup8i7zD0yJvzDGYdv2jfkFLOK3kG9XLcptNQBqubF2TtUCY3akS9WtIYK3Sg8+LeRRS
	SIQqqP3CMcmK5JOqErw4mWFgQhLmwmm5xY/joTJBqYxKRpBoG+CLimNhrki3OTuHqYVUXqo1ZEC
	jfgFV7Nfd8JVdMCxKmC/JBfX
X-Google-Smtp-Source: AGHT+IF1d6cYVnJi5xW59uL3+6NvNiwx8uIujRV1yuXHWDc54Fra2mr4R1Bhi8JKR7ZMNqzyULR9og==
X-Received: by 2002:a17:907:d26:b0:ab7:da56:af95 with SMTP id a640c23a62f3a-ab7f336e7b4mr907392566b.2.1739515146641;
        Thu, 13 Feb 2025 22:39:06 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231f36sm276066166b.33.2025.02.13.22.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 22:39:06 -0800 (PST)
Message-ID: <cf0a5ab5-265f-4429-8c11-8b669f00bc70@linaro.org>
Date: Fri, 14 Feb 2025 06:39:04 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: s3c64xx: add support exynos990-spi to new
 port config data
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: andi.shyti@kernel.org, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250213204044.660-1-wachiturroxd150@gmail.com>
 <20250213204044.660-3-wachiturroxd150@gmail.com>
 <CAPLW+4nJVf0raJ-O3u6uUteBi--N5xGwvzXp7cHqbkdMJ8gCSQ@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4nJVf0raJ-O3u6uUteBi--N5xGwvzXp7cHqbkdMJ8gCSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Sam,

On 2/14/25 12:08 AM, Sam Protsenko wrote:
> On Thu, Feb 13, 2025 at 2:41 PM Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>>
>> Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
>> Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
>> configuration port.
>>
>> The difference from other new port configuration data is that fifo_depth
>> is only specified in fifo-depth in DT.
>>
> 
> In the code below I can see this bit:
> 
>     /* If not specified in DT, defaults to 64 */
>     .fifo_depth     = 64,
> 
> Is that intentional or is it some leftover that was meant to be
> removed before the submission? From s3c64xx_spi_probe() it looks like
> the "fifo-depth" DT property is ignored if .fifo_depth is set in the
> port_config:

fifo-depth in port config is intended for IPs where all their instances
use the same FIFO depth. fifo-depth from DT is ignored because the
compatible knows better than what developers may in DT in this case, it
is intentional.

> 
>     if (sdd->port_conf->fifo_depth)
>         sdd->fifo_depth = sdd->port_conf->fifo_depth;
>     else if (of_property_read_u32(pdev->dev.of_node, "fifo-depth",
> &sdd->fifo_depth))
>         sdd->fifo_depth = FIFO_DEPTH(sdd);
> 
> Btw, wouldn't it be reasonable to flip this probe() code the other way

No, please. IPs that have instances with different FIFO depths shall
rely only on DT to specify their FIFO depths.

Cheers,
ta
