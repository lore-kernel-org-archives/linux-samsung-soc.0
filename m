Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB8920487E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Sep 2025 21:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758317497; cv=none; b=PdO9NrlRo+1ZI+KGVGlrZoqAa56QS659M5b57rFIbGzzU7zazbCq7VSZ242fK3cFrhG6QhLG+tP9R+ukZKfdr8rpxppzEjCSZY4fxmiX4QmKuCOYOiKC0KhiUdt/5tnxEPtOEmfhcfXJyWZRk1tRzuzCa8Dn1V+EwcUVbLCLtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758317497; c=relaxed/simple;
	bh=s3QR/bYnxFjVTV4aO6EFn3GAB0EPu/iKzYjY4K1d404=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=lncEUleZFAU63USkO65RwbSPlIFi31ZQY9wkBat7qXGxMaIaX1VzVOz7V0tQpf66GPbgNXiZtcqGd78Bq4Y6NeaRXQr8ZC8/8skXENsQ9jV3NAM9ak95WYRufhQrcqGtolELt0jOjRSqO73orJaRkQw7rcmEQ5tzIdSuC6a8HdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VH8EUVUj; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VH8EUVUj"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250919213127euoutp013c17daadfe6994b2bd630b6f09406916~mzHBY5xX91640116401euoutp01J
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Sep 2025 21:31:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250919213127euoutp013c17daadfe6994b2bd630b6f09406916~mzHBY5xX91640116401euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758317487;
	bh=+STulwrmmd/a02dJorxWTifa22lKeFoCcq1z9zgYcYk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=VH8EUVUjfnAlG7FLTyq4QOSc+IRmEuJl++0eR4hg2IGBhY3n+S+jckvdRf94Pb4F/
	 KVc2wlS+nbKFAxMeBWCBeyIOoTTOqjequ0GGU/ERkDm2A8vDkE9tDCwCs3EPIiH9JX
	 Kah2OOM+wkJpIDY/TCblxn7aprcr5JqtnkrNQfEU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250919213126eucas1p29bc2ab799cf2891457f4ff3353e96116~mzHAcqcd42589425894eucas1p2x;
	Fri, 19 Sep 2025 21:31:26 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250919213125eusmtip236748a339fe3a7ae4476be93fbd606b9~mzG-ijm9H1195011950eusmtip20;
	Fri, 19 Sep 2025 21:31:25 +0000 (GMT)
Message-ID: <d27df41d-58ba-41e8-9275-2e9991f574a0@samsung.com>
Date: Fri, 19 Sep 2025 23:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Alim Akhtar
	<alim.akhtar@samsung.com>, Ingo Molnar <mingo@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250919213126eucas1p29bc2ab799cf2891457f4ff3353e96116
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
X-EPHeader: CA
X-CMS-RootMailID: 20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3
References: <CGME20250827102650eucas1p1fe270adbf29c649b9ce529e1d45aabc3@eucas1p1.samsung.com>
	<20250827102645.1964659-1-m.szyprowski@samsung.com>
	<8fb4534e-ffb0-40ad-8256-b0fa040a1b97@kernel.org>

On 27.08.2025 13:58, Krzysztof Kozlowski wrote:
> On 27/08/2025 12:26, Marek Szyprowski wrote:
>> For some unknown reasons forcing percpu interrupts for local timers
>> breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
>> machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
>> flag only when driver is compiled for newer ARM64 architecture.
>>
>> Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
>
> I am pretty sure the patch above was not tested on arm32, thus this
> workaround seems reasonable.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Daniel, any chance to get this merged?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

