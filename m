Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46538C19F2A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Jul 2022 00:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbiG2AgV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233305AbiG2AgT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 20:36:19 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7288378DD0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 17:36:16 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220729003614epoutp04bb2924f052352e7a55b84a27bd2b77bd~GJbV3joNO2166121661epoutp04Q
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2022 00:36:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220729003614epoutp04bb2924f052352e7a55b84a27bd2b77bd~GJbV3joNO2166121661epoutp04Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659054974;
        bh=M7oogkQpztp5sjlSRj6N9GMYvr0b+Kxo7LymYzgVHL0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QRDBWkngdzPat8ZlTX03e01L6VwLaKORzhKrf8b7EQMa7MoHOps+35jaB0HZN3Q9G
         kfTo0suSgTgKcifBjo37UYyxjp0J0sA0KXQiXHO/SJOwOuK07n0XOsPQd6UIUIVgnB
         a+2RKTvmrg97TpzwHGY9XYEn58ReizYsvOb60TlI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220729003613epcas2p42b2a43dc9b5cb2166ecfc3cced25471e~GJbVS3dPy1916219162epcas2p43;
        Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Lv7qK0ylwz4x9QB; Fri, 29 Jul
        2022 00:36:13 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        4E.78.09642.C7B23E26; Fri, 29 Jul 2022 09:36:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epcas2p466c8e3f2dda399d40a8f8b45edcc9552~GJbUa8YPw1916119161epcas2p4G;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220729003612epsmtrp28dc476716908699e994540b90bcfdc8d~GJbUZ1nXQ1035210352epsmtrp2c;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
X-AuditID: b6c32a47-5e1ff700000025aa-82-62e32b7c487f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        BB.1B.08905.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epsmtip28d8c4f574089dc7d5d2b77d05311dc89~GJbUF43Pc0075200752epsmtip2K;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 5/6] clk: samsung: exynosautov9: add fsys0 clock support
Date:   Fri, 29 Jul 2022 09:30:23 +0900
Message-Id: <ae84d4a0487a5299076bfeef5732579f5207acf9.1659054220.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1659054220.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDJsWRmVeSWpSXmKPExsWy7bCmhW6t9uMkg6l3mSwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9Ktsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hqJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2xozt
        u9kKvmZWfJx8nbWB8WBsFyMnh4SAiUTT+0usXYxcHEICOxgltrSuZIZwPjFKfFu7Gcr5xihx
        b+ckVpiW753fmSASexklOh/cYYRwPjJKrDj9HKyKTUBXYsvzV2AJEYHHTBKHj7SxgTjMAm1M
        EtOebQSrEhbwlui8soQdxGYRUJVo7d/DBGLzCsRLHJvyiBlin7zE9ZttYDangK1EV9N3Foga
        QYmTM5+A2cxANc1bZ4MdKyGwlkNiyqQ1LBDNLhLrV+yFsoUlXh3fwg5hS0l8freXDcIullg6
        6xMTRHMDo8Tlbb+gEsYSs561A/3AAbRBU2L9Ln0QU0JAWeLILai9fBIdh/+yQ4R5JTrahCAa
        1SUObJ8OtVVWonvOZ1aIEg+JR2cKQcJCAhMYJW5PYpzAqDALyTOzkDwzC2HtAkbmVYxiqQXF
        uempxUYFxvAoTs7P3cQITsZa7jsYZ7z9oHeIkYmD8RCjBAezkghvQvT9JCHelMTKqtSi/Pii
        0pzU4kOMpsCgnsgsJZqcD8wHeSXxhiaWBiZmZobmRqYG5krivF4pGxKFBNITS1KzU1MLUotg
        +pg4OKUamCrXsZtOqVHakLgq40dVSOkCjdCcqIX6Mq+//TA2PSFsorVT3GqKt/asjTzLVYO8
        tf84JZzfo7Na/1nB9U9Jx5ZZfOGZwhK546DEMcZ5y87uMGbYtSeit+XLt39cvJ7LUpN2F6d0
        7538/IH8ESO5m7+W1BiXRkbI3N7iVrBqVrz05lsNXM3fbz5nLtm8Z+2zVXvvme1IWxDwP7Bn
        o6Bt2a2KX8V+9TwbbSodC+ybFvlpd+xeeH61Sxafwac37hZL+Xgdyh5oyEd4ltnLf2T5O11e
        UObHp4P/QozOLjV8mLDlvMnXpLjeI1VeiWvWrDG98jeVce4krRuahppOawVcTKf3VvzM/r5u
        ZeiW1XVVb5VYijMSDbWYi4oTAcPuMytPBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSvG6N9uMkgx93hS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9issm
        JTUnsyy1SN8ugStjxvbdbAVfMys+Tr7O2sB4MLaLkZNDQsBE4nvnd6YuRi4OIYHdjBIXpnxl
        g0jISjx7t4MdwhaWuN9yhBWi6D2jxIS/L1hAEmwCuhJbnr9iBEmICDxnkpiy4iCYwyzQxSRx
        p+0TWLuwgLdE55UlYDaLgKpEa/8eJhCbVyBe4tiUR8wQK+Qlrt9sA7M5BWwlupq+g20QErCR
        2LJsERtEvaDEyZlPwOLMQPXNW2czT2AUmIUkNQtJagEj0ypGydSC4tz03GLDAsO81HK94sTc
        4tK8dL3k/NxNjODI0dLcwbh91Qe9Q4xMHIyHGCU4mJVEeBOi7ycJ8aYkVlalFuXHF5XmpBYf
        YpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwGS2YtW9v+uWh11TPCy98P2l/61ibXXd
        XfH7qot2MHpFPLYJ3MjF47deyyrFcXKvwN4P0i/luwUlelo3TTbPKLR6qPI3arO6+IJPbcfm
        Ja9aIik897/3+bcx5YdvBukeTq3Yp1WuuOaDXVori/9Wkb4gCXYvk4xvdZ+PnNBYYHDPb5ld
        1kf2b4/fzPCxT1XQXLy0aYFUQUb73A6xzxOmHTljsnXRgvOSHC/lwm9MclwiYnyeW2Olvuqd
        L+vnT3946fE5dYOy+y5eB3/s1rsVMv/w3YcZ4lyX78/6M82f4fl1lmVihxd/YZ5jN2mNsMn9
        j1NebplgsN4zOifpifrRvxp2Nv9W//y43y67QlRnhtMKJZbijERDLeai4kQAjyzuqQsDAAA=
