Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919C2DFA46
	for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763027516; cv=none; b=JaMQeQQoKfJMiKol+Xahxs3kxZ/gpHrqx3ah/gan6l6jcZSiTDBhvvpJ2jd6+oEyJiHzXdK4fwo4lxaQXwW/DmCtAYt30F3RROVkrOQ7bv4kx1cf6hC6uGQOb2TaQGb59FzP6WIwTuV18IGoyW8U5uNVAf+ytxDNSfadRLGVDaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763027516; c=relaxed/simple;
	bh=1oacFYY/294TkhoTBx5pVnm2MquFkmlHkFBHaMNlPfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfRCW0ClKYHqkYZAD25eRnRh+DEYOdopKzS5dpM60hy6gK07EJaAdrAJn9PvTL8FaFWjWXG4yCfdrO5Q7YKdFJz19tWP1STComp/+cWkCzvU1BRksxSHI4GWMEZ37XB0Fuiey0P02X/eqa9oy2cQbMK5hhU/kTQyGJP4lGw04eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CBqx3iDU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CBqx3iDU"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b47f662a0so808141f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Nov 2025 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763027513; x=1763632313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDYZngmwSRp+0NNAwoPTnkhHZW5E4BniA8duLqhYUG0=;
        b=CBqx3iDUQC4FdMFOg5rqeoQLrvVlMD4F1JABvIRPnoED3VbaBWTxIUhETV7JWNSw7v
         AuCDQPOG/sEjmn5swazPIDXI1dsNoBvEiYAXtQhGivdbdmK8t/aFMwZrfBF49LLC4KvE
         arYLTbTKQzsO4k4EhfOlDM5syHRFNjdYs9tprBQ1hZ7/VUcR8PAZROYfK+ksGQOq8T6L
         uhL4Zxa5BLxVNIAgEX5rttAflXGQgnDoy8c6OkkTXNRJfHGcVO8PylHtYl1N/9sWOrSb
         W01xaT7rCITpfstiHtf3HbZfeTwlVR+wYxkQ78YJtquPt6s0prMg6EKWnUZlbskN3AaX
         kCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763027513; x=1763632313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDYZngmwSRp+0NNAwoPTnkhHZW5E4BniA8duLqhYUG0=;
        b=spnFraqbGaqFInetY14Nko1/noSRp1bzxZgGLjAWXknrNloVapyr96hU5xFEU2duNB
         vJakQmuZQeJc7hKuR0aWT5kMFqMVC3uvHUMzp0QkJd94B+wi9yfDCeW/pq9YX7/fgrmj
         f4xhp7mx+c9rq0/jUQNyZCQ49XDgAFOdzt6HAsdV682h8nRFBipq9pcV4dBYXFm1ZzwQ
         dEyljIiTJI3MkLse4vay4SclP8c0P8SBrtTzQyJvk2LYgDNbQFSMedw7NogJ3Sp3Bwk6
         DSkkaxpD1G5qhgXee+LZo+2hwE9BT4QcYSBMf0p/wA2izTxj796l0x+HUvUqyiAASYKO
         EJQw==
X-Forwarded-Encrypted: i=1; AJvYcCVtazJ6yaBICymSn4L9eRUu83o/1b9+3fHrXpliKkjFATUii5xUQNluH31liBTH1Ca035AbY/5+EkY/JQE4eOCRKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGi3YMUs221VnsZLbSS0pqqTfAri9u5Uq3uf+67d442YRxDWak
	i0E88/YAuDQhaVWmdPb4GcPA5rv1BcvVZyc2PkVQQO4bWgcKZsNnT3MlYQmjLTpTDns=
X-Gm-Gg: ASbGncudDnT44Mo3zyPX5t5bekUgnd2KwSlAQIClOy3rYW/RrBOuUIa5teRSWl2tD3m
	Irh0Di+cqTA/EKFoS6yu+NpfMU9h7dWCQWHZ4x2KsfKYa1VffxIfPILPoYp8aSWfG5+Hm5648cJ
	pNJL9gapk6L7M0CVpFVGzS2M5SWDcaWqgK5ua4NML15wtIMvA8CJnuuPvZWKD2Yv2PYDBlcK6ZM
	4eGfgIKYWMqNidj5ktLVdn9qhT8Ea/OV+y/tMOIQgK3nfObe5bK+DQ7eWta6LcDGtqhoEmeCtVH
	Cmx7Ya+2q3f75wVmGIlmBl84QkKLi/8lCGAe9VPYIZMmP/K/X8JTNcPoYPlXlufxf/86YUWmGG+
	oeHEJEKNiGObZu1wigmzewxE1R3T3OKy0re11lekSlxJdAv/ePYdKZx53nlaQvPipdXGXUzWxgj
	LRsh//kmHKJcWqoRHm
