Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CF73FBEB7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967592; cv=none; b=ZaqF8Zq0gFLkxE/Q0k2fvvBokRv4jM6EkMQ32kV3K1uwyStxnNwSgUPjlryTwnMRH5ik8PjcnnwgKwxdUDJMGhwrntE4DVP9TYdFDd3uSDBI5PFE3i2IDcVMGkTZUS2cwDFZrLtbtNlfqd3b8lesJ6+hN/v5+IyrBMxQPaW/1AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967592; c=relaxed/simple;
	bh=9FdlPJhn/IZ12XWI//YvQwgVvhpGbFxS2mTcEkFcs2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=DzGGlXZpjzXtrWD648HKhRjcdXdKDI2hi6S/NqfUl0WWtySqTN9D84FEDGZoBY/RSLTLKEwXXQUj0pMxeAl/hzr0BU3xmaiV4hB4bhs/p6IYRi+NF+y/pAyK7lX/eXwwUx9Zyh8HQ6K/uuwQxkN11OlwqpBKQFaU2E8+MvW/c18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gn+F3vmq; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gn+F3vmq"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260331143307euoutp019cf573d1e72175d7f9a7ca0f56c1562d~h8535uiOa0574805748euoutp01i
	for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Mar 2026 14:33:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260331143307euoutp019cf573d1e72175d7f9a7ca0f56c1562d~h8535uiOa0574805748euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774967588;
	bh=72m2TIJKvAyvCq88CEBugebJ+antOx8xqwjTjQMwlk0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gn+F3vmqJQPGn2xsJQqpdX4RtvRpmsHTAaGUD0tpt1g+Ew6zJljspU4j6kURwLMQ9
	 ERo1PX5RiXLPVAzyUO1QwHs3BkahpzMYKyidf9OSKDioGxkcum9vgNrhgpgyNpZxPi
	 prhflKqFUyBmBLoFHEoFlFc2p6OjbWzOpm30sCVI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260331143307eucas1p10710d28fbb1407571cce7f29547133df~h853mCCVw0263502635eucas1p1A;
	Tue, 31 Mar 2026 14:33:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260331143306eusmtip19f8a3609e5a023afe620e4c1c98035cb~h852vSnAr0271202712eusmtip1G;
	Tue, 31 Mar 2026 14:33:06 +0000 (GMT)
Message-ID: <52a26d5b-67ec-4a99-98f6-6216e930cdb7@samsung.com>
Date: Tue, 31 Mar 2026 16:33:06 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 0/4] drm/exynos: Random cleanups
To: Chen-Yu Tsai <wenst@chromium.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260331143307eucas1p10710d28fbb1407571cce7f29547133df
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260327054445eucas1p2d1ac645faccf16272c3a12406400a364
X-EPHeader: CA
X-CMS-RootMailID: 20260327054445eucas1p2d1ac645faccf16272c3a12406400a364
References: <20260326094308.1161335-1-wenst@chromium.org>
	<CGME20260327054445eucas1p2d1ac645faccf16272c3a12406400a364@eucas1p2.samsung.com>
	<CAGXv+5G2H3CSic5hCSd2g6RrfGyNSbpYS7Z9uo-XUn6No3a4Rw@mail.gmail.com>

On 27.03.2026 06:44, Chen-Yu Tsai wrote:
> On Thu, Mar 26, 2026 at 5:43 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>> Here are some cleanups for the exynos drm driver. This was done as part
>> of the conversion of the driver to GEM DMA helpers. These patches have
>> no dependency, unlike the actual conversion, so I am sending them
>> separately for inclusion now.
>>
>> Please take a look.
> I should add that these patches were only compile tested.

I've tested this on the real hardware and it works fine.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

