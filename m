Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E3214C5AF
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735182716; cv=none; b=C7F/9ceeJp1Exe8XNa/ZjkR+IaOfzWDVDXkfH97fkwgNNL3ISmYDucyuMhtcXJiQnijFqU1DHz2asXhcM0JfotR6oRpiKdNa9+1Ht4x/IihleTEjElsfNWhcIF8aA5mKPCMdUAjUo+3oJmTFCsv8Wdv5V7yjLaHX4jceVrT7fGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735182716; c=relaxed/simple;
	bh=O1nyPU7PWhaf86GRpqjpKCZFTKKxL6fAuyLmZLrVoUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Qh0vJffipBrvMN7exTlapgLCPBQVRxBv/1MOpREQVq7KEibbvaXYwt8AHnVpK82RN9UAVgCXfAeZhCv1T7Dcump53VP4vUFsq9iyfuxb2Qg5WASHx9gmLVCiJKwROnkl28MyGiIYoF5AoN72g7wqxc8VMOyT2+MKqmRHp0NxROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=AGALOcA9; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="AGALOcA9"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241226031147epoutp04ecd5daac100989b2db10028cf3675ac3~Um3qRPYp-3137931379epoutp04K
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241226031147epoutp04ecd5daac100989b2db10028cf3675ac3~Um3qRPYp-3137931379epoutp04K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735182707;
	bh=P+ZaqGtJsmxzbrPPYJpI+woPFkv+74kGvuAegMOxb4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AGALOcA920osUDc8cggCP/JzGMhWkV2nS8gVeb66BKCXfrG02GfnSpEG4POku8MFV
	 Hqfh4X9H5H2LzKx6K79o/16oKnLjTlepNaA7qiKAZ4hFHD9W5RRLNJNmr0tJUQ/rv0
	 YU8pIfOzsAp8upE4JUJ9XajELu6HLAlxdxImmgMQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20241226031146epcas2p3031525ac4f44c01b8f661e1f075682bb~Um3ptEUnG0559605596epcas2p3S;
	Thu, 26 Dec 2024 03:11:46 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.69]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YJYZ95RMWz4x9Q1; Thu, 26 Dec
	2024 03:11:45 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	DC.F8.22094.179CC676; Thu, 26 Dec 2024 12:11:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epcas2p1886e86abda180abbc1a070a5f70f5672~Um3onzrNL0864008640epcas2p1Z;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241226031145epsmtrp114f2d538eb038286d80be4f6d352a070~Um3onEi7Z1343613436epsmtrp16;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
X-AuditID: b6c32a48-e7eec7000000564e-cb-676cc971367d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2F.2B.18729.179CC676; Thu, 26 Dec 2024 12:11:45 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epsmtip24f1985b1c8a21932d6b8a7180a0a6a66~Um3oXM_FU2891128911epsmtip2U;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: phy: Add ExynosAutov920 UFS PHY
 bindings
