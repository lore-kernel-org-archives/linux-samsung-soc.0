Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA13D5228
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162042; cv=none; b=L9QMw2wx4yvaDiwF9gIhChCSCqa6GHdj+xZvzBTH2BHj028FvfrTSK0T691e0NSIoGr476xZknmkEoHXF6UcS7JFutbH9J8r2Rz0tYaJAtGoryBOePjF5K4ilVnOKm73ok0w/Xasx7helWyeUTU93Is9x6YY4f4TJQEkWbtzti4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162042; c=relaxed/simple;
	bh=2l2un2dJbMhS4rHXZeYIIG4tWC1pBRspQ9Web4LJIGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTz1WLukCyx3hjOCjRMVyxLt+f+l55BXh4AFi/z0zOu2OJUtw8hVwl2HEallMcVfxDRTNpOrydbNhzg6iJBuOvh/B7Xe61uUl3i+4oH+Bh00ofmvjb3awIwfisxb+rMD9DtqO2v7GeWjkyEGBEmbAevjsb6gg8ugXjGWuYc4JeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJkc4YdC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CJkc4YdC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso63163785e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Apr 2026 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776162037; x=1776766837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HjjP3x2s4FAG01oUrkjM+enP8FGX1QBSjIAMGgLldEs=;
        b=CJkc4YdCoQjH3GN88jmk+eLTvdY7mmpiML+zSvvz1oMgY8lgqrXGSUTb0E36hpjQiC
         L5bt+ugFfq1dsRkoOZDQ8pwovasweKdeTragSRq0d4Sxiu7erlwX9aN3sbQwPiMYImZd
         SYHLmJ81Ci6d+uC+zqJPITPmvO3HODAMBmNQ+J7Q/FQzesWANy9gFgu2m3TrMRJ4W8TZ
         N2/L1jBOuzbu3yRMaz/s+fcxh6sYHLxV8SHmpKVlxg1iHXRWAANr1NmJkYkHcQwrgti3
         a2iKjLlaHWYUSYhRxwwrDVjPFb+low5v+TQ7MpyMsA2FG/vPnzpFO6sSsk66pkbbDvvS
         V3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162037; x=1776766837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjjP3x2s4FAG01oUrkjM+enP8FGX1QBSjIAMGgLldEs=;
        b=tGyMrEyLmJp6aMclWXC7wbbd94RD9RdFIpV3SSjmOXhaHT+EtXJPgW3aldBzCQnc1W
         Xzdhw13WMEsdqYlgcLOWCa9Otx4zLuMCMvz+imHPv3tRRqV3hrYCpljtoFKwPsBsXE8M
         YaXCmLOrfhoLurvW4FwHZStPnQVs02346PeqdY8NCc8rvbSFq8o12h4eUJjvQjp0nSPj
         JXl19jitDy0sZA1ouzMzdMwzG0Oa4mkem+1T4ETeOELKIjVem/x9pC/NCMLtDQMq4fre
         FMimQAlIBNmks0pb6eHPYyeYzACDF4s9l5Ie8ZlBoSX+DmwRruStXbyaVh5w6+/xoi0X
         uzjw==
X-Gm-Message-State: AOJu0Yxgd4gfxaF+BwFCYm4LnRyX8MutcU6y/OwNoO46hZyNTVM6WyL9
	bMPzClaVWLIWRk6N3ziLdCg5x2QOX0czvN15ehVLXY41XxI0PWCDFkjrRh2iaeebvnc=
X-Gm-Gg: AeBDiev0y7WeN70q2yQ2InW7MqnKtLM7eV0H9YSxvZ6njDVnM+ouLx8ze+pvMJUFehR
	FG2fdud/FPOEVtFkuUhmN6f/NSf2fC3R0MBTQ0swlAvDw/eEWmrOgY6ErUvKSPurNjTdZc20lJg
	ODfY4iFPw8EHpB/TmrP1GaTejzzXi6ULa39XVnCxdfPvCjAnRMqcUgY8m3CzS6xQSuCHZW+t1we
	q4UVqk+zjcvyE9bpw4TLDZNnVBWoqMW+jE3DZpc0x+e3ULTVngGdQZv/CSB4mGTZ0HYIn0z1s6c
	mTZ3dnlfglKvjjdn1c6LlNueO6ZpdpWlgTOZGjXLvMqQov4aYBhdb9vluh6XMvAsxOP0W/jdRFc
	igmAezqsym7oqTztgcLclbTlLgv/Kg30HwrwqhJhRew2WxTiEP+va9BJ3BL96Y0z1fvN15ZdzEY
	IcNj8nbvBp2J7fctuzjKCKrVW6VSK7QKwQe/Q4X2kYTQ==
X-Received: by 2002:a05:6000:1a8d:b0:43d:1bf6:30f3 with SMTP id ffacd0b85a97d-43d6424c4f6mr24710460f8f.14.1776162037022;
        Tue, 14 Apr 2026 03:20:37 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73e36e7csm20342473f8f.10.2026.04.14.03.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:20:36 -0700 (PDT)
Message-ID: <5797be19-8886-45a2-bfce-eb7d5f0df6c2@linaro.org>
Date: Tue, 14 Apr 2026 13:20:31 +0300
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Juan Yescas <jyescas@google.com>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
 <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
 <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <4c6a92e0-15a1-4f82-afc9-542f5ad9d2df@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 4/14/26 12:08 PM, Krzysztof Kozlowski wrote:
> On 14/04/2026 11:00, Alexey Klimov wrote:
>> On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 16:52, Alexey Klimov wrote:
>>>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>>>> information and configuration data. Add the SRAM node.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> index cb55015c8dce..cf4a6168846c 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>>>  			};
>>>>  		};
>>>>  	};
>>>> +
>>>> +	apm_sram: sram@2039000 {
>>>> +		compatible = "mmio-sram";
>>>> +		reg = <0x0 0x2039000 0x40000>;
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <1>;
>>>> +		ranges = <0x0 0x0 0x2039000 0x40000>;
>>>
>>> You miss here children.
>>
>> Thank you! I guess I should convert it to smth like this:
>>
>> apm_sram: sram@2039000 {
>> 		compatible = "mmio-sram";
>> 		reg = <0x0 0x2039000 0x40000>;
>> 		ranges = <0x0 0x0 0x2039000 0x40000>;
>> 		#address-cells = <1>;
>> 		#size-cells = <1>;
>>
>> 		acpm_sram_region: sram-section@0 {
>> 			reg = <0x0 0x40000>;
> 
> This covers entire block, so feels pointless. Maybe requirement of
> children should be dropped. What's the point of having children? Why
> does the driver need them?
> 
>> 		};
>> 	};
>>
>> And then later reference shmem = &acpm_sram_region from acpm node.
>>
>>> Also, 'ranges' should be after 'reg'.
>>
>> Thanks, will fix this.
>>
>> FWIW this commit is a copy of commit 48e7821b26904
>> https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.org
> 
> 
> Huh, we should fix that one as well.
> 

On gs101, likely on e850 too, ACPM parses the SRAM and discovers at runtime where
the TX/RX queue offsets are in SRAM. So we can't define static partitions in DT.
I remember that I thought about extending the SRAM driver to add dynamic
partitions (clients to request the mmio-sram driver to create partitions at
runtime), but it was just ACPM that's using SRAM, so I didn't need it.

Cheers,
ta
