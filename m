Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E051038DD6
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 01:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733360871; cv=none; b=BSYm9tfQBUA9MBtONscCEqkjooIb7CZXVZ/etYIrlnNnDZgONQfRx/NGo2vj/PNOXbynw2FdjKq319gq9JqG5gR5x7ye2KKMKozOjRtW/b2B5PNr05ve67VH6xlDr6A2IvhPvzzCHf4wl1jVjcMw3953+RBsMHzfrH+m/y1nARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733360871; c=relaxed/simple;
	bh=pMbb3toWMK0n6yHW/9zWgt9MgBH6/2F+uu1cyUrTeY0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=uH2ARRh5yzfgiNZ0m6WfJvmdLrbesogrsHMlMw92+HuRiubSXA2k2CvMfh/f1BBPmrSMEn6qUbGyOoUJbG8GudiFKcpL6sEXsPcKP5K2L5N8mXfHSEmKIOsz7zanU3OYrAR9C0TQWR/DcYf9sbU1a64LnuG5LHu2cgzERpHpzCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vRqhvMjI; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vRqhvMjI"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241205010746epoutp03c16e196887442d2d1409b22e7bbdd2ad~OIoZPCMYu2470024700epoutp03j
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 01:07:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241205010746epoutp03c16e196887442d2d1409b22e7bbdd2ad~OIoZPCMYu2470024700epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733360866;
	bh=SURSzNB545P9Vk5b0nJvlTKPTgVi4ec+V0qYVG4L0sk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vRqhvMjIw7yO9hQQTghup+rldxt8VO/iNHHnxXNn+IieOUr8WrRgiJDxwyReM/ZMh
	 dAn3R09cSjAnigjjx9oJzrMMd1Q5XXVq++71AgieYiioWIthNYrLPdC924F7GITO0X
	 rZwk3fdMas+PNo9zqVDAAH0GDxD4Cnrhe9e6U/2E=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20241205010746epcas5p2fe7743c64f6f56f4f0116d8db4e84605~OIoYsYNJe1570115701epcas5p2i;
	Thu,  5 Dec 2024 01:07:46 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Y3bpm41zKz4x9Q1; Thu,  5 Dec
	2024 01:07:44 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7F.B1.19710.0ECF0576; Thu,  5 Dec 2024 10:07:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20241205010744epcas5p31a3babd89f127bfa9fc1432e95ecc2bd~OIoWsH3-b0341203412epcas5p3r;
	Thu,  5 Dec 2024 01:07:44 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241205010744epsmtrp1392341daf1c97dd7f1e73fb1717e6570~OIoWrSpZU0281902819epsmtrp1c;
	Thu,  5 Dec 2024 01:07:44 +0000 (GMT)
X-AuditID: b6c32a44-363dc70000004cfe-44-6750fce003b9
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	32.A5.18949.FDCF0576; Thu,  5 Dec 2024 10:07:43 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20241205010742epsmtip1e2d142b116ec47f8b69a575b24a7907f~OIoVaMYWv0580905809epsmtip1K;
	Thu,  5 Dec 2024 01:07:42 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Igor Belwon'" <igor.belwon@mentallysanemainliners.org>, "'Rob
	Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>
Subject: RE: [PATCH v2 2/2] arm64: dts: exynos990: Add pmu and syscon-reboot
 nodes
