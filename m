Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013E6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 13:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA00A610A5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 18 Oct 2021 13:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhJRNXN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 18 Oct 2021 09:23:13 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39217 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJRNXM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 18 Oct 2021 09:23:12 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211018132100euoutp018d33b03305622b2eb899b356a27c0bd9~vIp-tACgC0273502735euoutp01I
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Oct 2021 13:21:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211018132100euoutp018d33b03305622b2eb899b356a27c0bd9~vIp-tACgC0273502735euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634563260;
        bh=YGnK9CKWu5SNps21wx8LkkNFpWkALShAYmaU28j7K6g=;
        h=From:To:Cc:Subject:Date:References:From;
        b=jQzVjTLvI0AnlukHZNZQWVO0TDBQPP8+Vg2rzshOYCbWwHGS542pD1MLh18G/6su8
         5ovVIlqder5O72SMOHVIE8cxPnW471i9LBag32XzDFUoMaSWRUokrVur0Epeg8ATuK
         UNm/QSDfcJ5vLMxoe1Ut9JSKz5RVpX2zmh3luDqg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211018132059eucas1p10d13cc05fb63328a155ef6246e003265~vIp-Cpb_U2231722317eucas1p12;
        Mon, 18 Oct 2021 13:20:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 3E.3E.45756.BB47D616; Mon, 18
        Oct 2021 14:20:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8~vIp_WfIsd2231322313eucas1p1C;
        Mon, 18 Oct 2021 13:20:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211018132058eusmtrp218238bf8fedbeca745dad090b36e375e~vIp_VsL7S0985809858eusmtrp2J;
        Mon, 18 Oct 2021 13:20:58 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-50-616d74bb1dc6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 21.D8.31287.AB47D616; Mon, 18
        Oct 2021 14:20:58 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211018132058eusmtip234a1057d16f6b703774ab35ec1de4eef~vIp98uXa31303613036eusmtip2h;
        Mon, 18 Oct 2021 13:20:58 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: samsung: add IDs for some core
 clocks
Date:   Mon, 18 Oct 2021 14:54:55 +0200
Message-Id: <20211018125456.8292-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsWy7djPc7q7S3ITDVqO8Vpc//Kc1eL8+Q3s
        Fh977rFazDi/j8li7ZG77BaH37SzWvy7tpHFYtWuP4wOHB47Z91l99i0qpPNo2/LKkaPz5vk
        AliiuGxSUnMyy1KL9O0SuDLa7xgXtPNVHDpZ1sB4mbuLkZNDQsBEYse5o4xdjFwcQgIrGCWW
        3ZkG5XxhlJj5diobhPOZUeJR023WLkYOsJYjv8og4stBOk4ww3V0T2tgBJnLJmAo0fW2iw3E
        FhFwkNh1bDITSBGzwFdGiYf7r4EVCQsES3xr/84CYrMIqErsWDyPHcTmFbCR2LvxFhvEgfIS
        qzccANsgIdDKIbHi+iRmiISLREfbU3YIW1ji1fEtULaMxP+d85kgGpqBtp1byw7h9DBKXG6a
        wQhRZS1x59wvNpCHmAU0Jdbv0ocIO0q8/7aXCeJPPokbbwVBwsxA5qRt05khwrxAe4UgqtUk
        Zh1fB7f24IVLUKd5SHybN5cFpFxIIFbi+OfECYxysxBWLWBkXMUonlpanJueWmyYl1quV5yY
        W1yal66XnJ+7iRGYCE7/O/5pB+PcVx/1DjEycTAeYpTgYFYS4U1yzU0U4k1JrKxKLcqPLyrN
        SS0+xCjNwaIkzrtq9pp4IYH0xJLU7NTUgtQimCwTB6dUA5OGyw02VdfVp9aKzHaOaBLLmXjr
        xf49HWVcET7h6yTsZ66PePz+0bHI7aV5jmGhLeoR0p7pziYLWY1577zb/S/R2+xwmMK6acoz
        NG8Leu7+NEGw6ID0V9PCUJaIm42bPiRt5Y265JKoPDn2F3e00hrr9WrSkyRK41h45BOaRSqm
        /tnnsrkvm9dfr6Ppd6fEmozOjM4ns1RVErRmbZhyLmZB6EeFQ4WBWZ+6Vp5jtfxx8kjfkmcV
        /Oue7rhwYw9Pw7Nk5l3TX94yEd1RHr72wdafDm93nQo8whIxfcuGSvaVCfFFb5ZHP3uxzDN7
        /rxH81fKdic8nvcv5e1T7mlmfzc3PKu7sLW7qOGN9o1PLIlKLMUZiYZazEXFiQCp2uX1cwMA
        AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsVy+t/xe7q7SnITDZ7PU7C4/uU5q8X58xvY
        LT723GO1mHF+H5PF2iN32S0Ov2lntfh3bSOLxapdfxgdODx2zrrL7rFpVSebR9+WVYwenzfJ
        BbBE6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GW0
        3zEuaOerOHSyrIHxMncXIweHhICJxJFfZV2MXBxCAksZJWZe/crYxcgJFJeRODmtgRXCFpb4
        c62LDaLoE6NE45HXzCAJNgFDia63IAlODhEBJ4lHn2+ygxQxC/xklDi+6gU7SEJYIFBi0vlH
        YFNZBFQldiyeBxbnFbCR2LvxFhvEBnmJ1RsOME9g5FnAyLCKUSS1tDg3PbfYUK84Mbe4NC9d
        Lzk/dxMjMAC3Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuFNcs1NFOJNSaysSi3Kjy8qzUktPsRo
        CrRvIrOUaHI+MAbySuINzQxMDU3MLA1MLc2MlcR5t85dEy8kkJ5YkpqdmlqQWgTTx8TBKdXA
        5FjjwxSms0DJSLXx3LWnJgZXjvovlo4J9xW9kHvmv9ezl+l3n+3aqzFzGqeHywoNlwtp09M3
        cN7s6Y5NPezfocS+OP7I2VWnxQuniR9gv7W0mqdnxYUE98KXQsf4+NdvV5vLEXs8pOvPL51t
        px4dOGnO5Vavs7AvfUW3gtovjxW2950fFfqf1ut+VXt67+xTyrOeamtnz/1fxXdus0yw8zzJ
        GYkSm148f7k1SqT2bcC0hvr8ha9/MXlyTn1+6MKHdYGZwlei3tmvZXVYvWgFkzLPd629b97f
        n9HuMfvY+W++++41XPSS3N0WbvFwyewvyv4HTGcZ+q3gDZTZ+3llS4LuyS0Mi5OOui4P0vS2
        Y1RiKc5INNRiLipOBAAndxzUyQIAAA==
