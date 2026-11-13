Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567187;
	b=NlNYJytM2G+W4o3C1SKcuwpmbRohoqgZd7490i5tG+ZibI2++ycNj6c8GsyTuHg59los
	 ZV/Kz5K7U2milbABS4nQv6uKHQD1j480gXRjg2r6xaaBedZEqlMkjiOudr6x+bRGwTIS6
	 PKH1inJK61TJU7345pv4Xdj4Qt/XTOwf55H1jXOthk4loc2HMkRiHOpVlg0XBzX4A28Z6
	 OXUdR3PUv3yNwg9aWd2HyVldqhAIwZHdOg80zZOutLuTudCGLISIkKtGyRnONtwsIEMOH
	 HYavzVDtyaU5yKr1PXD5G1GIppHtXqvAzIFsUZQ9TJ7XjiwuI/CUbrkM63Ssf4kqHUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567187;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	b=onxPyt61HQxOxcuAQV5BR5fXxrcLTz+t1ehoXT45c/TUF2Ni5YK64y4bOLTR43e6E5TT
	 qwrE8x/0iyTc39HdmzxZpcOmqvmlJ35ALFud4fQIP7Ge2GBOAGqPJbbXKGr7ccbcWQh/T
	 QB0MLeRkAhkQHzY7i5OM/uRW8plQB6s95UnyntKKBLOI/hiNRGerUvAEKblflb4C4QOAV
	 9oZOta08danqWWKtqaDTlhP6dSYsVGoGIvQDcqz+FmtzMCPRr1ICKrIi+ZBkwuKr0lJ6r
	 NPxdQrjxjdoZYeaDX5tdmd4urR174DuQQOdZyQBx869vAqKaXBDQU1iJ//qFDbc2dyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KkkrUPls;
	arc=none smtp.remote-ip=203.254.224.34
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2B606A31C
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E2B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KkkrUPls
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261113105259epoutp04473a8bacae3e0294d343c285d232066d~nlVd16ntE0750907509epoutp04b
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 10:52:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261113105259epoutp04473a8bacae3e0294d343c285d232066d~nlVd16ntE0750907509epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567179;
	bh=xZPonB6Lbb0k2OXAWHkAdkEguf5JX+UcZL6exprUdC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkkrUPlsBtC0ji0UbJU4fmGmbYQ+7cNpAIj+Q414Jg2D3TgaoM3E9pFJdhSebZ+uG
	 XZ+iPm+0pMKw8mc+YKFyBHOYxBAjjD9SBPn8xUBHW3brNlQOvldsJWYHPv4fZNXEQM
	 wp2h7PJR/W3XzL4DzQMvajIjxBIJIyJHVwexZEIE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261113105257epcas5p16bd10862e221c5e0052930bf487d41c0~nlVcdI3-d0130901309epcas5p10;
	Fri, 13 Nov 2026 10:52:57 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jQvHD6X0Qz6B9m9; Fri, 13 Nov
	2026 10:52:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d~nlRlBPkNl0561205612epcas5p4u;
	Fri, 13 Nov 2026 10:48:32 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104829epsmtip288867f1635f2f9c4a284fec461722d48~nlRipOvDs2501325013epsmtip2F;
	Fri, 13 Nov 2026 10:48:29 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 01/14 RESEND] dt-bindings: soc: samsung: Exynos8855
 SYSREG compatibles
Date: Fri, 13 Nov 2026 16:35:59 +0530
Message-Id: <20261113110612.3265841-2-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104832epcas5p4e1e9a3dedeb0c9c60cb80c23eb5d930d@epcas5p4.samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

Add exynos8855 sysreg compatibles in bindings

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index fcdb9ffd2644..845e0caba15a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -31,6 +31,10 @@ properties:
               - samsung,exynos5-sysreg
               - samsung,exynos7870-cam0-sysreg
               - samsung,exynos7870-disp-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
@@ -103,6 +107,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8855-hsi-sysreg
+              - samsung,exynos8855-peric-sysreg
+              - samsung,exynos8855-peris-sysreg
+              - samsung,exynos8855-usb-sysreg
               - samsung,exynos8895-fsys0-sysreg
               - samsung,exynos8895-fsys1-sysreg
               - samsung,exynos8895-peric0-sysreg
-- 
2.34.1