X-CMS-MailID: 20220729003612epcas2p466c8e3f2dda399d40a8f8b45edcc9552
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729003612epcas2p466c8e3f2dda399d40a8f8b45edcc9552
References: <cover.1659054220.git.chanho61.park@samsung.com>
        <CGME20220729003612epcas2p466c8e3f2dda399d40a8f8b45edcc9552@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
Lanes.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynosautov9.c | 243 +++++++++++++++++++++++++
 1 file changed, 243 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index d9e1f8e4a7b4..527a6837661e 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1067,6 +1067,246 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_core_bus",
 };
 
+/* ---- CMU_FSYS0 ---------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_FSYS2 (0x17700000) */
+#define PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER	0x0610
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK	0x2000
+
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN	0x2004
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN	0x2008
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN	0x200c
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN	0x2010
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN	0x2014
+#define CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN	0x2018
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK	0x205c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK	0x2060
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK	0x2064
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK	0x206c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK	0x2070
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK	0x2074
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PIPE_CLK	0x207c
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK	0x2084
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK	0x2088
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK	0x208c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK	0x2094
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK	0x2098
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK	0x209c
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PIPE_CLK	0x20a4
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK		0x20ac
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK	0x20b0
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK		0x20b4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK		0x20bc
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK	0x20c0
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK		0x20c4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PIPE_CLK		0x20cc
+
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK		0x20d4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK		0x20d8
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK		0x20dc
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK		0x20e0
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK		0x20e4
+#define CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK		0x20e8
+
+
+static const unsigned long fsys0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN,
+	CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PIPE_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PIPE_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PIPE_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK,
+	CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK,
+};
+
+/* List of parent clocks for Muxes in CMU_FSYS0 */
+PNAME(mout_fsys0_bus_user_p) = { "oscclk", "dout_clkcmu_fsys0_bus" };
+PNAME(mout_fsys0_pcie_user_p) = { "oscclk", "dout_clkcmu_fsys0_pcie" };
+
+static const struct samsung_mux_clock fsys0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_FSYS0_BUS_USER, "mout_fsys0_bus_user",
+	    mout_fsys0_bus_user_p, PLL_CON0_MUX_CLKCMU_FSYS0_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_FSYS0_PCIE_USER, "mout_fsys0_pcie_user",
+	    mout_fsys0_pcie_user_p, PLL_CON0_MUX_CLKCMU_FSYS0_PCIE_USER, 4, 1),
+};
+
+static const struct samsung_gate_clock fsys0_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_FSYS0_BUS_PCLK, "gout_fsys0_bus_pclk",
+	     "mout_fsys0_bus_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_FSYS0_CMU_FSYS0_IPCLKPORT_PCLK,
+	     21, CLK_IGNORE_UNUSED, 0),
+
+	/* Gen3 2L0 */
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X1_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x1_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X1_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L0_X2_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l0_x2_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L0_X2_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_2L0_CLK,
+	     "gout_fsys0_pcie_gen3a_2l0_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L0_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_2L0_CLK,
+	     "gout_fsys0_pcie_gen3b_2l0_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L0_CLK,
+	     21, 0, 0),
+
+	/* Gen3 2L1 */
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_REFCLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X1_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x1_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X1_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_2L1_X2_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_2l1_x2_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_2L1_X2_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_2L1_CLK,
+	     "gout_fsys0_pcie_gen3a_2l1_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_2L1_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_2L1_CLK,
+	     "gout_fsys0_pcie_gen3b_2l1_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_2L1_CLK,
+	     21, 0, 0),
+
+	/* Gen3 4L */
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_REFCLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_REFCLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_refclk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_CLK_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_PHY_REFCLK_IN,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X2_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x2_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X2_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_DBI_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_dbi_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_DBI_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_MSTR_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_mstr_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_MSTR_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3_4L_X4_SLV_ACLK,
+	     "gout_fsys0_pcie_gen3_4l_x4_slv_aclk", "mout_fsys0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3_4L_X4_SLV_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3A_4L_CLK,
+	     "gout_fsys0_pcie_gen3a_4l_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3A_4L_CLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_FSYS0_PCIE_GEN3B_4L_CLK,
+	     "gout_fsys0_pcie_gen3b_4l_clk", "mout_fsys0_pcie_user",
+	     CLK_CON_GAT_GOUT_BLK_FSYS0_UID_PCIE_GEN3B_4L_CLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info fsys0_cmu_info __initconst = {
+	.mux_clks		= fsys0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
+	.gate_clks		= fsys0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(fsys0_gate_clks),
+	.nr_clk_ids		= FSYS0_NR_CLK,
+	.clk_regs		= fsys0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
+	.clk_name		= "dout_clkcmu_fsys0_bus",
+};
+
 /* ---- CMU_FSYS2 ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_FSYS2 (0x17c00000) */
@@ -1701,6 +1941,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-core",
 		.data = &core_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-fsys0",
+		.data = &fsys0_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-fsys2",
 		.data = &fsys2_cmu_info,
-- 
2.37.1

