Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9EBEC5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731299604; cv=none; b=m52+MyQ41uNkJ92QSTcp+1EPqlwHCgaNb4ddNGXdh7/dkwLnoxE+3MmWwhj9cVSNauEj2SJkJEgImjAgt1UhvVZ1nm1dyrdtUK87JnBp35GgSsX3wmano2Pj12dQ+38dCeBesnpu9wXNW+Yot9IHj2XMZeTCOuHrZkeyEiv4wKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731299604; c=relaxed/simple;
	bh=2+nwIlSYQpG0rH92v0TPYYdisZdIhViNljLwg0Z/2eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=mSPh7yT45WQlBe2vfSDAz2hgfn3VKFrGIOIhjO2UKMx1mEBXrOT3J5Tq57t6w0HFiiHvoyObcers+eXJ+ELb24fhX5G3GyoQZ35dT5LIPLNTSyNtuEcHN5xsqzMufccd9tVXMXzCoAx+/6dCIYOjAP99t1jPP0cSzcWhLM2OVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=q7ejfcNl; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q7ejfcNl"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20241111043319epoutp02e651e82e6297a390994cf7af90b5962f~Gz9AsV1952788427884epoutp02r
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Nov 2024 04:33:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20241111043319epoutp02e651e82e6297a390994cf7af90b5962f~Gz9AsV1952788427884epoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731299599;
	bh=mINgoMpMMdlYTYCpgiwdm0Dg+SMqFB6I05t2LeYQtTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q7ejfcNlxE5Jct6QZelJTTsXYvtB5YBqxAiNYqvltVzoFK/fa3ZbkdnI6WRZfAJEK
	 dXOlq1MGY9gBuOsXK8TTJ5Rh1XAILw4Ct7ZoUxSTIup0mLfXz+kPgoYYQX2LqaJX/H
	 j/gPu3k5of2FG9VDk2YpaQ2TCpEdc681liFzbIYA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20241111043319epcas2p24b760c6cc231cbd7af05b665908ba832~Gz9ALFimt0518405184epcas2p2x;
	Mon, 11 Nov 2024 04:33:19 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.69]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4XmxW221YVz4x9QC; Mon, 11 Nov
	2024 04:33:18 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	18.C4.09811.E0981376; Mon, 11 Nov 2024 13:33:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epcas2p41833b27eb761e46242bd973f56f51059~Gz8-AS-fP0046300463epcas2p46;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241111043317epsmtrp234da925e2b3e3882855f8bfc3c7ea44f~Gz8_8nJwt3011730117epsmtrp2W;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
X-AuditID: b6c32a48-0869ea8000002653-b5-6731890e59d7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B2.E1.35203.D0981376; Mon, 11 Nov 2024 13:33:17 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241111043317epsmtip1892212f793e51b2deb9add9c09b9b4fa~Gz8_rcQEb3202332023epsmtip1Q;
	Mon, 11 Nov 2024 04:33:17 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v2 3/3] arm64: dts: exynosautov920: add ufs phy for
 ExynosAutov920 SoC
