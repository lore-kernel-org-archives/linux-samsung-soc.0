Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A309C19F2C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Jul 2022 00:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbiG2AgY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 20:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233681AbiG2AgV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 20:36:21 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827D57392E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Jul 2022 17:36:19 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220729003613epoutp03690e771ed27f996fe4d939444f45970c~GJbVhMnJ11104211042epoutp03T
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2022 00:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220729003613epoutp03690e771ed27f996fe4d939444f45970c~GJbVhMnJ11104211042epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659054973;
        bh=Gr6TMsv6p+Dd55Io3wqeJ4BFllPq1nJVfMDMFtqdqx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RD9Te9FFjGWYFn3UGoYzrqxPTknxbuRofOpab95qupaTMPE28LAm+HXds2QYT0jL3
         w7miuNJDpiWTjxKnkscPFvQrLgquEu5tvUgdX0QXtE26AP+93LOxFKSPa/+mz4wmPP
         kcoo1dv4cjRdcuPj4TouMCCF6Acg92Bfsuqa13js=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220729003612epcas2p210ebd3b4e1b3f0e0995a552956cdcdbc~GJbU2rUnz2630726307epcas2p2X;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.90]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Lv7qJ47psz4x9Q5; Fri, 29 Jul
        2022 00:36:12 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        1D.78.09642.C7B23E26; Fri, 29 Jul 2022 09:36:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003612epcas2p280d8bd61f755ab6234b60030bc2cf7f9~GJbT_kcm23088830888epcas2p2t;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220729003612epsmtrp20922aa9392acf540b642a4b6adaf2522~GJbT9lm4k1035210352epsmtrp2b;
        Fri, 29 Jul 2022 00:36:12 +0000 (GMT)
X-AuditID: b6c32a47-dff43a80000025aa-7e-62e32b7c80e8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B9.1B.08905.B7B23E26; Fri, 29 Jul 2022 09:36:11 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220729003611epsmtip2d5af1d0662def5d8579b91754ca2791f~GJbTvQ39H0066700667epsmtip2M;
        Fri, 29 Jul 2022 00:36:11 +0000 (GMT)
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
Subject: [PATCH v2 2/6] dt-bindings: clock: exynosautov9: add fsys1 clock
 definitions
Date:   Fri, 29 Jul 2022 09:30:20 +0900
Message-Id: <debb6335cb2bcc935f7572bed25d76a85e80cfaa.1659054220.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <cover.1659054220.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFJsWRmVeSWpSXmKPExsWy7bCmuW6N9uMkg2XbZS0ezNvGZnF5v7bF
        9S/PWS3mHznHatH34iGzxd7XW9ktNj2+xmrxseceq8WM8/uYLC6ecrVo3XuE3eLwm3ZWi3/X
        NrJYPO8Diq/a9YfRgd/j/Y1Wdo+ds+6ye2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA9Ktsm
        IzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB+hqJYWyxJxS
        oFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6BeYFecWJucWleul5eaomVoYGBkSlQYUJ2RuP3
        H6wFq7krXs8LbWB8wNnFyMEhIWAisXRtZBcjF4eQwA5Gib99/9ghnE+MEmuOPGaEcL4xSnTO
        /cvaxcgJ1vHx7mdmiMReRomDu9exQDgfGSU6Pr5kAqliE9CV2PL8FVi7iMBjJonDR9rYQBxm
        gTYmiWnPNoLNEhYIl9h8v40J5BIWAVWJF93pIGFegXiJFU9WMkKsk5e4frONGcTmFLCV6Gr6
        zgJRIyhxcuYTMJsZqKZ562ywkyQEtnBILO7qZoZodpHY9LSNCcIWlnh1fAs7hC0l8fndXjYI
        u1hi6axPTBDNDYwSl7f9gkoYS8x61s4IchyzgKbE+l36kBBTljhyC2ovn0TH4b/sEGFeiY42
        IYhGdYkD26ezQNiyEt1zPrNClHhIXL3jAAmrCYwSv29OY5zAqDALyTezkHwzC2HvAkbmVYxi
        qQXFuempxUYFxvAITs7P3cQITsRa7jsYZ7z9oHeIkYmD8RCjBAezkghvQvT9JCHelMTKqtSi
        /Pii0pzU4kOMpsCgnsgsJZqcD8wFeSXxhiaWBiZmZobmRqYG5krivF4pGxKFBNITS1KzU1ML
        Uotg+pg4OKUamOTZdse+ieKq9p0TZtW3NiVo2vQTT0qPv+ZrldvzRHniyRsMMR/0LA67Z//Q
        LajbzhPy+/Pf4i0iVsIBmxeG3DqhEnD53oNFv8NW9z2Qt+v1mxiQGLHORbJhj0dLevfHimmq
        r2JyxTZFrbUsWSfOoZcd0bNqt97kKUGRXInJp0MjHkco8ZvenZKkOPWhXWiptZ+xjoifytZE
        Ael+hjDmbPsDlhGXvv95F7oi8UaWv+7cmYzc/B83bnZ5G9b3WLpc9WBviW2z2JWaJ2WbEyRW
        Xd90+/mCKTUsjX0rFjdHG53mkf5k/f75bbedbqf/5TEbrVn/Rmtb7fz/S1ZaKmicaLw4q15d
        5r7A+d8dW7znKrEUZyQaajEXFScCAFXBwhRNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWy7bCSvG619uMkg/9NlhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYu/rrewWmx5fY7X42HOP1WLG+X1MFhdPuVq07j3CbnH4TTurxb9r
        G1ksnvcBxVft+sPowO/x/kYru8fOWXfZPTat6mTzuHNtD5vH5iX1Hn1bVjF6fN4kF8AexWWT
        kpqTWZZapG+XwJXR+P0Ha8Fq7orX80IbGB9wdjFyckgImEh8vPuZuYuRi0NIYDejxP/LX1gh
        ErISz97tYIewhSXutxxhhSh6zyhx5+JaRpAEm4CuxJbnrxhBEiICz5kkpqw4COYwC3QxSdxp
        +wTWLiwQKnGq9wxTFyMHB4uAqsSL7nSQMK9AvMSKJysZITbIS1y/2cYMYnMK2Ep0NX1nAbGF
        BGwktixbxAZRLyhxcuYTsDgzUH3z1tnMExgFZiFJzUKSWsDItIpRMrWgODc9t9iwwDAvtVyv
        ODG3uDQvXS85P3cTIzhqtDR3MG5f9UHvECMTB+MhRgkOZiUR3oTo+0lCvCmJlVWpRfnxRaU5
        qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MBXsW9z2z8T8vzqf8AsmVdNJ9e0a
        1XO/P1e6eeRWxBOdylf6eyIexwquNNW8mJ8dLRWrN+X9vFyRCx1VUzyOVjhssbVO87wa2LQ/
        aWtkT8R3nuUJCw5wX2Or9Vxy8IDNhdv5TMbzz279uuP0Y06uVQ77PxYGcj1pfv7nYdYSz1yD
        ssKWP//O2tkv7g/SvHZiyWvFO0wnv+uzXngaxrcn6sBVbp2rvf9eujN1TglpYfm8uNO9ev+8
        IMYtCz23TNs3t009/3rCiXKNK4EBxQdnh3+4VPB+vWROw/aXRod2m23R/Lj5zYG6iwlaqSVB
        avf38nanTQmt1GP7z3JqRebVVy5fTp18GmdgeSho3fHjVT1KLMUZiYZazEXFiQCvoNc8CQMA
        AA==
