Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC353C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 02:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240295AbiFCCEf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 22:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236046AbiFCCEd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 22:04:33 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336C635DD9
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 19:04:30 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220603020428epoutp013ad297ed6737f365d702183bbb63021e~0_gZsPFLh1722317223epoutp01R
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 02:04:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220603020428epoutp013ad297ed6737f365d702183bbb63021e~0_gZsPFLh1722317223epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1654221868;
        bh=UTtOf85zXL4qy9IJi0G0xNbHM+kypzzRxzeINEGKtrU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RTucJ35vk/Kbv4E2eV+ZC+GgO/5EyrMG1hbW6V+kfj9Uxb2SrfC9JWlU/Guzclhqf
         +3jtEy0y9i3VHQR6UK+ePd1pqmwyZDhssS05/4TwQUWxXyE+maKCQSsbZIpFCEQind
         cWScLWCb2f0c60FLqAmxPAJUN8ZzQ9aGFCQ/thRY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220603020428epcas2p26ebe72cd24a10e5e6c44254ef5ce7c03~0_gZMBl4C1635416354epcas2p2U;
        Fri,  3 Jun 2022 02:04:28 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.88]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LDmQz1GsGz4x9Ps; Fri,  3 Jun
        2022 02:04:27 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        0C.A4.10069.B2C69926; Fri,  3 Jun 2022 11:04:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epcas2p3f50ebe570e01c7f10972a857659a5625~0_gXzuN7U1599315993epcas2p3e;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220603020426epsmtrp14bf070f6e42049c51fc9494964c3e569~0_gXxxIJv1338013380epsmtrp1i;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
X-AuditID: b6c32a45-a8fff70000002755-41-62996c2b71df
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        95.FF.08924.A2C69926; Fri,  3 Jun 2022 11:04:26 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220603020426epsmtip1272e6b0f82b21b3862457bc92983f522~0_gXkGfEN2995029950epsmtip1X;
        Fri,  3 Jun 2022 02:04:26 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 5/5] phy: samsung: ufs: support secondary ufs phy
