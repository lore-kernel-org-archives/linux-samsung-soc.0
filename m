Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1C5304BCD;
	Fri, 29 Aug 2025 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756466749; cv=none; b=KNZqtNTO4QvVpdNvCQaAO6Er6WRfOoBFhmsKizfINs7zGclqil7NIi1uhLoVwnXFRxIezHI9pQE2KLs+gLXclwdB4fe26Y5PZr3ZcHm2HI/JoXMtqYJs4TGTeeUkP66Tba+SS8KdhTVcyGyriASxOuQbf4KmBqVdHIwCe47oFKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756466749; c=relaxed/simple;
	bh=ysquxCIIQNwKzhgZFwqELK6EpHlgMkWfidw1GJSAZZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBflTIjURBrwOoeNRdj/l1K+OkmhJpGXC3GdNmjAGRJHjPI28nz97DB8hR/px3XSBAKmg9OS/EWCYD8OmjEeyQj0zTFZcDmJF841hCfqre4/TErJKTGur19Hc9QnJeNY7ATU6nnrBV89VXBG/OzN2KbTm+5AkHGgIouXY818cm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGB7dJcm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGB7dJcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9595EC4CEF0;
	Fri, 29 Aug 2025 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756466749;
	bh=ysquxCIIQNwKzhgZFwqELK6EpHlgMkWfidw1GJSAZZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aGB7dJcm+6ID0+LHHkaT1KcYKJMrt7Utm95JsSxHhHABLityLd/QlSAcvclcnl3We
	 VkfwaVzorBJIGitM1At4G1N9ei4KbOBYVTOh04g8OHNysz0XdwguMhiSuitnCeI6wg
	 Zvh9krgCyc3/lRraw9SYJ4ZQNWOvRPV+Mgafl5x+kK56UX6cfgeO8+yxsxO5RtXthF
	 XBY75p8Lxn4l6qeOuThNQeqHQA53kDCkYHV3QVEnVLkdOHV/3BpTkBT4dn8qlRJ9DJ
	 bFFERfD9rtp+4x1pz2Pcrx+NCGEai3orUB+z3Jn7xiOJd5gL3XIdepdKaT02Qyd/IK
	 CsMwloNNn9/tw==
Message-ID: <6b5f20ed-4e88-441e-8f61-20866e2b39c7@kernel.org>
Date: Fri, 29 Aug 2025 13:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Pritam Manohar Sutar' <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
 igor.belwon@mentallysanemainliners.org, johan@kernel.org,
 m.szyprowski@samsung.com, s.nawrocki@samsung.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
 <CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>
 <20250822093845.1179395-6-pritam.sutar@samsung.com>
 <20250824-rough-fresh-orangutan-eecb2f@kuoka>
 <007501dc1653$e36c3b50$aa44b1f0$@samsung.com>
 <83dc9435-5850-425d-b345-52e84ef9262c@kernel.org>
 <000401dc18cd$ec02a1b0$c407e510$@samsung.com>
 <e8e99c16-ad40-4d79-be92-1aa55c13f9ea@kernel.org>
 <263801dc18d3$d1e20950$75a61bf0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <263801dc18d3$d1e20950$75a61bf0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/08/2025 12:58, Alim Akhtar wrote:
> Hi Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Friday, August 29, 2025 4:07 PM
>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; alim.akhtar@samsung.com;
>> andre.draszik@linaro.org; peter.griffin@linaro.org; kauschluss@disroot.org;
>> ivo.ivanov.ivanov1@gmail.com; igor.belwon@mentallysanemainliners.org;
>> johan@kernel.org; m.szyprowski@samsung.com;
>> s.nawrocki@samsung.com; linux-phy@lists.infradead.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
>> rosa.pila@samsung.com; dev.tailor@samsung.com;
>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>> selvarasu.g@samsung.com
>> Subject: Re: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
>> ExynosAutov920 combo ssphy
>>
>> On 29/08/2025 12:15, Pritam Manohar Sutar wrote:
>>> Hi Krzysztof
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: 26 August 2025 02:05 PM
>>>> To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
>>>> Cc: vkoul@kernel.org; kishon@kernel.org; robh@kernel.org;
>>> .
>>> .
>>> [snip]
>>> .
>>> .
>>>>>> Subject: Re: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy:
>>>>>> add
>>>>>> ExynosAutov920 combo ssphy
>>>>>>
>>>>>> On Fri, Aug 22, 2025 at 03:08:44PM +0530, Pritam Manohar Sutar wrote:
>>>>>>> This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
>>>>>>> compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
>>>>>>> "phy" and "ref". The required supplies for USB3.1 are named as
>>>>>>> vdd075_usb30(0.75v), vdd18_usb30(1.8v).
>>>>>>
>>>>>> Please do not describe the schema, but hardware. This sentence does
>>>>>> not help me in my question further.
>>>>>
>>>>> This is a combo phy having Synopsys usb20 and usb30 phys (these 2
>>>>> phys are
>>>> totally different).
>>>>> One PHY only supports usb2.0 and data rates whereas another one does
>>>>> usb3.1 ssp+ and usb3.1 ssp
>>>>>
>>>>> This patch only explains about usb30 (since these are two different
>>>>> phys) phy
>>>> and omitted inclusion of usb20 reference (added separate patch for
>>>> this patch no 3).
>>>>>
>>>>> Hope this is clear.
>>>>
>>>> No. That sentence still explains what schema is doing.
>>>>
>>>
>>> Ok, let me simplify the commit message further something like below.
>>> Anyways, the coverletter contains more details about it.
>>>
>>> "dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo
>>> ssphy
>>>
>>>   Add schema for combo ssphy found on this SoC.
>>> "
>>>
>>> Please confirm if this looks fine?
>>> If so, will reflect the similar commit messages in patch 1 and 3.
>>
>> Please read my first comment again. I do not see how does this satisfy
>> hardware explanation.
>>
> Just went through the conversation above, 
> until what extent hardware description need to be explain in the commit?
> Do we have any guideline for the same?
> Could you please help with an example from previous any commit or some other patches? 
> I understand that mentioning, “two clocks, two supplies etc" are part of schema, 
> one may or may not capture that in the commit. 
> However mentioning, “this hardware (SoC) contain a combo PHY which supports usb3.1 and usb3.0" is not ok? 


Maybe that's just language, but to me the commit msg did not describe
hardware after first sentence, but said what schema requires (some
clocks and supplies). Other examples:
00399bbe02d2bb6fd8d6eb90573ec305616449f4
e4c9a7b475e5d0d9b2440ee48f91d1364eabd6cb

and here another anti-pattern:
23f793850e9ee7390584c0809f085d6c88de7d3f

(and before you ask why above carries my Rb tag, then note that
Samsung's revenue is around 220 billion USD, so for sure it has a lot,
really a lot of resources to review patches internally and improve their
quality before posting).

Best regards,
Krzysztof
