Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8CF19258E;
	Sat, 15 Feb 2025 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739614077; cv=none; b=G+LbHFT2bDkfZQ8Ep4ebDmiRA34psjrwuuX+S0ExBGuarPyPZ0jFt4s3mt7XD3jWfmVvzASlrNq/GOfvwvFL964xfotkKGIwtjkPDzf8/O2zx+Tcm+2bd1uGW63BKcEMnswpqxKna23q/uwVO44IQnhYjtkfhgs10047roaEwZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739614077; c=relaxed/simple;
	bh=tIDU56jo1s+8ObGKmjKkETRM71pM0ipfljqXskOq1B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYL4/Pi4I0C+fWEEGI5zm+lyJFLAuPDjd5YvHESwr+EY0xyOhY3DUVAH78mPezyCkZUrpYLZMcCbtgEGx7aL2xtJ3ouPwFDFfAxLmDKfbKA+lmsTpoUeIGHCpjlpn7OL2COdI+ane5BQrba0cWfAtEp7GFCMYVIDliwD+VeiJME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qi/k3+A5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qi/k3+A5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536A4C4CEDF;
	Sat, 15 Feb 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739614074;
	bh=tIDU56jo1s+8ObGKmjKkETRM71pM0ipfljqXskOq1B8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qi/k3+A5Xa5039kXxfQKobZt5SEFykpdULmJVuAdf4Ztgd36omY3Lf+bxJhlx/VbV
	 WRsJpETiz1GYv450e5jyBRJ0e36rg68oYKFoBG11lZUzzgoyBfHdZfgtXurhXNocCt
	 dDOavZy8T4laQniqN+x2AsMc+C5lJ4t1VjWjKH0pZGZsJFJaLZApzg2Abu6wwbYsqj
	 39x2PBOWshqbq0xE7dylOxaEeUyaSrgJ85bpdCVQIqfB+kRAzNuV8jPB/1M4iUkZ0f
	 E++o3Rzp1T3cGznja9cbYRX/irFPEtl2BO//q+2Tbh1CKpAmMAjBMfKN3wJQw7yUvq
	 QYrckA0bbRP+g==
Message-ID: <7c0dcf24-187c-4dc8-aa4a-4a8f814775b2@kernel.org>
Date: Sat, 15 Feb 2025 11:07:45 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <CGME20241206163109eucas1p12aea3a9a6c404cd7c678009ea11aa5b3@eucas1p1.samsung.com>
 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
 <3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2025 20:30, Marek Szyprowski wrote:
> On 06.12.2024 17:31, André Draszik wrote:
>> gs101's SS phy needs to be configured differently based on the
>> connector orientation, as the SS link can only be established if the
>> mux is configured correctly.
>>
>> The code to handle programming of the mux is in place already, this commit
>> now adds the missing pieces to subscribe to the Type-C orientation
>> switch event.
>>
>> Note that for this all to work we rely on the USB controller
>> re-initialising us. It should invoke our .exit() upon cable unplug, and
>> during cable plug we'll receive the orientation event after which we
>> expect our .init() to be called.
>>
>> Above reinitialisation happens if the DWC3 controller can enter runtime
>> suspend automatically. For the DWC3 driver, this is an opt-in:
>>      echo auto > /sys/devices/.../11110000.usb/power/control
>> Once done, things work as long as the UDC is not bound as otherwise it
>> stays busy because it doesn't cancel / stop outstanding TRBs. For now
>> we have to manually unbind the UDC in that case:
>>       echo "" > sys/kernel/config/usb_gadget/.../UDC
>>
>> Note that if the orientation-switch property is missing from the DT,
>> the code will behave as before this commit (meaning for gs101 it will
>> work in SS mode in one orientation only). Other platforms are not
>> affected either way.
>>
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>
>> ---
>> v3:
>> * drop init to -1 of phy_drd->orientation (Vinod)
>> * avoid #ifdef and switch to normal conditional IS_ENABLED() for
>>    CONFIG_TYPEC
>>
>> v2:
>> * move #include typec_mux.h from parent patch into this one (Peter)
>> ---
>>   drivers/phy/samsung/Kconfig              |  1 +
>>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 56 ++++++++++++++++++++++++++++++++
>>   2 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index f10afa3d7ff5..fc7bd1088576 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
>>   	tristate "Exynos5 SoC series USB DRD PHY driver"
>>   	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>   	depends on HAS_IOMEM
>> +	depends on TYPEC || (TYPEC=n && COMPILE_TEST)

BTW, this syntax never made any sense - it did not work. The optional
dependency is expressed as:
	depends on TYPEC || !TYPEC

but what it epxressed is that it is possible to build it without typec
only for compile test, which is odd if this was meant to be optional.
And further code:
	if (!IS_ENABLED(CONFIG_TYPEC))

clearly suggests this should be optional.


Best regards,
Krzysztof