X-CMS-MailID: 20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8
References: <CGME20211018132058eucas1p1d1549596c1320aa725f4d88ffef91ad8@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add IDs for some core clocks referenced during the boot process.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 include/dt-bindings/clock/exynos4.h    | 4 +++-
 include/dt-bindings/clock/exynos5250.h | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index 88ec3968b90a..acbfbab875ec 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -209,6 +209,7 @@
 #define CLK_ACLK400_MCUISP	395 /* Exynos4x12 only */
 #define CLK_MOUT_HDMI		396
 #define CLK_MOUT_MIXER		397
+#define CLK_MOUT_VPLLSRC	398
 
 /* gate clocks - ppmu */
 #define CLK_PPMULEFT		400
@@ -236,9 +237,10 @@
 #define CLK_DIV_C2C		458 /* Exynos4x12 only */
 #define CLK_DIV_GDL		459
 #define CLK_DIV_GDR		460
+#define CLK_DIV_CORE2		461
 
 /* must be greater than maximal clock id */
-#define CLK_NR_CLKS		461
+#define CLK_NR_CLKS		462
 
 /* Exynos4x12 ISP clocks */
 #define CLK_ISP_FIMC_ISP		 1
diff --git a/include/dt-bindings/clock/exynos5250.h b/include/dt-bindings/clock/exynos5250.h
index e259cc01f22f..4680da7357d3 100644
--- a/include/dt-bindings/clock/exynos5250.h
+++ b/include/dt-bindings/clock/exynos5250.h
@@ -19,6 +19,7 @@
 #define CLK_FOUT_EPLL		7
 #define CLK_FOUT_VPLL		8
 #define CLK_ARM_CLK		9
+#define CLK_DIV_ARM2		10
 
 /* gate for special clocks (sclk) */
 #define CLK_SCLK_CAM_BAYER	128
@@ -174,8 +175,9 @@
 #define CLK_MOUT_ACLK300_DISP1_SUB	1027
 #define CLK_MOUT_APLL		1028
 #define CLK_MOUT_MPLL		1029
+#define CLK_MOUT_VPLLSRC	1030
 
 /* must be greater than maximal clock id */
-#define CLK_NR_CLKS		1030
+#define CLK_NR_CLKS		1031
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS_5250_H */
-- 
2.17.1

