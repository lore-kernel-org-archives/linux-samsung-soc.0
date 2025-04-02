Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD51581F8
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 04:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743567821; cv=none; b=LLX6ISGbCM3ru9rPCNA472VZt6rqCRPoc2aQ+PWzsSuWnmTFxSzA2GYbHSgwWkG4byEmx0tLacHJQrZdcmVVT+OFIa1jK5QYvtWSy8GPg1zCDPq2+TSRmdFc1F8omokqnN7asIpoHcKvxKg9Dh4T+NYtw/83m1HGew3aveCtd0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743567821; c=relaxed/simple;
	bh=26XpbAd3cyx5c9FQj67eOKKt8ijUpzhvKNtGtKvOx90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=TRAw2oGyPdDa/0mRs4fjlhgNJRHkQ1w/33tA6LOS6+zRf001gh3uA/pRaMN7oguB2CqQhqmvkTT8kN5iQw1VZ5fObMjeJDB1We+hfIt7+1idzrMXfKhfJXjXG3K8NEArJxiWzIPkgs916zXyhaOoOhQA28HikUDTf+cZLyEcB/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Ec/oz4MP; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ec/oz4MP"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250402042337epoutp019c835b805d9a8bd2d48e9d72688faadd~yZbFNaJ700349003490epoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 04:23:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250402042337epoutp019c835b805d9a8bd2d48e9d72688faadd~yZbFNaJ700349003490epoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743567817;
	bh=MGQ991KMDMnW4m1Wiq57I0ckShIgb5l6KvutgoePhH8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ec/oz4MPGwzGI1b5GMcFUblyqZglebjub80TyQHnYkJ1dAdtVVPVLG9g9wPML/iXJ
	 IhhBb+9IHaJ5F/CUlK4+ETmd7wfWjhlf7s8xX88wYtxtE5MLGIMgo5pBffV5znfKGu
	 JtM3mM7b1L6be7WES/BldsMuhLT1WHiT3QN8d7BA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250402042337epcas2p39d1302266a3f0c77253492ba20f53f19~yZbEe3Aht0906209062epcas2p3v;
	Wed,  2 Apr 2025 04:23:37 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZSBZJ34mWz6B9m9; Wed,  2 Apr
	2025 04:23:36 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.A2.09787.8CBBCE76; Wed,  2 Apr 2025 13:23:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250402042335epcas2p4e2b5b118d546392237b555efabadfe2d~yZbDV097I0061800618epcas2p43;
	Wed,  2 Apr 2025 04:23:35 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250402042335epsmtrp1e6792f04c64557101454cb523d6068f0~yZbDQN7Xp1111511115epsmtrp1x;
	Wed,  2 Apr 2025 04:23:35 +0000 (GMT)
X-AuditID: b6c32a45-9d3ff7000000263b-6d-67ecbbc87a34
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2A.21.08805.7CBBCE76; Wed,  2 Apr 2025 13:23:35 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250402042335epsmtip1324317eb619d9d81a9481f673e9dc402~yZbDC1NJB2002020020epsmtip1j;
	Wed,  2 Apr 2025 04:23:35 +0000 (GMT)
Date: Wed, 2 Apr 2025 13:27:53 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: William McVicker <willmcvicker@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, =?iso-8859-1?Q?Andr=E9?= Draszik
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Daniel
	Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Donghoon Yu
	<hoony.yu@samsung.com>, Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 5/6] clocksource/drivers/exynos_mct: Add module
 support
