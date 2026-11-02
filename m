Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623412;
	b=yQLUV8Pi7pSgE96/he5Hw1Xsl5fd1udys+hsI2xjm8NYR9dfZ1O2ymP7e8zalYjTt7UB
	 rLDMsG/6D8Eu/I08kLAuaxkkb7OZIyWndmNOdgfNikQZbPHgn8Vm73qGGRR08n07ohY5Z
	 /qyHbDHIDamT8CcC+BGZLbhXBWRAoVb9G4pBS0ajjCWpwhDTb/ek6p96onRrn8JsFuLuM
	 qmsOsdGKg+F+RYr7fbDQsAFn9/7oMjZ3DSMTAg08TaNd8p+tvrIFoD4xuGpkgaG1wrxDA
	 eEBvMaAdB9mAu4YzU9UI8aDO9PrEI+vQwsW6pzWRcWr7WJiF24FPcp5RasOUuIJpuzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623412;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=hBaC7BnxNaZUHqSrCH/qzZn1xy4YvXNoDOE8QmFGYEM=;
	b=vP+LT+jMQRaI/uiQBWqqCBYZQbu3I+nXzCHFCSZ5E3VSLThexYtixd4v6XrTRAkARMqW
	 Uv0l4qOGvhf0Gev/nONzfWrfFPFGrQqVU/o0LNBQLoiCLDa9ZSMZWPDcVhL8LTbel70pn
	 oaVLGpuMJcNp8wMzwLFuIYC9SKjYLmlU4ukk5BoxOtQsqRKHGOKOAeIV/QvXa7UllCxvP
	 13j7BLaB0iP4ZeHpw/7VCDpNpVi1cnFvIYpiDiXx2+++MobHjNn+CTvk9ymktmco3XjsB
	 xpqv774tjMJ6mbyaxidJGENTE+jQtiJItm/qvahQhqr+WmeeriYGhYYcT3xLzxNSRsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XIz93rOC;
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA9860A2618
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 12:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA9860A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XIz93rOC
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261102124323euoutp012a496e1fb0832ace5a4dcea35b365da8~kOvuMoTUb0624306243euoutp017
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 12:43:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261102124323euoutp012a496e1fb0832ace5a4dcea35b365da8~kOvuMoTUb0624306243euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793623403;
	bh=hBaC7BnxNaZUHqSrCH/qzZn1xy4YvXNoDOE8QmFGYEM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XIz93rOCQPtFW7LiRkF/CCRl0DNuACfpNhZB5ACCvmwfwu1twjYLGamy6y5jX5MK0
	 XJFfS4Auf2+M4RB1Clz8rmcCNEWfESar2B+GCFIax1DOLpuKULlIiZkLq8MAU9md2E
	 ZACSCyBFTvvL6dX+CkQtP1TxPhluqw/WPONETGAg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261102124323eucas1p1ca4d8074337b074a3dec911583536e8a~kOvtrCjeL1385313853eucas1p1V;
	Mon,  2 Nov 2026 12:43:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261102124322eusmtip12c8687edda4b13e0ac59e007b9e63096~kOvtTyI3Z2235722357eusmtip1R;
	Mon,  2 Nov 2026 12:43:22 +0000 (GMT)
Message-ID: <790d2c3e-0665-4cd0-8bbc-ea70ad8b7ef9@samsung.com>
Date: Mon, 2 Nov 2026 13:43:22 +0100
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] ARM: dts: samsung: exynos4210-universal_c210: fix
 BCM4330 Bluetooth GPIOs
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <eeca871d-ca1f-4cd4-b40a-570f0805dbd1@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261102124323eucas1p1ca4d8074337b074a3dec911583536e8a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026103612eucas1p10fbe3777394cc604419299509c22a2e7
X-EPHeader: CA
X-CMS-RootMailID: 20261026103612eucas1p10fbe3777394cc604419299509c22a2e7
References: <CGME20261026103612eucas1p10fbe3777394cc604419299509c22a2e7@eucas1p1.samsung.com>
	<20261026103607.968295-1-m.szyprowski@samsung.com>
	<eeca871d-ca1f-4cd4-b40a-570f0805dbd1@kernel.org>

On 02.11.2026 13:26, Krzysztof Kozlowski wrote:
> On 26/10/2026 11:36, Marek Szyprowski wrote:
>> BT_REG_ON (BT_EN) line of the BCM4330 WLAN/BT combo chip is connected to
>> the XMMC1CMD pad (GPK1[1]), while the XMDMADDR_4 pad (GPE1[4]) is
>> connected to BT_RST (BT_nRST). The Bluetooth node however used GPE1[4]
>> as shutdown-gpios and left the real BT_REG_ON line undriven, so it was
>> kept low by the default SoC pull-down.
>>
>> This worked only by accident: the internal regulators of the BCM4330 are
>> enabled when either WL_REG_ON or BT_REG_ON is high, so the Bluetooth core
>> was powered via WL_REG_ON driven by the SDIO WLAN power sequence, while
>> toggling GPE1[4] only released it from reset. Once 'cap-power-off-card'
>> was added to the SDIO node, the MMC core started to power off the WLAN
>> part (asserting WL_REG_ON low) whenever it was idle, what cut off the
>> Bluetooth power as well and resulted in HCI command timeouts.
>>
>> Fix this by using GPK1[1] as shutdown-gpios and describing GPE1[4] as
>> active-low reset-gpios. While touching this, move the GPE1[4] pin
>> configuration to the pinctrl_0 node, as GPE1 bank belongs to that pin
>> controller, what fixes the following error:
>>
>>   samsung-pinctrl 11000000.pinctrl: does not have pin group gpe1-4
>>
>> Fixes: 8929d4a9d204 ("ARM: dts: exynos: Enable BlueTooth support for Universal C210 board")
> Unknown SHA.

Fixes: 4e7787929854 ("ARM: dts: exynos: Enable Bluetooth support for Universal C210 board")

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

