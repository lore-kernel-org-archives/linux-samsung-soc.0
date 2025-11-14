Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F0F132117
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763098630; cv=none; b=mpdr/dcUbD3mN0L7uGxoQUlJLTDpkrGW8alsBCf/fEDIyUFzurSwyNriKcsJHVdwv5lXDMt5MBhNMyKJ1DelOhhxhv232IN36h2DNbwCoPdx1v9y2W7gXrs0/rMu2kolijV7lvtvXklhnNqjSmDWfUfgcOu+cg66HHPXRYQCYzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763098630; c=relaxed/simple;
	bh=TXRqwR/IOg7GPTG36fUQuZs7J7mDP2wR/6HVNaO0ww0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=d0QfbU5Ij94xyW8utTAfWEIGaR+RtV4Hgnxaz+CQ/nlUiyjw7yTPK4j4JlwcWdQropOjdorPCV8QBJ0O6ijN7V65rydI7XMP3ux6pDoQU7fCYetmY5zwXaBZDUq9KbSjghS71NQ1OysnI8LHu8A3EzFCXVKSOFFIG9lexrIGZko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YgyMmFYv; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YgyMmFYv"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251114053700epoutp0279127fd7ed9e6f49b8f4e8dc3ecc0717~3yNqiWjgL2875628756epoutp02n
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 05:37:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251114053700epoutp0279127fd7ed9e6f49b8f4e8dc3ecc0717~3yNqiWjgL2875628756epoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763098620;
	bh=f4BkXaRbSY4CpriOHwvnOYLmtFzMrOOh9JYVfFHYZLU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YgyMmFYvQZKJBQaW2RZ1GrT7kT+Ok+o2IaDdCPx2EcyGSWVILyZADQ7jvRK5DbK99
	 c4u54jHechDb2It81AO3pNdvVKuG2FkzkzLGnuSysUSF5BLCJKyhRofQ55HCCkHS6O
	 ybO6+B2TPpW6zh6ufOqvvw+pxhqO6gaSa987tyig=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251114053700epcas2p4c375cd9debd91d96156eef1e20d5f26b~3yNqGZZPU2059920599epcas2p4A;
	Fri, 14 Nov 2025 05:37:00 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4d75Vg3vvJz3hhTH; Fri, 14 Nov
	2025 05:36:59 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251114053658epcas2p1bb54b75492e5850a0dc6dbed8ec7cf38~3yNpA9ojs2511225112epcas2p1v;
	Fri, 14 Nov 2025 05:36:58 +0000 (GMT)
Received: from KORCO118486 (unknown [12.80.208.104]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251114053658epsmtip274ea3eac07362b98eb7eac08d3e37631~3yNo5WXGX2019320193epsmtip2D;
	Fri, 14 Nov 2025 05:36:58 +0000 (GMT)
From: =?utf-8?B?67Cw7IOB7ZuIL1Nhbmdob29uIEJhZQ==?= <sh86.bae@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <vkoul@kernel.org>, <alim.akhtar@samsung.com>,
	<kishon@kernel.org>, <m.szyprowski@samsung.com>, <jh80.chung@samsung.com>,
	<shradha.t@samsung.com>
Cc: <krzk+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <945d5f68-66b9-40f3-afd7-64e746075d12@kernel.org>
Subject: RE: [PATCH 1/4] dt-bindings: soc: samsung: exynos-sysreg: add hsi0
 for ExynosAutov920
Date: Fri, 14 Nov 2025 14:36:58 +0900
Message-ID: <000001dc5528$b2053210$160f9630$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQISOccZb2Ez4IvEWuwZme1oXG7+3gG5WrFyAj6/1FYBYx2HL7RbA5zw
Content-Language: ko
X-CMS-MailID: 20251114053658epcas2p1bb54b75492e5850a0dc6dbed8ec7cf38
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074011epcas2p438f7edb31c720c0950e9df986983f5a5@epcas2p4.samsung.com>
	<20250926073921.1000866-2-sh86.bae@samsung.com>
	<945d5f68-66b9-40f3-afd7-64e746075d12@kernel.org>

> > Add hsi0 compatible for ExynosAutov920 PCIe settings for:
> > - PCIe PHY power control
> > - PLL settings for PCIe
> > - PCIe device direction (RC/EP)
> >
> > Signed-off-by: Sanghoon Bae <sh86.bae@samsung.com>
> > ---
> >  .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml   | 1 +
> >  1 file changed, 1 insertion(+)
> >
> This is not really related to PCIe or phy patchset, so putting it here
> just makes life of maintainers more difficult. There is really no reason
> for that.
> 
> Don't mix subsystems when not needed. DTS patchset targeting me, should be
> separate from other subsystems in such case and it only needs to mention
> in changelog or cover letter where are the bindings.
Will separate this patch from the patchset

