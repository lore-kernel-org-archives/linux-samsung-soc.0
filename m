Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B619C4167E
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 10:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbiECLBZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 07:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234612AbiECLBT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 07:01:19 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCAC27B01
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 03:57:35 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220503105733epoutp017fa0eafc2239cff1c4a4770dd2dfd0bf~rkx-XdU031315413154epoutp010
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 10:57:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220503105733epoutp017fa0eafc2239cff1c4a4770dd2dfd0bf~rkx-XdU031315413154epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1651575453;
        bh=MCG3Bq02CFg1ioqoTOffZojd3YJ1h5FnCVt+sX+ug+c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pK9BT8qaj6Su3+UdeROvMucIsfOb8bOHhl3PHZroqmu8A+SBio/sFuhPvhS57Q8kI
         SpcW8p3X69A/G1Yqwx30CGkecx/xBuyAbYptKkYB1ZNpfQW77wZZm5JQUdYCAD4p+f
         LycF6Wqh2Ur0kNU61Vo9nHeRHAy8xciS6ZSNwd/0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220503105732epcas2p23b4b288659a46769800ae6451f1050a2~rkx_0vOjm1964019640epcas2p2H;
        Tue,  3 May 2022 10:57:32 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4KsxkL1gS5z4x9Q7; Tue,  3 May
        2022 10:57:30 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        B2.DA.09694.A9A01726; Tue,  3 May 2022 19:57:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epcas2p27e90f15cd1ffda34d2c99f83c7d60f60~rkx8GlnsN1964119641epcas2p25;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220503105729epsmtrp17aba0ac28e6250d6653f21ef37ad3a55~rkx8Fu10U0279502795epsmtrp1f;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
X-AuditID: b6c32a48-495ff700000025de-97-62710a9afa7e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        3B.A3.08924.99A01726; Tue,  3 May 2022 19:57:29 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220503105729epsmtip2c775a2fca066fe11def68be5f884eb8a~rkx74r4Mc1109211092epsmtip2E;
        Tue,  3 May 2022 10:57:29 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 08/12] clk: samsung: exynosautov9: add cmu_peric0 clock
 support
Date:   Tue,  3 May 2022 19:59:10 +0900
Message-Id: <20220503105914.117625-9-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220503105914.117625-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmqe4srsIkg4snOCwezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxR2TYZqYkpqUUKqXnJ
        +SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5QMcqKZQl5pQChQISi4uV9O1s
        ivJLS1IVMvKLS2yVUgtScgrMC/SKE3OLS/PS9fJSS6wMDQyMTIEKE7Iz7p15wlrwKrvi5/4T
        7A2MffFdjJwcEgImEhcn/GPqYuTiEBLYwShxcOtKNgjnE6PE0Y5tzCBVQgKfGSX2X/KA6eja
        MAmqYxejxLPDm6Gcj4wS77pfs4BUsQnoSmx5/ooRJCEi0MUscbHvHguIwyywlVHi+I1ZTCBV
        wgIhEluXPgSzWQRUJZZ++QTWzStgL7Hl2UGg3RxA++Ql/i0OBQlzCjhIXN91jgmiRFDi5Mwn
        YOXMQCXNW2czg8yXEFjKIbHy01JmiFtdJC60NTJB2MISr45vYYewpSRe9rdB2cUSS2d9YoJo
        bmCUuLztFxtEwlhi1rN2RpAjmAU0Jdbv0oe4R1niyC2ovXwSHYf/skOEeSU62oQgGtUlDmyf
        zgJhy0p0z/nMCmF7SNzaO5UdEliTGSWObHrPNoFRYRaSd2YheWcWwuIFjMyrGMVSC4pz01OL
        jQpM4FGcnJ+7iRGcerU8djDOfvtB7xAjEwfjIUYJDmYlEV7npQVJQrwpiZVVqUX58UWlOanF
        hxhNgWE9kVlKNDkfmPzzSuINTSwNTMzMDM2NTA3MlcR5vVI2JAoJpCeWpGanphakFsH0MXFw
        SjUweQpWzH7JqjnRcavcgZtfArVtuk38/I8tNdjDvGv+eW6f9haL+zO7/So7+iavv7ivOuz4
        o+drX9ss/5YV90fQJjL7lKe0hpDs9F99xaW1RV/rpBqk1N0FTBm4tPO3Mdy5If03SS0uIjvb
        KTtdao+bmtqhVeu21HG+WHpg2rJrBmf51y8/xPNFfce/k61rHl4+/XDrQ5XF3ge+68U8Vk+y
        k4pYGfj5eM9lEcW3gg/yduQb+D4I4UuKkO0NVeQ/8Irp/6R5oluuPdw5U63k6WLNX/UqBQp/
        pJJaufc3hDAqzGlYkGrfft2I9YnVzzvcDSYmjRVFhQGfF+ef9BAuvLe8UdmzN6ynz1HSwltm
        m4cSS3FGoqEWc1FxIgCmSUfTRgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLLMWRmVeSWpSXmKPExsWy7bCSvO5MrsIkg2WLtS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktPvbcY7WYcX4fk8XFU64WrXuPsFscftPOavHv2kYWi+d9
        QPFVu/4wOvB5vL/Ryu6xc9Zddo9NqzrZPO5c28Pm0bdlFaPH501yAWxRXDYpqTmZZalF+nYJ
        XBn3zjxhLXiVXfFz/wn2Bsa++C5GTg4JAROJrg2TmLoYuTiEBHYwSjyaOpcNIiEr8ezdDnYI
        W1jifssRVhBbSOA9o8TKq0ogNpuArsSW568YQZpFBCYwS7y58oEdxGEW2MkocefVKbBJwgJB
        Eotnd7KA2CwCqhJLv3wCs3kF7CW2PDvI3MXIAbRBXuLf4lCQMKeAg8T1XeeYIJbZS+z8u50Z
        olxQ4uTMJ2CtzEDlzVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS9
        5PzcTYzgGNHS2sG4Z9UHvUOMTByMhxglOJiVRHidlxYkCfGmJFZWpRblxxeV5qQWH2KU5mBR
        Eue90HUyXkggPbEkNTs1tSC1CCbLxMEp1cAUfMRaQmZyauWHlekPzoY56V6+dyne73VT3MMH
        n43ec3+5VqHq92xO5v3fokzzw89Pbc4OstRfdJ+Zl9/pwP3iBq0fAb2phyT9qpY+ClASXXf8
        wfTS06U9Jupn3+isi3rkvuh9RNRN4VfNhlc/7dlx94O3/oKrbWeXZqm7/fsVt+fTxQNeLSff
        hR+4bChdtcwzlG+/xjnVhRcu34ndUdqZwCBREfXeqvS0UHntxO6Tk0JPN32tUpURMJfqMNle
        Eml8oPS+0Uu/hyKXcrquNEzU6j8dGZsg+D+zx+hrbefvPfc6Hl6aOSleeUPqp/3h1rNe+tzm
        +BaTntF5VOjHk2cPF3NeuR20TtqJffLjo7MUlViKMxINtZiLihMBQ/k+KwADAAA=
