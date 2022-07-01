Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF88C43334
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Jul 2022 01:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbiGABzD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 21:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbiGABzB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 21:55:01 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8945936B42
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 18:54:57 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220701015452epoutp04f9a6e40c56a3ecbd34b476cf1b665f77~9kcAuPjAh3131531315epoutp04c
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:54:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220701015452epoutp04f9a6e40c56a3ecbd34b476cf1b665f77~9kcAuPjAh3131531315epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656640492;
        bh=oidN89dlBynLlbLQyuEafPOUpPx7Zx7DbfKImEbpTlA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BTuWrTzvNUeEzeBjM07lqhdYEB/Zrbs/dfN1LWVWSNwK7PZROpbAw/927dVYz2pdI
         YEgi5J5OL9zDuBGjJl/RolTbDzqQA27tQPr5XiwTzbBFp7z26vcgZwsU0CELF/YyKZ
         xM9B/3BtNlW5EzdgoEGP6kSRfrim3Ipl+ASpVbLM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220701015451epcas2p15f48508f8be36e75d20b4e51b689b0b4~9kcAJu6wK2287322873epcas2p1J;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.91]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4LYytz42Z4z4x9Pp; Fri,  1 Jul
        2022 01:54:51 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        7F.1B.09642.BE35EB26; Fri,  1 Jul 2022 10:54:51 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220701015451epcas2p4d9fcc589d5d1afdbc80903274247891b~9kb-ZsusF1287912879epcas2p46;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220701015451epsmtrp187684f68f5b43e1ef07470411f7deffa~9kb-WkUNS0936309363epsmtrp1X;
        Fri,  1 Jul 2022 01:54:51 +0000 (GMT)
X-AuditID: b6c32a47-5f7ff700000025aa-7b-62be53ebd977
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        23.43.08802.AE35EB26; Fri,  1 Jul 2022 10:54:50 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220701015450epsmtip22cfc5c4f4530b9b24b12e24a571acdfd~9kb-GXkFo0265702657epsmtip2F;
        Fri,  1 Jul 2022 01:54:50 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 1/5] dt-bindings: soc: samsung: usi: add exynosautov9-usi
 compatible
