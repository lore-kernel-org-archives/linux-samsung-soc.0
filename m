Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A29B26A0D0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 04:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491880; cv=none; b=CxKWBdox9Bl+G01Hxi4qOvi57uGkCM9X5bM4Ys5ux8GWU+gLe4FkJ0nOF/zKnOiuxiWoUX8yTe7Hnj/lw37BFDmJwTZ15iaSweIOdAsXEkSSuk8Zp0qn1im3KkmhmpC5d8TA9LBtyBJ5rLXYjJO54UpgczVcCjjMIbQqZkNUGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491880; c=relaxed/simple;
	bh=hKf1r4fgpjrSWWezWgdTmHDSvhzqOvFCNFkMgevyXC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=PbbB4sLAOPNTKDXA54EjdwiF/dmRWHfz4HY5TiNZqWh7KnUBDDNXusRFkFtxmavJHIjoe+zWt1wUcgEgEstcWjy7aj8Qi+nVbBQl7cwn1/btPbI3Klim5b0QsidVsjPC4ANA/K+HLH3anSaaStST9nksNJRg15BgsU4tBnPTr9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ssXxs/bP; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ssXxs/bP"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043756epoutp024d681fced91c738497a633e48bff40bf~cwo_Sz1hM1652616526epoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 04:37:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043756epoutp024d681fced91c738497a633e48bff40bf~cwo_Sz1hM1652616526epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491876;
	bh=yMD85M6SrGm/2rhkRdAIrQRhH8rce/UofwihefSNyxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ssXxs/bPbVgfkD6gEWoluum7Wm125gYJKcqS9WSADn2UKMvPzXZxb7NivZClnNdaO
	 jB5U7omdbCBbkXOn2/d0vOAlE4QmcRa7Ut/eY7DWdJbtODtcJdN2VqmJUSV6gua5pi
	 2IdHEjbtb/0BWjhklN7SDfrmZdK6A28MwVDtzJ3U=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250818043752epcas5p10735c8345c19b690c1386b2c738b3d02~cwo6Z-A5X2576525765epcas5p1S;
	Mon, 18 Aug 2025 04:37:52 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c50M338Hgz2SSKZ; Mon, 18 Aug
	2025 04:37:51 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2~bp3rTNoxZ0487304873epcas5p20;
	Thu, 14 Aug 2025 14:10:25 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141021epsmtip2fc5a1f0b0511a018a32f4c76fb4e853e~bp3neAIzV1817818178epsmtip2m;
	Thu, 14 Aug 2025 14:10:21 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 05/12] media: imx-mipi-csis: Move clk to mipi_csis_info
 structure
Date: Thu, 14 Aug 2025 19:39:36 +0530
Message-ID: <20250814140943.22531-6-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141025epcas5p2b226c4eaab5d60d0e95f684e2ef930f2@epcas5p2.samsung.com>

clock names in NXP SoC's is different from the FSD SoC. Inorder to
extend this driver to use for FSD SoC. Move the clock names to
mipi_csis_info structure.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 2beb5f43c2c0..4afa75734f05 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -267,6 +267,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
 
+#define MIPI_CSIS_MAX_CLOCKS	4
+
 enum mipi_csis_clk {
 	MIPI_CSIS_CLK_PCLK,
 	MIPI_CSIS_CLK_WRAP,
@@ -274,13 +276,6 @@ enum mipi_csis_clk {
 	MIPI_CSIS_CLK_AXI,
 };
 
-static const char * const mipi_csis_clk_id[] = {
-	"pclk",
-	"wrap",
-	"phy",
-	"axi",
-};
-
 enum mipi_csis_version {
 	MIPI_CSIS_V3_3,
 	MIPI_CSIS_V3_6_3,
@@ -289,6 +284,7 @@ enum mipi_csis_version {
 struct mipi_csis_info {
 	enum mipi_csis_version version;
 	unsigned int num_clocks;
+	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
 };
 
 struct mipi_csis_device {
@@ -697,7 +693,7 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 		return -ENOMEM;
 
 	for (i = 0; i < csis->info->num_clocks; i++)
-		csis->clks[i].id = mipi_csis_clk_id[i];
+		csis->clks[i].id = csis->info->clk_names[i];
 
 	ret = devm_clk_bulk_get(csis->dev, csis->info->num_clocks,
 				csis->clks);
@@ -1539,12 +1535,14 @@ static const struct of_device_id mipi_csis_of_match[] = {
 		.data = &(const struct mipi_csis_info){
 			.version = MIPI_CSIS_V3_3,
 			.num_clocks = 3,
+			.clk_names = {"pclk", "wrap", "phy"},
 		},
 	}, {
 		.compatible = "fsl,imx8mm-mipi-csi2",
 		.data = &(const struct mipi_csis_info){
 			.version = MIPI_CSIS_V3_6_3,
 			.num_clocks = 4,
+			.clk_names = {"pclk", "wrap", "phy", "axi"},
 		},
 	},
 	{ /* sentinel */ },
-- 
2.49.0

