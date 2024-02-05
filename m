Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BE134A4
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707126149; cv=none; b=SC6B0wWENS3QICoQhNC69DJG1pfcrRqX+GTST2za3VOZTCWMktEPM/HufpV8b1t+uHyFB2RV9g85kzob1j9gYcg35CKpx5YRmP6f7fBdxS73B0Vve5e88kqdWS6qtZYs2CuaZ9P1OFQoafwy98b6WvHFCGGADWL1NZKHTuPnUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707126149; c=relaxed/simple;
	bh=ndtmyQfz2lDU9xmhWMYIFZzCXJAFZmg8jp/iXvCYft8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anO5+ZP80D3UMlih8RhmVPfTTrFoQpKmzmobsQXANA0gjOHwyFB8jITw8W7mtI92TR819n2Lhu/t4yvjbB+v1OInhwi7fnqdHmTiF+eJdrZACelhYO861G5eJXrSKNdd/kH36/74WtEsvEBCH645SAlGMdFyNARj0lFrD5b75zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u/SGZcTx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u/SGZcTx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33b402116e5so235323f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 01:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707126146; x=1707730946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C19SWlx8SHGU9RPXMPY4Ju+DFm4C/tARFadneQ87tZY=;
        b=u/SGZcTx0CdBXyRnLp5hPKRr6Y1ThxAv2R0zqrLO0Pt21Rfsz3q04FVYZARUt3v8d8
         xuPKaEwCSXGfago6jsslhaiDEI+TDxYeqJ3M70h1nNiCH674A2yUGaPACBQvzB/OpyaS
         8elZH2nAxrNSQClZ8CbcJmaKJh2A3qSMI5VYeBf6+vd391291qtCd0cotE8TAPWbCY9p
         mDa4MQAO0bBViz0JMVK1sU3oRJiv3m+6kdO6oR0UW4aP/bdgwiPbXErl0CvjEIk66+G2
         Fn4w3J7MO1rP9ptVvLRD4aH4VEv6CXOQk+YBkGBjexOj+2CJ2LRfWgopNcMiOJKUwkwL
         h/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707126146; x=1707730946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C19SWlx8SHGU9RPXMPY4Ju+DFm4C/tARFadneQ87tZY=;
        b=PoGA1IH8Ba+eFlxNGFJyc9NtcdXRbzbNRW/gaTfzBUrQJAJs4Km4hZVTOskOKgnzkM
         vJh8EZfSsBgt1tWTopCk4klWSz34zD4U10Cpt9H/fIATz6ZTy5QEVaYXolFC28UOKtF1
         eWmfF0mmwrk+ISezU0Oxh6qo/cmuf2SmvFMbV86faoGI9Ld4h1dABn0TaJ//f3K8zFZy
         n58aTkY1LXNgM9Nkj/uBAFte7wr4jFIDZ0DXUWmxgXFIg7/nKcmsiA246ESwcHBc/MCk
         IcdpWIFQvKcDSEwykZnmOu0pwYiC1ugjR+lrJt5++ngDYnxnuwUgqEQEc0OAOUzmkoC5
         bTDQ==
X-Gm-Message-State: AOJu0YxlmioL4CemZ7B1/zk5TtN5Juo/VtRBg01Osut9JEhcyQSt45yx
	gN4QAfM90I/48OdVFc49raVs+7NhMNfE7GNTlcGa7UDaWbJetg7OkUdnSPNjF6I=
