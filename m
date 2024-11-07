Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A4185B5F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730952923; cv=none; b=cTZAIaZfX41hjPOTjIpxwpMBhGC6XXJDimHelCHy0kElgDD11OFt9fJKS9FCYjw9fh5FJq4CJzjMMGz3hjq6SDnhbVfGdHmkgsCCmtJWL5J5Wz5y2DlFzGtwIz3qanxKzWSbeszt/r9pIM/V0NnOgA2oM89hw5Vr4XW2ZONE7Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730952923; c=relaxed/simple;
	bh=SiPaqL+BmeOd+7FyFcnJgWc3ggue09Sw8p1+SLXG/JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=EOAeda+LuN7JtiVBXat9tqbZLgt1jZvqrg+z/iSltXijHfjohX6AFNUYU1RP39DVajAGMWEf73YVxWuMoe8tkxKyy6aKPPp0ccwPZkYtjGIFURZAA3qo7mKPKkEC5fTMrQFM107FN4J9giTn6syb8UW3hdhkxziMA/ukJHDuBU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pGhc9EBm; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pGhc9EBm"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241107041513epoutp0246307223ee30cb59a02a9946a8c2c42c~FlIDghQyy1263512635epoutp02_
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241107041513epoutp0246307223ee30cb59a02a9946a8c2c42c~FlIDghQyy1263512635epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730952913;
	bh=ZnbRqmEV1gtYIYxvir7XRo+fymtToxWX3JyVjsq//eI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pGhc9EBmjymLlMl0dsMJghZ/oaMBb8PYQDV6KguQgvYMaElvpsQTGUpd/ggtOjdvW
	 svj6WucPiX576oU6h+S9BSp9XpfRIn3ueSQBkbwuNNSlmb9ORrMmxWge97wqllUDYC
	 6JH/x/acAEln0qZKDNGvg0FSUe+WGQWxLKNHNWmE=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20241107041512epcas2p4ad0ad727d7355a62351272929bacafbc~FlIC-Lndi2962829628epcas2p4g;
	Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XkTHz4mF6z4x9QQ; Thu,  7 Nov
	2024 04:15:11 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	6B.A2.09811.FCE3C276; Thu,  7 Nov 2024 13:15:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241107041510epcas2p4ffdc8c4a036bf8c54ca42b339650b6ac~FlIBlTTdR2906429064epcas2p4p;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241107041510epsmtrp1b0604aed676339713f27943ea18245ee~FlIBiT37_2424024240epsmtrp1b;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
