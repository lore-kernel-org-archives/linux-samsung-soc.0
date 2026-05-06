Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9F1F507
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069530; cv=none; b=EjEleB5+MxFgW/N64DitBIVPB3nozRGOoPcT40eHnDCWdNNIZboTc4RB/XJn7Z7orJCcn86lnm7UGiMQCTJXqyzuTHp3wdufMhV9EYSBa5eE2cY43mwY/z0K3D+4ytH/K7ul+m7Cqu5N/WlDUslXqlGmvz3M9Sf7TDzfnKQ/8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069530; c=relaxed/simple;
	bh=jfaWp8ixppP8eOYKh4ns9ulx+xbxaJZiancW/JSA0pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzfsNoxIm+dG94XW3agB8DV8KaM+Yohu6xZ8IRvRT3Z1JDOWn7Ri6Di4GI9riaC9/jrgzIrD4eltVnx/A5gV6h0ugTOY4OCHg2ZjQmMiJ+WJFnIkJ1EG8uqXKIxHa/SbJHWnMxx5b5GA2K/7xPOXGHr5M4fxhPamzWUEvT2mcXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nrJ5hFOX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nrJ5hFOX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d734223e4so545247f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 05:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778069527; x=1778674327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ws629W1+/OZhaFCmlUMwKh3w716Ok42C3gMHhe8mbxc=;
        b=nrJ5hFOXuaflWcEsoXo3dxTHpuS3ftE95u7k7KXNz4zU4Actt5qBQIG762MMZa6AMF
         ptUyu9wv2fRxgViXB2h/JD/xyEVBQhaYcLTG+w298GRJ4FkvSIyYGLhPKH2hx4oolsfd
         RMawdbH8hJtcaSmlMPVGXsnONWoDQd28L5imB1FB0bgONq+ev3H9P35u8cTUIYDIVxUt
         PgZjgsgHKB/HlpXwnAMSBOkcL7lNbRxwlQ1CJBZ8c30ZGiIqBNgXP24dVEfpIMpZI/u+
         rdoUgYGfj5y8ApxZtFR2++zZlGeujcePYZdROaD372tlww6+VOAEHxHMJqmry2OhqY+h
         9xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778069527; x=1778674327;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ws629W1+/OZhaFCmlUMwKh3w716Ok42C3gMHhe8mbxc=;
        b=IoQPdIpVUtnMjWdIJtMsUa39TR+2+EesREvv40FQ0JRaOGpEsivMl4Jl8xCVqq0R5a
         dyTf2m3gTu8BUHyT23JV2LGhKW8urHDIz6yxf/zQfGU6kSRbprnR2mmE7m5Xis0nH4sO
         iWkdRrY+IOypjHZ6nQ3GPPpEQE0GosfhOvUDs34BoileSxi8CBbTaja/XryNZfJOh9Oh
         SVXOogtB5KijtDwK7Yui8be+UxocsV/z9vA2/TJSPxEYXZpbG0M2VnHhRxDPInqh/mX0
         GhxpVapp4uN/xTkYdiBEBP0oWGdsgXusl5ZmukbO2F4ztt0NqQb1CnZK2i2yNPcId/Ez
         u8Mw==
X-Gm-Message-State: AOJu0YyQw3PegFd78OF8lefxRADjov6C74zu9IZ8ADGOccrnNZBQHoe6
	s7IAleYV2wy26hKjEDKeIA6z8xjPaPQEO178phS8bOO02y5aHYK0eTa9B87mHbgEyI4=
X-Gm-Gg: AeBDievsyX7zQS01FyZOobTTBkvsTCU1E9gHqZZPkGsj8co/Oxe2wmaKVKaZHrZKtNm
	tTgNLe6cofwM4VbXu3by+OIUTlPI2NBQkUxJf/qlY0uUBdjVuf0vCsbn4IrF6vTxkW8Xo65OLq7
	1iw/lPlzcU9nURPC35zPinohGJy7e+LLUqjJB+ZikmX7cF7tqwnlwbI7KxcrQWAM0UJrwMl2ud/
	0jWn/W5SILKF5R4XwP4C3Um+K29PV1ogjPf02TCyyUeY9NHW3Li/nasGGhkGaQdLUWKqqY/mdgP
	6enQ2bg3oM2h9Ts0fspLRM98tio5xw7N9W3QJmCDUnrYgLwORAuXPttLLCV+hvMs0Yny6sfKRBV
	wMgBGo+hAM5n5SFCXT2rDOeG+slEVEsAUEld1E4aKQf4Xa1HvTzM61IC1aXDS2QUoSKte1LA4Ur
	bQR5aDIZ9wpphUv87Vljev+KDef3iZeRaLUQ8BF+JU8Os=
X-Received: by 2002:a5d:64c5:0:b0:43e:a75e:352 with SMTP id ffacd0b85a97d-45162570080mr4694269f8f.4.1778069526968;
        Wed, 06 May 2026 05:12:06 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12000365f8f.12.2026.05.06.05.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 05:12:06 -0700 (PDT)
Message-ID: <b7657812-3afc-4b13-a579-6f07d061e2d9@linaro.org>
Date: Wed, 6 May 2026 15:11:58 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
 <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI6LNH2F0DP5.H1ZM8MTSDQJR@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/30/26 6:37 PM, Alexey Klimov wrote:
> On Tue Apr 14, 2026 at 10:08 AM BST, Krzysztof Kozlowski wrote:
>> On 14/04/2026 11:00, Alexey Klimov wrote:
>>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>>> information and configuration data. Add the SRAM node.
>>>>>
>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>> ---
>>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>>  1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>> index cb55015c8dce..cf4a6168846c 100644
>>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>>  			};
>>>>>  		};
>>>>>  	};
>>>>> +
>>>>> +	apm_sram: sram@2039000 {
>>>>> +		compatible = "mmio-sram";
>>>>> +		reg = <0x0 0x2039000 0x40000>;
>>>>> +		#address-cells = <1>;
>>>>> +		#size-cells = <1>;
>>>>> +		ranges = <0x0 0x0 0x2039000 0x40000>;
>>>>
>>>> You miss here children.
>>>
>>> Thank you! I guess I should convert it to smth like this:
>>>
>>> apm_sram: sram@2039000 {
>>> 		compatible = "mmio-sram";
>>> 		reg = <0x0 0x2039000 0x40000>;
>>> 		ranges = <0x0 0x0 0x2039000 0x40000>;
>>> 		#address-cells = <1>;
>>> 		#size-cells = <1>;
>>>
>>> 		acpm_sram_region: sram-section@0 {
>>> 			reg = <0x0 0x40000>;
>>
>> This covers entire block, so feels pointless. Maybe requirement of
>> children should be dropped. What's the point of having children? Why
>> does the driver need them?
> 
> Thinking further about this. I was looking at the schema file and
> different commits and it the right approach could be:
> 
> - add separate compatible for mmio-sram region for this case. Similar
> to scmi and scpi, i'd say it should be "exynos,acpm-sram" or
> "samsung,acpm-sram";
> 
> - update schema sram.yaml to exclude requirement for having child nodes
> and properties like ranges, address and size cells
> Similar like in commit, for instance, git show d0fe6491ddd22
> (or git show 2d4a22e79a5fd).

this works fine, but only if the sram is consumed as a whole, and only by
ACPM. Is this the case for exynos850?

Cheers,
ta
