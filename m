Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174092AF11
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728447683; cv=none; b=eFUXOETM+uEOg1fpjoFvoHPfytJRppSsvCBpvGf3LUMF8ZjVPH3LehUpE+b8nmQrrfDXL+yohMj+7q8K2Aa8uRTjvNTVEDq6G5LPkdd9bVrlwxUUegc6wlZ/gdz8d8eCU0+5PCPS5xZVbJHd4iyNrQkg4bDuOhEH3mZuNeDQfr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728447683; c=relaxed/simple;
	bh=rh3W5GxyUVsL2C7NuFhv7Fd1kdw81A/bO2SCyGv5klI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=CIdob2Rf7pg9wf/4M/UR3PinQCLZR7Jdae/HOr5fWvAVvCRlaajR+jsDlaVGqcf6L3nIFvJnbSM8e6aa8EXR1t8gyi8K5RBp3F3UGSyCVFwmouFox40MWERHmlvdUzNt1AfzcxMTKdxzgKepop3BfPxSzu0yCmNQ+3J9BSSTdrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vVXcZ4pj; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vVXcZ4pj"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241009042119epoutp02f2cde2458004c2fabf40eb96fa1ffde4~8rgGkNYGM2968729687epoutp02I
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 04:21:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241009042119epoutp02f2cde2458004c2fabf40eb96fa1ffde4~8rgGkNYGM2968729687epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1728447679;
	bh=Q8VU4gs+jWyP2uYl9CO9ruACP5N7ZVnt3XESNiQ3oNg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=vVXcZ4pj52zAGlYaZnhYE3gAaiWO5vHAicNB+0TXP2lsAE85K6l+bgjzSvFqF7Gvy
	 gVT5aH7W4A6QPdhs2YX3w60EQNLJmhnOkcajvY/z9FLvviodnkMrF/Y/ISNdkh+8TG
	 E2yXFah6hJgUQv8r4V4bmF5ajNv89nsaUWZu6qIs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241009042118epcas2p2f1bfbe3a75efadba6292a7adacf79902~8rgGBGPB-2939729397epcas2p2R;
	Wed,  9 Oct 2024 04:21:18 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.99]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4XNfpQ1BS9z4x9Pv; Wed,  9 Oct
	2024 04:21:18 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	3B.90.08559.DB406076; Wed,  9 Oct 2024 13:21:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epcas2p48f0273ccdaf17daf76eb0be6f7183d1e~8rgFIhD7I0752207522epcas2p4L;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241009042117epsmtrp1bb358a60849ad9977299bfd1ab3252a1~8rgFHxuMJ1171011710epsmtrp1B;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
X-AuditID: b6c32a43-7b1b87000000216f-ad-670604bd8bc1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	16.F8.07371.DB406076; Wed,  9 Oct 2024 13:21:17 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241009042117epsmtip20157bea1d48a7a236bd0067e196425f8~8rgE11sLn3166031660epsmtip2R;
	Wed,  9 Oct 2024 04:21:17 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v3 0/3] add clocks support for exynosauto v920 SoC
