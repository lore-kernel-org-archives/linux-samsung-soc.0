Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606783;
	b=iPD1FtWAHstTdXVm6YkC+vD2yqnB5dKk75iEIpaS8HTYlh9Ww1lz0wKQQDhzb719zHGA
	 mTR4pwc4AR1zKiXlh5wLBd+W0xxIwr5iIj7E/QszCO+3p/PGWTuCeIubErHjINSwcXjlP
	 lbrJnM7CiJiod8lw0AYPIB6581uX8J71nKKrcMyjkHuygvE+p+E5ObknaaXbxHWky6QEo
	 SsScoMlBJFas+aRVFxfbELmBS6/FEtErHVbOXIH84FRHINcDWGBy//rHLkO1JrYc2PLFg
	 l46DXDF8z2Ad6Zx61NJxMRJ1vqVQCugM1fzlRyalrNOcK+K5Dt1EmfKMUG+ZcYWLMLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606783;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=sqpao1/I/tLYCesD0l9knVmMOKVJ/faaut6nm1UzczM=;
	b=MCRYA8BfpVDJy415EKYtq7fYZhHto7v4tFhscTre2hdpa7G3YWA+UInEfCXLv/iLxmcp
	 b+qivpLr5gh3/nLjJ2QBbiCBQQM/sWrmGLjnFXjN7jkGneoqY5N2eI23AYpMC3scivpj9
	 SVzFbx0Vh4zK9lDkKsAu5QCLCZ2w//j1YXjLxhHE/fhbR43ChYdLP0JZRzchtZBO4/Jwz
	 793Mn0Wl2FPv45dkPg8glFubOZBpxhzuFSvr/eOQ37inFjn1ft/u4TZ7Iq/eQDK0eBv6e
	 XMbuqfhsjdF1EE1rzqDjsgugMyTjJ+KpzkhmtgLQ1ZY8HAS0Oe8etF92DfLO1tnXKUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NZSCviOz;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD188606A327
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 08:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD188606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NZSCviOz
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261102080609euoutp026a5c2e62f587e2827a9f6fa3b7d163dd~kK9p9UAL81797317973euoutp02O
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Nov 2026 08:06:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261102080609euoutp026a5c2e62f587e2827a9f6fa3b7d163dd~kK9p9UAL81797317973euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793606769;
	bh=sqpao1/I/tLYCesD0l9knVmMOKVJ/faaut6nm1UzczM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NZSCviOzZ/OZCMcVwA/wRyDfhWu4aCyYEmHY5/RxdaFYxocYJuX3zpcCQ4evxxEX5
	 B8UxaASGc/X7UAkXpR2+QHlCofj3DCXDp2dGws/qPhJKfdE/5IQNNuOhtWPNMlGPKV
	 urJIAgEkdAVGgnOtSaBFCL9MeN+oMwO/ggGACRGI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261102080608eucas1p29e19aeaa46f3f25c2921b573f9c732af~kK9pBZEyM1106911069eucas1p2-;
	Mon,  2 Nov 2026 08:06:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261102080606eusmtip23b97669eb77931e6c6d21f15001254a3~kK9n-x3f70436304363eusmtip25;
	Mon,  2 Nov 2026 08:06:06 +0000 (GMT)
Message-ID: <abf751e2-c03f-411d-b27f-1d822c084862@samsung.com>
Date: Mon, 2 Nov 2026 09:06:06 +0100
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
Subject: Re: [PATCH v3 0/3] clk: samsung: fix probe-ordering races in
 exynos5-subcmu
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <af5958f9-5a76-47bb-b78e-b17de38d66ee@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261102080608eucas1p29e19aeaa46f3f25c2921b573f9c732af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261030075332eucas1p16331988bd7df20db9538066a613a42f2
X-EPHeader: CA
X-CMS-RootMailID: 20261030075332eucas1p16331988bd7df20db9538066a613a42f2
References: <CGME20261030075332eucas1p16331988bd7df20db9538066a613a42f2@eucas1p1.samsung.com>
	<20261030075325.517182-1-m.szyprowski@samsung.com>
	<af5958f9-5a76-47bb-b78e-b17de38d66ee@kernel.org>

On 01.11.2026 20:03, Krzysztof Kozlowski wrote:
> On 30/10/2026 08:53, Marek Szyprowski wrote:
>> This series fixes a group of related issues around power-domain
>> availability and probe ordering on Exynos5 platforms (observed on
>> Exynos5800, e.g. Odroid XU3/XU4), which can leave clock muxes stuck on
>> the oscillator instead of their intended PLL parent.
>>
>> The issue was analyzed and patches were prepared with LLM assistance.
>> The whole patchset was tested on the real Odroid XU3, XU4 and Chromebook
>> Peach-Pit and Peach-Pi boards.
>>
>> Best regards
>> Marek Szyprowski, PhD
>> Samsung R&D Institute Poland
>>
>>
>> Changelog:
>>
>> v3:
>> - instead of removing more __init annotations, simply fail driver probe after
>>   the init sections have been freed; this should not happen anyway
>>
> I guess you did not pick up review tag(s) from v1 because patches changed?

Yes, imho that was a significant change.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