X-Google-Smtp-Source: AGHT+IHhu6cwV5mTTHoCSjNhsi+b6D44+r4XvIJYNlppSNCl3BI30ZzWjZzpjs1F0/PZJnEpT8gOcQ==
X-Received: by 2002:a05:6000:1811:b0:33b:3770:68b with SMTP id m17-20020a056000181100b0033b3770068bmr2123096wrh.45.1707126145950;
        Mon, 05 Feb 2024 01:42:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVAw/xLjlQM+28QDwdq1MsEgdFi6kuUzxJ+5aV9wn2ov8NcMPI3QXQGYKuFg2s00FNJmZj3DM6z/NHKtAklQU8dI18Blq82WU0bqkDrpvQjs/mFhZwc0fhbpgVU4f6Ek5MbU1gqW2IKaMn48v/DraUbOGc4VgAi2fsCIKwagttuo1JQCbSocQ9Okk4CqePkigWoGGQRz8oiHBoZZ9AJ5Wf2GpF0/lDIo1mfDpzrpbZ47mHCy+cKi7AXC8IqLQuW/hVVsx811HcyTh/8f1RZbXX446sPi1b/HlZEjF5+zVhc8N0SQHcZRn/Yu0BnK+tZNOwe0ICUJtu9tmGaGe1NvxTR0xq/I7IAFg/9chWyIh0vj0A1QErdLWQxXuVkSjliQZpR3NQrh2rDLNKqk2U1O9Oi/R014JZksQChecr7R07sseS+dHOP1LAdtYfP1M7rGfkUf/9FXC6uD+Ymam51KfBH1aR5l74Bqmh96BjkgZt8qGNxywb3FJiWFBVjME4iXgNy782zAP0tEOgjcEQlkVaTn6284KCLhJoReLIKSqHaFQqbYX43Zzxwabc75/ND3xMKQNFttQLDEsY9g7EH8kUgoAkyQsmwQdQ7e1ENTeQ8dNiLl3Kq6wKIJjfWyoba1daY
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d4e04000000b0033b3ceda5dbsm1920230wrt.44.2024.02.05.01.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 01:42:25 -0800 (PST)
Message-ID: <144a0bed-6ba2-480c-b377-16364522845c@linaro.org>
Date: Mon, 5 Feb 2024 11:42:21 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/28] spi: dt-bindings: samsung: add
 samsung,spi-fifosize property
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, andi.shyti@kernel.org, arnd@arndb.de,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arch@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, semen.protsenko@linaro.org,
 kernel-team@android.com, willmcvicker@google.com
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
 <20240125145007.748295-6-tudor.ambarus@linaro.org>
 <7ef86704-3e40-4d39-a69d-a30719c96660@sirena.org.uk>
 <1c58deef-bc0f-4889-bf40-54168ce9ff7c@linaro.org>
 <55af5d4a-7bc9-4ae7-88c5-5acae4666450@sirena.org.uk>
 <f2ec664b-cd67-4cae-9c0d-5a435c72f121@linaro.org>
 <f44d5c58-234d-45ec-8027-47df079e2f16@sirena.org.uk>
 <96f9306f-3445-484b-bd3c-82e708681f1b@linaro.org>
 <20240130222536.GA2523173-robh@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240130222536.GA2523173-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 31.01.2024 00:25, Rob Herring wrote:
> On Thu, Jan 25, 2024 at 07:01:10PM +0000, Tudor Ambarus wrote:
>>
>>
>> On 1/25/24 17:45, Mark Brown wrote:
>>> On Thu, Jan 25, 2024 at 05:30:53PM +0000, Tudor Ambarus wrote:
>>>> On 1/25/24 17:26, Mark Brown wrote:
>>>
>>>>> OK, so just the compatible is enough information then?
>>>
>>>> For gs101, yes. All the gs101 SPI instances are configured with 64 bytes
>>>> FIFO depths. So instead of specifying the FIFO depth for each SPI node,
>>>> we can infer the FIFO depth from the compatible.
>>>
>>> But this is needed for other SoCs?  This change is scattered through a
>>
>> There are SoCs that have multiple instances of the SPI IP, and they
>> configure them with different FIFO depths. See
>> "samsung,exynosautov9-spi" for example: SPI0, SPI1, and SPI6 are
>> configured by the SoC to use 256 bytes FIFO depths, while all the other
>> 8 SPI instances use 64 bytes FIFOs. I tried to explain the entire logic
>> of the series in another reply, see it here:
>> https://lore.kernel.org/linux-arm-kernel/40ba9481-4aea-4a72-87bd-c2db319be069@linaro.org/T/#u
> 
> We have some common properties for fifo size. In fact, there was just a 
> discussion recently on Samsung UART (Is that the same block?) about 

It is the same block, I'll take a look.

> this. So if you do use a property here, use a common one.

Will do. Thanks, Rob!
Cheers,
ta
