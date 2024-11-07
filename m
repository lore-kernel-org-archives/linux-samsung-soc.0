Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CAD18B47E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730952924; cv=none; b=iLngyTfI/8wpczXf3DbD7++u/DRngY/wQpSYywcQ80B7uwdpobKPhkNHvc9k7wz1QBKshbOK6gESxqgnbBR/wNbLDGgoeZNN1afJ6BuXBZJU1MdVt6/yk9xSxgKBBFubz2fSr6dJ9MLF/iYw5t7UUdY5t8CNaIahUvu8+hU/8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730952924; c=relaxed/simple;
	bh=f9rIRdH01sOBbAWm3uTjGf87zwwnOagb9SoPfc0q4zU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=MnhPaOhJ0xGAtsHYWkcB90S7e+c0pDBSJo45b5toOpHZ6fsdxg7pZG+iIWuiwSozpv65I7tafzhy7sn0GcYN+sgRV0dsLJBz1f0Zdv8JQdLrsO9SgjPSiFNn5tMcVTxuq7nVvAiinxDPcctL5rzXNrQEaLcnX4SGaDQXnyyD6YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=a2807/Bj; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="a2807/Bj"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20241107041512epoutp013d720466428d12767a0a68207dd07021~FlIDCcjFH1828918289epoutp01U
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20241107041512epoutp013d720466428d12767a0a68207dd07021~FlIDCcjFH1828918289epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730952912;
	bh=ZttJkELPYPkA6TBzXEj++IetKmjboKHw+U7WRdrbwy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2807/Bj6RjRAsHCILWMiTv/ZEY0pgbWMTA+oLbcK+bacJB2tV8SPrhWhn/19uyfi
	 bEReuAs4pDFjSjLd5dR1tV6bOOe1CNX9yAn/JWk2kyCS6J5FxevWKni+JlcVikXlZY
	 RjohfGWf5HfA/ryn32T/xf5aVBXgZsfMD73Mp45M=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241107041512epcas2p2c258c8fdf2ef9a12333e27a361bed50d~FlICxmL8G0980409804epcas2p2p;
	Thu,  7 Nov 2024 04:15:12 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.98]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XkTHz2mBsz4x9Q7; Thu,  7 Nov
	2024 04:15:11 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	9A.D9.09776.FCE3C276; Thu,  7 Nov 2024 13:15:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041511epcas2p285a5b52a6784e509977a1574f7c9ee4a~FlIBqMDEg0980409804epcas2p2d;
	Thu,  7 Nov 2024 04:15:11 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241107041511epsmtrp16a715b6d5e45380e16d2b0b76484069c~FlIBnbyPE2418524185epsmtrp1Y;
	Thu,  7 Nov 2024 04:15:11 +0000 (GMT)
X-AuditID: b6c32a47-37c38a8000002630-26-672c3ecf7ce8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	52.25.07371.ECE3C276; Thu,  7 Nov 2024 13:15:10 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241107041510epsmtip2eb41f209b758a90331ba888188d500c5~FlIBYo4J91200412004epsmtip2N;
	Thu,  7 Nov 2024 04:15:10 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