Date: Wed,  9 Oct 2024 13:21:07 +0900
Message-ID: <20241009042110.2379903-1-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEJsWRmVeSWpSXmKPExsWy7bCmqe4+FrZ0g54JzBYP5m1js1iz9xyT
	xfUvz1kt5h85x2px/vwGdotNj6+xWnzsucdqcXnXHDaLGef3MVlcPOVq8X/PDnaLw2/aWS3+
	XdvIYtG0bD2TA5/H+xut7B6bVnWyeWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl5
	6bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+AbpumTlAdyoplCXmlAKFAhKLi5X07WyK8ktL
	UhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJLrAwNDIxMgQoTsjNuzDrMVvCItWJp2y62BsaD
	LF2MnBwSAiYST3eeZepi5OIQEtjBKLFo+jco5xOjxNIbv9ggnG+MEg3PZ7PDtMx9fJYRIrGX
	UeLW5B1QLR8ZJTpfPgVyODjYBHQl/vxzAImLCOxhkthyfglYEbPAWUaJu3MWgI0SFnCSWPew
	C+wSFgFViQU7e8HivAL2Ev2TX7JCrJOXuP74KBNEXFDi5MwnYPXMQPHmrbOZQYZKCLRySLQ3
	rWaCaHCR2N64ihHCFpZ4dXwL1N1SEi/726DsfInJ198yQTQ3MEpc+9fNDJGwl1h05ic7yAvM
	ApoS63fpg5gSAsoSR25B7eWT6Dj8lx0izCvR0SYE0agm8enKZaghMhLHTjyDsj0k3n54CLZV
	SCBWYkXrdsYJjPKzkHwzC8k3sxD2LmBkXsUollpQnJuemmxUYAiP1uT83E2M4MSq5byD8cr8
	f3qHGJk4GA8xSnAwK4nw6i5kTRfiTUmsrEotyo8vKs1JLT7EaAoM34nMUqLJ+cDUnlcSb2hi
	aWBiZmZobmRqYK4kznuvdW6KkEB6YklqdmpqQWoRTB8TB6dUA1PA2oi1S8UdTPeve3rSp21a
	tMHJAkV3Po/W3qnWj6IcK51m+8k8uqrUwR3sZD5tv2HABuuSSemvPxWy3EpksXF9mPnxZ2v2
	plip4ORTr+Kv5t6uuDTxdHr/Vo6yWrNtE4Pe7a3UO5tjpyT+Nar5zM4exYjni+wuB7tvMC4S
	mBWduGZCTYb/I+26r7/ZZhr/auqw++7+/ttl3imaWqsq/aa1P34/e+LUhe+zrx5pelDL3O9Q
	+W37tEjpVxzbvnY3alcLWwdKz2bO1Hi8aNblr+1fkh45um241X3eUyVxMqfGnNsr/kckNnEf
	W+m0z1lPqu//mcb4S5/N48tfbFvbaVF4svF/y9W5ElPWXdkdtFyJpTgj0VCLuag4EQA/v3Fn
	NQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvO5eFrZ0g+O3JS0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mm7M
	OsxW8Ii1YmnbLrYGxoMsXYycHBICJhJzH59l7GLk4hAS2M0o8fX/J3aIhIzExob/ULawxP2W
	I6wQRe8ZJRYumATUwcHBJqAr8eefA0hcROAQk8TEz09ZQBxmgcuMEsfuTmYG6RYWcJJY97AL
	bB2LgKrEgp29YFN5Bewl+ie/ZIXYIC9x/fFRJoi4oMTJmU/A6pmB4s1bZzNPYOSbhSQ1C0lq
	ASPTKkbJ1ILi3PTcZMMCw7zUcr3ixNzi0rx0veT83E2M4FDX0tjBeG/+P71DjEwcjIcYJTiY
	lUR4dReypgvxpiRWVqUW5ccXleakFh9ilOZgURLnNZwxO0VIID2xJDU7NbUgtQgmy8TBKdXA
	tOXxr5Tbrp3HNst/n62+4f7P11fet3b4FFrc4Xn7ZMtb27f/Y5qklhY+2BgYaV8a9393+mI/
	x8o7S4P3R8kvULvz4HOU7Mx6hdtPHVa8U/noa6J3xXTZNqOrGiVXyyc/FL9g+ZVZc8evs6su
	GDqV8xzrS13AP7fik+0ZriOPNH8rbz65+PACt9zeOPUrnMcKirfM90yeFf126tT9ohOqwzbJ
	7Ug/3mazasPdC/cnvDqmteTzwjajhduseUwbGLmDq/kUN3ldffY/+Wj162dWhxfYiogt84ia
	Lh5yRXxP6LfZYs0R3hsWBfFxeG0x+zHxUq1Dat/WItavZpf3ZKtEXVn942/Z/Qd3qgq3FCTL
	6yorsRRnJBpqMRcVJwIAfSCIh+QCAAA=
X-CMS-MailID: 20241009042117epcas2p48f0273ccdaf17daf76eb0be6f7183d1e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241009042117epcas2p48f0273ccdaf17daf76eb0be6f7183d1e
References: <CGME20241009042117epcas2p48f0273ccdaf17daf76eb0be6f7183d1e@epcas2p4.samsung.com>

This patchset adds the CMU block below to support exynosauto v920 SoC.
- CMU_PERIC1
- CMU_MISC
- CMU_HSI0/1

Changes in v2:
 - Rebase the patch to reflect the latest fixes

Changes in v3:
 - Remove duplicate sentinels

Sunyeal Hong (3):
  dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock
    definitions
  clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock
    support
  arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes

 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  50 +++
 drivers/clk/samsung/clk-exynosautov920.c      | 289 ++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  47 +++
 3 files changed, 386 insertions(+)

-- 
2.46.0

