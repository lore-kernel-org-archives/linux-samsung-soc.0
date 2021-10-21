Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F1AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 01:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5B16611CC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 01:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhJUBZj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Oct 2021 21:25:39 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:10341 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbhJUBZi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 21:25:38 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211021012321epoutp024ad9b82472dac7cce6b05f24ba67335a~v5zRas1oY2663026630epoutp02V
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 01:23:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211021012321epoutp024ad9b82472dac7cce6b05f24ba67335a~v5zRas1oY2663026630epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1634779401;
        bh=b8JVmjPrCSWyy1z+AyxwzjgCFwo1grsQ7wfOTlZZUW0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cwGScrE3AsOg58YlWn0lS1uLLDtXf9YwnPr8cbeaKCKaIqQnaDX9Q11ZU7WSufwys
         z9g2yKDbzqNAAJtYbUt9Z0TESk16wK+RdSMe0WRW3V+yBVphPkI++OO30yfkDrWpok
         +L3JIv4I71uBkA3Vr+K49jXme8POXVUzDuEParuo=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211021012321epcas2p4bf7e69e8984ff41787426d448446f932~v5zQ_xTfw1630916309epcas2p45;
        Thu, 21 Oct 2021 01:23:21 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HZV9D6m9Tz4x9Px; Thu, 21 Oct
        2021 01:23:12 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        F9.DE.10018.EF0C0716; Thu, 21 Oct 2021 10:23:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211021012310epcas2p28274eaed951720285e52c36aeedf8935~v5zG62HDA0209302093epcas2p2Y;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211021012310epsmtrp17f0ab1ef834e44adea32fc9e4cd81efb~v5zG2xykJ1297112971epsmtrp1J;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
X-AuditID: b6c32a46-a0fff70000002722-e7-6170c0fe80ad
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        DC.77.08738.EF0C0716; Thu, 21 Oct 2021 10:23:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211021012310epsmtip2cd8d09d375b756702288be9233305cd5~v5zGrO6q42518525185epsmtip2U;
        Thu, 21 Oct 2021 01:23:10 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 1/2] soc: samsung: exynos-chipid: add exynosautov9 SoC
 support
