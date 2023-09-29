Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E18E71D21
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Sep 2023 12:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbjI2MSK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Sep 2023 08:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbjI2MSJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2023 08:18:09 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13C7195
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Sep 2023 05:18:07 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230929121806euoutp0243bf41ee4a72186b31f12c640071085e~JXdDtJeBm1101411014euoutp02C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Sep 2023 12:18:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230929121806euoutp0243bf41ee4a72186b31f12c640071085e~JXdDtJeBm1101411014euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695989886;
        bh=L2S/Qqh17Y6dRqVOiBnPiQaWvvdVHFT6HxbDcIE/924=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Zl8TUIBMENqCSv5LPfe1+5eCuS9CkTvF3cFsA7hsqkoZKUmzw9rcuIkSltAuEtdVJ
         L87Mz/EMkcm3p9DEQCHeXjtYfC33x95luhIPWXFmQO4AL1TiXD5SRS7MdN9oThwST/
         S4pEmC4mvC/6ARkegOQGqAAXHU6JvkrOH9rnKUjk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20230929121806eucas1p15dd857a20cc8293f360f44c2d9c5766a~JXdDhma8v0592705927eucas1p1E;
        Fri, 29 Sep 2023 12:18:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 97.03.11320.E70C6156; Fri, 29
        Sep 2023 13:18:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230929121805eucas1p18f8ad323c1243684436ae831f4cc563c~JXdDEUKrl0592705927eucas1p1D;
        Fri, 29 Sep 2023 12:18:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230929121805eusmtrp210e4f2d09c89ca12bc1bc79f462cfe6d~JXdDDvUEQ1696416964eusmtrp2c;
        Fri, 29 Sep 2023 12:18:05 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-2d-6516c07e01c0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 82.E1.10549.D70C6156; Fri, 29
        Sep 2023 13:18:05 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230929121805eusmtip2b70ba01d9863b22623ff2c61b014e0ea~JXdCowJXo2572825728eusmtip2F;
        Fri, 29 Sep 2023 12:18:05 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: multi_v7_defconfig: make Exynos related PHYs modules
