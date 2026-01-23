Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944AE29E0E9;
	Fri, 23 Jan 2026 07:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769153515; cv=none; b=CPWQSuvo9YiKH0naQRC9zQdMP6se1hNQCEkpv6AN56wX20Zz4nQzhTRb8FFECRxkI0JhvKYEDGxRRPEjK8fTPTVZShjxRP0q2cakpqnoc6mS6ulzmLdtFtqRSVe1RPSK/hwK9dmM/pSBjcd+PyRZ7zVt5r/pn+GB73z4H9nfpaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769153515; c=relaxed/simple;
	bh=X2aNQyzma6oSvVZ62REhmrqDM/nabK7Jf/HHD65gDKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpmR8hfsLj25zkQlIWje1w+z9DIkYYwNCoUS6POCrSjlN7jhstFk0R36YsvHeTtlCIPRjO9KOvYg5v4JwIvI5pd0xz7nJt2n9qeSRp14uIw4dteTkA4Cj23yJDbQ0mNxsSr/3qqj3qUcRlinBVEOfR6m5qG8mJShvwEoCCOvFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDQ0D3ZY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDQ0D3ZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13884C4CEF1;
	Fri, 23 Jan 2026 07:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769153515;
	bh=X2aNQyzma6oSvVZ62REhmrqDM/nabK7Jf/HHD65gDKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NDQ0D3ZY1cLX9VuobpQTa/t3/pZkowH5NbQ+RkDHmDGqpPNhc0ix4/znWJ9I2G/BM
	 K8eLm7osMK0aj76ceLE+wpTmjZ1Z85VWk3sY20xqk/q1QRo5Od0OkfMszKhyno5RWa
	 8OcBqrJ0WdnQbNQrNE2S8+2i4geXihTfFSHk2OEsSEyZsHD8T8se5kAc3loayMR16o
	 eVPjxtGoWlmahVCQ3Fp52rnUXiOuy3cRWr6z2A9mCyUiz3/4pmIDivfYGTBis36T9G
	 xVhOkQI4Z8ZXDC/WQPm4v8qKOOGbIlac1YdnOvXzOoGcC2beF4lzCTWrtBux3OjcrA
	 SkefVn0HjLApw==
Message-ID: <6ac69d62-6b14-4010-9c66-764b7dc2e610@kernel.org>
Date: Fri, 23 Jan 2026 08:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>,
 'Rob Herring' <robh@kernel.org>
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, rosa.pila@samsung.com,
 selvarasu.g@samsung.com, linux-samsung-soc@vger.kernel.org,
 muhammed.ali@samsung.com, faraz.ata@samsung.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dev.tailor@samsung.com
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>
 <20260122130721.205664-1-pritam.sutar@samsung.com>
 <176910209177.2703219.7993114273484886473.robh@kernel.org>
 <000001dc8c30$d83ce2e0$88b6a8a0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <000001dc8c30$d83ce2e0$88b6a8a0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2026 07:23, Pritam Manohar Sutar wrote:
> Hi Rob,
> 
> Thank you for your feedback on the patch series. 
> 
>> -----Original Message-----
>> From: Rob Herring <robh@kernel.org>
>> Sent: 22 January 2026 10:46 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>> Cc: alim.akhtar@samsung.com; conor+dt@kernel.org; krzk+dt@kernel.org;
>> linux-arm-kernel@lists.infradead.org; rosa.pila@samsung.com;
>> selvarasu.g@samsung.com; linux-samsung-soc@vger.kernel.org;
>> muhammed.ali@samsung.com; faraz.ata@samsung.com; linux-
>> kernel@vger.kernel.org; devicetree@vger.kernel.org;
>> dev.tailor@samsung.com
>> Subject: Re: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920
>> SoC
>>
>>
>> On Thu, 22 Jan 2026 18:37:18 +0530, Pritam Manohar Sutar wrote:
>>> This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
>>> controllers and among them, one single USB3.1 DRD combo phy and three
>>> USB2.0 only phy controllers. This patchset adds and enables USB and
>>> USB-PHY nodes in dts.
>>>
>>> PMIC is not implemented yet, we rely on USB LDOs being enabled by the
>>> bootloader and used dummy regulators for now.
>>>
>>> To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
>>> GPIO expander is present in the dts, we used it to enable the
>>> regulator using GPIO.
>>>
>>> USB ports are configured as OTG, and default mode is configured as
>>> peripheral. It will be changed based on requirements.
>>>
>>> changelog
>>> ----------
>>> Changes in v2:
>>> - As v1 was pushed 3 months back, resending this patchset.
>>> - Since dependencies are merged, removed links from coverletter.
>>>   link for v1:
>>> https://lore.kernel.org/linux-devicetree/20251024114845.2395166-1-prit
>>> am.sutar@samsung.com/
>>>
>>> Pritam Manohar Sutar (3):
>>>   arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
>>>   arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
>>>   arm64: dts: exynos: ExynosAutov920: Enable USB nodes
>>>
>>>  .../boot/dts/exynos/exynosautov920-sadk.dts   | 160
>> +++++++++++++++++
>>>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162
>>> ++++++++++++++++++
>>>  2 files changed, 322 insertions(+)
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>
>>
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>>
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform maintainer
>> whether these warnings are acceptable or not. No need to reply unless the
>> platform maintainer has comments.
>>
>> If you already ran DT checks and didn't see these error(s), then make sure dt-
>> schema is up to date:
>>
>>   pip3 install dtschema --upgrade
>>
>>
>> This patch series was applied (using b4) to base:
>>  Base: attempting to guess base-commit...
>>  Base: tags/next-20260121 (exact match)
>>  Base: tags/next-20260121 (use --merge-base to override)
>>
>> If this is not the correct base, please add 'base-commit' tag (or use b4 which
>> does this automatically)
>>
>>
>> New warnings running 'make CHECK_DTBS=y for
>> arch/arm64/boot/dts/exynos/' for 20260122130721.205664-1-
>> pritam.sutar@samsung.com:
>>
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy0 (usb-
>> nop-xceiv): '#phy-cells' is a required property
>> 	from schema $id: https://protect2.fireeye.com/v1/url?k=91401ba9-
>> cedb2354-914190e6-000babff317b-0af64cc1fcd35e1a&q=1&e=e0bf9bed-
>> 20f5-431c-9a8f-
>> ded53e46a366&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
>> sb-nop-xceiv.yaml
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy1 (usb-
>> nop-xceiv): '#phy-cells' is a required property
>> 	from schema $id: https://protect2.fireeye.com/v1/url?k=b208eda5-
>> ed93d558-b20966ea-000babff317b-f6650041a1e910a7&q=1&e=e0bf9bed-
>> 20f5-431c-9a8f-
>> ded53e46a366&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
>> sb-nop-xceiv.yaml
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy2 (usb-
>> nop-xceiv): '#phy-cells' is a required property
>> 	from schema $id: https://protect2.fireeye.com/v1/url?k=ce686cfd-
>> 91f35400-ce69e7b2-000babff317b-ccbf1b3c353ecfc0&q=1&e=e0bf9bed-20f5-
>> 431c-9a8f-
>> ded53e46a366&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
>> sb-nop-xceiv.yaml
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: usb-phy3 (usb-
>> nop-xceiv): '#phy-cells' is a required property
>> 	from schema $id: https://protect2.fireeye.com/v1/url?k=633aebf3-
>> 3ca1d30e-633b60bc-000babff317b-ef5a169bc853eddb&q=1&e=e0bf9bed-
>> 20f5-431c-9a8f-
>> ded53e46a366&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fusb%2Fu
>> sb-nop-xceiv.yaml
> 
> Apologize for any inconvenience caused by the issues you’ve identified. 

It means you did not test the patches before sending and I find it very
wasteful of my time.

> Below, Have outlined the changes, will implement to address the warnings 
> and ensure the patch set aligns with the required standards.
> 
> Proposed Changes:
> 1. Will include #phy-cells = <0>; in the USB PHY nodes 
>   (usb_phy0, usb_phy1, usb_phy2, and usb_phy3) 
> This is a crucial addition to avoid compilation warnings and ensure compatibility.
> 
> Example:
> usb_phy0: usb-phy0 {    
>     compatible = "usb-nop-xceiv";    
>     #phy-cells = <0>;    
>     vbus-supply = <&usbdrd31_dwc3_vbus>;    
> };    
> 
> 2. The errors were not caught by the make dt_binding_check and make dtbs_check 
>   commands 
>   make -j ARCH=arm64 dt_binding_check dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
>   make -j ARCH=arm64 dt_binding_check dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml

This is not the command you are supposed to run! You MUST CHECK YOUR DTS
WITH ALL THE BINDINGS. Why would you run only two of them and ignore the
rest which you still use? What is the logic behind - I will use phy-nop
binding, but not test against it?

A hint - if your patches are not being picked up, maybe because you send
buggy code and I am bored to reply - test finally, because I am not your
testing service.

Best regards,
Krzysztof