Date:   Fri,  3 Jun 2022 11:04:10 +0900
Message-Id: <20220603020410.2976-6-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603020410.2976-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCJsWRmVeSWpSXmKPExsWy7bCmha52zswkgymrWC0ezNvGZnF5v7bF
        /CPnWC0uPO1hs+h78ZDZYu/rrewWmx5fY7WYsOobi8WM8/uYLFr3HmG32HnnBLMDt8emVZ1s
        Hneu7WHz2Lyk3qNvyypGj+M3tjN5fN4kF8AWlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pm
        YKhraGlhrqSQl5ibaqvk4hOg65aZA3SdkkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUg
        JafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7o+PtZqaCOVwVz7YeZ2pgvMLRxcjBISFgIvHk
        s28XIxeHkMAORonWo+fYIZxPjBLTbu0FcjiBnM+MErt+RYDYIA1/+o+zQBTtYpR4+mQOE4Tz
        kVFi//MeFpAqNgFdiS3PXzGCJEQE2pkkTtybCzaXWWAzo8TJCRuYQaqEBVwktvxaDNbBIqAq
        MfnwMSYQm1fAVuLGpAfsEPvkJTbM7wWr5xSwk7g+7SszRI2gxMmZT8B6mYFqmrfOZgZZICHQ
        ySGx/dkFJohmF4mnrx5DDRKWeHV8C5QtJfGyvw3KLpZYOusTE0RzA6PE5W2/2CASxhKznrUz
        goKJWUBTYv0ufUiIKUscuQW1l0+i4/Bfdogwr0RHmxBEo7rEge3TWSBsWYnuOZ9ZIWwPibNP
        nrFBQmsio8T/P0dYJzAqzELyziwk78xCWLyAkXkVo1hqQXFuemqxUYEhPIqT83M3MYKTq5br
        DsbJbz/oHWJk4mA8xCjBwawkwluya2qSEG9KYmVValF+fFFpTmrxIUZTYGBPZJYSTc4Hpve8
        knhDE0sDEzMzQ3MjUwNzJXFer5QNiUIC6YklqdmpqQWpRTB9TBycUg1MBw5Hlkh8aL6ZZ9/x
        wHC9DHeJ8TLp3703Q/kXSJrL2K/Zeegd39XgN4ytU+Yvv7qadW3AtqeG006n3xL53q4q++ek
        Ksf20/azk8vZQlekK+wxqJF9Pql5n/YttuQfm7c12X/ZJDe56nVs+bqJKjNb8rNj7q5i9+7p
        XZyzYonNv7huXnlRjxvcyQ+5vc0Olh9/vKFo/mrxwKbzB10ufMz5axJ+6FjOXlmtM9tvz+Vs
        Fz/2bfmhg0cufMpaKZm74tKW3mSJ2j/+AW9Puc//4SK5f4eFEW9L9dZv4mLKm6J3Gi96ybHn
        bndJrcolz0yz2HSxI4t6Le8HhKx+m323j2uunP+yr8E171tEj7X9czSXUmIpzkg01GIuKk4E
        AFdopi03BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsWy7bCSnK5Wzswkg7+N8hYP5m1js7i8X9ti
        /pFzrBYXnvawWfS9eMhssff1VnaLTY+vsVpMWPWNxWLG+X1MFq17j7Bb7LxzgtmB22PTqk42
        jzvX9rB5bF5S79G3ZRWjx/Eb25k8Pm+SC2CL4rJJSc3JLEst0rdL4MroeLuZqWAOV8WzrceZ
        GhivcHQxcnJICJhI/Ok/ztLFyMUhJLCDUeJL81FGiISsxLN3O9ghbGGJ+y1HWCGK3jNKNC7e
        xQSSYBPQldjy/BUjSEJEoJtJYs6mfiYQh1lgO6PEh6XrWECqhAVcJLb8WgxmswioSkw+fAys
        m1fAVuLGpAdQK+QlNszvZQaxOQXsJK5P+wpmCwHVPO97xgJRLyhxcuYTMJsZqL5562zmCYwC
        s5CkZiFJLWBkWsUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERwJWlo7GPes+qB3iJGJ
        g/EQowQHs5IIb8muqUlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2C
        yTJxcEo1MHG9D573f7WT0YrZz24c2njo26WmMJlVrcdajqfO+5KYdrsq31rur0G5/vsGXrFG
        +yvzCoNVu5piPZyq/v42+xU44WpVumirV74Ch7jewds8msWfYxYdfnouYbXbXt2ezcoFMdm2
        dU/Ed+Xe38gz/S3Tbd3YuXrPnt3kqJY0uCdwVOrdlAU1l5fKp/LO+X42cN32mnWeCsaLGLrE
        a9vL3Dln3eKzbpXX9QtZos7wnnlKplmp7AN1dfavC0Ri2Xf9vbrigITjgplZfDUKDsnnHetl
        NdqVUwy4b2uKTzuTX6EpVPDardtMw3Km5Tdl3WWii6Sv7y8InL4+P3nFarZL7asZ9lY+uN5k
        O8W+YPsKJZbijERDLeai4kQADGa5IfMCAAA=
X-CMS-MailID: 20220603020426epcas2p3f50ebe570e01c7f10972a857659a5625
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220603020426epcas2p3f50ebe570e01c7f10972a857659a5625
References: <20220603020410.2976-1-chanho61.park@samsung.com>
        <CGME20220603020426epcas2p3f50ebe570e01c7f10972a857659a5625@epcas2p3.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

To support secondary ufs phy device, we need to get an offset for phy
isolation from the syscon DT node. If the first index argument of the
node is existing, we can read the offset value and set it as isol->offset.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index 0530513f2263..22b9e04ec39b 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -288,6 +288,7 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	struct phy *gen_phy;
 	struct phy_provider *phy_provider;
 	const struct samsung_ufs_phy_drvdata *drvdata;
+	u32 isol_offset;
 	int err = 0;
 
 	match = of_match_node(samsung_ufs_phy_match, dev->of_node);
@@ -330,6 +331,10 @@ static int samsung_ufs_phy_probe(struct platform_device *pdev)
 	phy->has_symbol_clk = drvdata->has_symbol_clk;
 	memcpy(&phy->isol, &drvdata->isol, sizeof(phy->isol));
 
+	if (!of_property_read_u32_index(dev->of_node, "samsung,pmu-syscon", 1,
+					&isol_offset))
+		phy->isol.offset = isol_offset;
+
 	phy->lane_cnt = PHY_DEF_LANE_CNT;
 
 	phy_set_drvdata(gen_phy, phy);
-- 
2.36.1

