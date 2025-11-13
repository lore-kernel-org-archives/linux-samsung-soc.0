Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23742D73B5;
	Thu, 13 Nov 2025 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026540; cv=none; b=tYRSPLDzLE7FDS8FfxuX2zdHu0Ae3Wkwh0eM/AC8oWrJdQnThgC/3vZGQIylEt7Vzjlhlp+66hagmOHKqef5GEJaMKj7DlI9qRsNqfYu1uwmSLILKvuoVF0cFmN/Odw7+9ST2W3BFipinAzpmrqt9vWXxw5SprPYl9hQ7hvdjtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026540; c=relaxed/simple;
	bh=Acg8WfWv6O0Hz6e63OeZUnHvxENtdAjcALw9YHwuktI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIuWzlHZt+E2jEjNCVKrVKMH+5FnZpn7GuD5mNmmQT9uyFZWtYN7JjjIQdS0hzeSXYBLHuHlTV5cYKjOI3E25bEXtwtdjC9kU4VQEEoQDDAW+Xg3X0rwt2GjmS0zxRIp9JXjLE1RYOHbCWNSwyjqAeug8CYRHhemsRXCrC1U004=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uO/R5TkG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uO/R5TkG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B86CC4CEF8;
	Thu, 13 Nov 2025 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763026540;
	bh=Acg8WfWv6O0Hz6e63OeZUnHvxENtdAjcALw9YHwuktI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uO/R5TkGgeGVVE4f/54ZW7cSJQb2cg22BC/Sz3eAIWC7rN4Hvid1Kgo6fNI2E8TEV
	 Qd9imDtrhaj2CA4Dn3BJNZgpgaBnncT1rPkBBGYeQ8Y+cfTEtuFH3doerMEABTf9Qp
	 OBZ/+lrcIxM6ztvCvmAl8TX/CmOHDN3rSid9THEfb4ZwEb+w/L5O/z1VOopFvPkTPr
	 g3o1HRKc+T2JbLUJqqW9gDxOZdX0/pSxC71nas9PnF1bJb7EtodVkGdOROkIXNxK1V
	 0dh+T3uDJbxyIv/1Ei6LgX5VSCkVrhPmp5HRhCXel18a+WaIutfpgZ91ay4UGHBaeW
	 2z3pA6+hgKYqg==
Message-ID: <725ea727-d488-40aa-b36d-04d6d44a8ec5@kernel.org>
Date: Thu, 13 Nov 2025 10:35:35 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] nvmem: add Samsung Exynos OTP support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <9d77461c-4487-4719-98db-1c5c5025c87e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/2025 10:28, Tudor Ambarus wrote:
> 
> 
> On 11/13/25 10:30 AM, Krzysztof Kozlowski wrote:
>> On Wed, Nov 12, 2025 at 08:29:06AM +0000, Tudor Ambarus wrote:
>>> Add initial support for the Samsung Exynos OTP controller. Read the
>>> product and chip IDs from the OTP controller registers space and
>>> register the SoC info to the SoC interface.
>>>
>>> The driver can be extended to empower the controller become nvmem
>>> provider. This is not in the scope of this patch because it seems the
>>> OTP memory space is not yet used by any consumer, even downstream.
>>
>> Quick look tells me you just duplicated existing Samsung ChipID driver.
>> Even actual product ID registers and masks are the same, with one
>> difference - you read CHIPID3... which is the same as in newer Exynos,
>> e.g. Exynos8895.
> 
> Yes, that's correct. It's very similar with the Samsung ChipID driver.
> 
>>
>> What is exactly the point of having this as separate driver? I think
> 
> The difference is that for gs101 the chipid info is part of the OTP
> registers. GS101 OTP has a clock, an interrupt line, a register space 
> (that contains product and chip ID, TMU data, ASV, etc) and a 32Kbit
> memory space that can be read/program/locked with specific commands.
> 
> The ChipID driver handles older exynos platforms that have a dedicated
> chipid device that references a SFR register space to get the product
> and chip ID. On GS101 (but also for e850 and autov9 I assume) the
> "ChipID block" is just an abstraction, it's not a physical device. The
> ChipID info is from OTP. When the power-on sequence progresses, the OTP
> chipid values are loaded to the OTP registers. We need the OTP clock to
> be on in order to read them. So GS101 has an OTP device that also happens
> to have chip ID info.
> 
> For now I just got the chipid info and registered it to the SoC interface
> (which is very similar to that the exynos-chipid driver does), but this
> driver can be extended to export both its memory space and register space


There is no code for that now and possibility of extension is not a
reason to duplicate yet.

> as nvmem devices, if any consumer needs them. Downstream GS101 drivers
> seem to use just the chip id info and a dvfs version from the OTP
> registers. DVFS version is not going to be used upstream as we're defining
> the OPPs in DT. So I was not interested in extending the driver with nvmem
> provider support, because it seems we don't need it for GS101.
> 
> Do the above justify the point of having a dedicated driver?
Only partially, I asked about driver. I did not spot previously the
clock, so we have two differences - CHIPID3 register and clock - right?
I wonder why Exynos8895 and others, which are already supported, do not
use CHIPID3, but nevertheless these two differences can be easily
integrated into existing driver.
 >
>> this can easily be just customized chipid driver - with different
>> implementation of exynos_chipid_get_chipid_info().
> 
> If the answer is no to my question above, how shall I model the device
> that binds to the existing exynos-chipid driver?
Just extend the existing driver.

Best regards,
Krzysztof
