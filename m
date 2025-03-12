Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2395F1EFFA0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741764980; cv=none; b=bBLED2CobMdy4l75c05cXsjD9FoAWomUGKOs3qj4s5hLe6u0TXjuRmJ9ZlH0FJCMzLaErkfhWKtvIyzQXLTCztf/ucspiG3G/5YC4n3doPZDJy5ju9Tiy0N2EPMfJUHkzyMwcmz+SElQcAOIVG81AWyVXaH+YD7o6N/vEFNXGlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741764980; c=relaxed/simple;
	bh=EusCgc+K994RYD1EIXFqcmDLz8FKECBaGdIb8kSqTVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=j/YJ7paDxaZsKtF3WYr9FovsfH4dy8qoXwDaJQxVD5iygM3lPmhlT+V0VTgDN59t5wzOJsWTQ9RChdflP0WJx3qLe45ink6qk9Uv2f4lCjy3Aowe8rC5x1R4P23UNWVGsUAdtQJ5oWRRdibxXLMk0UIt3oHH5tPUSIjcnVdj/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HgnRqHJa; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HgnRqHJa"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250312073609epoutp04919146aaf597c0f4cbaf47774243d528~r-gLWf1rE0811308113epoutp04C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 07:36:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250312073609epoutp04919146aaf597c0f4cbaf47774243d528~r-gLWf1rE0811308113epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1741764969;
	bh=nYzmAloJgMWfnQGtVRz2+KakhQLybe8oRE6g4jnnmwQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=HgnRqHJaLhoXrJCgwRbwJDWYIoBagbu/xY8CyV3t4MMqql0bWSjVFj4k8582APQwH
	 5ZqWQbFZ/qhlEz0KT3tXVLQSyQyZ4M8v7FpadasPZfFhuoc448/UjbXxsMsnaFQBl/
	 XEP8rDEW5MhJKzOiid87fnAwuSM6/0d9JrNxl5xM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250312073605epcas5p4c8d1eee147097f83250f641ca18b70fe~r-gISmIFW1209912099epcas5p4u;
	Wed, 12 Mar 2025 07:36:05 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4ZCMr43DxFz4x9Q1; Wed, 12 Mar
	2025 07:36:04 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A0.EA.19933.46931D76; Wed, 12 Mar 2025 16:36:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47~r_Vu5PMjE3187631876epcas5p36;
	Wed, 12 Mar 2025 06:10:53 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250312061053epsmtrp18e12ed5322127dd6d6eb70c800f65f0d~r_Vu4ZsdO1995219952epsmtrp1b;
	Wed, 12 Mar 2025 06:10:53 +0000 (GMT)
X-AuditID: b6c32a4a-b87c770000004ddd-0e-67d13964241d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	BB.6C.33707.D6521D76; Wed, 12 Mar 2025 15:10:53 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250312061051epsmtip128e0306e6f842b40f3c37e72f9d3179b~r_VtHIbGI2855128551epsmtip1k;
	Wed, 12 Mar 2025 06:10:51 +0000 (GMT)
From: Faraz Ata <faraz.ata@samsung.com>
To: alim.akhtar@samsung.com, dev.tailor@samsung.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	faraz.ata@samsung.com, rosa.pila@samsung.com, suyash.bitti@samsung.com,
	abhijeet.s23@samsung.com
Subject: [PATCH 1/2] tty: serial: samsung_tty: update UART_NR for
 ExynosAutov920