Message-ID: <Z+y8yf6zqW1R71Ai@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z-wT3ciq7nL5wa1X@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxjHc9rb21tizR0vcmDosCxmNBRbpO3BgTGBbY3OhYVMkTBZAzct
	A9qut52AZusyRCADlLdAB4iBMcbYIAVrpQIOCRY/tMkILCFmokMmiKCtsgla13Lr4rff85zn
	f563cwh28DweSeRrDJReoywU4EGY9XqsTOSwr6jEzwZC0Hy7FUdDy4MYWuv+DqC+EScLtXt2
	ogsTTg668csDDrJdDkVL5j9x5HINcJHlr1kOmh5uxVGza5SFBpq9GHp51cZFVeMvcDRoaWQj
	99wJVHZLinrdLwHqvObmHgxTWO1WjqKvvQ8oOixGhaW3Elfcmr2KK1adTq5isOtrRc1QL1B4
	LLvSeVkFyWpKmUfpoylNrjYvX6NKERzOyEnNkcrEEpEkCckF0RplEZUiSPswXfR+fqGvNUH0
	l8pCo8+VrqRpwd4DyXqt0UBFq7W0IUVA6fIKdXJdPK0soo0aVbyGMuyXiMUJUl/gZwXqtc5G
	oLu9o7j1Wj/HBBzBVYBHQDIRli03YVUgiAgmbQCunO0OGG4AK5rKuYyxDuDdvhn2K0mfZxMw
	ByMAumqqOYxxx6cfK+P4ozDybTjxZJjlZ5wUQavD61MQRCgZD5+fKfbHs8laHC40PNmKCSHT
	YbOte0vLJ2PgU3s9zvAbcKplAfMzjxTC32eaMKaKRwT8xqliOA0+3/yexXAIXL4xxGU4Ei7V
	lgeYhqbbc2x/YkiWAXjzj/uBdvZB8+JZ4Gc2qYamRQ/mLxT6ipiYwxj3dlhx/QWXcfNhRXlg
	dnvgRsMAYDgK2jt7AjcqYN35K4EBtbBg0+Nq/BzYZX6tHfNr2RiOgx12N272pWCTb8IfvQSD
	sbB/eG8H4PSCHZSOLlJRdIJO8v+Gc7VFFrD11IXv2UD9w0fx44BFgHEACbYglJ/5dEkVzM9T
	lpRSem2O3lhI0eNA6tvNeXZkWK7W91c0hhxJYpI4USaTyBOkYrkgnD/++J4qmFQpDVQBReko
	/Ssdi+BFmlhR7jNms350cuTExqjjSM5uc9Q+qfF+I/J8axeJpD02cQTmTUp1fN7Vi5f+XcoN
	NwStXpo6ut2ZoGat7L/zw8VtqdrjYi7+jnw1u1IUmy1aP6de2FYnLfn035Nd6w8uR4Q7sr4a
	Q/Lshzw6psBrNA14uvlg8m6m7CfxPavqV2g+6T2SHTfT8oXn4rub9qwDM8d68g6nXjrafCys
	vvG3qo9XMkv2eK6c2uifpOoyqmPGavob7JTQrajNcEXFqU+fmsufFpaEhS9KP/ngYLHt9D8p
	aUu8CzZyZSnoOO+mqy2i0r3bJGv76NyUOZSanV7bPNQqDEqeTiuaf/az5a2d0jYBRquVEiFb
	Tyv/A8XYDmdzBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Re0hTYRjG+85tZ8bouC36dKkwo4t5yUr66GJFRIfCsBuIVDr1MEuna8eV
	FpHEChKzxBSnyxS70DCKzdbyVs11sXCDTOliWsusqWi4FCqduUbUfy/P7/k9/7w0Lr5GBNOH
	cvI4TY4iW04FEJZ2eWjU0+YR5YqKnij0ocZCocYhM4HGrhcD1NDqwFCNJwRdsTtI9PTWMIms
	96TIXdVHIafzjgCZPvWQqKvJQKFKZxuG7lR6CTTTYhWgIts0hcymchyNvz2IdL1xyDg+A1D9
	w3HBpvmspdlCsg01DYCtNWlZk/Ecxfb2tFDsqMMhYM1XT7EljUbAekyhicLkgPUZXPaho5wm
	Jj41IPP5wCVMfUWaf7aphiwEdUwRENKQWQ0bPL9AEQigxUwzgK5uHeYHC+G7m12k/5bAfp2d
	9Jf6ARxpP437AMEsgvbvTX8EiomClmfe2SWaljLRcOpMvq+PM9UUNI/ZKV8uYXbCIV2ery5i
	wuFEcxnl39RjcHiwg/SDQNihHyB8N85EwNdeN+ZzcUYGb3hpXyycjV92VxAXAVP1n1H1n1H1
	z6gFuBEEcWpepVTxseqVOdyxaF6h4rU5yuj0XJUJ/PlkRIQVtBi/RdsARgMbgDQul4qSJtxK
	sShDUXCc0+SmaLTZHG8DMpqQLxBNDp/PEDNKRR6XxXFqTvOXYrQwuBDTprs1dn2+tlS2u1rt
	+vmld+v0rpS+koRd5YVn1nRcYOq2z0kqOD1PtyPEaZ3QpZFHlgbrhyQyV3j8Zmt8ZNju7h6+
	f39qwl1v0rRkRNi2duD25DOBp/hm8hY6xkBts86dLGAa2zqSpfumD1w24BWjO0Mqnu9vWfeK
	rNcc08suSGotA4s+nj38acPJb2bCvfCofup+2Ne6zrzWDbnFt12hMOGzkAdSm3O0Kzzu/cgQ
	KO+cf3nGjK9alua4VdQedKLXpvs4VrlXDDf+MHyJSX+w5MncpVmxB+YZX6j7H0Ym3i9xKR9L
	fu1xJQzawgJfnNoaqIrjX5Z6losWl8U8epMmJ/hMRWwEruEVvwEPbCuOOAMAAA==
