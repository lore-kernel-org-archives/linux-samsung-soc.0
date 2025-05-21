Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BAA23817A;
	Wed, 21 May 2025 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817897; cv=none; b=cQZ/vZzFuLJabmvlwrZRgpXnz4ll+3j9kd8k4YUOjfkzOWRnZ43xOMKMKpu8aUV6fDItFQ6usrvvtCCbNTtChoZFl46IhNAA8PyHd+iKqsR/kQkNXas//wrPeG5l9cjjw/JyHsSiar4umCFkUtsVmwL9PYHxbOQeRUGlWiFIbMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817897; c=relaxed/simple;
	bh=7zdquYhGr6LzhY4noloqWyYU2N3b4LAAmGk3pA3luw4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GIh95X6esA64yX23kl5s5AoIzHPgyS/g56GpPvm53/FT8+foWoAI2QBfko3GiD9aIxvnIWsP1HO9qKB1gYF8AXUVbcP4GrgjhMB45RJ+tGgtPiML9aKqpA+Krs5tAmZlboAqqtebJ9yVtHWV1bH01IhEAnIOiene9jzhiWrdX+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POJGl1WU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POJGl1WU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAE4C4CEE4;
	Wed, 21 May 2025 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747817896;
	bh=7zdquYhGr6LzhY4noloqWyYU2N3b4LAAmGk3pA3luw4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=POJGl1WUlleOUfa/aBNeuLj3rZDB3WODOo5cPFU1z7qGUfZ4vIw2K1w014pzhXkHk
	 2n1wNAWE8/7q11uDTw/Vo/IsFBvvAjVVIHctku5Vi6b3CotGBpn4oHV/DjrAi1O6PF
	 lsTYD3smJfVmI6fawDB1V8QQZRxR8ouZmGNBcgIRWYiYupGQ9qLn6MqtILE92gPFBW
	 sJ1DTIuX2Hpa4snLmHtcQGDwOhzZ7CmM1/L5UxP57EbxHPjhWS0p6mKrhamMCNMfsL
	 N5hcG0YoyPKPcWT/FK6FZ6upCVNzDhz9uIgfISjMZW1zAG0wnAL8FOVCMHpHGEKizY
	 1B+pyiMCh6B0Q==
Message-ID: <6f8599e2-2bce-4b66-84a9-03d8799b4a8a@kernel.org>
Date: Wed, 21 May 2025 10:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>,
 'Neil Armstrong' <neil.armstrong@linaro.org>, vkoul@kernel.org,
 kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org,
 kauschluss@disroot.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
 <CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
 <20250516102650.2144487-3-pritam.sutar@samsung.com>
 <a5c1a064-d760-4140-9e78-d74823b400a8@linaro.org>
 <1f63af35-7d10-434b-b802-115611ce2ed6@kernel.org>
 <000201dbca1f$737647d0$5a62d770$@samsung.com>
 <7fec4945-eec5-4247-9979-a6ee2229626d@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <7fec4945-eec5-4247-9979-a6ee2229626d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2025 10:47, Krzysztof Kozlowski wrote:
> On 21/05/2025 09:10, Pritam Manohar Sutar wrote:
>> Hi Krzysztof,
>>
>>> -----Original Message-----
>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>> Sent: 20 May 2025 01:13 PM
>>> To: Neil Armstrong <neil.armstrong@linaro.org>; Pritam Manohar Sutar
>>> <pritam.sutar@samsung.com>; vkoul@kernel.org; kishon@kernel.org;
>>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
>>> alim.akhtar@samsung.com; andre.draszik@linaro.org; peter.griffin@linaro.org;
>>> kauschluss@disroot.org; m.szyprowski@samsung.com;
>>> s.nawrocki@samsung.com
>>> Cc: linux-phy@lists.infradead.org; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-samsung-
>>> soc@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com;
>>> faraz.ata@samsung.com; muhammed.ali@samsung.com;
>>> selvarasu.g@samsung.com
>>> Subject: Re: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
>>> ExynosAutov920
>>>
>>> On 20/05/2025 09:39, neil.armstrong@linaro.org wrote:
>>>>> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>>>> b/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>>>> index 634c4310c660..b440b56c6595 100644
>>>>> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>>>> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
>>>>> @@ -177,6 +177,9 @@
>>>>>   #define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3,
>>> 0)
>>>>>
>>>>>   /* Exynos850: USB DRD PHY registers */
>>>>> +#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
>>>>> +#define CTRL_VER_MAJOR_VERSION			GENMASK(31,
>>> 24)
>>>>> +
>>>>>   #define EXYNOS850_DRD_LINKCTRL			0x04
>>>>>   #define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
>>>>>   #define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
>>>>> @@ -1772,6 +1775,10 @@ static const char * const
>>> exynos5_regulator_names[] = {
>>>>>   	"vbus", "vbus-boost",
>>>>>   };
>>>>>
>>>>> +static const char * const exynosautov920_clk_names[] = {
>>>>> +	"ext_xtal",
>>>>> +};
>>>>> +
>>>>>   static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy =
>>> {
>>>>>   	.phy_cfg		= phy_cfg_exynos5,
>>>>>   	.phy_ops		= &exynos5_usbdrd_phy_ops,
>>>>> @@ -1847,6 +1854,81 @@ static const struct exynos5_usbdrd_phy_drvdata
>>> exynos850_usbdrd_phy = {
>>>>>   	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
>>>>>   };
>>>>>
>>>>> +static void exynosautov920_usbdrd_utmi_init(struct
>>>>> +exynos5_usbdrd_phy *phy_drd) {
>>>>> +	u32 version;
>>>>> +
>>>>> +	version = readl(phy_drd->reg_phy +
>>> EXYNOSAUTOv920_DRD_CTRL_VER);
>>>>> +	dev_info(phy_drd->dev, "usbphy: version:0x%x\n", version);
>>>>
>>>> Please do not add mode info to boot log, use dev_dbg instead.
>>>
>>> Just drop entirely, not even worth dbg (see coding style, driver development
>>> debugging guide). It is fixed per given compatible, isn't it? If not, there is entire
>>> commit msg to explain unusual things.
>>
>> This SoC has a single USB 3.1 DRD combo v400 phy and three USB2.0 DRD phy v303
> 
> 
> That's a different device, no? Look at the compatible here - it says
> usb31drd.
> 
> What does 31 stand for?
> 
>> controllers those only support the UTMI+ interface. Currently, supporting only 
>> v303 phy in this patch-set, and planning v400 phy later (soon). Same may be 
>> also updated in commit  message. 
>>
>> If there's any issue in phy init, dbg print is needed to debug which phy caused it. 
> No, rethink rather this makes sense at all. Please read carefully
> writing bindings, which will tell you that you cannot have different
> devices under the same compatible. Unless you say these are the same
> devices and it differs by other phy? But this is a phy... so many questions.

Hm, unless you want to say devices are fully compatible, the version is
fully detectable and the driver will make use of that. That would be
fine, but should be expressed in commit msg and actually we should see
the second phy variant already in the patchset.

Best regards,
Krzysztof