Date: Wed, 12 Mar 2025 11:49:31 +0530
Message-Id: <20250312061932.1797993-1-faraz.ata@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmum6K5cV0g++vxS2+djhbPJi3jc1i
	zd5zTBb3dixjt5h/5ByrxbUbC9ktXs66x2ax6fE1VovLu+awWcw4v4/J4v+eHewWX34+YLaY
	Pb/Ggddj06pONo/NS+o9+rasYvT4vEkugCUq2yYjNTEltUghNS85PyUzL91WyTs43jne1MzA
	UNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6DglhbLEnFKgUEBicbGSvp1NUX5pSapCRn5xia1SakFK
	ToFJgV5xYm5xaV66Xl5qiZWhgYGRKVBhQnbGwmVfmQr6WCuuHn3E3MC4mKWLkZNDQsBEYsaM
	TvYuRi4OIYHdjBJTTzSxgSSEBD4xSry6VAeRALL/zZvHDtNxZ/tNFojETkaJ06sWMUI47xkl
	tn85BjaXTUBdYuaNI2C2iEC+xPUTu8BsZoG3jBKvV0aC2MICQRI/G68ygdgsAqoSG2fsBVvN
	K2Aj8WLeVaht8hL7D55lhogLSpyc+QRqjrxE89bZzCCLJQTesku8a18C1eAicenCNyYIW1ji
	1fEtUHEpiZf9bVC2j8Tko9+AruYAsjMk7qwVgQjbS6xecIYVJMwsoCmxfpc+RFhWYuqpdUwQ
	a/kken8/gZrOK7FjHoytLHFyzx5WCFtS4tDtF1C2h8TSdbOYICEaK7Hl8H6mCYzys5B8MwvJ
	N7MQNi9gZF7FKJlaUJybnlpsWmCUl1oOj9fk/NxNjOAkquW1g/Hhgw96hxiZOBgPMUpwMCuJ
	8K62vZAuxJuSWFmVWpQfX1Sak1p8iNEUGMQTmaVEk/OBaTyvJN7QxNLAxMzMzMTS2MxQSZy3
	eWdLupBAemJJanZqakFqEUwfEwenVAPTLB2n1JXVEyxi7UoLktezC+UrvrAIcl8/7QxnrlBR
	+BS1HxE+046+OeP7K7XT9UhXHE/9uczLzE9NJs0ISnNRiamd2pW38cNKQ4MGpmhxdrGtQu1/
	WZgL0k17Ju0/LvQ6IvfQ6mmZu6Lkvxi/kfq2ZeJvJZYD0lE/rkz8dujeKq0zU59s0z9TvMv9
	acqyyb9ZHl9cJ57Zff0sq8HzyrN/hU9F7N/7wrL6fPkvR93Qi7GZc27cDrirbml/cs3cdw52
	a76Z8xcubvzX8LFO85N9U4KzR3ERf/FBvZIMlzknggofPl9+OGTaxPuskokMb2Ye+n5st0C9
	xpr5nbw7FGKmPQ0QuxzJvzOYx7WI2eOJEktxRqKhFnNRcSIAEH9UvisEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrALMWRmVeSWpSXmKPExsWy7bCSnG6u6sV0gyk3uCy+djhbPJi3jc1i
	zd5zTBb3dixjt5h/5ByrxbUbC9ktXs66x2ax6fE1VovLu+awWcw4v4/J4v+eHewWX34+YLaY
	Pb/Ggddj06pONo/NS+o9+rasYvT4vEkugCWKyyYlNSezLLVI3y6BK2Phsq9MBX2sFVePPmJu
	YFzM0sXIySEhYCJxZ/tNIJuLQ0hgO6PEmRk/mSASkhKHn95lhbCFJVb+e84OUfSWUeLhrzlg
	CTYBdYmZN44AdXNwiAiUSpx/mAhSwyzwlVHi8JWpTCBxYYEAieMvbUDKWQRUJTbO2MsGYvMK
	2Ei8mHeVHWK+vMT+g2eZIeKCEidnPgE7jhko3rx1NvMERr5ZSFKzkKQWMDKtYhRNLSjOTc9N
	LjDUK07MLS7NS9dLzs/dxAgOZK2gHYzL1v/VO8TIxMF4iFGCg1lJhHe17YV0Id6UxMqq1KL8
	+KLSnNTiQ4zSHCxK4rzKOZ0pQgLpiSWp2ampBalFMFkmDk6pBqYg8cszv/dECbg9bPT8zWbz
	KTm675dT8w1F022TLwQzMM/UXztNLWl15Ym5Pr/U3VNat0WuN/+ylTVYuPfeqtfHc3dutulf
	+8PohtHyF3+f7M/Zk/NwcWrZ7soCQbv2439C7FZcbo36fMflc37KFaUiwQdvVlUlXn+Xdken
	L6IxqTnyb/vSg4tv5f3R97Zje/xPe+XcMIVD22N/Lj2y8uWzmP1PZaYIbZP5vCNs+fXIBpXA
	JW/SH601Ptek+JBtler9/Lc+bu3GqywNDbIvntBvdTf4f3mFwzPrC9/m/HOTun75r8TaP7/P
	Fi3sOcPyU4LviKax7PI8/3TFgKZXk0qEVhdwcq29K2l689Bb7ugMJZbijERDLeai4kQAyUdc
	LNMCAAA=
X-CMS-MailID: 20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47
References: <CGME20250312061053epcas5p3b33ffac4d9af89de5ef01d42f6157c47@epcas5p3.samsung.com>

ExynosAutov920 SoC supports 18 UART ports, update
the value of UART_NR to accommodate the same.

Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 210fff7164c1..9a5211b730fb 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -52,7 +52,7 @@
 #define S3C24XX_SERIAL_MINOR	64
 
 #ifdef CONFIG_ARM64
-#define UART_NR			12
+#define UART_NR			18
 #else
 #define UART_NR			CONFIG_SERIAL_SAMSUNG_UARTS
 #endif
-- 
2.34.1

