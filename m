Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016063;
	b=Hqakx2SphSIuaa8ORoYfZgy8oQEUzZ26JSpv4kX/4K8P+Tbo/IdLtXZ40Ooktj764kyH
	 VJMoQTqYRJ+SSMb6lUsQJR+Ok0YiNmITRKEYc9Y7piB84SJ57jUQuLyO69vunMOIg4n4V
	 COfVKJQXsJc+6Iky4wuEkaPQp6c5hjWvZKUEnkPmFoP+bccbTMExESCyALJfeq8+Dk8xL
	 P3Yl2E4+uYaidbGf2KkbcRKrlPlsiDHaESAlzQ6z9xbObe6aRLRwEQpxVDZMM0JcWfw1g
	 ASTmYvsHBtSTRsM2m/k1E+sxc7p4cxbUjYkQEis6UilHSrGYVRkvp444ePIPWFxLAVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016063;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 Cc:Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=Eooql/PWw9JrcOSkmPC1JhQXpt0yj7tFL/LJ7TTte3w=;
	b=lB6xkDmOkZWYqk6AwHmWoqnwrgCNhv89iO42yYioGoBfxvz/qSJK9d3tXZQuQ8G0lKLM
	 Ey3mCLHeLdng4WcPCVvm7d51ojX7Lh5rmcyhmp48y3tBTzHtq2DKkfYObtyyBbg1fw2BH
	 Hi98T9+l0E0efiP9OAeyj1KBPmIIJXQZlnjRbf6CxBfHzAUJIa+LikVJFLLb6i2LAMTHz
	 +/+nVn0Yw/rPwgy2U+Lfprex23GnoT9FILv8yqRHu0sgXipmxdA1680hplmvCDx7BeC+9
	 DyFb596JBN239LdNTzWyL6sNMVlpISAp9x721ERX9Tycz5RV5ginCoA6et3htq3Ilcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=l3Ic3VYd;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4E9606A31D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 12:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE4E9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=l3Ic3VYd
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261026120100epoutp0119aafd05f8495641af7c4beb7bf20f39~iEpt38Xwi0292702927epoutp01R
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 12:01:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261026120100epoutp0119aafd05f8495641af7c4beb7bf20f39~iEpt38Xwi0292702927epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793016060;
	bh=Eooql/PWw9JrcOSkmPC1JhQXpt0yj7tFL/LJ7TTte3w=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=l3Ic3VYd+gMtyXg1JgRhU7okFwCOEiwEoqoWQDb8N1n2G+hoj2eoZZjWy6BNeiazL
	 2DLAFM7Juqu38NPweXOp6vDulsFjwTCue8tgAufNaF3R6CYajbtnN7XuldaVgfYdFk
	 vbHCxmFrIiDGFXUvx/j/FTwNZV5RKJvAZVG2sES0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261026120059epcas5p1bdaf5a44a5c532174e91bbfd3d5400a6~iEptUuaTR0298902989epcas5p1a;
	Mon, 26 Oct 2026 12:00:59 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jCsf26vfDz6B9m5; Mon, 26 Oct
	2026 12:00:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261026120058epcas5p32b10714e9c7e86c757b03baf88c6b40b~iEpr3-hd61524215242epcas5p3M;
	Mon, 26 Oct 2026 12:00:58 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261026120055epsmtip160f476325e622f7e86ea621ffb4427f6~iEppABK6U1282912829epsmtip1P;
	Mon, 26 Oct 2026 12:00:55 +0000 (GMT)
Message-ID: <c09bd0c9-5173-4cb8-a2c0-2b5008b63712@samsung.com>
Date: Mon, 26 Oct 2026 17:30:54 +0530
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20261026-attractive-puma-of-merriment-0dfbe4@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261026120058epcas5p32b10714e9c7e86c757b03baf88c6b40b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
	<20261023131501.3157463-2-selvarasu.g@samsung.com>
	<20261026-attractive-puma-of-merriment-0dfbe4@quoll>


On 10/26/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 23, 2026 at 06:45:00PM +0530, Selvarasu Ganesan wrote:
>> Add the Samsung Exynos8855 DWC3 binding using a flattened node
>> representation, where the DWC3 controller is directly addressable
>> rather than nested as a child node of a glue layer.
>>
>> This is the first Samsung Exynos binding using the flattened
>> representation.
> Ah and:
> A nit, subject: drop second/last, redundant "binding". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://protect2.fireeye.com/v1/url?k=f1571c7b-aecc251e-f1569734-000babff32e3-08400c25edf5bcfb&q=1&e=549cd4c8-34f1-4b98-afc6-3f62b054ef3c&u=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv7.1-rc7%2Fsource%2FDocumentation%2Fdevicetree%2Fbindings%2Fsubmitting-patches.rst%23L23
>
> Best regards,
> Krzysztof


Hi Krzysztof,

Thanks for pointing this out. Sure, will drop the redundant "binding" in 
the next version.

Thanks,
Selva
