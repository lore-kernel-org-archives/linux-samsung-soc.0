Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478744;
	b=4K+tCIcXppvelFMr6jVNXr47gTcOdJlLy7FpfBUllU8GjeQPWC8/4dDbuxLES1BCAl2b
	 LTHD4Qc3KJhwvoBoWhW5iKp93qOs1+GlcyAZnKskPn+AN8ukdVnIhmz3za6th0qPyLyTJ
	 mSYwTsC/qXfRWPp+j7DxRe8RJT3PGyR1nW6vhiE3ECyG4HeaoyfI3xs9NCF60Z6BvxDd3
	 Og9Zpd9eCOiRVody5oAyvmwPumTONxQFYwN0vTuEYq8/4BYyi0EfHBfu7+R6zM3YYLu74
	 it4k8RLB+VTfJie5XvlBtPot7RmRv2PzCGtxy0qF8PgJxFmHXeHY5/PI0gQD48lj3hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478744;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:cpgsPolicy:X-CFilter-Loop:
	 X-CMS-RootMailID:References;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	b=ScXRa5YN8amvgx1ZxQd+wVmwkyA3TaosR0uZNMgiTQ3nVXD2PoyPwSXpHUrpf9TTB9mi
	 XVtNSi6Bq4m8UQPP6YI+tkq2WbJqp33AHVCEHbd81s+OOw8mNhcZNZHNSOaveetoFg9dU
	 /weEa+ZI5wI3TZQscbdbMRaddNGVaX0xN2MDR2Y9Vtc1t3VJMqFXT1OP34mpyz73eB6jV
	 OCiMUNhH7uJ7ZPJ/f+4ui2Bh68F3tKv1CGP/FvF8M/FCq9m9xqsycvgUXpaHqXkBC8T9w
	 ewEYsstmsELIC/RH53M3L9uizCfx39Xfy00RqNGseQOs9Xzd9EVKQz+gtphUu3pORGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=A+aZWDOQ;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF0606A32A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFF0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=A+aZWDOQ
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261020064534epoutp02d04cbe1b88952ce0cd0df215d12b4b02~gKemGKg521725817258epoutp02y
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 06:45:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261020064534epoutp02d04cbe1b88952ce0cd0df215d12b4b02~gKemGKg521725817258epoutp02y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792478734;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=A+aZWDOQfCxsTXBG59fgz4Yb6Zci8DGZwkUC1Gh3j4UXXwisTIzramkvRmR7mM6VP
	 C4Ox0zjUoon8Qp7ngVcimWlr8qGKWsG0EfodnC5nDil6HosZRdowjBUtV+OTBtRzri
	 1EkQ90nFTvArnZZN4QXbrSu69AQC4BAP4UiLk7hw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261020064533epcas5p4051fa2be1289b585cb16ce3f93314fd1~gKek5UybU3227532275epcas5p4U;
	Tue, 20 Oct 2026 06:45:33 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j82wr16ylz6B9mF; Tue, 20 Oct
	2026 06:45:32 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063759epcas5p1e91cb3158cd6c9c8f23a251cfc33d420~gKX9z8PpP1099110991epcas5p1L;
	Tue, 20 Oct 2026 06:37:59 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261020063756epsmtip1cc87584145afe4f37d93fe220c01669a~gKX7La8pH3255632556epsmtip1k;
	Tue, 20 Oct 2026 06:37:56 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 00/14] Add clock support for Exynos8855 SoC
Date: Tue, 20 Oct 2026 12:25:44 +0530
Message-Id: <20261020065558.1829402-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
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
X-CMS-MailID: 20261020063759epcas5p1e91cb3158cd6c9c8f23a251cfc33d420
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261020063759epcas5p1e91cb3158cd6c9c8f23a251cfc33d420
References: <CGME20261020063759epcas5p1e91cb3158cd6c9c8f23a251cfc33d420@epcas5p1.samsung.com>

This patch series adds clock support for below blocks
found in Exynos8855 SoC
TOP & PERIC
PERIS
HSI
USB
There are many other blocks, for which the support will be
added in a forthcoming patch series.
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Chanegs in v3:
 - Addressed Sashiko review comments
 - Collected Reviewed-by tags
 - In patch#2, added samsung,sysreg property to the binding,
   somehow this was not cought by dt_binding_check
   Have kept reviewed-by of Krzysztof on this patch  
Changes in v2:
- Removed name duplicates login, as pointed by Krzysztof Kozlowski
-Corrected the sequence of binding, driver and DT entries
- Removed <linux/mod_devicetable.h>, as pointed by Uwe
- Added all the TOP clocks in single patch
- Organised the patches in the order: dt-bindings → clk-driver → dtsi
- Added Automatic Clock Gating, as suggested by Peter Griffin
-Since we are adding ACG, we need to add SYSREG, hence, added that
- Followed the name mangling strategy as mentioned in clk-gs101

Link to v2: https://lore.kernel.org/all/20261009120137.2801911-1-raghav.s@samsung.com/
Link to v1: https://lore.kernel.org/all/20260728121111.2077860-1-raghav.s@samsung.com/

Alim Akhtar (2):
  dt-bindings: soc: samsung: Exynos8855 SYSREG compatibles
  clk: samsung: clk-pll: Add support for pll_4313

Raghav Sharma (12):
  dt-bindings: clock: exynos8855: add top & peric clock definitions
  dt-bindings: clock: exynos8855: add peris clock definitions
  dt-bindings: clock: exynos8855: add hsi clock definitions
  dt-bindings: clock: exynos8855: add usb clock definitions
  clk: samsung: exynos8855: add block top and peric clock support
  clk: samsung: exynos8855: add block peris clock support
  clk: samsung: exynos8855: add block hsi clock support
  clk: samsung: exynos8855: add block usb clock support
  arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
  arm64: dts: exynos8855: add cmu_peris clock DT nodes
  arm64: dts: exynos8855: add cmu_hsi clock DT nodes
  arm64: dts: exynos8855: add cmu_usb clock DT nodes

 .../clock/samsung,exynos8855-clock.yaml       |  196 +++
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    8 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    |   95 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8855.c          | 1378 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   11 +-
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../dt-bindings/clock/samsung,exynos8855.h    |  233 +++
 8 files changed, 1922 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h


base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
-- 
2.34.1

