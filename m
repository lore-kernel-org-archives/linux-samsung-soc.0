Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDEE3CEB90
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512469; cv=none; b=j7leQuKCRCstcbEd7A74v/8FIor9G/p1MK/kBCgaqxnS0JzVf6qDuOql7genSUci5p5IMZUvp+2EijxS4ifUuWv0RAyNMZDKKjUcTruAEbQdwqjTjX8OsRvNG05KFcgk7ul6DaM9DUMvXuLMcqFmh2SK9i0BGyB0x57Y6qk2Hp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512469; c=relaxed/simple;
	bh=eYfoVTTY5NEjUxbcKceaFp2ZtOa8bfuibisKfUP+gSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=U8F7tXpKRr4SahotH5BXc5t5O9CdwDD9RMqp/QN8dD/YWe3lvgYTz3uHBdyfQcRlnRuqv0UQC8t+hC95YTAVUV+rRAUo5+S84pe3Hc9alQyNWOvZsQP/B5r37XNJ3OCp+RfBzQArUtA6WYLi1wtVRJ+4C6SGmlH1L5kLzCTNWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=B3QX1w4M; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="B3QX1w4M"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260615083420epoutp0103bf799fa0a9268f52df2f569c390c7e~5NCTZaNpY2239622396epoutp01j
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:34:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260615083420epoutp0103bf799fa0a9268f52df2f569c390c7e~5NCTZaNpY2239622396epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781512460;
	bh=wl26fAR/gW6o8YIBNsSnb/apIo7BbF6qv1tG/czd9Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B3QX1w4MKhmduwNZ7cmVp02v3c4u3d0CkIfDJadcgAS/IV26QVoupTwO/2qfQFeyk
	 MiW0Vzlr8w7l/5Wk4SkdFGMevUxEN86vPAgYxvTxfFE/Sy2MFq3qK5zNOOt3Zkba6b
	 NWRf/4bgrw7UebOXtmJeNYGOaJztXtqwr3eCWZj4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260615083420epcas5p4165ab507ad0395eff05b47f40302028f~5NCS-cyqD3233832338epcas5p4Q;
	Mon, 15 Jun 2026 08:34:20 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf3Lv4SCtz6B9mG; Mon, 15 Jun
	2026 08:34:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083414epcas5p1391355f26fb4ce147782382af6668063~5NCOSYQKc2849128491epcas5p1n;
	Mon, 15 Jun 2026 08:34:14 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260615083413epsmtip147883ec3f24d1808b5113998f4de05ec~5NCMinSDw0113401134epsmtip1j;
	Mon, 15 Jun 2026 08:34:12 +0000 (GMT)
From: Alim Akhtar <alim.akhtar@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, robh@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	hajun.sung@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 1/5] dt-binding: ARM: samsung: Add Samsung Exynos8855
Date: Mon, 15 Jun 2026 14:22:48 +0530
Message-Id: <20260615085252.1964423-2-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085252.1964423-1-alim.akhtar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260615083414epcas5p1391355f26fb4ce147782382af6668063
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083414epcas5p1391355f26fb4ce147782382af6668063
References: <20260615085252.1964423-1-alim.akhtar@samsung.com>
	<CGME20260615083414epcas5p1391355f26fb4ce147782382af6668063@epcas5p1.samsung.com>

Add Samsung Exynos8855 smdk board to documentation

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 753b3ba1b607..273464400477 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -235,6 +235,12 @@ properties:
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
+      - description: Exynos8855 based boards
+        items:
+          - enum:
+              - samsung,exynos8855-smdk         # Samsung SMDK
+          - const: samsung,exynos8855
+
       - description: Exynos8895 based boards
         items:
           - enum:
-- 
2.34.1

