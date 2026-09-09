Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021B342523;
	Wed,  9 Sep 2026 05:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933436; cv=none; b=Ttz/PMDOSdlE2HdJyr1aWcCzaNXW7mRYf+QUynwqiEE3kk/kaE4Byt4LiECeqe5KbM2xwE2fOJ9muvWkguiN7hs0F+rwbPjrKRLTV0wqHMPUh47T1OpeHz6Rw2VkuBfap36IERTVgaANGp7kvtsHdnodKarMWX6DoSJJQjps4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933436; c=relaxed/simple;
	bh=r+LlJs5mM1ZgCgqI+0Dls4/jPaNAr5CiySqbIIFZ/Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6giNnEa12hPdf/sS9Q7L5wbMCY/oZ4w/t7BzAfj3xICdWoIZkdceVXFu+EIBasE9KJnOYF91ed3PXzRl703WJMOJYRUHEIFI9fXuZxhW6/95a0qsj4jbH2bg9V7T4IM4hI65ekOx4mRZlTT8XQuBc0IVLx7W8mZ/FDigthcwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8qZbINv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8qZbINv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2335D1F00A3D;
	Wed,  9 Sep 2026 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788933434;
	bh=URhDAXh9OmSfBgX3Y7ErDlKOv1KrV8vBjf+vWx2w2u8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E8qZbINvtrtL2r5KQihDXiO/X4PC6AJ2Mwttj7u12h905xAZVuAbBegz1gyzKJmSa
	 S9zjwbtOkjrcEMYOfBXZR/TZ+KagUnd2z0dipccGZvjVHn/x7obVbV+OshQKjQVBtN
	 Rk4gkEOKiLDCYB68Erx6QqRTLSxbdc0TPVq2jkRureBKvPDAxNjr3gZIG4Qq0WhOD0
	 p5CMCeQ5yzMR+ZuO8qX1Grd+F3f5phDmirlI76z8OaSBLAz/pkfc5catMNPuH1j5LA
	 AZyRTPvQS6rIZGAhWTv3qvebqhdVTSos88+baLP17CgOB2S2/ExRaP/6I0G+ZlOTxb
	 2mFKBtHpmbtqg==
Message-ID: <fba04516-9f78-49dd-978c-53d4256a7d88@kernel.org>
Date: Wed, 9 Sep 2026 07:57:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS in
 Bluetooth node
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20260829101532eucas1p29f4e04d4dfd169377793c276221059a6@eucas1p2.samsung.com>
 <20260829101509.138284-1-paul@crapouillou.net>
 <6e319291-72b8-4a43-b953-8a9f0a6049c8@samsung.com>
 <1666390417d0d9b8f58a7bdad1b8ecb475ba0d4f.camel@crapouillou.net>
 <62afdbc4-f21a-477a-b0ab-de20c96b4b6d@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <62afdbc4-f21a-477a-b0ab-de20c96b4b6d@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/09/2026 10:16, Marek Szyprowski wrote:
> On 03.09.2026 15:29, Paul Cercueil wrote:
>> Le mercredi 02 septembre 2026 à 10:36 +0200, Marek Szyprowski a écrit :
>>> On 29.08.2026 12:15, Paul Cercueil wrote:
>>>> The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-
>>>> rtscts'
>>>> property.
>>>>
>>>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>> Indeed the CTS/RTS pins are used for BT on most of the ARM Exynos
>>> boards,
>>> as the "<&uartX_fctl>" property is assigned for pinctl-0. This is not
>>> really
>>> specific to i9100, so maybe this property should be added to other
>>> dts?
>> I can add it to all exynos4 boards that use the "uartX_fctl" property.
>>
>>
>>> However I wonder if Samsung UART driver actually use this "uart-has-
>>> rtscts"
>>> DT property? A quick "git grep uart-has-rtscts drivers/tty" shows
>>> nothing
>>> related to Samsung Exynos...
>> It looks like it does not. I still think the DT property should be here
>> but I won't fight over this.
> I also don't have strong opinion on this issue. Krzysztof: do You see
> any benefit from adding this "uart-has-rtscts" property, just to describe
> precisely the actual hardware, even if it won't be used by any driver?
> 

Yes, it makes sense, because drivers could be improved or DTS could be
used in other project, but it also does not really matter in such case.

Best regards,
Krzysztof