Date: Thu,  7 Nov 2024 13:15:03 +0900
Message-ID: <20241107041509.824457-3-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107041509.824457-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmhe55O510g9bFghYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAc1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqt
	kotPgK5bZg7QQUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9
	vNQSK0MDAyNToMKE7IybK54yFvxnrVh84ghzA2MXaxcjJ4eEgIlE79UvQDYXh5DADkaJ/veT
	mCGcT4wS5+fsgXK+MUr0LFrHDNMyY/V6qMReRokX99rYIZxfjBJzjp9l6mLk4GATUJW41lAF
	YooIVErMXeYMUsIs0Au04s5aFpBBwgJeEke332ICsVmAyve0XQW7iVfASmLy9ensEMvkJS6u
	ec4GYnMKWEvMuvaUHaJGUOLkzCdgc5iBapq3zgY7SELgJ7tE6+5dbBDNLhK/bv1hgrCFJV4d
	3wI1VEriZX8blJ0vsf7hXaj6Com7h/6zQNj2EovO/GQHeYBZQFNi/S59EFNCQFniyC2otXwS
	HYf/skOEeSU62oQgGpUkOs7PgVoqIbHqxWSo4R4SS68egQZbH6PEpecLWScwKsxC8s0sJN/M
	Qli8gJF5FaNYakFxbnpqsVGBMTyCk/NzNzGC06eW+w7GGW8/6B1iZOJgPMQowcGsJMLrH6Wd
	LsSbklhZlVqUH19UmpNafIjRFBjWE5mlRJPzgQk8ryTe0MTSwMTMzNDcyNTAXEmc917r3BQh
	gfTEktTs1NSC1CKYPiYOTqkGpkMna76/b/VZUJX7Ief695iSmdEf9XWkZ+/zfzdlz48GtdVv
	0g+2hi+pW1yj9/aDrqD6w5SVHBOOLp8W9eDVuqL7azYtW2W6JNsh9IW4aPXTB4vNT7zY2LDM
	vPfGM0nj5P9h+2bMPJDZ2u3yk4PFdvEs98isTWU/vx9zmqHXpJOzo9l0w0tmRc3DkSx1OZ9c
	NOP0PwibGeUZWMmnNCe8CK/vLahXcxFw/hz/KPX0oUXNW86YyUeq6176Xb4xgX/v7RJndz2b
	HTuMOX1jghXf3ZFPtzQJD+6dKf0vKXjH9/WZcs8OTMjWi1Lfvv5WSG2Yj+GN02f4jbZKbV9/
	c5WR/a9rBXr8H/Q1Fu37XXVNXImlOCPRUIu5qDgRAC/XB8goBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSvO45O510g+W7zS0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujJsrnjIW/GetWHziCHMDYxdrFyMnh4SAicSM
	1euZuxi5OIQEdjNKvFp+hgUiISHx7c0eJghbWOJ+yxFWiKIfjBKf294DFXFwsAmoSlxrqAKJ
	iwg0Mko8/zAZbBKzwERGifPzjrCDdAsLeEkc3X4LbBILUMOetqtgq3kFrCQmX5/ODrFBXuLi
	mudsIDangLXErGtPweJCQDVPty5kh6gXlDg58wnYdcxA9c1bZzNPYBSYhSQ1C0lqASPTKkbJ
	1ILi3PTcZMMCw7zUcr3ixNzi0rx0veT83E2M4GDX0tjBeG/+P71DjEwcjIcYJTiYlUR4/aO0
	04V4UxIrq1KL8uOLSnNSiw8xSnOwKInzGs6YnSIkkJ5YkpqdmlqQWgSTZeLglGpgUi+PU1Nd
	Mmn9dMlpSbpXdYqUzotODpfYI71sxoHHZREiPfFbY0XY4rhWf87NZOVKYDh6yGrZalNb1e9T
	DvCsd1V0j9+Q7rLb64/91KJPGwx9r7LXq6VtuBSos2fh9Y7EchaTl3cYElrfZj35UpuU5MSx
	p/xp2EmTNb+rvx++PvGMyY353x5phexJXP3o/YIcScv9d2/8vvnNdeKxGXZLWZZnij3c6/Ol
	3NJC4UNGU+3rzktzNwQx3Ztz6YXYnRN3HfmP7XVbuN8y0blxf4Ywr3ChXq+a1MvkS0VXN76X
	Ofh9VaPBdp+Q93kqhX4fP1ut4rN5t0W32t/Nx1hxcbrzXO2o+oJNWx3XNXpf2shSqcRSnJFo
	qMVcVJwIAFePS83lAgAA
X-CMS-MailID: 20241107041511epcas2p285a5b52a6784e509977a1574f7c9ee4a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241107041511epcas2p285a5b52a6784e509977a1574f7c9ee4a
References: <20241107041509.824457-1-sowon.na@samsung.com>
	<CGME20241107041511epcas2p285a5b52a6784e509977a1574f7c9ee4a@epcas2p2.samsung.com>

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