Date:   Fri, 29 Sep 2023 14:18:00 +0200
Message-Id: <20230929121800.1722211-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzned26A2KpBvf+Clo8mLeNzeLvpGPs
        Fntfb2W32PT4GqvFjPP7mCzWHrnL7sDm8fvXJEaPO9f2sHlsXlLv0bdlFaPH501yAaxRXDYp
        qTmZZalF+nYJXBlbjrxhKVjPVjFh3VumBsbjrF2MnBwSAiYSk66+Ze9i5OIQEljBKPGr5QeU
        84VRoufUXBYI5zOjxPF1c9hhWlY27GGCSCxnlHhyv5URrqXjyyomkCo2AUOJrrddbF2MHBwi
        At4Sy68pgtQwC6xnlLj0ZRYrSFxYwEui+7UcSDmLgKrEldNzGUFsXgF7iaOz1jNDLJOX2H/w
        LDNEXFDi5MwnLCA2M1C8eetsZpCZEgIzOSQ6Jq9lgWhwkTjX8x/KFpZ4dXwL1NUyEv93zmeC
        aGhnlFjw+z6UM4FRouH5LUaIKmuJO+d+gV3NLKApsX6XPkTYUeLZj93MIGEJAT6JG28FIY7g
        k5i0bTpUmFeio00IolpNYtbxdXBrD164BPWLh8TuCWvB4S4kECvx/dwVpgmMCrOQvDYLyWuz
        EG5YwMi8ilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzDBnP53/MsOxuWvPuodYmTiYDzE
        KMHBrCTC+/C2UKoQb0piZVVqUX58UWlOavEhRmkOFiVxXm3bk8lCAumJJanZqakFqUUwWSYO
        TqkGpuRz742+s+3jOLl266LoBt09evXPOjQFlgVb3JnysCY2MODxjukr3Kp5NVydt98TPfbI
        d1FQaGhFRxtDUOGm9K1yd7estYhaknCfO233V6nqiq+2W6qvpna26HAfeOfNfXe/3dHtXT99
        RQ2PmOmF2t0rZy7Y7+j4UVnCSTN4+mEpt3+GCRkBjaXx2lz1kstT5t2dvv7C3bepKRffKyxu
        lJDnY/GemfGtwpHh2ZNrh9LeLdTQz1zxIXe5Qnn/Ngfp21wXrI94hPYe9vS1alHe/TpiaXD9
        QZucn8JzH1nsUZlz0d58W3vW/ZkS0qo5Ynx7XDh/53VOPrbcxXPOvm0NS00MfRxfdIh+nMAc
        x+atxFKckWioxVxUnAgAKlz5UZ8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsVy+t/xe7q1B8RSDa5eNLF4MG8bm8XfScfY
        Lfa+3spusenxNVaLGef3MVmsPXKX3YHN4/evSYwed67tYfPYvKTeo2/LKkaPz5vkAlij9GyK
        8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DK2HHnDUrCe
        rWLCurdMDYzHWbsYOTkkBEwkVjbsYepi5OIQEljKKLHo21mohIzEyWkNULawxJ9rXWwQRZ8Y
        JSY+uc4GkmATMJToetsFZosI+Eo0f93AClLELLCRUWL/whaWLkYODmEBL4nu13IgNSwCqhJX
        Ts9lBLF5Bewljs5azwyxQF5i/8GzzBBxQYmTM5+wgNjMQPHmrbOZJzDyzUKSmoUktYCRaRWj
        SGppcW56brGhXnFibnFpXrpecn7uJkZgYG879nPzDsZ5rz7qHWJk4mA8xCjBwawkwvvwtlCq
        EG9KYmVValF+fFFpTmrxIUZToPsmMkuJJucDYyuvJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUgg
        PbEkNTs1tSC1CKaPiYNTqoHJv+T619qZFcH+Ta/WZ8QUFi6MnF+7Z+KbpwtF6iRjYzZ4sV//
        cP3WofdZnYIz2zoX9ex0myXaXnRvwnoBQfEz3xm29Nc+rtKc8rctbnmfHqP55Y5VJRwPzSse
        l7SujrjLYVYXemLXA+GPsZ+nvNt984XXjMKCsm8LVLLtWrzfuXXW7f6cF8wr+X6OdMTlbTL7
        I28Za6fPfSe0IEGy9/53sdeGOxReGnhvE9i8urd3zcUnl2rmz7v9ZufF3Cl3jdhu7X+8oPN7
        RJS28T1NNt8PTrry1xa39uU6dC+1cWPaJem2aPfyU3xTu2+9P3zeSWFLpOmViS39j65kMT3R
        UPoscCGZSaFlmURItc2Eiu1vlFiKMxINtZiLihMBSCe30fUCAAA=
X-CMS-MailID: 20230929121805eucas1p18f8ad323c1243684436ae831f4cc563c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230929121805eucas1p18f8ad323c1243684436ae831f4cc563c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230929121805eucas1p18f8ad323c1243684436ae831f4cc563c
References: <CGME20230929121805eucas1p18f8ad323c1243684436ae831f4cc563c@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos Display Port PHY and Exynos MIPI Video PHY drivers are not
essential to boot on the Exynos based system, so make them modules
instead of build-in.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index dbba33cfb3bf..4b7810a09aa6 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1201,6 +1201,8 @@ CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_PHY_RCAR_GEN2=m
 CONFIG_PHY_ROCKCHIP_DP=m
 CONFIG_PHY_ROCKCHIP_USB=y
+CONFIG_PHY_EXYNOS_DP_VIDEO=m
+CONFIG_PHY_EXYNOS_MIPI_VIDEO=m
 CONFIG_PHY_SAMSUNG_USB2=m
 CONFIG_PHY_EXYNOS5250_SATA=m
 CONFIG_PHY_UNIPHIER_USB2=y
-- 
2.34.1