Date:   Thu, 21 Oct 2021 10:20:16 +0900
Message-Id: <20211021012017.158919-2-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021012017.158919-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmue6/AwWJBod3Wlpc3q9tMf/IOVaL
        jW9/MFnMOL+PyeJ53z4mB1aPWQ29bB53ru1h8+jbsorR4/MmuQCWqGybjNTElNQihdS85PyU
        zLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKC1SgpliTmlQKGAxOJiJX07m6L8
        0pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTsjJebxAp+sVYcmLiRsYGx
        mbWLkZNDQsBEYu3f1cxdjFwcQgI7GCVmr+hmg3A+MUr0dc5ignA+M0qs2/6PBaZlS8sJRojE
        LkaJxWdfQTkfGSX2LPzCBFLFJqArseU5SIKTQ0TAWuLo1vlgS5gFZgEV9V8DGyUsECDROXEZ
        2CUsAqoSfe1vmUFsXgF7iVcXVrJDrJOXOPKrEyzOKeAgsXDPD3aIGkGJkzOfgM1hBqpp3job
        bIGEwCl2iT0rnjJBNLtI/J05ixnCFpZ4dXwL1FApiZf9bewQDd2MEq2P/kMlVjNKdDb6QNj2
        Er+mbwG6jgNog6bE+l36IKaEgLLEkVtQe/kkOg7/ZYcI80p0tAlBNKpLHNg+HRpashLdcz5D
        A9tDov/EM2j4TmaUWLGlj2kCo8IsJO/MQvLOLITFCxiZVzGKpRYU56anFhsVGMGjODk/dxMj
        OB1que1gnPL2g94hRiYOxkOMEhzMSiK8uyvyE4V4UxIrq1KL8uOLSnNSiw8xmgIDeyKzlGhy
        PjAh55XEG5pYGpiYmRmaG5kamCuJ81qKZicKCaQnlqRmp6YWpBbB9DFxcEo1MBWrvTn51o55
        QUe9+I0X/+v5Nh55lZpwav+WOwpG6X9Kj35o0KxN+hfP0BnH93nJy9g9gRN+7nxYJvYsM+z7
        RJkzPKX/mNeGr1bRee5q69g4afGvKbYcd3t82m/k7v5/+Z3HToX7PiWBHj919grNMnpTWCn0
        2cRzKvv+p+e0LvE+XP/oX2umZeiFVz5tp25ETbfZU6p5bf3MVktWUZb8Sy4zTDI6v+tfal7N
        KNrL1Orx+0/VspNbsx8v33Cly9Hr2T6tZ9tXfBbfdEGw9aBq0AK+lMvsP2s5aoNNZ++9xr/H
        6M6K6ns80UsVp6loOud3Zqr/t1U0+HJ/0TeJn6JrHi6oLAqNMPTYvuxsTq3TzstKLMUZiYZa
        zEXFiQDuqFiaEAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOLMWRmVeSWpSXmKPExsWy7bCSvO6/AwWJBhceqVpc3q9tMf/IOVaL
        jW9/MFnMOL+PyeJ53z4mB1aPWQ29bB53ru1h8+jbsorR4/MmuQCWKC6blNSczLLUIn27BK6M
        l5vECn6xVhyYuJGxgbGZtYuRk0NCwERiS8sJxi5GLg4hgR2MEs9W/GKCSMhKPHu3gx3CFpa4
        33KEFaLoPaPEtNs7GUESbAK6EluevwKzRQSsJY5unc8MUsQsMIdR4ta1f2AJYQE/iQVLb4JN
        ZRFQlehrf8sMYvMK2Eu8urASaoO8xJFfnWBxTgEHiYV7foDFhYBqni1+wgpRLyhxcuYTFhCb
        Gai+eets5gmMArOQpGYhSS1gZFrFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREctlpa
        Oxj3rPqgd4iRiYPxEKMEB7OSCO/uivxEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmk
        J5akZqemFqQWwWSZODilGpgWGmc/E+rrs/1dqV908W6Nrrr72z+9/D1l3zYfClp8f88+XbE5
        GpMEJXryfp102nbvT935m7oVrCzmG/kvquYkG/Xu4Jp9/WnZFIW7k99aOieI95VMuLTe2WXP
        W9eaFW+O539b6anxYdLNEK3/YskHKzovrA4Q2lP/mnGXfXfD9PW6R0QeeweXeObI/q5MyO5d
        VqdXuFwx48wCA51aprqFv/5O4nTsODyn8mxZ7DJG3WJfbavuqoL9NTOMhB9NNDkVKFipvy+h
        Ql5B4RLngoWcgn4WTstn3Q366MK3KO91+PcEi4OHy5XYJB66fGj3mFlWLnCg/9uGyOlLI6Xk
        xLlNio15Qkoe8D+6OtFxrRJLcUaioRZzUXEiAG7mW6bKAgAA
X-CMS-MailID: 20211021012310epcas2p28274eaed951720285e52c36aeedf8935
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211021012310epcas2p28274eaed951720285e52c36aeedf8935
References: <20211021012017.158919-1-chanho61.park@samsung.com>
        <CGME20211021012310epcas2p28274eaed951720285e52c36aeedf8935@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The product id of Exynos Auto v9 is "0xAAA8_0000". Add this id and its
name.

Cc: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/soc/samsung/exynos-chipid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 0aeb24bcc11a..a28053ec7e6a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -56,6 +56,7 @@ static const struct exynos_soc_id {
 	{ "EXYNOS5800", 0xE5422000 },
 	{ "EXYNOS7420", 0xE7420000 },
 	{ "EXYNOS850", 0xE3830000 },
+	{ "EXYNOSAUTOV9", 0xAAA80000 },
 };
 
 static const char *product_id_to_soc_id(unsigned int product_id)
-- 
2.33.0

