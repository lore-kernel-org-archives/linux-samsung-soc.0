Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82AA17555
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 02:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743560927; cv=none; b=Ejb/rnqskJw9EHUHk+Ihp/Xy9mH2XGadOQLeqd7U/Mckee4aJvExuPRBxBeTmuMMICdWwLpUrCJyUwd19W+zqkzExg0GdK+WLk5CyPnONW0BsLOt8PzJcp5vorBYubFVSweRQvJF6BkCv/iz7cJUOtWmIbmDv4hTVoTRY7cp5Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743560927; c=relaxed/simple;
	bh=e/Ju2h7NCRRQ+8Kui3WDMVbZUdabNrGXKinZmYPOn+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=Q8xow/yYuD+9o3pMnIHf2NxznBV/AnVdNPzfWJLYpn8POoM3eOsLmVw96P4uWcJO3cT4dxH5EgIGNdWKPc6QHtgezYKwK4SeqgwcQGXDtzNBA7skgTfqTasCx734tS+YtCL5yx14hFgxSTVB+zuVl3IiJGwFrc44/w9HdmhdyHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RrTiGCaz; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RrTiGCaz"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250402022841epoutp04321d0f3b8ccf2cc8d4701f2bab271e83~yX2uUeSRx0121401214epoutp04N
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 02:28:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250402022841epoutp04321d0f3b8ccf2cc8d4701f2bab271e83~yX2uUeSRx0121401214epoutp04N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743560921;
	bh=/8oxjPS8tIOPkMuy0QEnU6ypDz8yfhs22Fv/dtcibj4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RrTiGCazqXXGnb00v9VBfymeqRov+Ym1dHvM0GZ6vpqnYalg8kOlIHAhV+kU76asI
	 o4MUMRUFNjHvS65pwkEVE9gL4KQ2lOZeFZ4G0h7oFJGDzdVG0qJrds1wnVbSmTgxpO
	 YvX5n0PKLzjy15YRbNW1Ssn9vsDZB4/FIbPk8Djk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250402022840epcas2p287e4e041182a3af00852cadacbcf30ef~yX2tu_Zg12874028740epcas2p24;
	Wed,  2 Apr 2025 02:28:40 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.68]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZS81h1T4Dz2SSKd; Wed,  2 Apr
	2025 02:28:40 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	0E.AC.09871.8D0ACE76; Wed,  2 Apr 2025 11:28:40 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250402022839epcas2p418dd591006fe8a00ecba240a3b60baaf~yX2sxd8oz1178711787epcas2p4d;
	Wed,  2 Apr 2025 02:28:39 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250402022839epsmtrp207b0765e1a3566a3b11851eb31b81dd6~yX2swXerG2617026170epsmtrp24;
	Wed,  2 Apr 2025 02:28:39 +0000 (GMT)
X-AuditID: b6c32a48-b95f07000000268f-87-67eca0d8adcf
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	11.D6.08805.7D0ACE76; Wed,  2 Apr 2025 11:28:39 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250402022839epsmtip12afaf422178eadf15f85237be9f86c93~yX2sc-fs01452614526epsmtip1X;
	Wed,  2 Apr 2025 02:28:39 +0000 (GMT)
Date: Wed, 2 Apr 2025 11:32:57 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: William McVicker <willmcvicker@google.com>
Cc: John Stultz <jstultz@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter Griffin
	<peter.griffin@linaro.org>, =?iso-8859-1?Q?Andr=E9?= Draszik
	<andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Daniel
	Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	tigersoundkim@gmail.com
