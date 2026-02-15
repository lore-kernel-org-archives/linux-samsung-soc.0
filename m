Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B24A246766;
	Sun, 15 Feb 2026 08:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771145842; cv=none; b=rNX0RAFmqdLBBHRVu7uP6QT7TQpuTYojLsQ+zboAXMaNrPkwSXdc8ufGxSY4uj2GYPReVUm7TMOX9qdAL2oZb6lxuddbeForcIWM0up1F5BRWsLom6PBhW/yYNcaQaEwEk5HPFxfYRugjrtYh6wY+hrAXMAaF2xi96W4vD6DpFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771145842; c=relaxed/simple;
	bh=UnIhEyFqsBzxtq7irrv/xJVxAo0Al4iv+ZsfkLBUjhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhrHr2xHL2MvzvVJxH8MtSsJyY7JuGj1cOkjPDPsi5FMqib1YlUQ+DpMsH2wH1y9peliN8XmzTH+CcZx6hlM/EvrvVyM/RBSmD2TJFABNtAcm13hAFMo97ZsFfww7RE11YVc7ztgtgED3awXfGO2t8RiGiX6V2rnRAhWONm9tL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i24gR8Ni; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i24gR8Ni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1191C19422;
	Sun, 15 Feb 2026 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771145841;
	bh=UnIhEyFqsBzxtq7irrv/xJVxAo0Al4iv+ZsfkLBUjhs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i24gR8NiM8nE5iYedl+X34eE0MSZeMQD0sBpdDZNET0FyK4QEv7UIj8oRZ9jWpASI
	 CkkbFYKdiqWn6l5yn06D5RtfaGB7ZPgC/h24y/sY1Y3oIaNy11QSgEzKQAVFL0Q9mp
	 lJiBExqG/q3A5B5AAZzjjNVNHXKYh2mvDy75/i4gx26SiMr4V/Up3V0w2QADbZ8aIR
	 pC+blAj12mgSge6cB/ojugUGLkglYOGNBI7KfHWuaGw9fN6yr77W8ryGbdSmiV5Pkj
	 m9Oficby5XjjDwXPpj0ahh69NQ4AxjzIP+N7vwxbC8ehMEIAbvJ+iTD6RJoAazkZpb
	 IwWM2fdPzOTqA==
Message-ID: <2edff611-76bb-45aa-922e-f96581dd0525@kernel.org>
Date: Sun, 15 Feb 2026 09:57:16 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add regulators
 for the USB
To: pritam.sutar@samsung.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
 muhammed.ali@samsung.com, selvarasu.g@samsung.com
References: <20260122130721.205664-1-pritam.sutar@samsung.com>
 <CGME20260122125134epcas5p36625b7ac70b8dfba9430831a11955682@epcas5p3.samsung.com>
 <20260122130721.205664-3-pritam.sutar@samsung.com>
 <352427f4-144a-4a43-a2f3-dd959302939f@kernel.org>
 <000001dc9c13$ea305520$be90ff60$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <000001dc9c13$ea305520$be90ff60$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2026 12:37, pritam.sutar@samsung.com wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Thursday, January 22, 2026 7:04 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com
>> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
>> rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v2 2/3] arm64: dts: exynos: ExynosAutov920: Add
>> regulators for the USB
>>
>> On 22/01/2026 14:07, Pritam Manohar Sutar wrote:
>>> Add dummy regulator for USB and PHY supplies.
>>>
>>> Add vbus regulator that is enabled by GPIO pin.
>>>
>>> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>> ---
>>>  .../boot/dts/exynos/exynosautov920-sadk.dts   | 139
>> ++++++++++++++++++
>>>  1 file changed, 139 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> index a397f068ed53..f90f7704597c 100644
>>> --- a/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> +++ b/arch/arm64/boot/dts/exynos/exynosautov920-sadk.dts
>>> @@ -52,6 +52,76 @@ memory@80000000 {
>>>  		      <0x8 0x80000000 0x1 0xfba00000>,
>>>  		      <0xa 0x00000000 0x2 0x00000000>;
>>>  	};
>>> +
>>> +	/* TODO: Remove this once PMIC is implemented  */
>>> +	dummy_regulator: regulator-0 {
>>> +		 compatible = "regulator-fixed";
>>> +		 regulator-name = "dummy_regulator";
>>> +	};
>>> +
>>> +	usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus {
>>
>> Please use name for all fixed regulators which matches current format
>> recommendation: 'regulator-[0-9]v[0-9]'
>>
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/
>> Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
>>
>> None of the regulators are called like you wrote. Really NONE.
>>
> 
> Thank you for the references. Will bring changes for regulator's name 
> and labels as 
> 			
> -       usbdrd31_dwc3_vbus: usbdrd31_dwc3-vbus {
> +       reg_usbdrd31_dwc3_vbus: regulator-1 {

Did you read the binding? That's not what I asked.


> 
>> Also, carefully follow DTS coding style.
>>
> 
> Sorry for that. Checking the code and will update in next 
> patchset version (v3).
> 
>>> +	       compatible = "regulator-fixed";
>>> +	       regulator-name = "usbdrd31_dwc3-vbus";
>>> +	       regulator-min-microvolt = <5000000>;
>>> +	       regulator-max-microvolt = <5000000>;
>>> +	       enable-active-high;
>>> +	       regulator-always-on;
>>> +	       gpio = <&gpp2 0 GPIO_ACTIVE_HIGH>;
>>> +	};
>>> +
>>> +	/* Use gpio for enabling vbus regulator */
>>> +	usb_phy0: usb-phy0 {
>>
>> usb-phy-0
>>
>>> +		compatible = "usb-nop-xceiv";
>>> +		vbus-supply = <&usbdrd31_dwc3_vbus>;
>>
>> That's pretty incomplete. Why do you need such node - just to toggle
>> regulator?
>>
> 
> There is no external controller to detect or switch the USB modes 
> automatically rather it is switched using userspace control 
> (sysfs attributes) for this SoC.  GPIO pins are required to enable 
> vbus regulators. Existing phy-generic and fixed regulator are used to 
> avoid making any USB driver changes for the same purpose and it is 
> referenced from below -
> 				
> https://lore.kernel.org/r/20230825215445.28309-3-semen.protsenko@linaro.org
> a12af1c20751340ab6e449a5ef78b37d31123aca: ARM64: dts: marvell: armada-3720-db: Add phy for USB3
> 		
>>> +	};
>>
>> ...
>>
>>> +&usbdrd20_phy2 {
>>> +	dvdd-supply = <&dummy_regulator>;
>>> +	vdd18-supply = <&dummy_regulator>;
>>> +	vdd33-supply = <&dummy_regulator>;
>>> +};
>>> +
>>> +&usbdrd20_dwc3_2 {
>>> +	maximum-speed = "high-speed";
>>> +	usb-phy = <&usb_phy3>;
>>> +};
>>> +
>>> +&usbdrd20_2 {
>>> +	vdd10-supply = <&dummy_regulator>;
>>> +	vdd33-supply = <&dummy_regulator>;
>>> +};
>>
>> That's a bit too much of dummies. This is heavily incomplete. You need to
>> bring back the PMIC first.
>>
> 
> Presently, relying on USB LDOs being enabled by the bootloader in this
> automotive SoC. However, we understand the concern and it is added in case 
> if anyone wants to use implemented PMIC in future. For now, would like 
> to proceed with the dummy regulators to enable the required USB features. 

And I don't see the point of these dummies. Solves nothing.

> Dummy regulators are clearly marked so that they will be replaced once 
> the PMIC driver is fully up.
> 


Best regards,
Krzysztof
