Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359D1534EC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731299604; cv=none; b=i7G//8o5eQIqYdoHXBFVEXBZ5TffYadksMrENc2I05IhFCtAeZhFegJlsJ1LBUwB8ucaG9PXcJe83j33hTvXgkDh7ISvorprbZI6Hl36L/kWnsM70tABVSpYkkJziKEmTsjz2QoDXs8jBkEw9JgqQ0S4/wJnp+I13Bc9w83rzvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731299604; c=relaxed/simple;
	bh=3zyj37RKWmpKfuiUEJwI1F3EkA+DhPSagOfYV/WjErY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=OMiKEOfElYEo3Gha9QInRf8NzUvCpCaZUB3MdD/XhuiK0uGAMsDhEYweoUxastRoP4YDKsn9r6d2uV2SyiDoH9aTCo/LasCztY/5+7gsC0k2E+arEYm9Cjdy+eMMjYiRKoepYraElK8vZSg9ZkT8Kd1Dm8XKW+/COWxKcfJEF8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QC+ZJ24B; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QC+ZJ24B"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241111043319epoutp037e3ca1f1a2e3aa8e01368cde9001d75c~Gz9AkupSe2689126891epoutp038
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241111043319epoutp037e3ca1f1a2e3aa8e01368cde9001d75c~Gz9AkupSe2689126891epoutp038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731299599;
	bh=FCti/Tt/UKVpKzk/W4+L3phxgm6En+igi/iZDI307DY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QC+ZJ24B+GE8ITmzTXdb4mobgXY+S6YRocSwL5nNFCJ/iGBP7JWCNFrhQznnnpjDP
	 RKprOUYw4d2f7LZxTLuA6axsyPVaGNONDWzAz3f7l0Y56bNwef4gC4s8ZI6EHV+UWh
	 QW0nXxccxaFDp/nw4VZOv8rloZWKjaqRKiNV/5CE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241111043319epcas2p297b8895ee3b7b7eb6bfae06d28b28447~Gz9AI3qkZ3227632276epcas2p2t;
	Mon, 11 Nov 2024 04:33:19 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.68]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XmxW21DPbz4x9Q2; Mon, 11 Nov
	2024 04:33:18 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	47.C4.09811.E0981376; Mon, 11 Nov 2024 13:33:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epcas2p4fbe716e509fdd39e86c50026a2923e9f~Gz8_tcmZ_3265432654epcas2p4D;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241111043317epsmtrp2311d8b224752f5f59eb1fc6e07199f10~Gz8_o5FHY3011930119epsmtrp2M;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
