Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C14F4086A;
	Wed, 28 Jan 2026 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769585828; cv=none; b=UO6YZRug7JmmihP/UCKB4HUSsMSrfXp2ps02gtk0O6QvGA9x7sUGi8HcEXRUSUJQhVhIgusCJnyC2sGJarjn2u0Ycv1NkR6/eHp+PtvDOnFysNNGoIxHcJCT+09KkS9wp2eob8hMUNsJeeIQ9v6fuPpTjXhSfK5LxWcQl216dkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769585828; c=relaxed/simple;
	bh=HpHwEOk+kbnxBkHrgpKVXyvkLiomsQWIMoos1EbNhFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBEMn0ml8kVeL/TI4J96cVLDcORR0NUSRddLemK1bMn6yNO0QBVehKhCDzf4gNv+1tFAQY54Z2FcxPy6/r0+5IB/sMIBSs307gHf3gRagOEZewt52k3XvWZuaFV/i1JZzIvdGcM7DQ7wLSKJPbEjAOgDJEATdOoMtFbXkRHVVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxfwe6bK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxfwe6bK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66839C4CEF1;
	Wed, 28 Jan 2026 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769585828;
	bh=HpHwEOk+kbnxBkHrgpKVXyvkLiomsQWIMoos1EbNhFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bxfwe6bKxW1PfzT30N/p0O01AqeQqoIW+4O2wMPj/pwfKl43GvoTHNZ7XOxTMP3Bo
	 qbgym8Hs0YKuANygjIo4t8HCMAbozNXNZGay/eYtJuHjm0OQNe5GnucjuNYOjA1mgt
	 D+ZdoNzZQ4LGkqKpd22dvNndDRDb1cqEPAyywpcLhjgWezWsY6m9KX7nnssodgEnNj
	 t75akRoMpJzW8nAQZPgMem1QHPFAb20InpwC7vEUO9IBHN2PIOacz6jd91peQwlqce
	 LHIZ5NoNSd012i5Y7pn87v6uuVwTfWPgdhnlV/im6puONE0KeDrsbn/ElgNA4LGp6R
	 acEs20xoQMtWg==
Message-ID: <91adfc3d-1612-4bc8-8f4e-525141fd9e67@kernel.org>
Date: Wed, 28 Jan 2026 08:36:59 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB
 nodes
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
 muhammed.ali@samsung.com, selvarasu.g@samsung.com
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
 <CGME20260122125136epcas5p2db0fa3d04671ddc915e60ae8c5bcfb98@epcas5p2.samsung.com>
 <20260122130721.205664-4-pritam.sutar@samsung.com>
 <6f381f88-3a51-4fc8-844c-41b167b07628@kernel.org>
 <000f01dc8c3e$2b6dcf30$82496d90$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <000f01dc8c3e$2b6dcf30$82496d90$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/01/2026 08:59, Pritam Manohar Sutar wrote:
> Hi Krzysztof,
> 
> Thank you for your feedback. 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 22 January 2026 07:05 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com
>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: ExynosAutov920: Enable USB
>> nodes
>>
>> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
>>> Enable USB PHY and DWC3 USB controllers' nodes.
>>>
>>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>> ---
>>>  .../boot/dts/exynos/exynosautov920-sadk.dts   | 21
>> +++++++++++++++++++
>>>  1 file changed, 21 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> index f90f7704597c..5896dd69334a 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> @@ -160,15 +160,20 @@ &xtcxo {
>>>  &usbdrd31_ssphy {
>>>  	dvdd-supply = <&dummy_regulator>;
>>>  	vdd18-supply = <&dummy_regulator>;
>>> +	status = "okay";
>>
>> You just added the node in the previous patch, so why it cant be enavled
>> there?
>>
>>>  };
>>>
>>>  &usbdrd31_hsphy {
>>>  	dvdd-supply = <&dummy_regulator>;
>>>  	vdd18-supply = <&dummy_regulator>;
>>>  	vdd33-supply = <&dummy_regulator>;
>>> +	status = "okay";
>>>  };
>>>
>>>  &usbdrd31_dwc3 {
>>> +	dr_mode = "otg";
>>> +	usb-role-switch;
>>> +	role-switch-default-mode = "peripheral";
>>
>> Why did you add incomplete node in previous commit?
> 
> The commit was added to align with the existing convention of separating 
> node addition and enabling logic in USB configurations. This approach is 
> referenced from commits such as:
> 
> https://lore.kernel.org/all/20250710-resends-july-exynos990-dt-v2-5-55033f73d1b0@mentallysanemainliners.org/
> https://lore.kernel.org/all/20240429-usb-dts-gs101-v2-2-7c1797c9db80@linaro.org/
> 
> Please let me know if this commit to be merged in previous commit.


BTW, don't ever use AI to write code or code justifications. I will make
note of it.

Best regards,
Krzysztof