X-AuditID: b6c32a48-0869ea8000002653-b1-672c3ecf654d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	B8.B2.18937.ECE3C276; Thu,  7 Nov 2024 13:15:10 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041510epsmtip28abf99f9d43ec0b10e5e032033090bbc~FlIBSo-y31190811908epsmtip2c;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 0/3] Support exynosautov920 ufs phy driver
Date: Thu,  7 Nov 2024 13:15:02 +0900
Message-ID: <20241107041509.824457-2-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107041509.824457-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMJsWRmVeSWpSXmKPExsWy7bCmue55O510g2ubBCwezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5qhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRb
	JRefAF23zBygg5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BeYFesWJucWleel6
	eaklVoYGBkamQIUJ2RnrOvYwFfSzVSx7N4m9gfEFSxcjJ4eEgInEjkcX2LoYuTiEBHYwSsxp
	fcoC4XxilGhasZ4dzln+5xpzFyMHWMuR63Yg3UICOxkl3n3UgKj5xSjRvvg4G0gNm4CqxLWG
	KhBTRKBSYu4yZ5ASZoFeRon+O2vBNgsLWElcm/yNGcRmASq/NXsJK4jNCxR/seADG8R18hIX
	1zwHszkFrCVmXXvKDlEjKHFy5hOwOcxANc1bZzODLJAQ+Mgu8f7GSVaIZheJjYsWQr0pLPHq
	+BZ2CFtK4mV/G5SdL7H+4V2oZRUSdw/9h6q3l1h05ic7yAPMApoS63fpQ7yuLHHkFtRaPomO
	w3/ZIcK8Eh1tQhCNShId5+cwQdgSEqteTIYa7iHRs/UpKySk+hgl5l35zT6BUWEWkm9mIflm
	FsLiBYzMqxjFUguKc9NTi40KTODRm5yfu4kRnDq1PHYwzn77Qe8QIxMH4yFGCQ5mJRFe/yjt
	dCHelMTKqtSi/Pii0pzU4kOMpsCwnsgsJZqcD0zeeSXxhiaWBiZmZobmRqYG5krivPda56YI
	CaQnlqRmp6YWpBbB9DFxcEo1MG1b2JBauOjghZ9ZPJrTpX5dvSLx2EIoTZuPw/ODQHiCQ6/H
	sTnV+zes3zP5gtx/NaEa7SmTORJDt//7PkesJe9F0+qZjy4w2iqerzq7R8p5++ynO3rqK4OP
	/fb6+nf/SW+1hmcrAtk/aFh9O3PWTFiSlc952eMWn3rPip37lv4M3NEbc8fJljn2rd7Onz81
	jiku/zOPo2ZmZOhUjpUGXryHGfprD1U2Cdpv7/7xKozlx9+gR7erF/ya3s5WG+hfkft505pJ
	0rwXMrV0lV5d2NQUsb/x1Fyfnfwv4nnufv445/3PbTaM3GdcFtYkV1+8UlXYl3zz4bXQgz+n
	f3itsYF3zYR9djFJb6IVDuf/uO+txFKckWioxVxUnAgAN6lUYiYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsWy7bCSvO45O510g4sbDC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujHUde5gK+tkqlr2bxN7A+IKli5GDQ0LAROLI
	dbsuRi4OIYHtjBL/Hu8DinMCxSUkvr3ZwwRhC0vcbznCClH0g1Fiy9cGdpBmNgFViWsNVSBx
	EYFGRonnHyYzgzjMAhMZJc7PO8IO0i0sYCVxbfI3ZhCbBajh1uwlrCA2L1D8xYIPbBAb5CUu
	rnkOZnMKWEvMuvYUrFcIqObp1oXsEPWCEidnPgG7jhmovnnrbOYJjAKzkKRmIUktYGRaxSia
	WlCcm56bXGCoV5yYW1yal66XnJ+7iREc4lpBOxiXrf+rd4iRiYPxEKMEB7OSCK9/lHa6EG9K
	YmVValF+fFFpTmrxIUZpDhYlcV7lnM4UIYH0xJLU7NTUgtQimCwTB6dUA1Ph1O+aniKutaw3
	Spn6vH7U/ThQsjtCQ+L63X0MLspxZaY71/2K5Hd/6VBoEPLbmJtfdObBBrOwCzxezIGSH28G
	F+09m+q8XXnfZf7wfNuUuuvsVZ2iihdsjvk+kzSq896+quTjy4pPxz22NWdPsJnWvX5yo5LL
	mVtqWy2rxC5uU59m9KHiS8lMlwpnn/hHEatWH9ZmfbZCWJVRUiQwlz1J35L1zFr7VvOn9xYn
	S8yec9Gtounv5BMacxSsBQQXTJpXVBOYVeQ07We4ju6XBntHwaLF0z02dolKnZ2Z+sd9/sRt
	OTYvGxo33d/end9XxPbd4tm5id/XCRcGPNt14ccP5ZTg/5avJ27W3Dx/vxJLcUaioRZzUXEi
	ADzYplrgAgAA
X-CMS-MailID: 20241107041510epcas2p4ffdc8c4a036bf8c54ca42b339650b6ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241107041510epcas2p4ffdc8c4a036bf8c54ca42b339650b6ac
References: <20241107041509.824457-1-sowon.na@samsung.com>
	<CGME20241107041510epcas2p4ffdc8c4a036bf8c54ca42b339650b6ac@epcas2p4.samsung.com>

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

