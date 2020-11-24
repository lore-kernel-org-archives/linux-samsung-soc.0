Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F26BC2D0E4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Nov 2020 08:33:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8156E2076E
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 24 Nov 2020 08:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XlAQDjMJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgKXIdf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 24 Nov 2020 03:33:35 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51289 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730429AbgKXIde (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 03:33:34 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201124083322euoutp0182f2d2600e0e0782627b7c731584db9b~KZJO6eaf41901919019euoutp01s
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2020 08:33:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201124083322euoutp0182f2d2600e0e0782627b7c731584db9b~KZJO6eaf41901919019euoutp01s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1606206802;
        bh=zbd3g6zknyPwtPpsUhX5yxCRfSw7jV9kPvq/96JQ5Sg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=XlAQDjMJzaBopgQIg2jUbGBbugLn7Ecgme1J4hzdyyqhviTT60lb8eXIaalIMTSpk
         ppXESd3oqvutWi9oaupBh5yGAw3/w80el2LbCTrS6N9cLnOjdwrtOv+mPPrMt3Mvcs
         Cq0SDuiGDArm20sVLIckN8GPfBimtf0Db2po8I/c=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201124083322eucas1p2bc7da95ef9f9348b6c3dcb3206f7fcea~KZJOqX-4Q0818708187eucas1p2t;
        Tue, 24 Nov 2020 08:33:22 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EE.73.45488.255CCBF5; Tue, 24
        Nov 2020 08:33:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201124083321eucas1p2303f28fc17736bcdc5e626f463ed74c6~KZJOKFJ9w0818708187eucas1p2s;
        Tue, 24 Nov 2020 08:33:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201124083321eusmtrp1d2959cf1cbd80587b280bc60788ef45b~KZJOJcvig0326503265eusmtrp1S;
        Tue, 24 Nov 2020 08:33:21 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-05-5fbcc5520f73
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6D.A4.16282.155CCBF5; Tue, 24
        Nov 2020 08:33:21 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201124083321eusmtip191049cb5d5abf0423aa8d7f7c7639d31~KZJNvTC9I0704307043eusmtip1D;
        Tue, 24 Nov 2020 08:33:21 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: multi_v7_defconfig: make Samsung Exynos EHCI driver a
 module
Date:   Tue, 24 Nov 2020 09:33:12 +0100
Message-Id: <20201124083312.12356-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsWy7djPc7pBR/fEGyxbImmxccZ6Vovz5zew
        W8w4v4/JYu2Ru+wOLB6bVnWyefRtWcXo8XmTXABzFJdNSmpOZllqkb5dAlfGguZjbAWH2Su2
        7HvD0sC4l62LkYNDQsBE4mqbahcjF4eQwApGiXkX37NBOF8YJdqen2SHcD4zShx7f5uxi5ET
        rKPz/iOoquWMEt8f/mOGa2n/PIsdpIpNwFCi620XG4gtIqAq8bltAdgoZoE+Ronre+cygySE
        BUIkTk27DVbEAlR06vFUsBW8ArYS3/c8ZodYJy+xesMBZgj7GrvE1xM+ELaLxL17S9kgbGGJ
        V8e3QNXLSJye3MMCskxCoJlR4uG5tewQTg+jxOWmGVBPWEvcOfcLHATMApoS63fpQ4QdJf6s
        eMgCCRk+iRtvBUHCzEDmpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIlqBIPiU3/gkHCQgKxEq9+
        LmCfwCg3C2HVAkbGVYziqaXFuempxcZ5qeV6xYm5xaV56XrJ+bmbGIGRffrf8a87GFe8+qh3
        iJGJg/EQowQHs5IIb6vczngh3pTEyqrUovz4otKc1OJDjNIcLErivLu2rokXEkhPLEnNTk0t
        SC2CyTJxcEo1MKlfF+Z9mfOfR6cz+tnhUxekbMv5WvYaRk5e2OJY0X/5pPWh14kmKZGqk2zV
        s2y3fPMKPX2lOKb26x7Zkh87btxwfr3yxTmjvuUvNSOS0zf+CYoTKgn8+aRWKaKv9pPe32VH
        k1WkK8JeRPnmXf13+qxUeujcp82fay5nmTw1fdN+d13kvB+aP04Fu/0+d/yDqc3t4GpPZeuQ
        yS02f7vWt/l0Gbc7mGgnvOFZt6j+epPE1ZIjdw/mW6mJa/A/C2uYP79z2n+zKUkpuoLK1cYL
        osJ/XnXW+nyokbX4RJfUdxUtPRnV7SWn7tZsMu3i37Ngu75nw7Zd2mXKMw5ekN/WfqvDvYH5
        0xWfg0ouVaoRSizFGYmGWsxFxYkAtpA8NlsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrALMWRmVeSWpSXmKPExsVy+t/xu7qBR/fEGyztNbXYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
        yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9jQfMxtoLD7BVb9r1haWDcy9bFyMkhIWAi0Xn/
        EZDNxSEksJRR4nnvDBaIhIzEyWkNrBC2sMSfa11QRZ8YJbZ1LGIESbAJGEp0ve0CmyQioCrx
        uW0BO0gRs8AERonznTPAEsICQRIPzlwBa2ABKjr1eCqYzStgK/F9z2N2iA3yEqs3HGCewMiz
        gJFhFaNIamlxbnpusZFecWJucWleul5yfu4mRmBQbTv2c8sOxpWvPuodYmTiYDzEKMHBrCTC
        2yq3M16INyWxsiq1KD++qDQntfgQoynQvonMUqLJ+cCwziuJNzQzMDU0MbM0MLU0M1YS5zU5
        siZeSCA9sSQ1OzW1ILUIpo+Jg1OqgWmH/hdf+9Co+vCYGmcJw33KsiZrZilZtX06ZuU9w0Xp
        ebmH2MulxQaO+xtW6B2YM3vNxIgp/eyp00qu3CqI2a60m1N/ukpezKUT7pulA34eu2Z44f25
        DH1BxjMrby5VD1/z4D1HLYsg0zUzJpHVppF6jLFuL3mqP79M2nq1pH9DqOry3efWLMhuyPqx
        fYrrv0MdKU2PN/bOiHvU+0fo9NWlL5bdNnCXWvswP8/o3TJ5E5mog3LfYt94Xfk+9WffMtXd
        cT9Tnnts9nTIXaaxqqGu9W/QofgVn6+U3D9yz4l7wYcrK2ImcnUuc5nG8aTk0tPn8jl7356e
        m9JiEfQoKYLjk+CW4OXutx+vu+cRdydeiaU4I9FQi7moOBEAnKiPhLMCAAA=
X-CMS-MailID: 20201124083321eucas1p2303f28fc17736bcdc5e626f463ed74c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201124083321eucas1p2303f28fc17736bcdc5e626f463ed74c6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201124083321eucas1p2303f28fc17736bcdc5e626f463ed74c6
References: <CGME20201124083321eucas1p2303f28fc17736bcdc5e626f463ed74c6@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos EHCI driver is compiled as kernel built-in, but it requires Samsung
USB2 Generic PHY driver to operate properly, which is compiled as module.
Make the Exynos EHCI driver also a module, because having it built-in
makes no sense. Exynos OHCI, which also uses that PHY driver, is already
compiled as a module.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3792ef8a71ea..de0dc513c2b7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -779,7 +779,7 @@ CONFIG_USB_XHCI_TEGRA=m
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_STI=y
 CONFIG_USB_EHCI_TEGRA=y
-CONFIG_USB_EHCI_EXYNOS=y
+CONFIG_USB_EHCI_EXYNOS=m
 CONFIG_USB_EHCI_MV=m
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_OHCI_HCD_STI=y
-- 
2.17.1

