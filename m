Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A323356A39
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Feb 2026 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027604; cv=none; b=l7ElI+44wEH0/KN4AoSPKOMWj08KSPxwstUZUeZW/X0NHQNWLJU/tDLymrfH/I/2P1cXHkRDxhwtHxL8fYkgvxQcOGrzmexhgwH1y4Qx7dm5DGUOMjMKZsryuFDmPq3qUOsjZtz0+oQZKKlrlBawyKt/8jNuxtjel3XDE7IVuIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027604; c=relaxed/simple;
	bh=KRZ6KLOJ/WmKW7DLd89v4zMCfLRb6jmBmPG53TeZfLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=RoxvxFL+VLYXvgX3Jn7fbcQvJss7u3VUk07GbnYehCd3NHz56KdiafdSKzozQ13l/N/rIDY12BIDffPqGbBDHAYHNVDf6WGX5r1xJwGjQYVX7FH4lBDTH4C0spyzYnzXbaSYymtF+jQpFfYR+hZcQ/kn6gl6UhIqTG0dt6NCbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=G7e7tKyK; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="G7e7tKyK"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260202101954epoutp04b5bdb517e93e69de6973f6a10955b44e~QZrgB7xVQ1817418174epoutp042
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Feb 2026 10:19:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260202101954epoutp04b5bdb517e93e69de6973f6a10955b44e~QZrgB7xVQ1817418174epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770027594;
	bh=FwFqYqYfD15PAdwyyngrCMvzCO2FQbIKwm0H2nGhazc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=G7e7tKyKPr5aobWH5L10YT6N2ZSmWQ8gM1VEwEHERz6/xRmv9nrvHYUmURD4RIknM
	 2NCfImvJvqSbq+ukcisEb1axJIvflwCf4Jm6ofLd63yCP4jk0Nx0c1Vkp2AJAnzOrJ
	 83ta1cTVPDaiL7QhRVx9zHEN4PckBwyRbcO4WhqM=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260202101953epcas5p276fc3ec430574a19245421b56232efbd~QZrfadcfL0758407584epcas5p2x;
	Mon,  2 Feb 2026 10:19:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4f4N084nqWz6B9m5; Mon,  2 Feb
	2026 10:19:52 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a~QZreJ_-_G2979829798epcas5p3_;
	Mon,  2 Feb 2026 10:19:52 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260202101949epsmtip1d80c1ee20aa6ed9ccba1120809826f39~QZrbwpLJ31774317743epsmtip1L;
	Mon,  2 Feb 2026 10:19:49 +0000 (GMT)
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
Subject: [PATCH 0/3] Add clock support for CMU_G3D
Date: Mon,  2 Feb 2026 16:05:52 +0530
Message-Id: <20260202103555.2089376-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a
References: <CGME20260202101952epcas5p37eb879d5f55e7bdc8a90b86abe34eb4a@epcas5p3.samsung.com>

This series adds clock support for the CMU_G3D block.
G3D block is for Graphics

Patch[1/3]: dt-bindings: clock: exynosautov920: add g3d clock definitions
        - Adds DT binding for CMU_G3D and clock definitions

Patch[2/3]: clk: samsung: exynosautov920: add block g3d clock support
        - Adds CMU_G3D clock driver support

Patch[3/3]: arm64: dts: exynosautov920: add CMU_G3D clock DT nodes
        - Adds dt node for CMU_G3D

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---

Raghav Sharma (3):
  dt-bindings: clock: exynosautov920: add g3d clock definitions
  clk: samsung: exynosautov920: add block g3d clock support
  arm64: dts: exynosautov920: add cmu_g3d clock DT nodes

 .../clock/samsung,exynosautov920-clock.yaml   | 21 ++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 13 +++++
 drivers/clk/samsung/clk-exynosautov920.c      | 52 +++++++++++++++++++
 .../clock/samsung,exynosautov920.h            |  6 +++
 4 files changed, 92 insertions(+)


base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
-- 
2.34.1