Date: Mon, 11 Nov 2024 13:33:02 +0900
Message-ID: <20241111043306.1250488-4-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111043306.1250488-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmhS5fp2G6weXLvBYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAc1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqt
	kotPgK5bZg7QQUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9
	vNQSK0MDAyNToMKE7IzHy08wFrzlqPiw4ghLA+My9i5GTg4JAROJlg+L2UBsIYEdjBIfNzp3
	MXIB2Z8YJbrutTFDON8YJXb2T2SB6Vj+dxMTRGIvo8Tu5fdZIZxfjBJrm6cDzeXgYBNQlbjW
	UAViighUSsxdBjaVWaCXUaL/zlqwQcICERKrjj5mBLFZgMo7rj9iBrF5BawlPkydB3WevMTF
	Nc/BzuMUsJH4eL0XqkZQ4uTMJ2BzmIFqmrfOBrtUQuAnu8T/A53MEM0uElO3zGCFsIUlXh3f
	AjVUSuLzu71sEHa+xPqHd6HsCom7h/5DfWkvsejMT7BfmAU0Jdbv0gcxJQSUJY7cglrLJ9Fx
	+C87RJhXoqNNCKJRSaLj/BwmCFtCYtWLyVDDPSRWX/vGCAmpfkaJM5PnMU9gVJiF5JtZSL6Z
	hbB4ASPzKkax1ILi3PTUYqMCE3j8JufnbmIEJ08tjx2Ms99+0DvEyMTBeIhRgoNZSYRXw18/
	XYg3JbGyKrUoP76oNCe1+BCjKTCsJzJLiSbnA9N3Xkm8oYmlgYmZmaG5kamBuZI4773WuSlC
	AumJJanZqakFqUUwfUwcnFINTJF7Jm7P1L3NeuHD865E74XuL86FbTm/nH+5e9qCmLAYtmtP
	It7enLzXucDlA2vP26ci2gcXL3rcd6Mw/KyEkzffpJM7dogq3bB2/PL+tlbTutRJr6SvHzet
	u+tyuynvgbjpI2eGw59+hLROL1pn0NQ1k2Pu1wONszp2r/pktuiQxnmNwtTLeybEnQ/6phff
	LjI5W/Lhr32lAYERuheWnvnLvOyJslbN0sdq5/ebPpP5ZrD4B29Iw8atHzt5u8L+ZQacPh4q
	6phx629KuQR3RUTegmeHfqxQVTBj4d8xrfOdh5i+oIpJ0y3zsA+Fzyauqfz/n/vNyuuMcX/q
	Ps54eKxQ+tSVNr6tG8LeVXyRlbynxFKckWioxVxUnAgAolZdvCcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSnC5vp2G6wZtXehYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAcxSXTUpqTmZZapG+XQJXxuPlJxgL3nJUfFhxhKWBcRl7FyMnh4SAicTy
	v5uYuhi5OIQEdjNKbG58zgyRkJD49mYPE4QtLHG/5QgrRNEPRomV018CdXNwsAmoSlxrqAKJ
	iwg0Mko8/zCZGcRhFpjIKHF+3hGwFcICYRKTNkxgBLFZgBo6rj8C28ArYC3xYeo8qDPkJS6u
	ec4GYnMK2Eh8vN4LViMEVHP6/i2oekGJkzOfsIDYzED1zVtnM09gFJiFJDULSWoBI9MqRsnU
	guLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzgYNfS3MG4fdUHvUOMTByMhxglOJiVRHg1/PXT
	hXhTEiurUovy44tKc1KLDzFKc7AoifOKv+hNERJITyxJzU5NLUgtgskycXBKNTBlPPtz4cia
	EI2dpzJXMq608UsrUmGa73m167KfEmvb03zZ7Ucc1u7gWjL5rzNr3tr0SJvItf+LoxLm2k5e
	/yCu38f+0FVPi4CXW3xMNx/PPn1IMfFo1r/0e2IvHeO5du3q7Er4EOcla7HB8+ed25cXaItw
	zthxfG7TvQ63Bx5mngw/Pfc9fX9fKKwkwLP6VExzlTrv/bfBZ+Zt5Dd5cEqv5r/A6wlvhWZa
	yB3dEe+6z9tPZemECU/SWXlbb/DsLNlalHnuj06h+upvPDKHD1R8e3pt6YzvGj+jXnn5eZ73
	X//u8m5/1ibp4iXyC3q4Xtgc/8iYYmvuFyahozdTwat3Y/mbyWLS2YzzNk6e7LlbiaU4I9FQ
	i7moOBEAlkkRWuUCAAA=
X-CMS-MailID: 20241111043317epcas2p41833b27eb761e46242bd973f56f51059
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241111043317epcas2p41833b27eb761e46242bd973f56f51059
References: <20241111043306.1250488-1-sowon.na@samsung.com>
	<CGME20241111043317epcas2p41833b27eb761e46242bd973f56f51059@epcas2p4.samsung.com>

Add UFS Phy for ExynosAutov920

Like ExynosAutov9, this also uses fixed-rate clock nodes until clock driver
has been supported. The clock nodes are initialized on bootloader stage
thus we don't need to control them so far.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index c759134c909e..505ba04722de 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -361,6 +361,17 @@ pinctrl_aud: pinctrl@1a460000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x1a460000 0x10000>;
 		};
+
+		ufs_0_phy: phy@16e04000 {
+			compatible = "samsung,exynosautov920-ufs-phy";
+			reg = <0x16e04000 0x4000>;
+			reg-names = "phy-pma";
+			clocks = <&xtcxo>;
+			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.45.2