Date:   Fri,  1 Jul 2022 10:52:22 +0900
Message-Id: <20220701015226.32781-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701015226.32781-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmhe7r4H1JBtM3yFs8mLeNzeLyfm2L
        +UfOsVrsaDjCatH34iGzxabH11gtZpzfx2TRuvcIu8Xzvn1MDpwem1Z1snncubaHzWPzknqP
        vi2rGD0+b5ILYI3KtslITUxJLVJIzUvOT8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLx
        CdB1y8wBOkdJoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BeoFecmFtcmpeul5da
        YmVoYGBkClSYkJ1x7tIb9oLNHBVLrjg3ML5i62Lk5JAQMJG4v3grYxcjF4eQwA5GiYfr3rNA
        OJ8YJTpPP2QGqRIS+MwocWVqIkxH116Yol2MEu2nbkM5Hxklms61MoJUsQnoSmx5/grMFhGI
        l3h+AaKDWWASk8T5jmawscICkRL/nq5lB7FZBFQlWq4eBrN5Bewkbi6+wwqxTl5iw/xesHpO
        AXuJf/vnQtUISpyc+YQFxGYGqmneOpsZZIGEwEd2iROrHjBCNLtIPJq2AWqQsMSr41vYIWwp
        iZf9bVB2scTSWZ+YIJobGCUub/sFDRpjiVnP2oEGcQBt0JRYv0sfxJQQUJY4cgtqL59Ex+G/
        7BBhXomONiGIRnWJA9uns0DYshLdcz5DXeAhcfNNLxMksCYxSuydMYVtAqPCLCTvzELyziyE
        xQsYmVcxiqUWFOempxYbFRjDYzg5P3cTIzh5arnvYJzx9oPeIUYmDsZDjBIczEoivGzz9iYJ
        8aYkVlalFuXHF5XmpBYfYjQFBvZEZinR5Hxg+s4riTc0sTQwMTMzNDcyNTBXEuf1StmQKCSQ
        nliSmp2aWpBaBNPHxMEp1cDU4MPYtYnHY6/+1t2P+PXLeq4nvmZd+HHeErHjEprWQRP/B226
        rv9aO2vNws719196nqzlmXwjaeNjKU3JN+2Oa/g1d75ifHSlfpKwvV/itO+3gwSba0y3zk29
        ImksLXr92XW3TR/LLxSZu2tfk/E8Xff+YKu+pUuN24pe95wLMUfKo/KPMc2b9H2JWuKk77zS
        NV2s/7glGNZ+kljj7LTmd4UWV+6Rgizday4P3Xk8Xh6aW5M6TfJ+lo/T863xJd+bcp9OP8X4
        vpHVa5r4yf/3F/vqX+xsqNivLSq6x8Drx78Orz18S+eYVPP8rdwuv/aVt/7pZ25rN0eW/zP9
        WjFxdqvPXBGXKXbpKU8Mci8osRRnJBpqMRcVJwIA9s6N8CcEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWy7bCSvO7r4H1JBqtTLB7M28ZmcXm/tsX8
        I+dYLXY0HGG16HvxkNli0+NrrBYzzu9jsmjde4Td4nnfPiYHTo9NqzrZPO5c28PmsXlJvUff
        llWMHp83yQWwRnHZpKTmZJalFunbJXBlnLv0hr1gM0fFkivODYyv2LoYOTkkBEwkuva+Z+li
        5OIQEtjBKPH/zEFGiISsxLN3O9ghbGGJ+y1HWCGK3jNKLF3bxgySYBPQldjy/BVYg4hAvMTm
        LwvBJjELTGOS6Hg8A6xbWCBc4vPtT2DrWARUJVquHgaL8wrYSdxcfIcVYoO8xIb5vWBDOQXs
        Jf7tnwtWIwRUs/rdbWaIekGJkzOfsIDYzED1zVtnM09gFJiFJDULSWoBI9MqRsnUguLc9Nxi
        wwKjvNRyveLE3OLSvHS95PzcTYzgINfS2sG4Z9UHvUOMTByMhxglOJiVRHjZ5u1NEuJNSays
        Si3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFqEUyWiYNTqoFJ89h2bq6taetqOS8e
        Ed6SbHB+KnPOIutpSlulfGs3b0xfIlWVc3OzffDb7Z8lwnvZfLw39sw96mCQUXX5hVLHDk2e
        BpHgMsezX63kIx6pGt/bbOuqO7HpxfOSb/ec6wyCfnTzWvIcN/1Y+Hov14SYT6cc7Qu7uee/
        YNg/W0ToXUllk+GSnm2zPH6GVe+3eZwVE85zftLhBjWhTa490csdZM9P1SiICl2btr3B/Ehp
        /xtnaz+fuZaRWd8CLgRrfHXum7jzbJGP59WXARnPFq3YnfBk9xxRVc6Gum/z/aef32uWeJzR
        +/IN/kPCC0LPrTt6799fUZ5lt5p2uCvPsSstDL4aluN5PDK19crXhaFKLMUZiYZazEXFiQDe
        qh4X4QIAAA==
X-CMS-MailID: 20220701015451epcas2p4d9fcc589d5d1afdbc80903274247891b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220701015451epcas2p4d9fcc589d5d1afdbc80903274247891b
References: <20220701015226.32781-1-chanho61.park@samsung.com>
        <CGME20220701015451epcas2p4d9fcc589d5d1afdbc80903274247891b@epcas2p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add samsung,exynosautov9-uart dedicated compatible for representing
usi of Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index fde886a8cf43..6e806e950a36 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -22,8 +22,12 @@ properties:
     pattern: "^usi@[0-9a-f]+$"
 
   compatible:
-    enum:
-      - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
+    oneOf:
+      - items:
+          - const: samsung,exynosautov9-usi
+          - const: samsung,exynos850-usi
+      - enum:
+          - samsung,exynos850-usi   # for USIv2 (Exynos850, ExynosAutoV9)
 
   reg: true
 
-- 
2.36.1

