Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03FA255E5C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394511; cv=none; b=QliNeIGrdcIAPbWMUvEKC5Z6jYpiw9LB69TM3eBq2iaa3hvpXxAuF+Wa5ZAfXShCbKe9x9CvgoukO5fX35VkcK8ABRwQuHpiOkGRARD0+1OMuSEW6amMV8K9aN/NrrmGhNu79627FeB+MH0ZoY027sLlOtikYYvfCAeB5LiUCy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394511; c=relaxed/simple;
	bh=l0bNRcWw2GffP61aokgJT5WZ+wFeJ02jEdzQTThNDHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c/+ptWOVdly+huh1AMMn/aoz73lry2GK9s33G0adQwWu173e3uh/txHcvtWJyjpny+AJ4OHxdeI+lckaQS4wMO88AfxzHj0qylWYxorEgbkVxMSnifOYqlIAtDAiG11RhVLyu610ERC7t99eVJz9GnFI0loHQfVzdXFYmeS54SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lFgN5zLL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFgN5zLL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f286b5281so2055434f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2025 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740394506; x=1740999306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Iot9I4h4jJMqZbR9/3Iio7a6IBbtlOgx6s1kh41LTE=;
        b=lFgN5zLLAaYUHc71SlmY2dJV91kfZxzOyLQDFd2AOaxZMHkBmlQx1pZN5V90bL44i7
         +b2sENSUIejUuW53MpR5UjSbHlmb6pc9DOeuYt22+fVmHV0YdFhQ8hgAVBJTDKlVA0y3
         PCb8QTBPOk9pO8wkfTgwONLXJtDts7OHUQG7hZdxTjTME15Hmst6vj1AYTR1zd5RwFvs
         qttIu90THniQLLTuiezTOtzd+iDvSM0jRuKWH+DlSYHaabB+X5tj73vQMT/ByX4tsvTM
         dQ/GYwAVAHQnhXoWiIKZDyJ/95MlLV6cTBiRZ8trHHOdLW2aw0DO/rDj2fxYF4RRtfGH
         r/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394506; x=1740999306;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Iot9I4h4jJMqZbR9/3Iio7a6IBbtlOgx6s1kh41LTE=;
        b=n5sbYOZVkoefdoyeRUOyb0WYnxzqh0GEp1JixrL3PXa1JvAmMd45sr/fN5spjbUXdg
         CL4/7NDGYmw3RviiC0Jh1+d+gmWZlszFRgB2LFNUAOoSpjHo+KL4RwB3GznekP4aHe4H
         BGhIB7FDrpiOboLwpMdIf4I2ILFusC0xRYSgSJofgaMnYxmwi6c1zxBR+QtpKKnCu4qk
         qjo+JGljgDPBNabNgDcfY3zaPWI/zXLKIibgOC17u/7+AiAblXPx2MYlujmpQMHf93Om
         eeh1pLgTrqs4ybLVjgs+qX1/qVL0flPJsVuYBCgM8KYX9a6XYJQ451MiB9DRazKMsgqk
         tuGw==
X-Forwarded-Encrypted: i=1; AJvYcCXka9q2TPuSvW02aXPcYBQb+q/xsB1kVRnncABM6I9Z8+9tn2pC6zcuxVClcvhtz1kKUC6gsL0hqrUxtJNGNPp1Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlwwHc5ouVqQiKZ0D9qEMHSYdlIW04wB5gAPTgFZqx50dpIABb
	y1vH+omnAh1sgH8sGQ5TLXYnxfXRaTRvHeB9zvuYrfJwTSP/ZD2o7aVhZtANX0U=
X-Gm-Gg: ASbGncuBerRd8+Two0J8Htt8wr/SVcw9OB4TwfT+xBbubtcZVqSKiE9z796AwTFE0oK
	wE2QL+64/prA6GHotc8d6CxjSXqo4w3Ci6R3lNPzoScu+fjZol1jwNOQwKTHtiBeXrzoYjZAzs2
	+RyVDQ6GR1Jxc2uMngzxxBGwKC/mwV+XFyv7NBcGrdgQ82JgPHcXXWHm500LoFw3I+2VxiKJdZ+
	94elt4mgeHwDYOj01/2CW7RnpaPQRTw4yzqQ+tOwOW/woP5GhCzFzNfhYY2cNgGURzP4J4ouFxW
	hAEtokrweu4pnavxV+d4VIdr+mRhhc90W6MMMfVesSLFqiFue1OKJhf/7E0OG/xf4qMEmhzHqhZ
	GCFI=
X-Google-Smtp-Source: AGHT+IE4j4S+EDiD5wh2IMuUEhCY86d7JCH8Dc3GdjFV6vdXtjgVdXLV1ClcAd5tybFFKQM3S7o/Bw==
X-Received: by 2002:a5d:5985:0:b0:38f:4808:b9f with SMTP id ffacd0b85a97d-38f7085c617mr10519652f8f.47.1740394505896;
        Mon, 24 Feb 2025 02:55:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:825b:5392:ef70:cc0b? ([2a01:e0a:982:cbb0:825b:5392:ef70:cc0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7979sm30904426f8f.83.2025.02.24.02.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 02:55:05 -0800 (PST)
Message-ID: <d3067b8e-38fe-48b0-b031-8aacd1aedca4@linaro.org>
Date: Mon, 24 Feb 2025 11:55:04 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
To: Abel Vesa <abel.vesa@linaro.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
 <Z7xF66TctF2wuoGj@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <Z7xF66TctF2wuoGj@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/2025 11:11, Abel Vesa wrote:
> On 25-02-23 14:22:24, Ivaylo Ivanov wrote:
>> Some platforms initialize their eUSB2 to USB repeater in the previous
>> stage bootloader and leave it in a working state for linux. Make the
>> repeater optional in order to allow for reusing that state until
>> proper repeater drivers are introduced.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>   drivers/phy/phy-snps-eusb2.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
>> index 4e5914a76..dcc69c00a 100644
>> --- a/drivers/phy/phy-snps-eusb2.c
>> +++ b/drivers/phy/phy-snps-eusb2.c
>> @@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>   		return dev_err_probe(dev, ret,
>>   				     "failed to get regulator supplies\n");
>>   
>> -	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
>> +	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
> 
> Maybe make it optional based on compatible or something?

It's already optional in the bindings:
Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml

So it's:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
>>   	if (IS_ERR(phy->repeater))
>>   		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>   				     "failed to get repeater\n");
>> -- 
>> 2.43.0
>>
> 

