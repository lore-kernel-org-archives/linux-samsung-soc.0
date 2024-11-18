Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65F1EEF9
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731895823; cv=none; b=isidatrxgJ7Ahw+IIdQnDQuKgujvahYMlvd4lp0EzT55A05ASWkwoi+WZFwFMEJALktDa3TZTHKAcFrOUZONY6VBJHXqpmYKLymK7uslRS+Ssm9GuFRAQcMxodjvQHdiMu8o49+ZcRSVcqwCcFUKFX+G91yw8fu8/SjC4FaQc/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731895823; c=relaxed/simple;
	bh=07xPLB905A1DPc98G+yQG8yfUV/8j5IquwCgQsLyy9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=V16C0ZYNsf8UZXtNAF/UDpyPXBz8BHoap3VqgXG4XSJHjfIZF8YRIs56IZmqIy0sG4QOVW+X9FbBEcQ+PolQaGSrhGiR8lHQRWcvzlnWdrfFSuA2JoSz+PQZFuInvXog+jZQYhNqf/g7+tV/2nDaRzKb7T2CZ2a6HQy8NRox3us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=uVAp4JRo; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="uVAp4JRo"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241118021013epoutp02d7d8dccb2c2d41aeb961b632068aaa56~I7hDjT5YZ0709207092epoutp02R
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Nov 2024 02:10:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241118021013epoutp02d7d8dccb2c2d41aeb961b632068aaa56~I7hDjT5YZ0709207092epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731895813;
	bh=e09Jl/inlWKxLvAMioYDSjkjUimRZffSdFUT3AHJbw8=;
	h=From:To:Cc:Subject:Date:References:From;
	b=uVAp4JRoo3zkufFnpDpccW9aQ4pOfL6lmX1YnEn3UDeusF+qo8mhLPTrFNJlODWMs
	 7ktscW6pjFmFMnqc32DJ6QA4sOXN8ZPJoiqNuN9dqRePl0RR/v0J4kdyFUkyh8Mcpd
	 /boxbUVZsEiDm1EgnbWaiXvR/ufbfZBqcthBT+Kk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241118021012epcas2p14ff4cb94e054cfdb287870700928860a~I7hDAf6wd1639416394epcas2p1F;
	Mon, 18 Nov 2024 02:10:12 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.99]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XsB0g4vrrz4x9Pv; Mon, 18 Nov
	2024 02:10:11 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1E.A0.59203.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241118021011epcas2p397736dd9e5c7d96d799716e09919c136~I7hBzg0NQ0164901649epcas2p3n;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241118021011epsmtrp29f48dc0ba6de36110eaaf7c4943603a3~I7hBy0eBn2522325223epsmtrp2d;
	Mon, 18 Nov 2024 02:10:11 +0000 (GMT)
X-AuditID: b6c32a4d-4e5cb7000004e743-01-673aa203ef63
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	43.11.07371.302AA376; Mon, 18 Nov 2024 11:10:11 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241118021010epsmtip1685a9f6c83d998da75fec470ba207137~I7hBmZ9zo3234932349epsmtip1V;
	Mon, 18 Nov 2024 02:10:10 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v3 0/3] Support ExynosAutov920 ufs phy driver