X-AuditID: b6c32a48-7f9ff70000002653-b3-6731890e8a8a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D9.89.07371.D0981376; Mon, 11 Nov 2024 13:33:17 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epsmtip18182f78502d41a28f39be13dcb46ef48~Gz8_Z2nYI3087930879epsmtip1U;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v2 0/3] Support ExynosAutov920 ufs phy driver
Date: Mon, 11 Nov 2024 13:32:59 +0900
Message-ID: <20241111043306.1250488-1-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjk+LIzCtJLcpLzFFi42LZdljTTJev0zDdYPNCNosH87axWazZe47J
	Yv6Rc6wWR1v/M1u8nHWPzeL8+Q3sFpd3zWGzmHF+H5PF/z072C1+/zzEZLHzzglmB26PTas6
	2Tz6tqxi9Pi8SS6AOSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VW
	ycUnQNctMwfoICWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpe
	XmqJlaGBgZEpUGFCdkbDZ8WC2RwVjybfY2xgPMDWxcjJISFgInGl6RZTFyMXh5DADkaJi3e7
	WSGcT4wSy/4+YIFwvjFKPPjeywrTcvzNI6iWvYwSixY/ZINwfjFKrH7XBFTFwcEmoCpxraEK
	xBQRqJSYu8wZpIRZoJdRov/OWhaQuLCArcSMSV4gM1mAqs/eaQQ7iVfAWmLOhZXMELvkJS6u
	eQ4VF5Q4OfMJC4jNDBRv3jqbGWSmhMA9doljx/ZCNbhI3F92lgnCFpZ4dXwLO4QtJfH53V6o
	n/Ml1j+8C2VXSNw99J8FwraXWHTmJzvIbcwCmhLrd+mDmBICyhJHbkGt5ZPoOPyXHSLMK9HR
	JgTRqCTRcX4O1FIJiVUvJkMN95B4uOsu2AFCArESV+d/YZrAKD8LyTOzkDwzC2HvAkbmVYxi
	qQXFuempxUYFJvAYTc7P3cQITpBaHjsYZ7/9oHeIkYmD8RCjBAezkgivhr9+uhBvSmJlVWpR
	fnxRaU5q8SFGU2DwTmSWEk3OB6bovJJ4QxNLAxMzM0NzI1MDcyVx3nutc1OEBNITS1KzU1ML
	Uotg+pg4OKUamJgVEi5x/N/L1NnNFyng8fDV3RC++F4rCetgt3V9Hbpvyv13NXRa9i3deetn
	wTeV4A/T36yrKp+i8V5Ju+Ra+xSTCP8ti87FT1t2ZKrSdL/pkXc5jqyfKnZ3xsY9h3i/envF
	OPNM85z8wfeE0E3l3tpmn2l3nxodeXQwI+8Lp8DLPwouPjft5XUnrXrHXOq1y+H5P33nZdkH
	IxUKv/0r5Dkg3q621o/hlK629q01Rmv2r/nn5ddpc5EjveP9a9a0rRcri2WnPH7Tum1W3a6T
	tx8EdRWFdqukXjtg+3WqxHZD1VfL7/We3fWXLV2Q7dH73wY/Np6c+7yrerNDk/6yEM+eQzel
	Tu7tjkk7Zi+7PUaJpTgj0VCLuag4EQCNsqL7GQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBLMWRmVeSWpSXmKPExsWy7bCSnC5vp2G6waGvMhYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXRsNnxYLZHBWPJt9jbGA8wNbFyMkhIWAicfzN
	I6YuRi4OIYHdjBITb3yDSkhIfHuzhwnCFpa433KEFaLoB6PEmd1bWboYOTjYBFQlrjVUgcRF
	BBoZJZ5/mMwM4jALTGSUOD/vCDtIkbCArcSMSV4gg1iA6s/eaQRbwCtgLTHnwkpmiAXyEhfX
	PIeKC0qcnPmEBcRmBoo3b53NPIGRbxaS1CwkqQWMTKsYJVMLinPTc5MNCwzzUsv1ihNzi0vz
	0vWS83M3MYIDV0tjB+O9+f/0DjEycTAeYpTgYFYS4dXw108X4k1JrKxKLcqPLyrNSS0+xCjN
	waIkzms4Y3aKkEB6YklqdmpqQWoRTJaJg1Oqgakqp7jIWpnpGJPPV5c52td4vl+/za14I+ri
	kSsdv3z3dSpc3PX6ocH7t4dXLdrcskcz6+DWM0fVil27un6u9i0JczXctyy/vfuIU+PDNdKB
	qv7mZRH+7ycmL81nzXHcpWwX/nbl37pchcU3BZnUe5w353StneT5pbUuddZ5/9ysKVvW67IV
	OBUWsrIeCzSbc91DV+TYWQPZ91P3OZhe2dLYZZZyfOuDReIqv4OX+3nMPp0cxcf+sXKXqP2z
	4gdTGrZxdS6OFHp7U+r2HdmjiYYrW88x90+Z6cCyp35KRlGTzH33Ffdld+6actHdWXzOJVZO
	55MuM49xh4pMK7+0S609YvbB/DcT38gK7VjwyFqJpTgj0VCLuag4EQDqZqF0ywIAAA==
X-CMS-MailID: 20241111043317epcas2p4fbe716e509fdd39e86c50026a2923e9f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241111043317epcas2p4fbe716e509fdd39e86c50026a2923e9f
References: <CGME20241111043317epcas2p4fbe716e509fdd39e86c50026a2923e9f@epcas2p4.samsung.com>

This patchset introduces ExynosAuto v920 SoC ufs phy driver as
Generic PHY driver framework.

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
 drivers/phy/samsung/phy-exynosautov920-ufs.c  | 170 ++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c         |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h         |   4 +
 6 files changed, 193 insertions(+), 3 deletions(-)
 create mode 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c

-- 
2.45.2