X-CMS-MailID: 20220729003612epcas2p280d8bd61f755ab6234b60030bc2cf7f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220729003612epcas2p280d8bd61f755ab6234b60030bc2cf7f9
References: <cover.1659054220.git.chanho61.park@samsung.com>
        <CGME20220729003612epcas2p280d8bd61f755ab6234b60030bc2cf7f9@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add fsys1(for usb and mmc) clock definitions.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../dt-bindings/clock/samsung,exynosautov9.h  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
index 6305a84396ce..ffa44b3bdd2b 100644
--- a/include/dt-bindings/clock/samsung,exynosautov9.h
+++ b/include/dt-bindings/clock/samsung,exynosautov9.h
@@ -228,6 +228,31 @@
 
 #define FSYS0_NR_CLK			37
 
+/* CMU_FSYS1 */
+#define FOUT_MMC_PLL				1
+
+#define CLK_MOUT_FSYS1_BUS_USER			2
+#define CLK_MOUT_FSYS1_MMC_PLL			3
+#define CLK_MOUT_FSYS1_MMC_CARD_USER		4
+#define CLK_MOUT_FSYS1_USBDRD_USER		5
+#define CLK_MOUT_FSYS1_MMC_CARD			6
+
+#define CLK_DOUT_FSYS1_MMC_CARD			7
+
+#define CLK_GOUT_FSYS1_PCLK			8
+#define CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN		9
+#define CLK_GOUT_FSYS1_MMC_CARD_ACLK		10
+#define CLK_GOUT_FSYS1_USB20DRD_0_REFCLK	11
+#define CLK_GOUT_FSYS1_USB20DRD_1_REFCLK	12
+#define CLK_GOUT_FSYS1_USB30DRD_0_REFCLK	13
+#define CLK_GOUT_FSYS1_USB30DRD_1_REFCLK	14
+#define CLK_GOUT_FSYS1_USB20_0_ACLK		15
+#define CLK_GOUT_FSYS1_USB20_1_ACLK		16
+#define CLK_GOUT_FSYS1_USB30_0_ACLK		17
+#define CLK_GOUT_FSYS1_USB30_1_ACLK		18
+
+#define FSYS1_NR_CLK				19
+
 /* CMU_FSYS2 */
 #define CLK_MOUT_FSYS2_BUS_USER		1
 #define CLK_MOUT_FSYS2_UFS_EMBD_USER	2
-- 
2.37.1

