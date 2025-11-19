Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4DA3546FA
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552369; cv=none; b=Q/m1+Jw59mlAvEkldOLiXc/khHgO7gHtjQIPTUgtEF08x17kFYNQneuOR/sZmZzYCprD1lWqZdPF0pMHQoh785nOdDI7puiYTL/AMZdLVQtY6lM6emKRwI+cOlKiMQbCmpk34T8D+5hvuM25abSlezdJfrb8D+rGQRr8vPJuOQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552369; c=relaxed/simple;
	bh=pVej9yb0oFRfnNwoiocViccJGUDxUVElSLYjdkU1s9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=dcDz99K8JdwycRvti846nBhat+Lkjg4DH4Sqsr73RS+rHABcvopk132jAblwoGPZR61QKf4hJuRD9GZ/SZav2MngoMDQEH5Wp+ZKGgKf8QxaWG2BusiAKFM4QKDX41fKpok0LGpJ7epE1g3gogk7lfnphvO4w9/+gNbbj7glYXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LRT0rFXK; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LRT0rFXK"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251119113924epoutp028b99680041b056f5c41c9183cf86e279~5ZYgqDJox1161011610epoutp02Q
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:39:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251119113924epoutp028b99680041b056f5c41c9183cf86e279~5ZYgqDJox1161011610epoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763552364;
	bh=DFjfFU0/pVrO5ht5F9eEWORDMXGICruazYbhvrUKrXI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LRT0rFXKQLPEuntx3P1ZpnZYt0p+z3qBBuEmjuXwoKGlZONLwgVU2MssWllTxWlbe
	 ZMRSopoqtS9FVf6WQj4AZuTxoF2baoQlCAdxOzjwD15vXAR0IjrX+RGegH4mbVoaoh
	 4CAJQdlAz+CpgmpDZGpDJWMosADiGoRuFbqjE5Y8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251119113923epcas5p46294f421ab29108220250921d24c418a~5ZYf_5Ym50922909229epcas5p4Z;
	Wed, 19 Nov 2025 11:39:23 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4dBKJW1Bwsz6B9m5; Wed, 19 Nov
	2025 11:39:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef~5ZYeth24o0409104091epcas5p1i;
	Wed, 19 Nov 2025 11:39:22 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251119113918epsmtip14f510d62705d865d66df7e6c0a679acb~5ZYbOM7zY0198401984epsmtip17;
	Wed, 19 Nov 2025 11:39:18 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 0/3] Add clock support for CMU_MFD
Date: Wed, 19 Nov 2025 17:17:41 +0530
Message-Id: <20251119114744.1914416-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef
References: <CGME20251119113922epcas5p1f9593dbc6cd51d9fa04613d9120eceef@epcas5p1.samsung.com>

This series adds clock support for the CMU_MFD block.
MFD stands for Multi-Format Decoder

Patch[1/3]: dt-bindings: clock: exynosautov920: add mfd clock definitions
        - Adds DT binding for CMU_MFD and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block mfd clock support
        - Adds CMU_MFD clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_MFD clock DT nodes
        - Adds dt node for CMU_MFD

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add mfd clock definitions
  clk: samsung: exynosautov920: add block mfd clock support
  arm64: dts: exynosautov920: add cmu_mfd clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 19 +++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 11 +++++
 drivers/clk/samsung/clk-exynosautov920.c      | 40 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  4 ++
 4 files changed, 74 insertions(+)


base-commit: fe4d0dea039f2befb93f27569593ec209843b0f5
-- 
2.34.1

