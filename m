Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EFFC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Feb 2022 13:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243836AbiBTN1T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Feb 2022 08:27:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238186AbiBTN1S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Feb 2022 08:27:18 -0500
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC54F32EF7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 05:26:55 -0800 (PST)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220220132648epoutp02be68371945d63aa5337cdc0d442bd16e~VgXweRPRF2092820928epoutp02a
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Feb 2022 13:26:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220220132648epoutp02be68371945d63aa5337cdc0d442bd16e~VgXweRPRF2092820928epoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1645363608;
        bh=cnyxtRrWbeih/IsRFZWojusqHAb9pkqNvcPgg6+wo9w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VaIe7qO4/8pybZaqY/kFO4OQW3C/8GvAfAyXaVbFvTCFTrc/J9UV/ew5gWOHbBvgS
         KxxzoGhqmCm9x8E9mYHffzNdgcmhIX9wYoeGFN7XvT/daK1Mc5EaNqlF1kI1zxlCPv
         oOn8t7vfEPXfDq8FrYn1rawMTffjZqylA5ad+pMw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTP id
        20220220132647epcas5p47ba7f49cdac3bc6a9b33ecb5bc72791e~VgXvUk-pt2772027720epcas5p4q;
        Sun, 20 Feb 2022 13:26:47 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4K1mRj5yYfz4x9Pr; Sun, 20 Feb
        2022 13:26:41 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1B.EB.06423.F8142126; Sun, 20 Feb 2022 22:26:39 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20220220132640epcas5p1a523e6db151e0cb76c0edb6d32959fe5~VgXo52BYI0740907409epcas5p11;
        Sun, 20 Feb 2022 13:26:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220220132640epsmtrp169912302bd2de67cef39c6566e19fec7~VgXo9ftea0610706107epsmtrp1Z;
        Sun, 20 Feb 2022 13:26:40 +0000 (GMT)
X-AuditID: b6c32a49-b01ff70000001917-ea-6212418f0b82
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        8F.AD.29871.E8142126; Sun, 20 Feb 2022 22:26:38 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220220132639epsmtip176e169ab4ee7ec4766e505fbcf966009~VgXnjvWMC2735827358epsmtip1P;
        Sun, 20 Feb 2022 13:26:39 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, pankaj.dubey@samsung.com,
        m.szyprowski@samsung.com, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 2/3] clocksource/drivers/exynos_mct: bump up mct max irq
 number
