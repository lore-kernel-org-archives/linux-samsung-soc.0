Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B610B1F4723;
	Wed,  8 Jan 2025 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328377; cv=none; b=s/UohfJuWZJiicT3w8cdHtnAJKH8Yxldc2U8EXnaeAd/CN5erajjA/g3k/UGHneiIBMquT3jSFV9OqZobigbLlbdut2eB942AjtQxYdkk3yYk7vQEPnXjoolVWpLXCZY1Pkv2aPCHQaGtB9+Qd4+ZWCHxCMePZwAsXkJwhaCKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328377; c=relaxed/simple;
	bh=XPJj6oXMCGezoqFdEXRGYT/4pQLrzWUSOHgwH+//EU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZJd1TkfGest5pg2MObk3PCNAmp5DLX2RnpnKpXWvcX5vQBbn3wVL2SDweaBGkH5/UfP+z3QE/MX4AbEf7kaT9cIXNZLIpXa4VdtIK8/YqCCmRoN4C2jm+YmPSawO4UAwHshGqwUQMwKOVME8v6HLAF90ZlT7aOxj5ETnyydGEnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dn+EcWTS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dn+EcWTS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27239C4CEE0;
	Wed,  8 Jan 2025 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736328377;
	bh=XPJj6oXMCGezoqFdEXRGYT/4pQLrzWUSOHgwH+//EU4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dn+EcWTSyAGrfXMgrdbL0WBRoRZdwOzEBKp3dPyecyMGB+Aytui87AHQTi3XLCXT8
	 EPNEbc7lNrg5OVwNdWLBglDkIZmcAvJFyL1NMcjC/iME3JkWEuprWeLO6OaQj3Z3s/
	 s3Ajr6RuoxawGcfXBS66AdPNwHbuZWCshorZeNVzgfjWwgBxORy4ztdEnXw4ayMyWX
	 igIwB8WOToQALJPo/VfRgAeRqKWc0iJBhiFbigyMWOvY0J2U/sQxCAjB/DtqiwRvXZ
	 ZcUsjJ+23SmHcIrUsvMCQ54dWPGYzBO+NPpUFkFl2S5bFzGvW97DLS75gvRUQOJT67
	 UpcIp2jiwqp1g==
Message-ID: <e28abf31-3d91-4d1b-97e6-202df5ebb3f5@kernel.org>
Date: Wed, 8 Jan 2025 10:26:11 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: samsung: usi: implement support for USIv1 and
 exynos8895
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250107113512.525001-1-ivo.ivanov.ivanov1@gmail.com>
 <20250107113512.525001-3-ivo.ivanov.ivanov1@gmail.com>
 <6y4mg6atqi6idyoppesg5owrnfrjhkzqh4im4po7urfry2qctb@yimp5y6sm7h6>
 <907e1169-ceea-4d41-93bb-925041de005e@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <907e1169-ceea-4d41-93bb-925041de005e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/01/2025 10:17, Ivaylo Ivanov wrote:
> On 1/8/25 10:30, Krzysztof Kozlowski wrote:
>> On Tue, Jan 07, 2025 at 01:35:11PM +0200, Ivaylo Ivanov wrote:
>>> USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895) and
>>> provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
>>> SPI, UART, UART_HSI2C1).
>>>
>>> USIv1, unlike USIv2, doesn't have any known register map. Underlying
>>> protocols that it implements have no offset, like with Exynos850.
>>> Desired protocol can be chosen via SW_CONF register from System
>>> Register block of the same domain as USI.
>>>
>>> In order to select a particular protocol, the protocol has to be
>>> selected via the System Register. Unlike USIv2, there's no need for
>>> any setup before the given protocol becomes accessible apart from
>>> enabling the APB clock and the protocol operating clock.
>>>
>>> Modify the existing driver in order to allow USIv1 instances in
>>> Exynos8895 to probe and set their protocol. While we're at it,
>>> make use of the new mode constants in place of the old ones
>>> and add a removal routine.
>>>
>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> ---
>>>  drivers/soc/samsung/exynos-usi.c | 108 +++++++++++++++++++++++++++----
>>>  1 file changed, 95 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
>>> index 114352695..43c17b100 100644
>>> --- a/drivers/soc/samsung/exynos-usi.c
>>> +++ b/drivers/soc/samsung/exynos-usi.c
>>> @@ -16,6 +16,18 @@
>>>  
>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>  
>>> +/* USIv1: System Register: SW_CONF register bits */
>>> +#define USI_V1_SW_CONF_NONE		0x0
>>> +#define USI_V1_SW_CONF_I2C0		0x1
>>> +#define USI_V1_SW_CONF_I2C1		0x2
>>> +#define USI_V1_SW_CONF_I2C0_1		0x3
>>> +#define USI_V1_SW_CONF_SPI		0x4
>>> +#define USI_V1_SW_CONF_UART		0x8
>>> +#define USI_V1_SW_CONF_UART_I2C1	0xa
>>> +#define USI_V1_SW_CONF_MASK		(USI_V1_SW_CONF_I2C0 | USI_V1_SW_CONF_I2C1 | \
>>> +					 USI_V1_SW_CONF_I2C0_1 | USI_V1_SW_CONF_SPI | \
>>> +					 USI_V1_SW_CONF_UART | USI_V1_SW_CONF_UART_I2C1)
>>> +
>>>  /* USIv2: System Register: SW_CONF register bits */
>>>  #define USI_V2_SW_CONF_NONE	0x0
>>>  #define USI_V2_SW_CONF_UART	BIT(0)
>>> @@ -34,7 +46,8 @@
>>>  #define USI_OPTION_CLKSTOP_ON	BIT(2)
>>>  
>>>  enum exynos_usi_ver {
>>> -	USI_VER2 = 2,
>>> +	USI_VER1 = 1,
>> Is this assignment=1 actually now helping? Isn't it creating empty item
>> in exynos_usi_modes array? Basically it wastes space in the array for
>> no benefits.
> 
> I wanted to keep the USIv2 enum the same.

Is there any need for keeping it the same?

> 
>>
>>> +	USI_VER2,
>>>  };


...

>>
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void exynos_usi_remove(struct platform_device *pdev)
>>> +{
>>> +	struct exynos_usi *usi = platform_get_drvdata(pdev);
>>> +
>>> +	if (usi->data->ver == USI_VER2)
>>> +		exynos_usi_disable(usi);
>> This is not related to the patch and should be separate patch, if at
>> all.
> 
> Well I though that since didn't have any removal routine before it'd be good
> to introduce that and not leave USIv2 with hwacg set.

Sure, but separate commit, please. Can be preceeding the USIv1 support.

Best regards,
Krzysztof
