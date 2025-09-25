Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC92E9EB5
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782241; cv=none; b=Hyq9zou9wf9A2gd33bPPAP3M662NiZTnd+iydbzIkKWKHqJX6+SXhJ6CsdjF+k2NT5EhG4ec4psE7svQJwDikvd3K4TJzYByoYfHpdYVuKVcmpojpoMsPcmF9essU9Q85oMpW+OM2K4N6ZjWWNtt68UCWiyyRb82XL6U+ILwVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782241; c=relaxed/simple;
	bh=/oUprJdQlpWhGyr+T8J0CGDIcV3tTijdiTeGGTLC3zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZruGkZfksfjVt/xC8IqvqSP75tpb/paEBUfB4yMj3CQu7AlddzKo5uEtOOfhR0i1tPn+YftJXCiXxq8hIV1iFUzisxMyhvi4ZCEhxQhoinLDREGxwB39Nppanf/MBvk7oyTJxZw5H4Lo4RB7qSCJXCksHdHiVG51Bp20AAS+pSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Jih2lDjB; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Jih2lDjB"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250925063713euoutp026a55aec851076312a8ff08c0f7769c37~ocx9tfpNc0444304443euoutp02e
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 06:37:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250925063713euoutp026a55aec851076312a8ff08c0f7769c37~ocx9tfpNc0444304443euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758782233;
	bh=1KW/opvHx16r3s1Vc5ZpK1xznEfLK8QH9H6s4kzsVEA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Jih2lDjBlJNmf5n3R8rFB9UiHzAVNyJGnEEezwa4oL8EJYZXWhXLH0gNeRAhTetw5
	 /iokn0kMt24A6FsC/JMLedoA/pulEj6tl9siUnVmp9dLwptzs47WjfvFGxSfamzGkR
	 Jn3CBQqEjZ6E+ZvB+i8w7nEAl4zYtOqk7wnhrPqo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250925063712eucas1p2af67fe7f4ea8b8af33874bfaba09fb02~ocx9TqQsg2841228412eucas1p2s;
	Thu, 25 Sep 2025 06:37:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250925063711eusmtip1f9c8523f8b0305612b38794be3d45926~ocx8VlJBi1105611056eusmtip1T;
	Thu, 25 Sep 2025 06:37:11 +0000 (GMT)
Message-ID: <5f69200c-0cce-4b7b-85df-8b9d37960269@samsung.com>
Date: Thu, 25 Sep 2025 08:37:11 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: William McVicker <willmcvicker@google.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, Alim Akhtar <alim.akhtar@samsung.com>,
	Ingo Molnar <mingo@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Youngmin Nam <youngmin.nam@samsung.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <aNQnszeIfeHjx3GS@google.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250925063712eucas1p2af67fe7f4ea8b8af33874bfaba09fb02
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
	<aNQnszeIfeHjx3GS@google.com>

On 24.09.2025 19:17, William McVicker wrote:
> On 09/24/2025, Daniel Lezcano wrote:
>> On 19/09/2025 23:31, Marek Szyprowski wrote:
>>> On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
>>>> On 27/08/2025 12:26, Marek Szyprowski wrote:
>>>>> For some unknown reasons forcing percpu interrupts for local timers
>>>>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>>>>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>>>>> flag only when driver is compiled for newer ARM64 architecture.
>>>>>
>>>>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>>>> I am pretty sure the patch above was not tested on arm32, thus this
>>>> workaround seems reasonable.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Daniel, any chance to get this merged?
>> The patch does not apply. However it is not your fault but a glitch in the
>> previous pull request and the regression found in the Exynos MCT.
>>
>> Apparently, Thomas had to drop the entire pull request while I thought he
>> dropped only Will's changes.
>>
>> A pull request with the previous changes for v6.17-rc1 and with the new
>> changes for v6.18-rc1 is about to be emitted but without the Exynos MCT
>> changes for the modularization. That means your change does not apply
>> correctly anymore on the current changes.
> Is there somewhere I can check to see which changes will be re-sent? I don't
> see them in the timers/drivers/next branch. Will it be patches 2-4 plus the
> fixes for the section mismatch and this new IRQ fix? Once that's all sorted
> out, I'll base the new modularization patches on top of that.

The problematic mct patches are still in linux-next, merged via tip tree 
by commit 9703240ef617 ("Merge branch into tip/master: 
'timers/clocksource'"). What are the plans to resolve this?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