Date: Mon, 18 Nov 2024 11:10:03 +0900
Message-ID: <20241118021009.2858849-1-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmk+LIzCtJLcpLzFFi42LZdljTXJd5kVW6wdklahYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAc1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqt
	kotPgK5bZg7QQUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9
	vNQSK0MDAyNToMKE7IxH+3cyF/zgrJgyZSlbA+Mv9i5GTg4JAROJ5UdPMXUxcnEICexhlHh9
	aDkLhPOJUWLJ43msEM43RokJf98ww7Sc+9zIDpHYyygxedszqP5fjBKNp44BVXFwsAmoSlxr
	qAIxRQQqJeYucwYpYRboZZTov7OWBWSQsICtxLHnv8FsFqDyhzNmgNm8AtYSe65MZIVYJi9x
	cc1zNoi4oMTJmU/AapiB4s1bZ0MddI9d4sUPNgjbReLxvpssELawxKvjW6D+lJL4/G4vVE2+
	xPqHd6HsCom7h/5D1dtLLDrzkx3kZmYBTYn1u/RBTAkBZYkjt6C28kl0HP7LDhHmlehoE4Jo
	VJLoOD+HCcKWkFj1YjLUcA+J24eOgNlCArESi1YfZJzAKD8LyS+zkPwyC2HvAkbmVYxSqQXF
	uempyUYFhrp5qeXwaE3Oz93ECE6VWr47GF+v/6t3iJGJg/EQowQHs5II7yVX83Qh3pTEyqrU
	ovz4otKc1OJDjKbAEJ7ILCWanA9M1nkl8YYmlgYmZmaG5kamBuZK4rz3WuemCAmkJ5akZqem
	FqQWwfQxcXBKNTBZTb59zuLmp9U8wntb1mjxHGZaaBs2bUei5aktyxjXGOy+vm3G2hrvWedq
	p4i41zl2WXv6qFS4O7jm1rGZGjyKk3OdVrH8Y+b0kL2ed1xn/ui7Pkc9qvh33JaYjrXFsQed
	7rGdSV3Voe3Kp6Ef25/1XGpfmPnMr/8uKGwReMjwJTnT+v3pLwdFvcvcudiafv9oY/Sc/uiT
	588D6hKhlfpCQg33IiY/0rh6/l+xEs/Nv67un/Ttbp8wlNC8nxL+4mZQjf1KbY7OMr2iXWVh
	R9x4jr3cpvj53UZTpVkftsWJCDZc91vV+fbySZ4Hhqs3bbcu8Z6QuCNGUsdEslpPYeqC6V2G
	Tv1f057arjzsf1OJpTgj0VCLuag4EQBxr+4JHgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWy7bCSnC7zIqt0g+uXWC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujEf7dzIX/OCsmDJlKVsD4y/2LkZODgkBE4lz
	nxuBbC4OIYHdjBIz9zxmgkhISHx7swfKFpa433KEFaLoB6PEs5kv2boYOTjYBFQlrjVUgcRF
	BBoZJZ5/mMwM4jALTGSUOD/vCNgKYQFbiWPPf7OA2CxADQ9nzACzeQWsJfZcmcgKsUFe4uKa
	52wQcUGJkzOfgNUwA8Wbt85mnsDINwtJahaS1AJGplWMkqkFxbnpucmGBYZ5qeV6xYm5xaV5
	6XrJ+bmbGMHBq6Wxg/He/H96hxiZOBgPMUpwMCuJ8F5yNU8X4k1JrKxKLcqPLyrNSS0+xCjN
	waIkzms4Y3aKkEB6YklqdmpqQWoRTJaJg1Oqgen446NTVizQaW2001+5av4vM7v/a48uiF07
	VbrzA8uG8wEOxz4GMlVLL7i5Rnu5+Gb/3cX3a8XbUjb69K2bGbm3bdeHiJknVwQEGiiqruA2
	KLSvfK1yOJSjhk3oyzHZNiMhpoUpj2qC3x66Lfx81pfjTpt7jgpH/+W5oJw7X/TiBUN+rlCj
	2oywrd/1ey7yNcZ/9n8a21e+3f5S5ZTG/dvtV2Yo/NJ48y274aVd1ZWY+Q1T7h8MWX6vRmX/
	3EizhYkzGiWFOidWNF1hnnQ58fKSYp4vK+LZXP/YiOi80U3e2Ljpvuo656WlVx4/mp7pvvC8
	J9vH60eUbpcsZbuv8Ej8zHMtw/mtMXy7fx/I/TddiaU4I9FQi7moOBEAe/jN9s0CAAA=
X-CMS-MailID: 20241118021011epcas2p397736dd9e5c7d96d799716e09919c136
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241118021011epcas2p397736dd9e5c7d96d799716e09919c136
References: <CGME20241118021011epcas2p397736dd9e5c7d96d799716e09919c136@epcas2p3.samsung.com>

This patchset introduces ExynosAuto v920 SoC ufs phy driver as
Generic PHY driver framework.

Changes from v2:
- simplify function name from samsung_exynosautov920_ufs_phy_wait_cdr_lock
  to exynosautov920_ufs_phy_wait_cdr_lock
- return immediately after getting the CDR lock
- add comment for wait CDR lock

Changes from v1:
- use exynosautov920 instead of exynosauto to specify
- remove obvious comment
- change soc name as ExynosAutov920 to keep consistent
- use macros instead of magic numbers
- specify function name
- add error handling for CDR lock failure

Sowon Na (3):
  dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
  phy: samsung-ufs: support ExynosAutov920 ufs phy driver
  arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC

 .../bindings/phy/samsung,ufs-phy.yaml         |   1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  11 ++
 drivers/phy/samsung/Makefile                  |   1 +
 drivers/phy/samsung/phy-exynosautov920-ufs.c  | 167 ++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c         |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h         |   4 +
 6 files changed, 190 insertions(+), 3 deletions(-)
 create mode 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c

-- 
2.45.2

