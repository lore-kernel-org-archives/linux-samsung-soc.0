Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B52FFDEA
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167057; cv=none; b=cnZZv66rZCuL+G/WNpsIRAkbkaDLk3m2AHyFysW3/cwwTXVW8ZWYlHqe//VV+kCW9aFxqsd5JKb4XqnEOhASpcDO07dzUgtyPnqkbLyK2QankxlunBw1bWkkIZkDStF9qz7taOEk4CrD7HXmaaGpDqJuftEake+5wTQY1/cIpV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167057; c=relaxed/simple;
	bh=K/DZtMl6bTbXSyX1kAX6cDkUuBNHfLB6DitBcsu4woE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=da0/ZQzCybKlJ/D6JtOyNZrAVG8rYsK3qHFgRlRVRDrtzvwY4S6hvaWQhpqg+JTeqDY1D+dMpkNGWutZP5F8wBcpci7ot8Ug56/jMSgvXd7nn34KBd7UUVJcC2gWK3sBlVvEgLc4wE1ZlBGQ+mQRG2zEDwoV8A7KWIN6evD306Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Db1WiWvp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Db1WiWvp"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b64cdbb949cso696747266b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 02:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762167054; x=1762771854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aAPWr6sG6plHcRAb74AERMut+3PIj3xR4C7ijLuCgY=;
        b=Db1WiWvpl+hkZBbwI9ag7Df6MHc9U8E5LwVFjmJ/JhNqOQd7gRgMfQjvZoqDMRUDbV
         NzHLozZgrQKBoHYjxkjELN0DT9U2YrEXGgIEEnydTXFXxdSBO2SIraTh/QTrkfVfuhT9
         kMZKgqtQyrKCG4R8oDFNNq+00wpTJpT3vAP52eldtqBcxCTQqUT3Eez6TK0T4GaD3KN0
         9CviyO2M9SLHS+XqOeqK6HL9Bgm26fLu9nNr4e3TLLbxBM4QOkx1qAqp0eib9J193P8K
         Lb1/RCTjXk+M6My2QctUV9i1PeG/5lUu3+azOW0vxz+RAp8e8zpPoYBVESf/ayoRrYMp
         BMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167054; x=1762771854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6aAPWr6sG6plHcRAb74AERMut+3PIj3xR4C7ijLuCgY=;
        b=wjv39TSMksLcKFFe1tvmB+LPnCyKGV5qU3XlmHxLrzCapy1HQF0sSsiCWAXEc/IH1L
         VgN2OhzFxBDEQE8cG6X6gE7RYaJX2khKNrf9ONoManaElzP/bajGTClcQ9mDPSB0ythy
         9RakMUahpL0B3eVQzjC8fJZU9FbnQ33wfel7/Y9tEGAAacqpOduymekrnqXLnqx/vDvP
         pFnxDXeIIL/JcfRcQ91ORvHcFF34JCr92fcXGnNmS3CYUP/C6zK/I2Dy8Vm6paEVyqON
         PMbZ1quQ7rD5rEr8sLf65ZrS19wjvMMzT7of1QSH8/eqIX9ofYFdUV4MzZRURu40pW8r
         fqHA==
X-Forwarded-Encrypted: i=1; AJvYcCXMoyzpEIXdBVCr5nfXuU3udAIaN/xblRYe3iTQ+IzOno7rdAhA/mz9raGdWmSZN7FoSfQ03RwhuyLA0KGFzd0QEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztTvV7kgHQ8VbiZY+X2feJKtHb+F8QVSPW/syGIjh3UOopYYrx
	+GhM3sNbLjXpH2gBx2zhmI/hvZVLFq63CE2XMQ8C8wTJqiOXztWk36unQcymqDpF1E89U3nukPI
	/D7QI
X-Gm-Gg: ASbGncudTqXOliP50yOgIjn6OxBU0yL7fuS2nYnanFrRFtPQM6l3e5OeKSwCcULHG/t
	QHb2kAG6PzcO4pyoaQXYKHsR+u7PFOigeygkSLu7jxn0Q7n0P4EDY5BYYFf4TRyHe3Nt5yAFUQr
	nwfMD+WEwre+Kk6kIrgNutqfrIUt66mvMvr6gtMjUphvOZBwxNJ/QNsdl54ej0czjte37DzFGFE
	0ZpbvOAO2u80yhnk3lBdThdMRSOoaXgyd0aDGOiR1wWa5r+QxELrU0vQm0SvZVzhMM//w2lV+dG
	KoE6ainRzoqTL5TMoWaewR7iWoBMlqgnMGwlStDD/LRkY/HnvhRFTseyWGEZQUCYA7MOEAMUkyx
	ETAq3VuW151MgKzpzct8y2UkkKe0ZTEZ+g5+xeDsjsgrA8nj8qzvhRemLyadzht8PVvHdVru5Q8
	alBEpLkdPbMc9p
X-Google-Smtp-Source: AGHT+IGAsmHIJSxBw8Ivjg8wV5c1LPLNuyYfSnhOFaJTNn0jDUJaTnBR+1poGrO0LFeXhX5G5jmT/Q==
X-Received: by 2002:a17:907:e98b:b0:b6d:8d8d:3010 with SMTP id a640c23a62f3a-b7070840e1bmr1281242166b.56.1762167053554;
        Mon, 03 Nov 2025 02:50:53 -0800 (PST)
Received: from [172.20.10.10] ([213.233.110.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b374067esm411112266b.64.2025.11.03.02.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:50:52 -0800 (PST)
Message-ID: <b82af744-ebbd-4dc8-8ccb-c7e4f2a6b04d@linaro.org>
Date: Mon, 3 Nov 2025 12:50:48 +0200
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251103-pompous-lean-jerboa-c7b8ee@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/3/25 12:18 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 31, 2025 at 12:56:09PM +0000, Tudor Ambarus wrote:
>> Add the chipid node.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -467,6 +467,12 @@ opp-2802000000 {
>>  		};
>>  	};
>>  
>> +	chipid {
>> +		compatible = "google,gs101-chipid";
> 
> That's not a real device, sorry.
> 
> I had some doubts when reading the bindings, then more when reading
> driver - like chipid probe() was basically empty, no single device
> access, except calling other kernel subsystem - and now here no single
> actual hardware resource, except reference to other node.
> 
> Are you REALLY REALLY sure you have in your datasheet such device as
> chipid?
> 
> It is damn basic question, which you should start with.

Documentation says that  GS101 "includes a CHIPID block for the software
that sends and receives APB interface signals to and from the bus system.
The first address of the SFR region (0x1000_0000) contains the product ID."

0x1000_0000 is the base address of the OTP controller (OTP_CON_TOP).

"CHIPID block" tells it's a device, no? But now I think it was just an
unfortunate datasheet description. Do you have an advice on how I shall
treat this next please? Maybe register to the soc interface directly from
the OTP controller driver?

Thanks!
ta