Date:   Sun, 20 Feb 2022 19:08:23 +0530
Message-Id: <20220220133824.33837-2-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220133824.33837-1-alim.akhtar@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLKsWRmVeSWpSXmKPExsWy7bCmlm6/o1CSweSXVhYP5m1js5j3WdZi
        49sfTBabHl9jtbi8aw6bxYzz+5gs1h65y26xaOsXdovNm6YyO3B6zGroZfO4c20Pm8e7c+fY
        PTYvqffo27KK0ePzJrkAtqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE
        3FRbJRefAF23zBygm5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BSYFesWJucWl
        eel6eaklVoYGBkamQIUJ2RlTGr4zFexhrZjwzaeB8ShLFyMnh4SAicT2rwdYuxi5OIQEdjNK
        tB3qZ4RwPjFKzJlwignC+cYoca9pKxNMy6zmM+wgtpDAXkaJ3ifhEEUtTBItjVuZQRJsAtoS
        d6dvAWsQEXCTuNHYATaJWeAao8SfiYcYQRLCAiES1z7NBpvEIqAqMev7brA4r4CNxNur76EO
        lJdYveEA0FAODk4BW4lbncYQ4WvsEi92hELYLhLHbm1jhbCFJV4d38IOYUtJvOxvYwdplRDI
        lujZBdVaI7F03jGo6fYSB67MYQEpYRbQlFi/Sx8kzCzAJ9H7+wkTRCevREebEES1qkTzu6tQ
        ndISE7u7oZZ6SHw8eo0NEgoTGCWO3JvFPoFRdhbC1AWMjKsYJVMLinPTU4tNCwzzUsvhsZSc
        n7uJEZzOtDx3MN598EHvECMTB+MhRgkOZiUR3g8HeZOEeFMSK6tSi/Lji0pzUosPMZoCA2wi
        s5Rocj4woeaVxBuaWBqYmJmZmVgamxkqifOeTt+QKCSQnliSmp2aWpBaBNPHxMEp1cDky7/x
        duydOQtk/kRXCTVf4VhaPWep8Wdes59qbnUcHWeVs65Z/lz5fYqoirn/1T0HD1aX1fF9VMw9
        5HXwyonFJ1OuJErFp8dW2d98LvxzRvid50cDdnJLfTd4t0BWqP/zAc3qkKXGTEc8lfP8H/9b
        7vb5CPOFMxayU19vSbq6XU71/6QVx1OzutI97x+XNtxqJHH7OYtt5arVd3/6JwlPORS2uGnO
        XtmXkyuaVm3fvkzF1lS2+NO1qNjqGoGLyi7PTUQYZkV9/+FRufVvTm/G9J4XnDZOX+TVZDbv
        vPxoy5Kj5lcVeS4eLOw3Ey+cY7iLq0rwuGpEzmuF8mzTvUmrrNbdyzRtkU+6zqnS0hyuxFKc
        kWioxVxUnAgAVU1fxfADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWy7bCSnG6fo1CSwfSdlhYP5m1js5j3WdZi
        49sfTBabHl9jtbi8aw6bxYzz+5gs1h65y26xaOsXdovNm6YyO3B6zGroZfO4c20Pm8e7c+fY
        PTYvqffo27KK0ePzJrkAtigum5TUnMyy1CJ9uwSujCkN35kK9rBWTPjm08B4lKWLkZNDQsBE
        YlbzGfYuRi4OIYHdjBIHni2DSkhLXN84gR3CFpZY+e85VFETk8Sl7+1MIAk2AW2Ju9O3gNki
        Ah4Sbf/uMYMUMQvcY5T43TKNESQhLBAksWDKI1YQm0VAVWLW991gcV4BG4m3V99DbZOXWL3h
        AFAzBwengK3ErU5jkLAQUMnsu/uZJzDyLWBkWMUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpec
        n7uJERyOWpo7GLev+qB3iJGJg/EQowQHs5II74eDvElCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
        eS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MNW7TD97SeH9mvcSjXbxX+4Fvi8IT4je7xxorMVe
        cKbU5+G8afKn8ieIPFQ6d/bP/ovTvVcuatwv5Cfsnbz7R/91ttebPwoaznBlEL23oCnw2IS1
        JzaqP7TnjXo721mMd19QROjf2Ht7Pzem6Gdf1jW0cNv4cMaxebcVOBolHMUO9taxystHFiau
        /vfZLyk0+amSrp+3CJ+zoprzgwIbbpYtxa+s9CQlGD89rt+kdXvVxN+fg6e8bjjPey7u9XbH
        BVefXjBy0La8sKnNW7WuZvmHCUV8l9a6TO29pXTf+oRjEeMp55tmIhNOBc8+cDNAQunrkwlr
        dOIi/O1eeWTER/wvmLcgN/LiQ5PZlvJJe5VYijMSDbWYi4oTATjObqe2AgAA
X-CMS-MailID: 20220220132640epcas5p1a523e6db151e0cb76c0edb6d32959fe5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220220132640epcas5p1a523e6db151e0cb76c0edb6d32959fe5
References: <20220220133824.33837-1-alim.akhtar@samsung.com>
        <CGME20220220132640epcas5p1a523e6db151e0cb76c0edb6d32959fe5@epcas5p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Bump-up maximum number of MCT IRQ to match the binding
documentation.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index b3f3d27a837b..0c7931f7f99a 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -64,7 +64,8 @@
 #define MCT_G0_IRQ	0
 /* Local timers count starts after global timer count */
 #define MCT_L0_IRQ	4
-#define MCT_NR_IRQS	12
+/* Max number of IRQ as per DT binding document */
+#define MCT_NR_IRQS	20
 
 enum {
 	MCT_INT_SPI,
-- 
2.25.1

