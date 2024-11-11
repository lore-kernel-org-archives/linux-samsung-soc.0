Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9E1537CE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731299605; cv=none; b=dD2+XT2Ziz6KyC4viayMsR2kZh+qDIWLqylYi3EtONw+xw0K5I/PqqZ+ibilODXSUDRhllvyD5Qj73OZobuRQDc4sdExMMrlNj7eUaFxN5Ur9YY3lmNX2EtbN4VaVLp68YvgYpzO9IChRGeu4MMziMWYP4dl/aM66PQSjIlp+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731299605; c=relaxed/simple;
	bh=f9rIRdH01sOBbAWm3uTjGf87zwwnOagb9SoPfc0q4zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ZyAkso7J1Ch+0cLzJS3Vwk1sTpV9FagXY/hLei51XEdyWOKerdl6jiRcmX8Mf4P0fI9KI+4P2NMd52HC3o7hmv6Uumz4E1TBVfS1rZ702SnWBPnTzyLUxxjHbKOfonf513XLNnqknpcnGxwgnJS2WNOZPZlmSoS/4sWfwIVnBvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uCYKwNOY; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uCYKwNOY"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241111043320epoutp0436412bafa1c2ecbbd384c9db66f3ee14~Gz9BOTvf82917329173epoutp047
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241111043320epoutp0436412bafa1c2ecbbd384c9db66f3ee14~Gz9BOTvf82917329173epoutp047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731299600;
	bh=ZttJkELPYPkA6TBzXEj++IetKmjboKHw+U7WRdrbwy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uCYKwNOYNOzcbkVfPEu5gRQoHRDB2tUZRAWKH8DDSQeQKyW5ZXcNERMB9oHUZiVLi
	 9aiIFkp3f0hbvU/kKGdLZtI4XwQyIAbQ50OWwP0QAjWifqEk5lTe3AnocCcLWTVo3E
	 HIoZf1JgcFy4ja4cFGN5wUvsrnYKS/JyKqcVm+Yg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241111043319epcas2p4f445a38d5e22496964e086c9e60be6ca~Gz9A5e23o3265432654epcas2p4R;
	Mon, 11 Nov 2024 04:33:19 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XmxW31RzMz4x9Pw; Mon, 11 Nov
	2024 04:33:19 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	26.91.09770.E0981376; Mon, 11 Nov 2024 13:33:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epcas2p48ebdc4c0219c1a4bf7c0a44873c5a98e~Gz8_w0wvW0046200462epcas2p4w;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241111043317epsmtrp1a8feaf6a2d800dced55eaa390c887068~Gz8_wIqMO2461724617epsmtrp1V;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