Date: Thu, 5 Dec 2024 06:37:41 +0530
Message-ID: <0f2301db46b2$16b204d0$44160e70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGGNHhzN/gxjLnIJKtzBVvnrIc1QgGfjHvkAooqZNizX60xoA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmhu6DPwHpBsdmSlqs2XuOyWL+kXOs
	Ftf2z2KxeDnrHpvFpsfXWC0u75rDZjHj/D4mi/97drA7cHhsWtXJ5rF5Sb3Hw+2H2Dw+b5IL
	YInKtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wBukJJ
	oSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BSoFecmFtcmpeul5daYmVoYGBkClSY
	kJ0xeddx5oIujorJL3awNjA+Yeti5OSQEDCR+DzzCHsXIxeHkMBuRoneRXtZIZxPjBITFzxj
	gXC+MUpcOrKFFablw85eqKq9jBIzf15mBkkICbxglNh8xhDEZhPQldixuI0NpEhEYCejxIad
	85lAHGaBfiDnywuwUZwCvhLHP3YDVXFwCAuESPx+zgcSZhFQkXi4opERxOYVsJTYPf8qM4Qt
	KHFy5hMWEJtZQF5i+9s5zBAXKUj8fLoMbKSIgJPEqp2vGSFqxCVeHoV4TkJgKodE09qlUF+7
	SNy4tBvKFpZ4dXwLO4QtJfGyvw3KzpY4fnEWVE2FRHfrR6i4vcTORzdZQG5mFtCUWL9LH2IX
	n0Tv7ydMIGEJAV6JjjYhiGpVieZ3V1kgbGmJid3d0ED0kNh6q4dlAqPiLCSfzULy2SwkH8xC
	WLaAkWUVo2RqQXFuemqyaYFhXmo5PMKT83M3MYITqZbLDsYb8//pHWJk4mA8xCjBwawkwhuk
	HZAuxJuSWFmVWpQfX1Sak1p8iNEUGNwTmaVEk/OBqTyvJN7QxNLAxMzMzMTS2MxQSZz3devc
	FCGB9MSS1OzU1ILUIpg+Jg5OqQamW+81u324reM3R7zJFTvGt4550me9nBfbJ2dOKenZp735
	SejpEz4yEk8D/628dZt7kS/7/+nyQRs66iSv3riw+ddjqfdl5z8fU74n+fTmm/+JUUtlGdTj
	J7n0HL+r1CBif3mi+RtDpbQCkYtxBu2KC64YSGfYccyvuXZ66rqM2OTY2FO+BT8Wrqtznalg
	Hi16w8Tq56w5vU8blBsbz82qdJLJYnWcHhDmOu0J++nDnY9sTBcn/XSc6CwrFlogEm8u4Zm6
	efWpeydXu3dl7PFYKefRP2tTUbJczB29TY7Ry118Uh5YbvrI2irMmG8/7fvpry/SD1vPebvC
	00qFXdc1cp/FYslY3RweO+m1BQ+UWIozEg21mIuKEwG+HKkTLQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42LZdlhJTvf+n4B0g1vXLC3W7D3HZDH/yDlW
	i2v7Z7FYvJx1j81i0+NrrBaXd81hs5hxfh+Txf89O9gdODw2repk89i8pN7j4fZDbB6fN8kF
	sERx2aSk5mSWpRbp2yVwZUzedZy5oIujYvKLHawNjE/Yuhg5OSQETCQ+7OxlBbGFBHYzSlz7
	VwIRl5a4vnECO4QtLLHy33Mgmwuo5hmjxKb/FxlBEmwCuhI7FrexgSREQJq//3zCCuIwC0wG
	cg6sZYJouc8ocWnFZrB9nAK+Esc/dgPZHBzCAkESx05FgoRZBFQkHq5oBJvKK2ApsXv+VWYI
	W1Di5MwnLCDlzAJ6Em0bwUqYBeQltr+dwwxxnYLEz6fLwD4QEXCSWLXzNVSNuMTLo0fYJzAK
	z0IyaRbCpFlIJs1C0rGAkWUVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZwLGlp7WDc
	s+qD3iFGJg7GQ4wSHMxKIrxB2gHpQrwpiZVVqUX58UWlOanFhxilOViUxHm/ve5NERJITyxJ
	zU5NLUgtgskycXBKNTAlTZWQ+7B3XuyWtYX/1r7gdeyTt3t87EKbXMiLjxNYPvw/WLRL+9aD
	k1zyt77V8t6b/q/zYcXFz7yLhb+Hzd335l6H7dINuimzdq29P6G1ToOnVaa8wjKJp8Ty3OOj
	fxt8tZ59NfDfevDM88f7VipHfJUq2P+pMfLHqrm3JJ5Yy99peu6TbmW1R2lfWx3HWSH+TYd8
	skNaZh+rSIr6qDrvFte94obo6nO1Xg8zLtiHv5zBu0/zZ8J1hY/fV/rdMV1qP8suyk5vlfGp
	ih8yq9c6iGhsWHM+o9jjTIKpKd+09xO5vB4Vu6+4PnVi/wrLhrpoNrPXi65LGO072rRartzP
	QeLt9zKVVreeN/LPIluZlFiKMxINtZiLihMBuUGddRQDAAA=
X-CMS-MailID: 20241205010744epcas5p31a3babd89f127bfa9fc1432e95ecc2bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241204145953epcas5p4d9d541ee5d585d9e882c3b4b202b96f5
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
	<CGME20241204145953epcas5p4d9d541ee5d585d9e882c3b4b202b96f5@epcas5p4.samsung.com>
	<20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>

Hi Igor

> -----Original Message-----
> From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> Sent: Wednesday, December 4, 2024 8:26 PM
> To: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Alim Akhtar
> <alim.akhtar@samsung.com>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
linux-
> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v2 2/2] arm64: dts: exynos990: Add pmu and syscon-reboot
> nodes
> 
> Add PMU syscon, and syscon-reboot nodes to the Exynos990 dtsi.
> 
> Reboot of the Exynos990 SoC is handled by setting bit(SWRESET_TRIGGER[1])
> of SWRESET register (PMU + 0x3a00).
> 
> Tested using the "reboot" command.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
[snip]
> 2.45.2