Subject: Re: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
Message-ID: <Z+yh2UUwxUz/vRbK@perf>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z-wWA-46L08V89qK@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf1DTZRzm3b77bqNbfp2YL4S0ptFJAhtt7KUDrxrVt/KC6rg4PIUBXzdk
	bGs/PPrhSYFKwxM0uYOpyK9iNyfgGHOohE5FggTvCjFC0CMISEBYmdcha2Oz47/nfT7P836e
	z33el0XnzuNhrDyVntKqZEo+How5rm6RRN+pfSAX1DQz0b0aB47sM20Ymv/+MEDWzn4aqnFv
	RKev9TPQUs85HDnPh6Bp0yiOBgZamcg2fpuBfr5wEkdVAz/QUGvVMoY8l5xMZHQ9wVGbrZKO
	bg0OYGhxeBcqGREjy6IHvL6edFx0MEhrjRWQHaa7TLLWZiBtlm9wcuT2JZyc6+9nkm2N+8kj
	dgsg3baI1OCM/EQFJcultDxKlaPOzVPJk/jvf5wpzRTHC4TRwgQk4fNUsgIqiZ+8PTX67Tyl
	dz4+b69MafBSqTKdjh+7LVGrNugpnkKt0yfxKU2uUiPRxOhkBTqDSh6jovSvCQWCOLFXmJWv
	OH7ATNO4OYUtvWfoRaD2GSNgsyAhgo1//YoZQTCLSzgBNM1OMfyHRQDtp44FKo8AnByqpz21
	VFw5RfMXOgHs7h4LWO4DaCl3rqgwYjPstfQxfRgnoqGjZxkYAYsVQsTApQOFPj2d8DDgnXPn
	gU+zjsiGV+a/xXwaDrEJXq9L8dEcYi38sfp3zIfZRBScnhun+7yQKGdD55+/4P5EybDiURnm
	x+vgzA0704/DoHuuM6DRwaKx4YC5BMDeoSm6v/AqNE0eWglBJxTQaL7O9IWA3hDXhjE//Sws
	vfokQHNg6UGu3xkJ/z3eCvw4HF5sMAduJGFXU8NKWy5hpcFb9Z9WgAjTqnFMq5qZvLfSiS2w
	5UKsn34BFrefoPvp52HTMmuVohbgFvAcpdEVyCldnEb0/65z1AU2sPLyo0gnODH7MMYFaCzg
	ApBF54dw0v+elnM5ubLPPqe06kytQUnpXEDs3dJRetj6HLX366j0mUJRgkAUHy+UxIkFEv4G
	jmthQs4l5DI9lU9RGkr71EdjscOKaGl9utGsobMkDTAdh3jlD7s+it8XldLeHbljh3F/NR9t
	tGYnz7Ijij958x2HcU2kvSp3oblsJ2PkpULzH7acmamUF5stxBvSlP57c/u23uzq7itFOYku
	xC9pcXTsnuC8NZV+84MKjH1m3BOy6eBOj2jhw4LLoscll4Pd6UGisLSMiL1BipfjMnavDXe3
	72EebYs/6dlqHpQSE4xjEvGGSiohXfGu5r0vJtuzZkbrouzmbdt5PdIvg3/qG9QW1wiCbpzt
	qD/dwLkv/vofw+Dj+iawJjzu8FfSPaHGlPQy6YNY5dgrgwONprvfLVRWLw1N9iWHTrQcmRaF
	/pZtTdtVt7nDw8d0Cpkwiq7Vyf4DmLJZ64IEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsWy7bCSnO71BW/SDT7+V7J4MG8bm8WWV5tZ
	LN4v62G0WLP3HJPFvM+yFvOPnGO1+HNiI5vFju0iFi9n3WOzOH9+A7vFpsfXWC0u75rDZjHj
	/D4miw0z/rFY/N+zg92i69BfNovNm6YyW1y4ep7F4tOtOIuWO6YWqz79Z3QQ9di2exurx5p5
	axg9ds66y+6xYFOpx6ZVnWwed67tYfN4d+4cu8fmJfUefVtWMXp83iQXwBXFZZOSmpNZllqk
	b5fAlXF1yQbmgqncFd/39DA3MN7j6GLk5JAQMJGYcHAuUxcjF4eQwG5Gic+fLzFCJGQkbq+8
	zAphC0vcbznCClF0n1Fi1sEZzCAJFgEViVOrTrOD2GwCuhLbTvwDaubgEBHQk/jTWgFSzyzQ
	ySbR/fwuE0iNsECSxMH3k1lAangFlCWOLvSHmLmGSeL43l1gc3gFBCVOznzCAmIzC6hL/Jl3
	iRmknllAWmL5Pw6IsLxE89bZYCdwCmhJvHz3mHkCo+AsJN2zkHTPQuiehaR7ASPLKkbJ1ILi
	3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4GjW0trBuGfVB71DjEwcjIcYJTiYlUR4I76+TBfi
	TUmsrEotyo8vKs1JLT7EKM3BoiTO++11b4qQQHpiSWp2ampBahFMlomDU6qBSczw6vq2L1p/
	/ixS9eRevH2BekX4NHPhm6vi92S7L3FymLIiS/WZxIpiiVbfbVY2QVKyvzgmKx56J756mhOT
	TUnf0fO8fIf809n/lGsWJS/bttz1peNhmeCVO7dWSj/fmyvwmNM5pFLwmh3zx9AJs7fab/jP
	P9/yy26fLbWNnA9yz9a8bylb2xa86sqmi9vDj7m+Notmufri6fSAI/c2zf2x6OkWa4WHivXi
	10u2TljKaqK8SHC1mGHQAasVs/X4NH6y7XXqsHufvetgzoOShWsTFaVOZ8zR27EqzOxX56//
	i69ELuXj4TuWt4LRweBuT8ymj/u368zuf61V/jVPgzPljMVFFrbFSsaK+zncdiqxFGckGmox
	FxUnAgBuIFEVVQMAAA==
