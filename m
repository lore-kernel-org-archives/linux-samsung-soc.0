Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B19B224B04
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766945; cv=none; b=tShyp4uWHPRvZp+siUKPio2IOHbS6XJwv+vGNSRCNjY7KXtZnlmzeqaTvp9/1tlKDCbHivtbTBgXl5EnbYdpP/jzlQWaVPBEL0OEMBpPXGEzqIpBr31MhZ6ZHKYx7lH8O2OMcQ5gkt8WzJuktYojeiffQeAtVdXu8Qm/s6xDJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766945; c=relaxed/simple;
	bh=cQCq9mf+4odA3iUdRoOEUQPVNJLSpTjSlhgginhi9m8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jah/sSTzZmYcyS1U5uHJK9fb3iklakoiU6keGlNflq13ptvEz/ZkIqIyKfMXE88xGIrhDbsC9vf3K0LGWnIau5fnDXycQGnfOVflL8d7SKYsvxhCJNZxC7doIEKODvVv575pJhXE8AFLLoXP3sYLBEBbKHUgmTcJ2Em3k3lXyO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nU39OciU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nU39OciU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477770019e4so17036525e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 01:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762766941; x=1763371741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yy2Y3SJbuc6h3iInMfmhynFq9n8Y39FAnrKgiWA6qd4=;
        b=nU39OciU6xlalCppBfMHmG2Ki88rc+8SK7ABBNIHuRhHhotVhMVevQ7Ofmw0WQ4RbS
         ptCnqjtGiOtUo2tlqv3i9cfZmAgsAohZM8UM8TaiQyDBfpiG5Xb1Wywar/EVQ9nErMjS
         dFpcatjHFjm91/PN5v1OzeowjCY6FbfpZl8toKNxFv8XDQLpuhuuaCK7PytLMAPMEGa6
         Xtzy/Oo0sjtCpQV90RizvlBZtll4wIgJDdGxynj9PBeSvUtskUMKCNvMEbbyTtNH8KuM
         wVq1YSTGFLxZxhQHA50rDKkpFewYz2sU5qxOrknpZll280kKADD1VRRTVfberFH4FHPb
         9lzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766941; x=1763371741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yy2Y3SJbuc6h3iInMfmhynFq9n8Y39FAnrKgiWA6qd4=;
        b=BuSBKveK/C+xqUnVMjdSEPBmKsk+tgH/dVqJPboq/iizC5eW+6imNnrQPJ+kuthuc4
         FHDnwBBT5Nif9VGu1pD1LX/V2+LgYAj7IAJj3wa8bSKQWtfid61l1xMq5fYYCdpIET+B
         /7uaUjj9utXV9iio7bVOk9tGL7hzqMl+70v1LjBhpOKMy9H5KsaVBOBwQTD2K4kByBGv
         LeEfDyU/qIG1XOo7cTunH6fHOS922T3unwBns+8H/wP8IFrxBAnFBn94+Vj8xDb0TuVC
         efEeykAdfUXj6UTQbWBq4I9NF8JTJzxINcNvcFeFu/XPFR2rS8y0UJZ6IewVTvwcfbEb
         kpmA==
X-Forwarded-Encrypted: i=1; AJvYcCWVTHR8XBj67KdJ+S7UgLs4bPwQsc+6yCJFOqUkGUWCMKWTsXXPExkCiMvkoCB0O/9RX2LZRMq5TgpnuRXe+WPFeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4k9QqP0y7jFP8/UUhKpU8ck1cS7zsZnoynOPu2L5X1BldMoAu
	ZKt+pvGesRx1Y5zC68vUgaK3WZpiYh9clkUGuhWnogOcxq7I/0jZsrJp/259cgfvx2s=
