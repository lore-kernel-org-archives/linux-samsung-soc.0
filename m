Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE254188CC9
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730952923; cv=none; b=obtz3bxmvlcNixunj6qVTWLd9tfOLp2uwyu2+ppcE4/RJbCKme+8ePpGvdYSRoHMMl1iI0ORWhg5gN1NZ7Gos6fBlfPjOKT8II837caPzPXMfGsU2/DFrCWew7mnKHN2qJiyvN1nvwWvaz70vlWqCKf1H6twGgtIM/YmQF/yUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730952923; c=relaxed/simple;
	bh=SiPaqL+BmeOd+7FyFcnJgWc3ggue09Sw8p1+SLXG/JU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=WwhxZXdQyKcNrXrq8gSofRFbNlhmmRE80mkZMV7EnnSPWAG6cHULxKcjNWslYlKUCf5ODr1j5stUqX5cdpoeEUgXyrdE+MY0gjIoMB6kuYk7utJgiX0j+rdH2LUlIDmX41MCQUyjt5lKykMCmU8yuxbi03V2VTHm3T8FhH7r60o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Vu5bxE0A; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Vu5bxE0A"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241107041512epoutp0437be910e1882c9e0cf178b855317eafe~FlIDLih5s0440304403epoutp04d
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241107041512epoutp0437be910e1882c9e0cf178b855317eafe~FlIDLih5s0440304403epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730952912;
	bh=ZnbRqmEV1gtYIYxvir7XRo+fymtToxWX3JyVjsq//eI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Vu5bxE0AEjgpEKwNnuDMj3E//kCi3uHqJjg34bEAPOFVdK7sTvYdFE5pzZRZuPN1J
	 oB/VVh8lG1RB5uL4sm4CcP7Z74e4REnNnddRQTWiOzlWgpIn/m4L18rnH/ItZzvPdI
	 3EZ2UMXxcnuwlLI5DKJChj7dAi+dEAMVjzPhPprg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241107041512epcas2p160a7a279f07e2c115de95bee2ca07d45~FlICszDrX1077410774epcas2p1B;
	Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.101]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XkTHz1JJBz4x9Q2; Thu,  7 Nov
	2024 04:15:11 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	A9.D9.09776.FCE3C276; Thu,  7 Nov 2024 13:15:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041510epcas2p28a5506042eeca912da5b665a04c3a6f0~FlIBefeMC0980409804epcas2p2c;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241107041510epsmtrp255e89777f10f1d6af0ed3ff3cee9118a~FlIBdr45r2957029570epsmtrp2N;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
