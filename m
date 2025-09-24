Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FD7289E0B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758704029; cv=none; b=rnipKFaKp6aBspJcE6pxFKYy1Ga8SfEOzSPgaDou5A/ilIDGq+yn+6KOR7SclrgI3RYKS41jK0Gfnby/kEumNbar2xVdN2rrSpAx34ZHmnxhv57kZLlDKv5s7PRrX01ygdTryf/2KxqdgGEuChtpTa9z2Hf29docBn6tk5GKux8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758704029; c=relaxed/simple;
	bh=UT+rj7curaBxcmnA0NDN1QAWnYNiZdSC1KAfxQWdXBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=PPzPizEUz/m30HQHHKpP0NTdGX/yDjRwGhstFj1FMe5HmvI/Xng5Lv5ozHJDwl26bAVrxfkN2ZnMFT/8GlnqdX711mOtyJJ2rY6dyCd4VzzSO9B/uuGow2ax66ki8E/PIvlzDrFeO2IvwCAfzyChgikWCOGxdXHEkRrlGfgPuTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KcNch+1S; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KcNch+1S"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250924085339euoutp019e3ddf71126a5e3557b1ee4cd840b45d~oK-y-sRqe3237232372euoutp01k
	for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2025 08:53:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250924085339euoutp019e3ddf71126a5e3557b1ee4cd840b45d~oK-y-sRqe3237232372euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758704019;
	bh=CqXbCXCtfo3WYJi7OeV3d7gOVlYWPMATHpNe2Dly36M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KcNch+1SleSfRiwUNdfjecEzzqa7B113uBvSNATfohn3+1nkid85q1JT/8KZo9G3w
	 hBPRfsPfV+qhYZD9L+nioCTXdNunZPv3xpowgyojDfUNrj9I5ArgRGfvk5D3PPHrOQ
	 VDK+hDOS4DI1+f2/B8XfJ+kdjMctSD0mUxLkQ0hQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250924085338eucas1p262e8f49fbe3d4eb17c25e99907fc0915~oK-yvdSFC0850508505eucas1p2f;
	Wed, 24 Sep 2025 08:53:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250924085337eusmtip2a749c23464beec550557f0850b9d4e6c~oK-xoipmi0978809788eusmtip2E;
	Wed, 24 Sep 2025 08:53:37 +0000 (GMT)
Message-ID: <a1ce41d7-ac54-4f66-b0b3-b98e5079e926@samsung.com>
Date: Wed, 24 Sep 2025 10:53:36 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Alim Akhtar
	<alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>, Will
	McVicker <willmcvicker@google.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250924085338eucas1p262e8f49fbe3d4eb17c25e99907fc0915
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-EPHeader: CA
X-CMS-RootMailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
	<20250827102645.1964659-1-m.szyprowski@samsung.com>
	<8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
	<d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
	<6a89a8bf-022d-4c31-b6db-95763142e603@linaro.org>

Hi Daniel,

On 24.09.2025 10:41, Daniel Lezcano wrote:
>
> On 19/09/2025 23:31, Marek Szyprowski wrote:
>> On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
>>> On 27/08/2025 12:26, Marek Szyprowski wrote:
>>>> For some unknown reasons forcing percpu interrupts for local timers
>>>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>>>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use 
>>>> percpu
>>>> flag only when driver is compiled for newer ARM64 architecture.
>>>>
>>>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local 
>>>> timer interrupts as percpu")
>>>
>>> I am pretty sure the patch above was not tested on arm32, thus this
>>> workaround seems reasonable.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Daniel, any chance to get this merged?
>
> The patch does not apply. However it is not your fault but a glitch in 
> the previous pull request and the regression found in the Exynos MCT.
>
> Apparently, Thomas had to drop the entire pull request while I thought 
> he dropped only Will's changes.
>
> A pull request with the previous changes for v6.17-rc1 and with the 
> new changes for v6.18-rc1 is about to be emitted but without the 
> Exynos MCT changes for the modularization. That means your change does 
> not apply correctly anymore on the current changes.

Thanks for the information. I've checked and 
https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git/commit/?h=timers/drivers/next 
branch indeed doesn't contain the whole Exynos MCT modularization 
patchset, so the $subject patch (which was supposed to fix it) is not 
really needed.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

