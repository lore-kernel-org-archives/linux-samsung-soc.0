Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623388;
	b=W0J7tHQdI+idzu9N2nC+ZZKx6jLFnkAAgMNTN0q5rMB3onfC6qCIbfHbb+/3AJ3CiaDa
	 wRTEpJGapCm/fGv8um3UQXVlDhmV+c7scjpZ0gYLH+DVkfw/0HcicH3x8jTifRBReKMMC
	 Y20A48lfSVQJ43L68PeP6KbJqyvK6YwkA0+M3r0f7EJH00oxJtpQ9qj5Shcd3yGFLnjbb
	 U2PwMAiYVW4zw7RtscSF+X+XKSZq3saVzE0i/eArdI7ksyU42Sch6YrZpK3ls5NL3Vqkh
	 VdGI9kYqM8lo0T5eE/bmjQ23GN8SvKYigTHtDMNb7VsiqJfCS9k2uoRQrxMco0LZzlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623388;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=rH9vlZwAwta5qI38yKfrBL3Gqc0558o0bMuyyiURmLQ=;
	b=GFo42S5sKY++gW/O90mDMNtlMWUjupQsqOCDR4+8VhXcLXALW2yXhqTwZwtvxUKy5udg
	 e+a1KXmHcURjV0RJxQzZ09FMyfq7A01xRCXJTghhBvIp8F9LhACF/0BaJ5AWTQd7Djq0Z
	 6oTNv1lIxJhM7iG0P8aTAyGVZdQhWuEtxvQis1HRnGlXfX7mTb63yGrYyjHnZWETI8bAu
	 WZyIpWUdQtuaRY9JswYvLjDxCGMYr+Yq7ZyRSRw2usT3cufXaaGBZo2ujBK7YKnjY6BE3
	 71MP2KUHJ5JW/LZZ1wnfQ2jxIs22Lhla7g2xvV2MHCG94esT2nEIDeoF3t/C1YfdwPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RAP4Jk5I;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CC260A2637
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 12:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CC260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RAP4Jk5I
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261102124305euoutp023bc705674e4c1cb3b2df45322acb398e~kOvdGOwbs0818108181euoutp02K
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 12:43:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261102124305euoutp023bc705674e4c1cb3b2df45322acb398e~kOvdGOwbs0818108181euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793623385;
	bh=rH9vlZwAwta5qI38yKfrBL3Gqc0558o0bMuyyiURmLQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=RAP4Jk5IpIl9qisl34bV2qvQux21cBQ4nqXdyVkcAHgVlIl0liGG2kjCu2gUBSoWZ
	 GS86gtUEKdAZUPgTXEZJ2dif9vOVf8dqw2r+Q3tT1t5Nv123mDQiEY+cMPVu/mj+gB
	 TemKvE9rQVaC23JvY+3LCY7H5B7QFQr8/MRQ+N+Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261102124304eucas1p2f20d8303a387eed97c9a260751f4183a~kOvcy1Cm90644306443eucas1p2Q;
	Mon,  2 Nov 2026 12:43:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261102124304eusmtip29e9b409d4c80572efdd6779c68c2fc36~kOvcZ2q7A2439124391eusmtip2Y;
	Mon,  2 Nov 2026 12:43:04 +0000 (GMT)
Message-ID: <c5e4791d-d402-471a-b8a1-d791e6f3417e@samsung.com>
Date: Mon, 2 Nov 2026 13:43:04 +0100
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
Subject: Re: [PATCH] ARM: dts: samsung: exynos4210-trats: fix BCM4330
 Bluetooth GPIOs
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <8ab6e4fd-6a84-4a9b-9f2f-311d8a754158@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261102124304eucas1p2f20d8303a387eed97c9a260751f4183a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261026103600eucas1p25b6792a9a244d71a5f2ca8d06c9e79f8
X-EPHeader: CA
X-CMS-RootMailID: 20261026103600eucas1p25b6792a9a244d71a5f2ca8d06c9e79f8
References: <CGME20261026103600eucas1p25b6792a9a244d71a5f2ca8d06c9e79f8@eucas1p2.samsung.com>
	<20261026103555.968273-1-m.szyprowski@samsung.com>
	<8ab6e4fd-6a84-4a9b-9f2f-311d8a754158@kernel.org>

On 02.11.2026 13:28, Krzysztof Kozlowski wrote:
> On 26/10/2026 11:35, Marek Szyprowski wrote:
>> According to the board schematic, BT_REG_ON (BT_EN) line of the BCM4330
>> WLAN/BT combo chip is connected to GPL0[4], while GPL1[0] is connected
>> to BT_RST (BT_nRST). The Bluetooth node however used GPL1[0] as
>> shutdown-gpios and left the real BT_REG_ON line undriven, so it was kept
>> low by the default SoC pull-down.
>>
>> This worked only by accident: the internal regulators of the BCM4330 are
>> enabled when either WL_REG_ON or BT_REG_ON is high, so the Bluetooth core
>> was powered via WL_REG_ON driven by the SDIO WLAN power sequence, while
>> toggling GPL1[0] only released it from reset. Once 'cap-power-off-card'
>> was added to the SDIO node, the MMC core started to power off the WLAN
>> part (asserting WL_REG_ON low) whenever it was idle, what cut off the
>> Bluetooth power as well and resulted in HCI command timeouts:
>>
>>   Bluetooth: hci0: Opcode 0x0c03 failed: -110
>>
>> Fix this by using GPL0[4] as shutdown-gpios and describing GPL1[0] as
>> active-low reset-gpios, together with the respective pin configuration.
>>
>> Fixes: 2fd18f0a8de6 ("ARM: dts: exynos: add bluetooth support for midas & trats boards")
> Another unknown SHA.

Aghhh, my fault:

Fixes: 132e900a47b8 ("ARM: dts: exynos: Enable Bluetooth support for Trats board")

Do You want me to resend it?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