Date: Thu, 26 Dec 2024 12:11:36 +0900
Message-ID: <20241226031142.1764652-2-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241226031142.1764652-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmmW7hyZx0g9+XtC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW+x9vZXd4vKuOWwWM87vY7L4v2cHu8Xvn4eYLHbeOcHs
	wOOxaVUnm8eda3vYPPq2rGL0+LxJLoAlKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX
	0NLCXEkhLzE31VbJxSdA1y0zB+g0JYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6B
	eYFecWJucWleul5eaomVoYGBkSlQYUJ2xtq5s5kKPrNVtMycx97A+IW1i5GTQ0LARKJh73a2
	LkYuDiGBHYwSf+YsYYVwPjFKPJ37jAXC+cYosXrjG2aYlq6F/6Gq9jJKfLy9CKr/F6PEtyer
	gRwODjYBVYlrDVUgpohApcTcZc4gJcwChxklHn/oZgMZJCzgL3Gt6yaYzQJSvu88E4jNK2At
	8WfNCUaIZfISF9c8B6vhFLCRONE2kxmiRlDi5MwnLCA2M1BN89bZzCALJAQ6OSTmT5zABLJY
	QsBF4sZiU4g5whKvjm9hh7ClJF72t0HZ+RLrH95lg7ArJO4e+s8CYdtLLDrzkx1kDLOApsT6
	XfoQE5UljtyC2son0XH4LztEmFeio00IolFJouP8HCYIW0Ji1YvJUMM9JNovLmSCBFQ/o0T3
	8fNsExgVZiF5ZhaSZ2YhLF7AyLyKUSy1oDg3PbXYqMAEHr/J+bmbGMEJVctjB+Pstx/0DjEy
	cTAeYpTgYFYS4T0klJkuxJuSWFmVWpQfX1Sak1p8iNEUGNQTmaVEk/OBKT2vJN7QxNLAxMzM
	0NzI1MBcSZz3XuvcFCGB9MSS1OzU1ILUIpg+Jg5OqQamvZ2nv/33X177PM5N9vel8yIqzvZ6
	K9aLZoYXFG0RlTv+cvGSO4cOBXZVF1X1r/hwbKauoI7X9NL3Rw3XGS45EF/5RHriocPmAYd1
	BS6/8W3oWN1dE/T26q/maIv61IMc88snv7watiQnoi6zfbLM5xy7XQ8lrm1hrP+s/KH0ieT9
	lTIJC7YHXNVZdrls/09GuVCZHMYPRdq94pPUDWyXS4ofnsxgaXFVbOo9sT86UWuZA7n+fTo8
	ZfsiGb5LW6bFSf5UbVL/KLrveNip5Sv2FguHHODSjRaWEf7x76PznKzQX/U72W1f3nrw7xG3
	ZdObplrmYMUEM96fNYe3HNxS8D9us6bgdya5S17G89vclFiKMxINtZiLihMB6qswQTEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSvG7hyZx0g8fTBC0ezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW+x9vZXd4vKuOWwWM87vY7L4v2cHu8Xvn4eYLHbeOcHs
	wOOxaVUnm8eda3vYPPq2rGL0+LxJLoAlissmJTUnsyy1SN8ugStj7dzZTAWf2SpaZs5jb2D8
	wtrFyMkhIWAi0bXwP5DNxSEksJtRYublR2wQCQmJb2/2MEHYwhL3W45AFf1glLhxciZzFyMH
	B5uAqsS1hiqQuIhAI6PE8w+TmUEcZoGTjBLT7/xhBOkWFvCVOHX5PDuIzQLSsO882FReAWuJ
	P2tOMEJskJe4uOY52GZOARuJE20gCziBtllLfPq+nB2iXlDi5MwnLCA2M1B989bZzBMYBWYh
	Sc1CklrAyLSKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4ArQ0dzBuX/VB7xAjEwfj
	IUYJDmYlEd5DQpnpQrwpiZVVqUX58UWlOanFhxilOViUxHnFX/SmCAmkJ5akZqemFqQWwWSZ
	ODilGphsm9WC5rGbrvv954Obx4XVxqEvPnNfZZEXiFE+llEwe/G84MZlu/U+/Vk29VvQ4Zw3
	iaLb0l0tp599yJzT5bTyXarGLbcJ5/yeXJZLepqVME2kvb33tPppM//POvs2PVl54VbnivM5
	Da3St5+EL2k10ppmZXGJKXCZ0Mt9+z4lGZk5cK589/KK036J1asDV5zjOKfiEq3/686v3WYT
	Sl57PPjj8krqsXLUv6Wt8656xz+au5vvO5PyDufOLVWd0vZBFUY7IxYmpXit1nzysa+pf93O
	ffyXay1kO03tr7fUpnxO23Xk34e7z8Ju5Qfpfbp3RPTQtH3HZysruR2d+XEW15cm6RsdLhvc
	7t9he1y8S4mlOCPRUIu5qDgRAAfRnEvvAgAA
X-CMS-MailID: 20241226031145epcas2p1886e86abda180abbc1a070a5f70f5672
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241226031145epcas2p1886e86abda180abbc1a070a5f70f5672
References: <20241226031142.1764652-1-sowon.na@samsung.com>
	<CGME20241226031145epcas2p1886e86abda180abbc1a070a5f70f5672@epcas2p1.samsung.com>

Add samsung,exynosautov920-ufs-phy compatible for ExynosAuto v920 SoC.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
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

