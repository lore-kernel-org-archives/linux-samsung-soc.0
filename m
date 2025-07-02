Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B570808
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751420018; cv=none; b=dcONLdyof9pYebswo5aUGvVVtUkBv8bRbal0k3jj0fZuI3ASnbbuxt0loZ70Tw+vg0eLtEYMdfVD/IEEzuKamZgO4+mrZNZx+Gf7UmO3BnbrhdesrdRCZdkBInOoaDrfRgwfmqzRgGitJaq2ajaW8KiwPRLRy+e9XpLr3OZqrUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751420018; c=relaxed/simple;
	bh=KUqflc5ZNY4e2Hc47pSY8AhIh+SsDN/Cz98Jd3lURF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=SfOiks67gunEiSRn41FM7AGbhHZsoVr9j1nFJo5NoNIW6FHqAv0B3lg7WEeNZqODTyzJsVEazNkCfjjFI6uYZDAHybAaqbE0bukt+87Mgn50OLwuo4sLtsEkzRVbeD3KFUcomIlLxj3+wP+joqunVQQ/TUGoAWdunxJ0XXCTW1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Xko7HCNv; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Xko7HCNv"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250702013334epoutp04b1e9f400289dcf5a854751c79fe9b7cc~OSzk0fFEs0133101331epoutp04e
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Jul 2025 01:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250702013334epoutp04b1e9f400289dcf5a854751c79fe9b7cc~OSzk0fFEs0133101331epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751420014;
	bh=mt5f5y4PvBP8NSZn5as+QYdyFgs3NB2RxGGZteyhX+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xko7HCNvNaqvNYLRmdjqrAmRn++OBYn2lOx+GPUkHhciNce7YzpfqI99wMcJc747b
	 oY2m82kFAD3+ESehf02hTGsG+bZsDpInfdnQJz1e2Zw32TLZNK+884Q1OuXBey4Xia
	 85pQMC5WNXaSyATmWgnN3hkPf5j8VVbnpk43K28A=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250702013333epcas2p2099efb497d5867471aacf85a8a7f0bfc~OSzkcxmKk0894408944epcas2p2Q;
	Wed,  2 Jul 2025 01:33:33 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.70]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bX2V50j1Mz2SSKm; Wed,  2 Jul
	2025 01:33:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epcas2p4fe456c285c96c143d96f98b31d9b5255~OSzjGIvsb0722207222epcas2p4L;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702013332epsmtip249f5e50587109f235b3e14c792d839b6~OSzjAYJJ-2820728207epsmtip2k;
	Wed,  2 Jul 2025 01:33:32 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH 2/5] dt-bindings: ufs: exynos: add ExynosAutov920 compatible
 string
Date: Wed,  2 Jul 2025 10:33:08 +0900
Message-ID: <20250702013316.2837427-3-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702013316.2837427-1-sowon.na@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702013332epcas2p4fe456c285c96c143d96f98b31d9b5255
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702013332epcas2p4fe456c285c96c143d96f98b31d9b5255
References: <20250702013316.2837427-1-sowon.na@samsung.com>
	<CGME20250702013332epcas2p4fe456c285c96c143d96f98b31d9b5255@epcas2p4.samsung.com>

Add samsung,exynosautov920-ufs compatible for ExynosAutov920 SoC.

Signed-off-by: Sowon Na <sowon.na@samsung.com>
---
 Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index b4e744ebffd1..52485912d29a 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -19,6 +19,7 @@ properties:
       - samsung,exynos7-ufs
       - samsung,exynosautov9-ufs
       - samsung,exynosautov9-ufs-vh
+      - samsung,exynosautov920-ufs
       - tesla,fsd-ufs
 
   reg:
-- 
2.45.2

