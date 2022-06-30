Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB22C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 02:19:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbiF3CT6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 22:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiF3CT5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 22:19:57 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB29736B61
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 19:19:55 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220630021952epoutp02b5cc37c98d80a53d7373eb0448fa8b40~9RIjo-jEs0344003440epoutp02O
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 02:19:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220630021952epoutp02b5cc37c98d80a53d7373eb0448fa8b40~9RIjo-jEs0344003440epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656555592;
        bh=GtOtG8CCU/OnV5j+u3rBano411OPwWIi7Y+uQfdrQf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bvq8qmiwpysxNzaRxI5BO1at/e8MmY91gTxy7fqW5uNDxx9GNmfsMcNE/6gxTTVtI
         9Q3UQq4hj7Qsm6tNAWGFJesG9XejkSVVpc4GzQK0wJzo6rFhrx5R022QhLj2iZVhnM
         H6bsaxzp7pCqLJ2j2f98wE6rHoQxu03qnlUBzNTs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220630021952epcas2p26e9a91a4f53ca9b2520fb9f2a16a7a01~9RIjDQyRN0853708537epcas2p2p;
        Thu, 30 Jun 2022 02:19:52 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4LYMVH5lRkz4x9Q4; Thu, 30 Jun
        2022 02:19:51 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        97.47.09662.7480DB26; Thu, 30 Jun 2022 11:19:51 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd~9RIiYLVOK0853708537epcas2p2l;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220630021951epsmtrp2f3a6f5f975157e042f0bbf27e399a370~9RIiXf8gz1699116991epsmtrp2Y;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
X-AuditID: b6c32a48-9f7ff700000025be-24-62bd0847d378
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E7.06.08802.7480DB26; Thu, 30 Jun 2022 11:19:51 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220630021951epsmtip2e04a391a23bb74bedc4a42f34116a4b2~9RIiMvnf_3173531735epsmtip2Z;
        Thu, 30 Jun 2022 02:19:51 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 1/4] dt-bindings: soc: samsung: usi: add exynosautov9-usi
 compatible
Date:   Thu, 30 Jun 2022 11:16:53 +0900
Message-Id: <8d7029cdf7b2ce0d1c43e6f91b3b9fdadece08ee.1656554759.git.chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656554759.git.chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRmVeSWpSXmKPExsWy7bCmma47x94kg4ZWHYsH87axWVzer20x
        /8g5VosdDUdYLfpePGS22PT4GqvFjPP7mCxa9x5ht3jet4/JgdNj06pONo871/aweWxeUu/R
        t2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJuam2Si4+
        AbpumTlA5ygplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL89L18lJL
        rAwNDIxMgQoTsjMmPz/BUvCLvaKpr5GtgXEbWxcjJ4eEgInEsqUvGbsYuTiEBHYwSsy+94AN
        wvnEKLH//D12COczo8Tv3sPsMC1HNv5ihUjsYpS4+/AUC0hCSOAjo8TyC9EgNpuArsSW568Y
        QWwRgXiJ5xfes4A0MAtMYpI439HMDJIQFoiUuNq7DcxmEVCVWNP0BMjm4OAFaui85A2xTF5i
        w/xesBJOAVuJprXfwWxeAUGJkzOfgO1lBqpp3jqbGWS+hMBXdomfp09BPecicfbcFmYIW1ji
        1fEtUB9ISXx+txeqplhi6axPTBDNDYwSl7f9gkoYS8x61s4IchCzgKbE+l36IKaEgLLEkVtQ
        e/kkOg7/ZYcI80p0tAlBNKpLHNg+nQXClpXonvOZFcL2kHhzdyE0qCcwSnzbfZNlAqPCLCTv
        zELyziyExQsYmVcxiqUWFOempxYbFZjAYzg5P3cTIzh5annsYJz99oPeIUYmDsZDjBIczEoi
        vAvP7EwS4k1JrKxKLcqPLyrNSS0+xGgKDOuJzFKiyfnA9J1XEm9oYmlgYmZmaG5kamCuJM7r
        lbIhUUggPbEkNTs1tSC1CKaPiYNTqoFJxKFkX8xWfe5VCs63TsjeWnCzNvbyyTRenVNZE/RN
        zm+zfVx+v/3jGrv6/4/+zV3fWx39YZ+uksWFCP985pwqm+euSh8PSh8zj9Z4LKi9+vEDqTfB
        O4TDXT7OPfw2+uICV/1ZVYqBgsJiIbofq30XNGz6eUPlZrM7q1nbMqaNtam2WT4XnHfMmzyj
        6HzdhtUiGxe9+m/CoJElKGw3r5b3hvK3OUf2eJccux96SFkj/ZZ57qszvQemtBieu3lrQfz3
        VY9NAvfMTHy8IkvbrV01uWaJe83JgMBTemxfFDxuKoi3Wq+K3dz4sLtKePUSy2mClkEnY1p3
        1gUs81Mq+NC7759VYWulWcJEnZun3V8psRRnJBpqMRcVJwIATU6eEScEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHLMWRmVeSWpSXmKPExsWy7bCSvK47x94kg9m7RC0ezNvGZnF5v7bF
        /CPnWC12NBxhteh78ZDZYtPja6wWM87vY7Jo3XuE3eJ53z4mB06PTas62TzuXNvD5rF5Sb1H
        35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZUx+foKl4Bd7RVNfI1sD4za2LkZODgkBE4kjG3+x
        gthCAjsYJfYcloaIy0o8e7eDHcIWlrjfcgSohguo5j2jRPPt92ANbAK6Eluev2IEsUUE4iU2
        f1nIAlLELDCNSaLj8QywbmGBcInO5V+YQWwWAVWJNU1PgGwODl6ghs5L3hAL5CU2zO8FK+EU
        sJVoWvudGeIgG4ndC5aCzecVEJQ4OfMJC4jNDFTfvHU28wRGgVlIUrOQpBYwMq1ilEwtKM5N
        zy02LDDKSy3XK07MLS7NS9dLzs/dxAgOci2tHYx7Vn3QO8TIxMF4iFGCg1lJhHfhmZ1JQrwp
        iZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTAJrrFgzzju9f7U
        1oCH86IYN6zuNqjbaJbWc3L91SU8e1wsfDzOtnq26H9+mTvLefG+HMV+wZXfnorbvH9i7fi0
        qXFDR8f8qZ89TRNiV25WzOsNfJOyV2VStuaJmNUdNnN+uEy5e2970dadUjOfpNr9M11/efGm
        O2I9ZkpT9oT21TTmHvz0ed5PoR8CHQnvpivnBv6wTJ+3eYdHwrsud75JWgK6DTYKF8QMWZsO
        ffmy/s7xNLY3KjdC/pmuNG04vv/kLc2b1U4qwZ9uxSrlc7Syey413ifG6pd/9kqnaFiS0WTx
        k3+W3sjMXrY0Ydf6/1Ld/SH/9htOSdxbN8mwPNpjo+qq82ElafO3zVV7v3CWEktxRqKhFnNR
        cSIASvLzEeECAAA=
X-CMS-MailID: 20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd
References: <cover.1656554759.git.chanho61.park@samsung.com>
        <CGME20220630021951epcas2p26cd4a554f01f9cb6e44acd813eee15fd@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add samsung,exynosautov9-uart dedicated compatible for representing
usi of Exynos Auto v9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
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