X-Gm-Gg: ASbGncutSiTi1VpUUICP+gCMYvIT5ZldGxxSJVLvGfhajD4NJ7XrmOen60aepq01FEk
	/jqsSAHzAIyvwUv+NlWZGAc2mRSdh+3/+BT3ntw1M+4NsZbSSq4S2xvR5GXBJiATHU9b8wjdaaa
	W7cJny2xLqKUNPTv+OygbbrBRGbYwZ4yxvYgoyzhJuy4W2PFD4Txboamsw3ajhpnk/aaBZXRfRA
	OQndzFQk8O1+hUJQfv29Yt5TlVNLbrMb1x9EpwbD8A6FrFKxdl5BOr87vSKvY+Qb1Qs3ynI1IQp
	wm+yxL17B1EUNgrfpk04p8kdqVVP8xa4UorX+skAofLSjWkXPs7UrwWQ05vb6hH07iwqJzBd6u6
	TUfPot11j48PZNh1M9vC9Zlx5L8n3TSGUOWW2TthcvNj4ADDdRtmtaDD6Ez98oYpEkOfEk8CvI5
	JSlQheOmwPB1Cpts4b
X-Google-Smtp-Source: AGHT+IGRrEV2Y5FWsA2ScUyXO8LRGfeCzTu8A6LXyew1cnLNeQXucI/waFNT0uIfIF1Jhc8bs3HOiw==
X-Received: by 2002:a05:600c:4453:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47773277296mr66813835e9.30.1762766941281;
        Mon, 10 Nov 2025 01:29:01 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm21324511f8f.22.2025.11.10.01.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:29:00 -0800 (PST)
Message-ID: <3a2f9b58-bbdf-4977-b06b-9f43a4555274@linaro.org>
Date: Mon, 10 Nov 2025 11:28:57 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: exynos: gs101: add the chipid node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
 <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>
 <20251103-pompous-lean-jerboa-c7b8ee@kuoka>
 <b82af744-ebbd-4dc8-8ccb-c7e4f2a6b04d@linaro.org>
 <b9b10943-0ece-495f-a6a8-403fc1ab9213@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <b9b10943-0ece-495f-a6a8-403fc1ab9213@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/4/25 9:14 AM, Krzysztof Kozlowski wrote:
> On 03/11/2025 11:50, Tudor Ambarus wrote:
>>
>>
>> On 11/3/25 12:18 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Oct 31, 2025 at 12:56:09PM +0000, Tudor Ambarus wrote:
>>>> Add the chipid node.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>>> index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
>>>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>>> @@ -467,6 +467,12 @@ opp-2802000000 {
>>>>  		};
>>>>  	};
>>>>  
>>>> +	chipid {
>>>> +		compatible = "google,gs101-chipid";
>>>
>>> That's not a real device, sorry.
>>>
>>> I had some doubts when reading the bindings, then more when reading
>>> driver - like chipid probe() was basically empty, no single device
>>> access, except calling other kernel subsystem - and now here no single
>>> actual hardware resource, except reference to other node.
>>>
>>> Are you REALLY REALLY sure you have in your datasheet such device as
>>> chipid?
>>>
>>> It is damn basic question, which you should start with.
>>
>> Documentation says that  GS101 "includes a CHIPID block for the software
>> that sends and receives APB interface signals to and from the bus system.
>> The first address of the SFR region (0x1000_0000) contains the product ID."
> 
> So chipid@1000_0000
> 
>>
>> 0x1000_0000 is the base address of the OTP controller (OTP_CON_TOP).
> 
> 
> and efuse@1000_0000 from your other patchset and your sentence above.
> 
> Please add them to DTS and check for warnings.

One would get an unique_unit_address warning, yes.

> 
>>
>> "CHIPID block" tells it's a device, no? But now I think it was just an
>> unfortunate datasheet description. Do you have an advice on how I shall
>> treat this next please? Maybe register to the soc interface directly from
>> the OTP controller driver?
> I think in the SoC it is impossible or at least never happening that you
> create two devices for the same address, therefore either chipid is a
> device or efuse is a device.
> 
Right. The ChipID "block" does not have its own registers. It references
the OTP registers. I'll describe just the efuse device in the DT and
register to the soc interface directly from the efuse driver. Please let
me know if you think there's a better way to handle this.

Thanks,
ta
