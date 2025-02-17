Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324FD155316;
	Mon, 17 Feb 2025 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782991; cv=none; b=ZyJnVjYprkAuQYdA8tLiHghbbIqJrx5ppzvoO0mu/551RoD0yyvGHBaZ5/T/mHrHEVoI8tNZuc2MJvYCRbRXev0uwjSDV+mIObmN8lSQZr/NTMp39yWsaIrTmsuz82vVZEXA4N6zWE4uw7kq95ZJ+BJ9ctxTXo7KBUqAcHAWWUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782991; c=relaxed/simple;
	bh=+/V/f2UmhABPBHEhpM89O0v+/BuOgWChXwtKqLdZojE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKi/0EklPrCmQJrZbpku/xO8+0EyhmeqbEj5Lckce5BQVwoRmfoQB1O9q1ns/dD1UwKfJcvccTd0D4G3CR81Sf/nzSKVdWb9SEcj34BdRHYLsTyS+AkSAXQnTUABZFj98ijUu5gszPlS9JQLxlTTBaBCvAqUxLAodhKGjVZMRQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/C7nE3Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/C7nE3Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FC7C4CED1;
	Mon, 17 Feb 2025 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739782990;
	bh=+/V/f2UmhABPBHEhpM89O0v+/BuOgWChXwtKqLdZojE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T/C7nE3ZJzcytEDaob79THSWlUDYhbCSpWGOShDoLnx/nAYGb2tsMnJnFEM1p3u+L
	 QysCsOL9T63Gi044GNTJ7aIMBv4hxm3JkaonTgJ4A44H+XJXXxnyBTdKPfmr/4xbCq
	 W6IlRt9CW2l3h3L4MxPGTbUjn9tmmn2zicAHX0iy6BxHOMXih5Cbs4qXrRoJWV5pNG
	 xpTMJghoPlEh9L6ToAmsuLtAIhwDKTeBFXc3zCO9ZGr8bouTBDUi50F4p5lWJ73902
	 V30LJVPDdtmMR1qWQx9EGOtkC3ciDnR60FBEXI5E+lm9x6w/bUg4pXSFH9hmvNL0Io
	 27zzQqJjDpM8g==
Message-ID: <35d9c210-1ffb-4878-863c-912f389b18e5@kernel.org>
Date: Mon, 17 Feb 2025 10:03:03 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Fix broken USB on Exynos5422
 (TYPEC dependency)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
References: <20250216114136.245814-1-krzysztof.kozlowski@linaro.org>
 <88b00cc53cd5cb3682a29d6a2ec491c7640129ce.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <88b00cc53cd5cb3682a29d6a2ec491c7640129ce.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/02/2025 06:59, André Draszik wrote:
> Hi Krzysztof,
> 
> On Sun, 2025-02-16 at 12:41 +0100, Krzysztof Kozlowski wrote:
>> Older Exynos designs, like Exynos5422, do not have USB Type-C and the
>> USB DRD PHY does not really depend on Type-C for these devices at all.
>> Incorrectly added optional dependency on CONFIG_TYPEC caused this driver
>> to be missing for exynos_defconfig and as result Exynos5422-based boards
>> like Hardkernel Odroid HC1 failed to probe USB.
>>
>> However ARM64 boards should have CONFIG_TYPEC enabled and in proper
>> state (e.g. =y when PHY_EXYNOS5_USBDRD is =y) for proper USB support on
>> Google GS101 boards.
>>
>> Add itermediate CONFIG_PHY_EXYNOS5_USBDRD_TYPEC symbol to skip TYPEC on
>> older boards, while still expressing optional dependency.
>>
>> Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
>> Closes: https://krzk.eu/#/builders/21/builds/6139
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Closes: https://lore.kernel.org/all/3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com/
>> Fixes: 09dc674295a3 ("phy: exynos5-usbdrd: subscribe to orientation notifier if required")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Patch for issue in linux-next
>>
>> Changes in v2:
>> 1. Add PHY_EXYNOS5_USBDRD_TYPEC, so arm64 defconfig will have both
>>    symbols in-sync
>> ---
>>  drivers/phy/samsung/Kconfig              | 12 +++++++++++-
>>  drivers/phy/samsung/phy-exynos5-usbdrd.c |  1 +
>>  2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index 7fba571c0e2b..b20ac6b75993 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -77,12 +77,22 @@ config PHY_S5PV210_USB2
>>  	  particular SoC is compiled in the driver. In case of S5PV210 two phys
>>  	  are available - device and host.
>>  
>> +# None of ARM32 Samsung boards use Type-C, however newer ARM64 do and
>> +# PHY_EXYNOS5_USBDRD driver needs TYPEC to be in a matching state to avoid link
>> +# failures (see optional dependencies in kconfig-language.rst).  Intermediate
>> +# PHY_EXYNOS5_USBDRD_TYPEC symbol allows to skip TYPEC on ARM32 boards.
>> +config PHY_EXYNOS5_USBDRD_TYPEC
>> +	tristate
>> +	depends on ARCH_EXYNOS
>> +	depends on ARM || TYPEC || !TYPEC
>> +	default y
>> +
>>  config PHY_EXYNOS5_USBDRD
>>  	tristate "Exynos5 SoC series USB DRD PHY driver"
>>  	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>  	depends on HAS_IOMEM
>> -	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
> 
> Is it not possible to just drop the '&& COMPILE_TEST' part to make
> it
>   depends on TYPEC || TYPEC=n
> or
>   depends on TYPEC || !TYPEC
> (without any of the other changes)?
> 
> If not, why not, are there corner cases that doesn't catch? Some
> minimal testing seems to suggest that that works, too.

Yeah, I think I overcomplicated it. I wanted to make it really
independent from TYPEC on ARM, but that's not trivial and my patch fails
here.

Best regards,
Krzysztof