X-CMS-MailID: 20250402042335epcas2p4e2b5b118d546392237b555efabadfe2d
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_75001_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250401162717epcas2p1882aa777398380ac5e69ee80fb5c3ae9
References: <20250331230034.806124-1-willmcvicker@google.com>
	<20250331230034.806124-6-willmcvicker@google.com>
	<9f594cf1-f1c3-45fc-8d1f-a5abe6c84699@kernel.org>
	<CGME20250401162717epcas2p1882aa777398380ac5e69ee80fb5c3ae9@epcas2p1.samsung.com>
	<Z-wT3ciq7nL5wa1X@google.com>

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_75001_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 01, 2025 at 09:27:09AM -0700, William McVicker wrote:
> On 04/01/2025, Krzysztof Kozlowski wrote:
> > On 01/04/2025 01:00, Will McVicker wrote:
> > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > 
> > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > source for the arch_timer.
> > > 
> > > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > > [Original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > ---
> > >  drivers/clocksource/Kconfig      |  3 +-
> > >  drivers/clocksource/exynos_mct.c | 47 +++++++++++++++++++++++++++-----
> > >  2 files changed, 42 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > > index 487c85259967..e5d9d8383607 100644
> > > --- a/drivers/clocksource/Kconfig
> > > +++ b/drivers/clocksource/Kconfig
> > > @@ -443,7 +443,8 @@ config ATMEL_TCB_CLKSRC
> > >  	  Support for Timer Counter Blocks on Atmel SoCs.
> > >  
> > >  config CLKSRC_EXYNOS_MCT
> > > -	bool "Exynos multi core timer driver" if COMPILE_TEST
> > > +	tristate "Exynos multi core timer driver"
> > > +	default y if ARCH_EXYNOS
> > >  	depends on ARM || ARM64
> > >  	depends on ARCH_ARTPEC || ARCH_EXYNOS || COMPILE_TEST
> > I am not sure if you actually tested it as module. On arm I cannot build
> > it even:
> > 
> > ERROR: modpost: "register_current_timer_delay"
> > [drivers/clocksource/exynos_mct.ko] undefined!
> > ERROR: modpost: "sched_clock_register"
> > [drivers/clocksource/exynos_mct.ko] undefined!
> 
> I tested with the gs101 ARM64 configuration. You're right it won't work with
> ARM32. Thanks for catching this! Since ARM32 architectures don't have the
> arch_timer, I'm not sure if we can actually support Exynos MCT as a module as
> you wouldn't have any available clocksource during boot. I'll update the
> Kconfig for v2 to handle this and make sure it works for ARM32. I'm guessing
> it'll work with something like:
> 
> config CLKSRC_EXYNOS_MCT
> 	tristate "Exynos multi core timer driver" if ARM64
> 
> 
> Regards,
> Will
> 
> [...]
> 

Thanks for working on upstreaming the MCT driver modularization.
I'll take another look at your v2 patch

Thanks.
Youngmin

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_75001_
Content-Type: text/plain; charset="utf-8"


------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_75001_--
