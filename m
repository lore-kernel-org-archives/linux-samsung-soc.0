Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4E042DA53
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239593; cv=none; b=LKJL81etzA0xisUCxaJHmnGZZ+H5F0HaYerGUlGWPJrhCFsCswY+RAaGWahvSRyre0aRRkL3s+msRtrWz67V92X7zRJn4orrtfJ0WDu+Dgyltesef4MLtX8tx8wIAwPzrtAkpG+fyiOPtZq4dpLe7tqKOCHq0EU418ku0fJIuNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239593; c=relaxed/simple;
	bh=AAXgE0PDyWClevlotQt61BAckVBZTcQiosB6nI5Zf2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=rMVApEUF8qZTKAIELz8Fr2P1qM/xlTXXHrsI/1KtTIzQXmazItmggs+0Vk+E65tac4yVv+2lFQBVj8gB8GcUg2FBJDeIFd/2UP3dbE6TRC+2Ent1iJLCHVPxJbNSRyScvelwzjd34UxaIB+7zC8rb7dUWHiJsA5fiJWPmZBqGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GzEA1RdH; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GzEA1RdH"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260728115310epoutp0103292f0d90bf70b970e3ade973eee164~GcfLdv49Z1239112391epoutp01a
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2026 11:53:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260728115310epoutp0103292f0d90bf70b970e3ade973eee164~GcfLdv49Z1239112391epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785239590;
	bh=GG3gQXNZg4KJgPZln4dmN7buJq42W584sGfTmqCRugU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GzEA1RdHJLtS/IJI21XlNSmDLU13Bj/BW9CFSjxs9sSXFH/U0FIv/ZpcYq528/hTo
	 ytvz61KvCFxEcwvBk19o1TJquTlGPG4xbdM9sdfDWTp+DYlzQUXHibv3qutT4/zS+B
	 P3M2+z4Pm2FVeTdNWypQcEydx5mF2OwE7GtqGTuw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260728115309epcas5p1121bdfa96758db06c4042e6b801acffe~GcfK2lhRW2742927429epcas5p1X;
	Tue, 28 Jul 2026 11:53:09 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4h8YkX4LC6z6B9m9; Tue, 28 Jul
	2026 11:53:08 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e~GcfJgBgLe2742927429epcas5p1S;
	Tue, 28 Jul 2026 11:53:08 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260728115305epsmtip1128824a6f7f1d4afcf2a461a0c9588f4~GcfG_ARpZ2207322073epsmtip1Q;
	Tue, 28 Jul 2026 11:53:05 +0000 (GMT)
From: "raghav.s" <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, mturquette@baylibre.com,
	sboyd@kernel.org, bmasney@redhat.com, robh@kernel.org, conor+dt@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hajun.sung@samsung.com, raghav.s@samsung.com,
	is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
Subject: [PATCH 07/13] arm64: dts: exynos8855: add cmu_peris clock DT nodes
Date: Tue, 28 Jul 2026 17:41:05 +0530
Message-Id: <20260728121111.2077860-8-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728121111.2077860-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e
References: <20260728121111.2077860-1-raghav.s@samsung.com>
	<CGME20260728115308epcas5p12e93dfef5637137f3ed159ebc2e9bd8e@epcas5p1.samsung.com>

Add required dt node for cmu_peris block

Signed-off-by: raghav.s <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 0053730b3e01..a8f5ff0a7f1a 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -141,6 +141,19 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		cmu_peris: clock-controller@10030000 {
+			compatible = "samsung,exynos8855-cmu-peris";
+			reg = <0x10030000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
+			clock-names = "oscclk",
+				      "gic",
+				      "bus";
+		};
+
 		gic: interrupt-controller@10200000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1

