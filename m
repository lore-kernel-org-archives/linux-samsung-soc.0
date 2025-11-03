Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123A3019B7
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 11:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169224; cv=none; b=jSA26wpn0bTFNzc0vlLPWOvV6o/cLWvVv8ZaGaxSGHQ/c3h6rdXYfPjtMupfFijrAUdRFzR+ewJqBBU+4Ad+MtX3bd6dsj7TDruZ/9sIsTswn4oDDE73WAYe+xo+YrmZPlyB1zamk91IO5GqiH6NFAXEvaNvS9SmdHxJjrq/xc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169224; c=relaxed/simple;
	bh=lGE7Ybu/RDSIulxrNCxHK7fYM0+Qcge2/3uQRKIybAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsJFDuUXlDmCAlUZeb/DhAaARboNKTZ3M84Z/XyM0+ZIdEW17fG5O0aiPcyoDUyqdyk5f90UyDS3oASOAdsF18yo7vTmjo4sKyCmTVt6e3ovNx3Tw4xlfxC3Z3fAAd7NVUI/Qlsok/X5YKszp81nWUhZo0L5Jfyn9CvqTxrA4tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4g6jvJJ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4g6jvJJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640c48b3b90so1106040a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 03:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762169219; x=1762774019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjmy8XjX+bzyGd/5u6oANywBcBczevKHZ7vCYGJEnxc=;
        b=e4g6jvJJclnb+Bh7nUITeQ9pEDiyXGS235zjqhzozRUfnn8CyyR5clYo7iuFiA6Cgk
         vKmVxhDeuS07H7ObjDJQEaYUd1oF+Lv0F9Yl2vM81WMw1TEInOXkmnhLnvGafPgVJ5nb
         bZrKAciwkJDRT0/rhD8eEmOxdDMszZe2dcu+KZw86aCWuuAfjxaKVSTV4mKxImYtsF+f
         dMOcC+7uzVqRujYWgTBrsoJuaSnKU8wIA1874aVaaAT4W7apTVEtyIUn33Fnp5expoC/
         /DoqUh2e9H/u/7g7dTrlKN8w9EJkLBVNv+9e4Q2Z0/fvi7xq7p0qPgzAi2zP63UGqE08
         g4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169219; x=1762774019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjmy8XjX+bzyGd/5u6oANywBcBczevKHZ7vCYGJEnxc=;
        b=V1ahUcUCN2O9A6t+1+z5LgjU0IuTZl91stve+VtDkNC3ILpxQxpkm/5Eb79xE5qfJJ
         OZKN3oTlyFxma82HQlSmiY+1H7R9fPGKBRsIPNGO0eAPE1JT6AheueJjrM+8r2HaLg3q
         uNa+jDaalblIe8A7OJOpK0ePB7lf4So0ejafPtaV6iU2r0ALcqs0MYqjRgkStatnUeIX
         gnAVWPR8FFauWPtyv61ZRghL7jtgV8QICqZDWtQqFWO2OEB6BrV8/N076GCXTXH9k9ad
         dHKVkoKqsmKTmjgFlCcNWAarp4M83oIf1d/r0o8BVprhuJm+K8C4grqb+DPANNqrUhy5
         qBWA==
X-Forwarded-Encrypted: i=1; AJvYcCWht4ujTMK15aJvs/hd8igY537yY/7sWplm2SrgZDEdWkxO+Ya8jGpQwAbp3mrggnNYphoVnmu+OyowZ5spWTgqfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRsVytZRPHabhUvaYiAbNLiTluUMahBGP4GxnqBj78JWXUgGo
	NdSD0axXSunDkmv+I57RCUFdxYMiDigT3nUUe5DF0FOwA7k/SDZmdm8ivJvbHbbItxw=
X-Gm-Gg: ASbGncu6+BLX9/rVKQFkuBb7WOeBnzIVdlyLYxFE2x4Pslwzv56uqH9si+GSfwKnqPK
	Vnqr7ucCqTMLOICRoda8yUXomttpgJm+VBrXyKtjx/LaAa2Yr3YZ00C4uGMMMQBph/8uWP7QCXc
	8+/1fwugH7pOfTzLJn0ck4UAmM9jE7FM5wotNLUAzncy0rCuWzD0GXoRK7tjTNP8KrbuNDRVi7R
	vggTdsmwdq17uSSPgox4GuDyiSCFd7XsQQnrCePv/zbNaJhCm95MFRyijchrU0fB6hpq1JV6x6W
	VL3vW8gY/RbzFQ+m/nDfeBKoeKI5ejVDEO4L//Sb7o6x3+Pm4m/5vDUDrEHSuEAsfY4d6+EndNP
	gleQxiur+pI9ZSAUhajJsMMwzF3bZbdYEdzx3KyxxM+ig485l8H99Pp4d9Y8MtuasWwRgvhUaQV
	4+jRwtufGmPd0kVMP/8970Ico=
X-Google-Smtp-Source: AGHT+IHivtvy/jRPu0I8Ces/TDhvBY7TVA9tDT88jLA028aX3ASpmqQ3KfJYVYM1rOEorR2QyolQYQ==
X-Received: by 2002:a05:6402:4402:b0:640:a26e:3d76 with SMTP id 4fb4d7f45d1cf-640a26e4208mr5484730a12.27.1762169219448;
        Mon, 03 Nov 2025 03:26:59 -0800 (PST)
Received: from [172.20.10.10] ([213.233.110.172])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640af968e5dsm4801329a12.19.2025.11.03.03.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:26:58 -0800 (PST)
Message-ID: <c5c81744-48a2-4f3f-9ac3-2420af7caaac@linaro.org>
Date: Mon, 3 Nov 2025 13:26:56 +0200
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
 <abd5b16b-1467-449c-b452-7699cbe5d9f5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <abd5b16b-1467-449c-b452-7699cbe5d9f5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/3/25 1:01 PM, Krzysztof Kozlowski wrote:
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
>>
>> 0x1000_0000 is the base address of the OTP controller (OTP_CON_TOP).
>>
>> "CHIPID block" tells it's a device, no? But now I think it was just an
>> unfortunate datasheet description. Do you have an advice on how I shall
>> treat this next please? Maybe register to the soc interface directly from
>> the OTP controller driver?
>>
> 
> 
> Huh, then I am confused, because:
> 1. That's the same message as in other Exynos and it has SFR region
> 2. Your binding said there is no SFR region.
> 3. Anyway, please post complete DTS, so if this has SFR region it must
> have proper reg entry. You cannot skip it.
> 
> Of course next question would be what is the OTP controller...

The CHIPID block, which has a dedicated chapter and all :), consists of two
registers:

Product ID
Address = Base Address (0x1000_0000) + 0x0000, Reset Value = 0xE383_0000

Chipid 3
Address = Base Address (0x1000_0000) + 0x0010, Reset Value = 0x0000_0000

While the Product ID is fixed (fused I assume), the CHIPID registers:
"depend on the OTP value. When the power-on sequence progresses, the OTP
values are loaded to the registers. These registers can read the loaded
current OTP values."

OTP values are from the OTP memory (32Kbit) from address 5'b00000, 160 bits
in total. Even if not explicitly stated, I think the OTP controller copies
the CHIP ID from the OTP memory to its registers, so that the "CHIPID block"
can access them. You notice that the reset value of the CHIPID OTP registers
is zero. They're then filled at power-on.

This is all. I lean towards thinking the CHIPID block is not really a device.
It's just a way software gets the product and chip IDs, which is by querying
the OTP registers. I think I lean towards registering to the soc interface
directly via the OTP device. Or maybe you think differently?

Thanks,
ta


