Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456441;
	b=v1qpnvPkc1OwIheCYbHDVr3dW6pMeJnn4Ud+Gt0acgotagvXDqzq7BvD8K4Ahe4/zWri
	 qi9X3qxRMePgiKVEEwGjWCz8rDhTBqKBOp0j+mCGOPL6It5F1Ht2Lc6L2mNcJF0eRcb5L
	 +QXcHvm4A4SYiiWl0AQDLYMPQMcFsudeksXFanc03nV1ziyOGYU0nANhHopeghu+4Bpb1
	 PE345hZvqdVJ6AewT0GXCkvsClptFigZq/VTdYBsKVC1D+qDeUxYdPRpEqe1lRweOj5LC
	 +L4ol4ocqlRJlB6M0A3nHbMvj3sFcMQm3pHTXtPeh3QkPALGgD3saE//b4qoKs92W/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456441;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=KAB2BKt918TC8J1Io05dleoIknVU5q1NI2MsEwZVMss=;
	b=CsFlmYmNz1PZt1KeIhCfjrbk5Qz4vvxolzVXGiDeO0OjSrJVkrpKm4XesMLJs6f00riA
	 jl+ZYRDDnqYWZLn1MLlBOPDC0RLwWfgnGrngxZHp60Sg0bMfN2bz1dDnoPSoIXHUu2rRa
	 anYZovcsEuZtoKFbH4lB37ITPw3ddyXYsgGekMrBp+PUR2wrm4CMkP19giFmf/QB6torc
	 eVwZ1gRhHnBYP+6x98EOaLGV7vSDBiz5qT8wJGTy4orn1g7zmZ/lvUJT2XXszNrylODvy
	 o8hJECbfhUr0cTzNK/ZcOVZkC3/J6LwV1xPUF3kAX4DiY3eYlZD3MHir4OQ2fwdgF9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="KaLHmeY/";
	arc=none smtp.remote-ip=210.118.77.11
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A159606A321
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 17:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A159606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KaLHmeY/
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261123175357euoutp011b6c662edf1a950ff561e874b0417ed6~qvh4O2g_51519515195euoutp01W
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 17:53:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261123175357euoutp011b6c662edf1a950ff561e874b0417ed6~qvh4O2g_51519515195euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795456437;
	bh=KAB2BKt918TC8J1Io05dleoIknVU5q1NI2MsEwZVMss=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KaLHmeY/H5/6luOM3bVkacedBNGp4qFGJ/QLKxD9En+nFjUF5oST4IhTspYpfAUoo
	 +Js8gOjXitDE24uNSHz9PV3JDQ/OWZ/IuT4sobCQh9OVCo221IgqmSuvS3sjQIjjTm
	 WzSNQ4plLTKCpO1lLKZF+smGvCmLACEWFffNiNnw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261123175357eucas1p2cc191475e27a19aa757b67113f059dff~qvh3zUySr2536125361eucas1p2Y;
	Mon, 23 Nov 2026 17:53:57 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261123175356eusmtip2b9af5e8e9756c7efec6eca2def375a43~qvh2tRfpt1373213732eusmtip2Q;
	Mon, 23 Nov 2026 17:53:56 +0000 (GMT)
Message-ID: <d0bf2242-d9ad-4a7e-a1cb-ef32e50f34f9@samsung.com>
Date: Mon, 23 Nov 2026 18:53:55 +0100
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
Subject: Re: [PATCH RFC 0/2] clk: samsung: exynos5: fix sub-CMU power domain
 attach
To: y-asai.0816@docomonet.jp, Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261123175357eucas1p2cc191475e27a19aa757b67113f059dff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261123141844eucas1p221c650882789ccab239e57ee458c02a1
X-EPHeader: CA
X-CMS-RootMailID: 20261123141844eucas1p221c650882789ccab239e57ee458c02a1
References: <CGME20261123141844eucas1p221c650882789ccab239e57ee458c02a1@eucas1p2.samsung.com>
	<20261123-exynos5-subcmu-defer-v1-0-43aef47d4f2b@docomonet.jp>

On 23.11.2026 15:18, Shigeaki Asai via B4 Relay wrote:
> Since commit c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular
> platform driver"), the exynos-pd platform driver registers the power
> domains too late for exynos5-subcmu, so the sub-CMUs are not attached to
> them and their clock setup is not restored. On ODROID-XU4 this drops the
> GPU performance badly (about 3.5 fps in the Kodi menu, with repeated
> panfrost "gpu sched timeout").
>
> This series fixes it as follows:
> - Make the exynos5-clock probe wait until the power domains are
>   registered, so the sub-CMUs are attached to them.
> - Also make audss wait for pll_in. As a side effect of making the
>   sub-CMUs wait, audss would otherwise probe before pll_in exists and
>   generate audio from the 24 MHz pll_ref, which causes audio stuttering.
>
> However, this relies on deferred probe, which conflicts with the move 
> towards platform_driver_probe(), and the sub-CMU clock data is
> __initconst, so the deferred probe has to finish before init memory is
> freed. So I would like to discuss the preferred way to fix it.
>
> This may also explain the oopses seen in the RFC series "clk: samsung:
> Use platform_driver_probe() to avoid __refdata". Krzysztof saw them
> when converting exynos5-subcmu, and Stephen pointed out that
> platform_driver_probe() is incompatible with deferred probe. The
> sub-CMUs have to wait for their power domains, so exynos5-subcmu
> probably cannot use platform_driver_probe() as long as exynos-pd is a
> regular platform driver.
> https://lore.kernel.org/all/20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org/
>
> Testing:
> - Tested on ODROID-XU4 with a Linux 7.3 based LibreELEC kernel:
>   every power domain now has an exynos5-subcmu device attached in
>   pm_genpd_summary, the Kodi menu went from about 3.5 fps to 25-30 fps,
>   "gpu sched timeout" went from 17 to 0, and there is no audio
>   stuttering.
> - On next/clk, only build-tested (exynos_defconfig, W=1) and checked
>   with checkpatch. I have not booted next/clk on the hardware.
> - These patches are already carried in LibreELEC.
>
> I investigated the root cause and wrote these patches and the commit
> messages with the help of Claude (claude-opus-5-5). I reviewed the
> changes and tested them on the hardware as described above.

https://lore.kernel.org/all/20261030075325.517182-1-m.szyprowski@samsung.com/

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5fbe2d229bd3738ed63c7c9177466ad6bc130f18

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