X-Google-Smtp-Source: AGHT+IHZkeuEDZYJsmeqSkNhq3Bl5KYXIylnr89Ea5RYR3BcZR9jpgcLY7nN/+8jXCtmO4YuJD3daw==
X-Received: by 2002:a05:6000:2887:b0:429:58f:26f with SMTP id ffacd0b85a97d-42b5281c40cmr2203450f8f.24.1763027512635;
        Thu, 13 Nov 2025 01:51:52 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm2817519f8f.38.2025.11.13.01.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:51:52 -0800 (PST)
Message-ID: <1af37451-1f66-4b6b-8b36-846cbd2ca1e8@linaro.org>
Date: Thu, 13 Nov 2025 11:51:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 semen.protsenko@linaro.org, willmcvicker@google.com,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
 <20251112-gs101-otp-v2-2-bff2eb020c95@linaro.org>
 <20251113-benign-macaw-of-development-dbd1f8@kuoka>
 <9d77461c-4487-4719-98db-1c5c5025c87e@linaro.org>
 <725ea727-d488-40aa-b36d-04d6d44a8ec5@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <725ea727-d488-40aa-b36d-04d6d44a8ec5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 11:35 AM, Krzysztof Kozlowski wrote:
> On 13/11/2025 10:28, Tudor Ambarus wrote:
>>
>>
>> On 11/13/25 10:30 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Nov 12, 2025 at 08:29:06AM +0000, Tudor Ambarus wrote:
>>>> Add initial support for the Samsung Exynos OTP controller. Read the
>>>> product and chip IDs from the OTP controller registers space and
>>>> register the SoC info to the SoC interface.
>>>>
>>>> The driver can be extended to empower the controller become nvmem
>>>> provider. This is not in the scope of this patch because it seems the
>>>> OTP memory space is not yet used by any consumer, even downstream.
>>>
>>> Quick look tells me you just duplicated existing Samsung ChipID driver.
>>> Even actual product ID registers and masks are the same, with one
>>> difference - you read CHIPID3... which is the same as in newer Exynos,
>>> e.g. Exynos8895.
>>
>> Yes, that's correct. It's very similar with the Samsung ChipID driver.
>>
>>>
>>> What is exactly the point of having this as separate driver? I think
>>
>> The difference is that for gs101 the chipid info is part of the OTP
>> registers. GS101 OTP has a clock, an interrupt line, a register space 
>> (that contains product and chip ID, TMU data, ASV, etc) and a 32Kbit
>> memory space that can be read/program/locked with specific commands.
>>
>> The ChipID driver handles older exynos platforms that have a dedicated
>> chipid device that references a SFR register space to get the product
>> and chip ID. On GS101 (but also for e850 and autov9 I assume) the
>> "ChipID block" is just an abstraction, it's not a physical device. The
>> ChipID info is from OTP. When the power-on sequence progresses, the OTP
>> chipid values are loaded to the OTP registers. We need the OTP clock to
>> be on in order to read them. So GS101 has an OTP device that also happens
>> to have chip ID info.
>>
>> For now I just got the chipid info and registered it to the SoC interface
>> (which is very similar to that the exynos-chipid driver does), but this
>> driver can be extended to export both its memory space and register space
> 
> 
> There is no code for that now and possibility of extension is not a
> reason to duplicate yet.
> 
>> as nvmem devices, if any consumer needs them. Downstream GS101 drivers
>> seem to use just the chip id info and a dvfs version from the OTP
>> registers. DVFS version is not going to be used upstream as we're defining
>> the OPPs in DT. So I was not interested in extending the driver with nvmem
>> provider support, because it seems we don't need it for GS101.
>>
>> Do the above justify the point of having a dedicated driver?
> Only partially, I asked about driver. I did not spot previously the
> clock, so we have two differences - CHIPID3 register and clock - right?

clock and interrupts, but I don't use the interrupts because I just need
to read the OTP registers to get the chip id info.

> I wonder why Exynos8895 and others, which are already supported, do not
> use CHIPID3, but nevertheless these two differences can be easily
> integrated into existing driver.

they can be integrated, but I want to make sure we're making the best
decision.

>>> this can easily be just customized chipid driver - with different
>>> implementation of exynos_chipid_get_chipid_info().
>>
>> If the answer is no to my question above, how shall I model the device
>> that binds to the existing exynos-chipid driver?
> Just extend the existing driver.
> 
So you mean I shall have something like that in DT:

+		chipid@10000000 {
+			compatible = "google,gs101-chipid";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};

Maybe remove the interrupts because I don't need them for reading OTP regs.

What happens in the maybe unlikely case we do want to add support for OTP
for GS101? How will we describe that in DT?

Thanks!
ta
