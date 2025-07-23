Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD38927990E;
	Wed, 23 Jul 2025 08:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753260169; cv=none; b=ktRbF2mOPFOZkJUv8YBRYXr9TJSJSvE2hQ+35CUJakGPaW+sdI5U8GmbvTeNjkYk4WRFvQWkJqv8/MkOz+NEmeZAG/NqJz5u6GWVG3sVUZWj4wteRYNWaEZWHocw83ZUHiwGPBvsDZb1BX+tlBlphRiMesvQ5ri2H/0VcOjbGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753260169; c=relaxed/simple;
	bh=prvWFi+z0zohKW9TFGGnwO6BglnkBXWV+SiL44zZjuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYPe/F6k892LksGaOKrl/GHj/VcYLnOBEuaXedDJNX1P+rmN2pfrDAiK9+o6c131c9UdbUcsIBuO/QXPg11lCqxgXwxYNDBJiR/5vvYtjfjn31ys55/oUFcb5nl18SXWMNlCROErRGC0vtX0i5l06+NOtofSkKAoRFOQBuJN9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vJMYDn55; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vJMYDn55"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B0FC4CEE7;
	Wed, 23 Jul 2025 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753260169;
	bh=prvWFi+z0zohKW9TFGGnwO6BglnkBXWV+SiL44zZjuE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vJMYDn555vsHRNq5kPiUZijyDB87u7vNQAghXB15tKuihRu8Xr8PzRs/L8j7at0JF
	 W9j4kEYkPWlZhnf0CEPtg5y2ptJqiAiQrZevWOC9zgSXTfoB9+Zk3aKd3GrLQbpdTe
	 8WST3WBTINOoHT63bqx4UH029GC99uI3aRrhenPQsNoCJPPUzORE9tn4wFFH9dB3f6
	 C6XHgWgeRfSrXTX+cCiyDCS8f0E0VRVCv8I4dJT6tFoxFXjLtKeXRXkCA+OkfYRWW3
	 aWeUmxVkHag/fId2idjTVER+4Kl6tZVpuxYhguZDiRQWE8ccU67Qfok4kctFg4jrmo
	 r7fEzeZZJ1VVw==
Message-ID: <6e1c67d2-9bfa-442a-9d53-8c5970a2a9ef@kernel.org>
Date: Wed, 23 Jul 2025 10:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, andre.draszik@linaro.org,
 peter.griffin@linaro.org, neil.armstrong@linaro.org, kauschluss@disroot.org,
 ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
 s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
 muhammed.ali@samsung.com, selvarasu.g@samsung.com
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
 <CGME20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63@epcas5p3.samsung.com>
 <20250701120706.2219355-2-pritam.sutar@samsung.com>
 <20250706-fresh-meaty-cougar-5af170@krzk-bin>
 <07d301dbf0ae$0658cbe0$130a63a0$@samsung.com>
 <9a2d0ad7-cb1f-473d-a91a-3a1b59b71280@kernel.org>
 <000c01dbf70b$ccdbf630$6693e290$@samsung.com>
 <a43cfe4f-8ff9-4dbd-b7f4-07ccc3d8e01b@kernel.org>
 <00ff01dbfac1$ee528860$caf79920$@samsung.com>
 <9a97cc9e-2221-44d6-83e9-25b1bec10a6f@kernel.org>
 <000901dbfb90$42873060$c7959120$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <000901dbfb90$42873060$c7959120$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2025 07:11, Pritam Manohar Sutar wrote:
>> On 22/07/2025 06:34, Pritam Manohar Sutar wrote:
>>>>>> Nothing is explained in changelog/cover letter. You claim you only
>>>>>> added Rb
>>>> tag.
>>>>>> This is an entirely silent change while keeping the review.
>>>>>
>>>>> Will add more explanations in cover letter/changelog why this block is
>> added.
>>>>>
>>>>>> Combined with not even following DTS style!
>>>>>
>>>>> Ok got it. Will change supplies name as below avdd075_usb =>
>>>>> avdd075-usb
>>>>> avdd18_usb20 => avdd18-usb20
>>>>> avdd33_usb20 => avdd33-usb20
>>>>>
>>>>> Confirm the above change that is meant in terms of DTS style.
>>>> Yes. I have doubts that actual supplies have suffix usb20. Are there
>>>> more than one avdd18 for this block?
>>>>
>>>
>>> Yes, there are more than one vdd18 supplies for this block.
>>
>> And their names are?
>>
>>>
>>> Re-analysed your comment on adding new supplies.
>>> Going to re-use existing supplies as mentioned below, rather than
>>> introducing new supplies
>>>
>>>   dvdd-usb20-supply   => for 0.75v
>>>   vddh-usb20-supply   => for 1.8v
>>>   vdd33-usb20-supply => for 3.3v
>>
>>
>> You just expect us to guess whether this is correct...
> 
> Sorry about not being clear so far. 
> 
> V920 needs three supplies, 0.75v, 1.8v and 3.3v for USB PHY
> The naming convention used in the schematic are
> avdd075-usb, 
> avdd18_usb20, 
> avdd33_usb20.
> 
> However, PHY's user manual just mentions DVDD, VDD33 and VDD18.


Then dvdd, vdd33 and vdd18.

> Since GS101 binding already using supply names similar to what is mentioned in the PHY user manual.


GS101 has USB 2.0 and DP, thus the suffix made some sense. I think you
have only USB 2.0, that's why I question the suffix.


Best regards,
Krzysztof