X-AuditID: b6c32a47-d53fa70000002630-24-672c3ecf44f2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A3.DF.35203.ECE3C276; Thu,  7 Nov 2024 13:15:10 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041510epsmtip246f6e995016448fdb6742e05465d4422~FlIBMeNXk1198011980epsmtip2y;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 0/3] Support exynosautov920 ufs phy driver
Date: Thu,  7 Nov 2024 13:15:01 +0900
Message-ID: <20241107041509.824457-1-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdljTXPe8nU66wdvT7BYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAc1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqt
	kotPgK5bZg7QQUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9
	vNQSK0MDAyNToMKE7Ix1HXuYCvrZKpa9m8TewPiCpYuRk0NCwESieelDxi5GLg4hgR2MEicP
	vWKDcD4xShz6dZEFwvnGKPFo4yX2LkYOsJZnndoQ8b2MEhPuH4Zq/8UoMXHvHCaQIjYBVYlr
	DVUgpohApcTcZc4gJcwCvYwS/XfWgq0WFrCSuDb5GzOIzQJUvvL9P3YQmxcovufSGWaI8+Ql
	Lq55zgYRF5Q4OfMJWC8zULx562yomnvsEuc+ukDYLhI3bl2Eek1Y4tXxLewQtpTE53d72SDs
	fIn1D+9C2RUSdw/9h6q3l1h05ifYj8wCmhLrd+lDvKssceQW1FY+iY7Df6GhwCvR0SYE0agk
	0XEe5G8QW0Ji1YvJUMM9JGZt+Q52pJBArET//bVMExjlZyH5ZRaSX2Yh7F3AyLyKUSy1oDg3
	PbXYqMAYHqPJ+bmbGMEJUst9B+OMtx/0DjEycTAeYpTgYFYS4fWP0k4X4k1JrKxKLcqPLyrN
	SS0+xGgKDN2JzFKiyfnAFJ1XEm9oYmlgYmZmaG5kamCuJM57r3VuipBAemJJanZqakFqEUwf
	EwenVAOT672E2zHSm5/MW/1u5ux/E7tlNu9/MVtf6mfPU2P1I3u/bo57wctva8nxUHz9v+pd
	s98taP+8IVzi9225tKodvKrVT6N9mP4IyCqo6K49GJWXGKDOu+/hxW1Mpwqmrtx36eMSh2sL
	tjW6WHncstMP26nYN7P/gIK8+cLjx8Pry9K9/Sq2Cby4FcK6idVj4fwpUYWnAnUuTpEyikh8
	Uvi/7SHblc6761ZOZi5686Y+5O+7OsEjK5IUAoUzO9fE6TB/ab1RdiOZY9KX5Qc5Is9f+KbF
	4/L396vpL46Zc7vdVa4LzFr1QVPvYO5Ru+vdxRGHuw4vEj3292dg5N/L4elzdLWzlNOu8m0v
	r1S7fGUHjxJLcUaioRZzUXEiACb0YxgZBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWy7bCSvO45O510g+lztS0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujHUde5gK+tkqlr2bxN7A+IKli5GDQ0LAROJZ
	p3YXIxeHkMBuRolPh/cxdTFyAsUlJL692QNlC0vcbznCClH0g1Fid1c3K0gzm4CqxLWGKpC4
	iEAjo8TzD5OZQRxmgYmMEufnHWEH6RYWsJK4NvkbM4jNAtSw8v0/sDgvUHzPpTPMEBvkJS6u
	ec4GEReUODnzCQuIzQwUb946m3kCI98sJKlZSFILGJlWMUqmFhTnpucWGxYY5qWW6xUn5haX
	5qXrJefnbmIEh66W5g7G7as+6B1iZOJgPMQowcGsJMLrH6WdLsSbklhZlVqUH19UmpNafIhR
	moNFSZxX/EVvipBAemJJanZqakFqEUyWiYNTqoFpSsbKLWmPDNj2+t5wV924Lo+ZQ1Y6gOOF
	xoqacI5ulbVep34KFh3qt5OUcy1Wddec2Peqx1aXZ+YZ+xtOhzR+/ePc9odhpnxte1/v/JsR
	Wj7cJiIeCSsnebvxO8+WXabTMDfP049D+rd7x/viCc5C253lHf6L8j23+3vEO+Dbb0W5POPE
	GTN7Z5cePxZwZd1sOf7crvN8MuvZL7tfaXzo3PH3lFKl9avfP44UKv592f3e2u/sZo0jRQlc
	1nW8VUrFLHyOq/lYrWatqPY9sOC3WOmM/B9Bhoc/X479Pd1y6rN7DzOeNs/8nT5r1/JTFQHL
	tLv+F53eUFIdfeq7WM17p7zr5/V44kqX8f7+FazEUpyRaKjFXFScCADUHDMqzAIAAA==
X-CMS-MailID: 20241107041510epcas2p28a5506042eeca912da5b665a04c3a6f0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241107041510epcas2p28a5506042eeca912da5b665a04c3a6f0
References: <CGME20241107041510epcas2p28a5506042eeca912da5b665a04c3a6f0@epcas2p2.samsung.com>

This patchset introduces ExynosAuto v920 SoC ufs phy driver as
Generic PHY driver framework.

Sowon Na (3):
  dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
  phy: samsung-ufs: support exynosauto ufs phy driver
  arm64: dts: exynosautov920: add ufs phy for exynosautov920 SoC

 .../bindings/phy/samsung,ufs-phy.yaml         |   1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  11 ++
 drivers/phy/samsung/Makefile                  |   1 +
 drivers/phy/samsung/phy-exynosautov920-ufs.c  | 159 ++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c         |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h         |   4 +
 6 files changed, 182 insertions(+), 3 deletions(-)
 create mode 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c

-- 
2.45.2