X-CMS-MailID: 20220503105729epcas2p27e90f15cd1ffda34d2c99f83c7d60f60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220503105729epcas2p27e90f15cd1ffda34d2c99f83c7d60f60
References: <20220503105914.117625-1-chanho61.park@samsung.com>
        <CGME20220503105729epcas2p27e90f15cd1ffda34d2c99f83c7d60f60@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_PERIC0 provides clocks for USI0 ~ USI5 and USIx_I2C. USI0/1/2/3/4/5
have its own divider but USI_I2Cs share "dout_peric0_usi_i2c" divider.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov9.c | 254 +++++++++++++++++++++++++
 1 file changed, 254 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov9.c b/drivers/clk/samsung/clk-exynosautov9.c
index 8c6ecd3f3eeb..e85efc6c3f71 100644
--- a/drivers/clk/samsung/clk-exynosautov9.c
+++ b/drivers/clk/samsung/clk-exynosautov9.c
@@ -1134,6 +1134,257 @@ static const struct samsung_cmu_info fsys2_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_fsys2_bus",
 };
 
+/* ---- CMU_PERIC0 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_PERIC0 (0x10200000) */
+#define PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER	0x0600
+#define PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER	0x0610
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI	0x1000
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI	0x1004
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI	0x1008
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI	0x100c
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI	0x1010
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI	0x1014
+#define CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C	0x1018
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI	0x1800
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI	0x1804
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI	0x1808
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI	0x180c
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI	0x1810
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI	0x1814
+#define CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C	0x1818
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0	0x2014
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1	0x2018
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2	0x2024
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3	0x2028
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4	0x202c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5	0x2030
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6	0x2034
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7	0x2038
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8	0x203c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9	0x2040
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10	0x201c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11	0x2020
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0	0x2044
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1	0x2048
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2	0x2058
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3	0x205c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4	0x2060
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7	0x206c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5	0x2064
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6	0x2068
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8	0x2070
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9	0x2074
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10	0x204c
+#define CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11	0x2050
+
+static const unsigned long peric0_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER,
+	PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI,
+	CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_1,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+};
+
+/* List of parent clocks for Muxes in CMU_PERIC0 */
+PNAME(mout_peric0_bus_user_p) = { "oscclk", "dout_clkcmu_peric0_bus" };
+PNAME(mout_peric0_ip_user_p) = { "oscclk", "dout_clkcmu_peric0_ip" };
+PNAME(mout_peric0_usi_p) = { "oscclk", "mout_peric0_ip_user" };
+
+static const struct samsung_mux_clock peric0_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_PERIC0_BUS_USER, "mout_peric0_bus_user",
+	    mout_peric0_bus_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_BUS_USER, 4, 1),
+	MUX(CLK_MOUT_PERIC0_IP_USER, "mout_peric0_ip_user",
+	    mout_peric0_ip_user_p, PLL_CON0_MUX_CLKCMU_PERIC0_IP_USER, 4, 1),
+	/* USI00 ~ USI05 */
+	MUX(CLK_MOUT_PERIC0_USI00_USI, "mout_peric0_usi00_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI00_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI01_USI, "mout_peric0_usi01_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI01_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI02_USI, "mout_peric0_usi02_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI02_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI03_USI, "mout_peric0_usi03_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI03_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI04_USI, "mout_peric0_usi04_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI04_USI, 0, 1),
+	MUX(CLK_MOUT_PERIC0_USI05_USI, "mout_peric0_usi05_usi",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI05_USI, 0, 1),
+	/* USI_I2C */
+	MUX(CLK_MOUT_PERIC0_USI_I2C, "mout_peric0_usi_i2c",
+	    mout_peric0_usi_p, CLK_CON_MUX_MUX_CLK_PERIC0_USI_I2C, 0, 1),
+};
+
+static const struct samsung_div_clock peric0_div_clks[] __initconst = {
+	/* USI00 ~ USI05 */
+	DIV(CLK_DOUT_PERIC0_USI00_USI, "dout_peric0_usi00_usi",
+	    "mout_peric0_usi00_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI00_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI01_USI, "dout_peric0_usi01_usi",
+	    "mout_peric0_usi01_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI01_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI02_USI, "dout_peric0_usi02_usi",
+	    "mout_peric0_usi02_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI02_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI03_USI, "dout_peric0_usi03_usi",
+	    "mout_peric0_usi03_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI03_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI04_USI, "dout_peric0_usi04_usi",
+	    "mout_peric0_usi04_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI04_USI,
+	    0, 4),
+	DIV(CLK_DOUT_PERIC0_USI05_USI, "dout_peric0_usi05_usi",
+	    "mout_peric0_usi05_usi", CLK_CON_DIV_DIV_CLK_PERIC0_USI05_USI,
+	    0, 4),
+	/* USI_I2C */
+	DIV(CLK_DOUT_PERIC0_USI_I2C, "dout_peric0_usi_i2c",
+	    "mout_peric0_usi_i2c", CLK_CON_DIV_DIV_CLK_PERIC0_USI_I2C, 0, 4),
+};
+
+static const struct samsung_gate_clock peric0_gate_clks[] __initconst = {
+	/* IPCLK */
+	GATE(CLK_GOUT_PERIC0_IPCLK_0, "gout_peric0_ipclk_0",
+	     "dout_peric0_usi00_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_1, "gout_peric0_ipclk_1",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_1,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_2, "gout_peric0_ipclk_2",
+	     "dout_peric0_usi01_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_3, "gout_peric0_ipclk_3",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_4, "gout_peric0_ipclk_4",
+	     "dout_peric0_usi02_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_5, "gout_peric0_ipclk_5",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_6, "gout_peric0_ipclk_6",
+	     "dout_peric0_usi03_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_7, "gout_peric0_ipclk_7",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_8, "gout_peric0_ipclk_8",
+	     "dout_peric0_usi04_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_9, "gout_peric0_ipclk_9",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_10, "gout_peric0_ipclk_10",
+	     "dout_peric0_usi05_usi",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_IPCLK_11, "gout_peric0_ipclk_11",
+	     "dout_peric0_usi_i2c",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_11,
+	     21, 0, 0),
+
+	/* PCLK */
+	GATE(CLK_GOUT_PERIC0_PCLK_0, "gout_peric0_pclk_0",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_0,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_2, "gout_peric0_pclk_2",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_2,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_3, "gout_peric0_pclk_3",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_3,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_4, "gout_peric0_pclk_4",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_4,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_5, "gout_peric0_pclk_5",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_5,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_6, "gout_peric0_pclk_6",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_6,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_7, "gout_peric0_pclk_7",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_7,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_8, "gout_peric0_pclk_8",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_8,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_9, "gout_peric0_pclk_9",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_9,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_10, "gout_peric0_pclk_10",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_10,
+	     21, 0, 0),
+	GATE(CLK_GOUT_PERIC0_PCLK_11, "gout_peric0_pclk_11",
+	     "mout_peric0_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_PCLK_11,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info peric0_cmu_info __initconst = {
+	.mux_clks		= peric0_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(peric0_mux_clks),
+	.div_clks		= peric0_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(peric0_div_clks),
+	.gate_clks		= peric0_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(peric0_gate_clks),
+	.nr_clk_ids		= PERIC0_NR_CLK,
+	.clk_regs		= peric0_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(peric0_clk_regs),
+	.clk_name		= "dout_clkcmu_peric0_bus",
+};
+
 /* ---- CMU_PERIS ---------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_PERIS (0x10020000) */
@@ -1202,6 +1453,9 @@ static const struct of_device_id exynosautov9_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-fsys2",
 		.data = &fsys2_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov9-cmu-peric0",
+		.data = &peric0_cmu_info,
 	}, {
 		.compatible = "samsung,exynosautov9-cmu-peris",
 		.data = &peris_cmu_info,
-- 
2.36.0