X-AuditID: b6c32a46-da9ff7000000262a-3e-6731890e5811
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9A.89.07371.D0981376; Mon, 11 Nov 2024 13:33:17 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epsmtip1db456f75a4c548e4086c2455a980d141~Gz8_gXnji3208132081epsmtip1n;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v2 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Date: Mon, 11 Nov 2024 13:33:00 +0900
Message-ID: <20241111043306.1250488-2-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111043306.1250488-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmuS5fp2G6wb+/HBYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAc1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqt
	kotPgK5bZg7QQUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9
	vNQSK0MDAyNToMKE7IybK54yFvxnrVh84ghzA2MXaxcjJ4eEgInEwcb9QDYXh5DADkaJN/eX
	MEM4nxglHrW0MEI43xgllrW9hmtpPTYfqmUvo8S3fwvZIZxfjBKzvmwBauHgYBNQlbjWUAVi
	ighUSsxd5gxSwizQyyjRf2ctC8ggYQF/ib3dD8FsFqDyP/dPg9m8AtYSfd29TBDL5CUurnnO
	BmJzCthIfLzeywxRIyhxcuYTsHpmoJrmrbPBzpYQ+MouMXXPfRaQxRICLhLLD/lCzBGWeHV8
	CzuELSXxsr8Nys6XWP/wLhuEXSFx99B/FgjbXmLRmZ/sIGOYBTQl1u/Sh5ioLHHkFtRWPomO
	w3/ZIcK8Eh1tQhCNShId5+dAHS8hserFZKjhHhKt1zdDQ62fUeLGsfVsExgVZiF5ZhaSZ2Yh
	LF7AyLyKUSy1oDg3PbXYqMAIHr/J+bmbGMHJU8ttB+OUtx/0DjEycTAeYpTgYFYS4dXw108X
	4k1JrKxKLcqPLyrNSS0+xGgKDOqJzFKiyfnA9J1XEm9oYmlgYmZmaG5kamCuJM57r3VuipBA
	emJJanZqakFqEUwfEwenVAOTgs4EkfhTrGcNXk6Xz4/NF3e0l+g9cnIXk2/BL4ayhFe3qmSN
	Bb68cp9V/uSn1Htpd8N9c5bsebrT3u1I1C9lzW/XRVaUPHhnsG3fsZ2dO5z9dHP3Xn7E9+H4
	qTxVV4O9uXUBa08aTZojdJ/5WMe00tVHeL9YOvYf4U92txBtNCl52/yrNC13hu2DiancWmv0
	AsL+GHpMfaujXcgn9Sw89m3Y09WRWqtlVOr5kv5+CZaInZOvslTvTZiKebrcNeXD1rZLazWE
	z17nDGWP87i66MOUtQ2qCxx2fJtVcUD9huGNGZ9FpdyTbu8O8L7se2nexy2TDQ1enr/D0vFj
	6befwh4fniR8Yr3X86npxYZwJZbijERDLeai4kQAnwQXYicEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnC5vp2G6wYQ9ahYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXxs0VTxkL/rNWLD5xhLmBsYu1i5GTQ0LARKL1
	2Hwgm4tDSGA3o8SjWU+hEhIS397sYYKwhSXutxyBKvrBKPGjYTlbFyMHB5uAqsS1hiqQuIhA
	I6PE8w+TmUEcZoGJjBLn5x1hB+kWFvCV2DtjG9hUFqCGP/dPs4DYvALWEn3dvVAb5CUurnnO
	BmJzCthIfLzeywxiCwHVnL5/ixmiXlDi5MwnYL3MQPXNW2czT2AUmIUkNQtJagEj0ypGydSC
	4tz03GTDAsO81HK94sTc4tK8dL3k/NxNjOBg19LYwXhv/j+9Q4xMHIyHGCU4mJVEeDX89dOF
	eFMSK6tSi/Lji0pzUosPMUpzsCiJ8xrOmJ0iJJCeWJKanZpakFoEk2Xi4JRqYFJQ5Ek+pntF
	+JbfY9kmFdaKO65F05QOS4sxnbd1bT0yk2N3o8i02S3lMovymqKv7NJY9+CrVI0c/6PjUvVa
	ezZcmnbaMXWXb9x999rTDxjuPVN9LJjR73Sq53jnW50VHikvKk73lXn9lX/reVBiwXOnSXur
	7XLX1TAHWSX3Z5YfqXHbbK5/Q2OfneLzEnuGZ+4Pm3ifBP68s3Nylkf4Ba+g5FlLOD/U3Pl7
	sbM6M0DQW2zXrmU1cc/vSHodupvGu0t03x2G9mSFsGkB8Zf0LDtifvMzFd50ctOttkieopUx
	41fvgVrmRUsePdRzS7bd7Fq6Oc9vitBVjju74j8rhzLeK1Ni4t3xYt/13dpJSizFGYmGWsxF
	xYkA6FYvnuUCAAA=
X-CMS-MailID: 20241111043317epcas2p48ebdc4c0219c1a4bf7c0a44873c5a98e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241111043317epcas2p48ebdc4c0219c1a4bf7c0a44873c5a98e
References: <20241111043306.1250488-1-sowon.na@samsung.com>
	<CGME20241111043317epcas2p48ebdc4c0219c1a4bf7c0a44873c5a98e@epcas2p4.samsung.com>

Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index f402e31bf58d..d70ffeb6e824 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -18,6 +18,7 @@ properties:
       - google,gs101-ufs-phy
       - samsung,exynos7-ufs-phy
       - samsung,exynosautov9-ufs-phy
+      - samsung,exynosautov920-ufs-phy
       - tesla,fsd-ufs-phy
 
   reg:
-- 
2.45.2