X-CMS-MailID: 20250402022839epcas2p418dd591006fe8a00ecba240a3b60baaf
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="-----xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_74052_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250401163914epcas2p1a16e2b7a6ecac9f010ef6eb4c8efc6fb
References: <20250331230034.806124-1-willmcvicker@google.com>
	<20250331230034.806124-4-willmcvicker@google.com>
	<CANDhNCqNqXfGgvo8vNof1qi3E3jejk5KBD=oedZp2_p8RKZdjw@mail.gmail.com>
	<CGME20250401163914epcas2p1a16e2b7a6ecac9f010ef6eb4c8efc6fb@epcas2p1.samsung.com>
	<Z-wWA-46L08V89qK@google.com>

-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_74052_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Tue, Apr 01, 2025 at 09:36:19AM -0700, William McVicker wrote:
> On 03/31/2025, John Stultz wrote:
> > On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > From: Hosung Kim <hosung0.kim@samsung.com>
> > >
> > > The MCT local timers can be used as a per-cpu event timer. To prevent
> > 
> > Can be used, or are used?  If it's an option, is this change important
> > in both cases?
> > 
> > > the timer interrupts from migrating to other CPUs, set the flag
> > > IRQF_PERCPU.
> > 
> > Might be work expanding this a bit to clarify why the interrupts
> > migrating to other cpus is undesired.
> 
> Let me dig into this further to figure out if the IP has a limitation where the
> interrupts need to be handled by the CPU the timer was triggered on or if this
> is just an optimization.
> 
> Any chance you know this @Youngmin?
> 
> Thanks,
> Will
> 

Hi Will.

Yes. In downstream, we’ve been using MCT as the clock event timer instead of the ARM timer.
Setting this flag allows each CPU to handle its own clock events, such as scheduling interrupts.

> > 
> > > Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
> > > [Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
> > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > 
> > thanks!
> > -john
> 
> 

-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_74052_
Content-Type: text/plain; charset="utf-8"


-------xErIy8MFyp5znNcbVfGOYxfVuB8z5fzEV-ls754GuccR_q1=_74052_--
