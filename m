Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=139.150.92.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943745;
	b=j/8B5rr1U3qlb4z8xJNegoVI4iTHHkvf2A7qYmr2YkhGSFaIUPbg1K+hjWktzrKhQCNR
	 0Y5M1kXywNurPbmtjh4k2H43IwkP8GbROJLRZ+6KK40KiBOVD+mJYcFYxEsjypxOMGj31
	 trKoxdFkVr/XcQKYwBAX24z9r0Kcr01Ri6V8p4SpMRpOz6yrdrEVK/j8zbX4ntfi6fW0Z
	 ADAGmFKtflg8CmJWtS04L5LCVcn07mUrhv1JJQ2mcYV6yz8/iV3r9O4rqYoVbMHQxPz2e
	 MoPz4RcJv9Sw2PgD6yALn3GFm6a9C3Tsmxfeof3csym1+HpkJ1tYBqMbwk5mFJ/qeYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943745;
	h=DMARC-Filter:Received:Received:Received:X-Authinfo:
	 X-Hiworks-Remote-IP:X-Hiworks-User:X-MailFrom-INFO:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1vc04qdLOVc0oS3YblVHKMpNWYhEpjNqAFH2e1GCpvs=;
	b=YE5m9ORP7uUKsp3+YL8KG4QB2OWx3v6a20Of5U1kV+vDjTBIFzErkmXTy7NEU9IWOtHX
	 GWXbFbTnla7iu9yGZMM5TtnN6q9ZiX+rzPrSid9BcOp3Ol2vTAtKWSm1V6egM0Dx9GiPG
	 iah/UTlaFO8j4V93HhkVxMfRN1DRgfJ2Vfy6dAr9bvwoPImW8xwesBvs98QpqB5cNJAdq
	 ziFSaukVTa/TAOVl7A86pfjkKjyl5FE9pcXWSmvehAaxARruaMdqcnXD0k7+NA4BJcckx
	 BB7glOPXz4k4NAnmXtVuQrJQXkBNQQArDPInprovTrDRaRfWNoMQ/zqyiuJcFrMVBdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nirvanahyj.com;
	spf=pass smtp.mailfrom=nirvanahyj.com;
	arc=none smtp.remote-ip=139.150.92.44
Received: from smtp92-44.hiworks.co.kr (smtp92-44.hiworks.co.kr [139.150.92.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF7B606A336
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 05:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF7B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nirvanahyj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nirvanahyj.com
Received: from hi-smtp-node4 (unknown [172.18.0.3])
	by smtp92-44.hiworks.co.kr (Postfix) with ESMTPS id 4jLSk173kQz3wtqK
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 14:42:17 +0900 (KST)
Received: from hi-smtp-node1 (unknown [192.168.71.167])
	by hi-smtp-node4 (Postfix) with ESMTP id 4jLSk13s1dzQLCTP
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Nov 2026 14:42:17 +0900 (KST)
Received: from hi-total-node5 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node1 with ESMTP id mam33weavsiw44bx;
 	Fri, 06 Nov 2026 14:42:17 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <nirvanah@nirvanahyj.com|114.203.237.180|nirvanah@nirvanahyj.com|261106144217_2181351674>
X-Hiworks-Remote-IP: 114.203.237.180
X-Hiworks-User: (SASL_USER) nirvanah@nirvanahyj.com
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from localhost.localdomain (unknown [114.203.237.180])
	(Authenticated sender: nirvanah@nirvanahyj.com)
	by hi-total-node5 (Postfix) with ESMTPSA id 4jLSk00lG9zSqYcP;
	Fri,  6 Nov 2026 14:42:16 +0900 (KST)
From: Young-Jun Hong <nirvanah@nirvanahyj.com>
To: 
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] clk: samsung: exynos5420: add VPLL rates for 650, 700 and 750 MHz
Date: Fri,  6 Nov 2026 14:41:49 +0900
Message-ID: <20261106054210.2893230-3-nirvanah@nirvanahyj.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
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

The VPLL drives the G3D (Mali) clock on Exynos 5420/5422. Its rate table
stops at 600 MHz, so GPU OPPs above 600 MHz cannot be reached:
clk_set_rate() silently keeps fout_vpll at 600 MHz.

Add the 650, 700 and 750 MHz rows (VCO 1300/1400/1500 MHz, using the same
P/M/S style as the APLL rows).

Tested on Samsung ARTIK 10 (Exynos 5422): with these rows the G3D devfreq
reaches 700 and 750 MHz, and the OpenCL accuracy suite passes 96/96 at
750 MHz with a board-specific 1.35 V OPP.

The analysis, the code and this changelog were produced with Claude
Code (Anthropic), a coding assistant.

Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 400a5c59815c..1b4b0ae16765 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1451,6 +1451,9 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
 };
 
 static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
+	PLL_35XX_RATE(24 * MHZ, 750000000U,  125, 2, 1),
+	PLL_35XX_RATE(24 * MHZ, 700000000U,  175, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 650000000U,  325, 6, 1),
 	PLL_35XX_RATE(24 * MHZ, 600000000U,  200, 2, 2),
 	PLL_35XX_RATE(24 * MHZ, 543000000U,  181, 2, 2),
 	PLL_35XX_RATE(24 * MHZ, 480000000U,  160, 2, 2),
-- 
2.47.3

