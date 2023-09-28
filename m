Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B19E743C1
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Sep 2023 20:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbjI1U1s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Sep 2023 16:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjI1U1r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 16:27:47 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15335180
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Sep 2023 13:27:45 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230928202743euoutp01e4aa15f1a26d26974953419cde26de37~JKfQ_L0my1040710407euoutp01H
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Sep 2023 20:27:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230928202743euoutp01e4aa15f1a26d26974953419cde26de37~JKfQ_L0my1040710407euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695932863;
        bh=1huI9hqnKBCb7Vu4UH7Kuz3Bzv/JbxbP310C3vuRhvo=;
        h=From:To:Cc:Subject:Date:References:From;
        b=M1Pa3NZ7ox/soc5ldJ5sWIuwtUl1NyLDQjCRYL4iPW7wJ+tixYn+pBF2gp7jOfW6U
         Y9Ip3WYXWR72HwIdUMWIHkWVrInkHP4UCOhezUJGyN1plBXox5A4ydaghzSHDzp4eq
         Xu6jUCdi+7TsbzIpjKREv+NIhnTLv4P8lwajnjuA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20230928202742eucas1p2570049aa9a723d5609a76571407caa50~JKfP_159C2770027700eucas1p2r;
        Thu, 28 Sep 2023 20:27:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 4E.FD.37758.EB1E5156; Thu, 28
        Sep 2023 21:27:42 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230928202741eucas1p1b39edbdd390e2b1aaaeea5f8e364d58e~JKfPaESnN1676616766eucas1p13;
        Thu, 28 Sep 2023 20:27:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230928202741eusmtrp2eff56e2a432000bb72c3daa0da2907a2~JKfPZlTIg3232032320eusmtrp2V;
        Thu, 28 Sep 2023 20:27:41 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-78-6515e1be13a6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 05.AA.25043.DB1E5156; Thu, 28
        Sep 2023 21:27:41 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230928202741eusmtip2d765332859d32bc721d48d1d5b21e0c2~JKfO9siaF2907129071eusmtip2j;
        Thu, 28 Sep 2023 20:27:41 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: multi_v7_defconfig: add AHCI_DWC driver
Date:   Thu, 28 Sep 2023 22:27:36 +0200
Message-Id: <20230928202736.340435-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOd19D0VTDdbulbN4MG8bm8XfScfY
        Lfa+3spusenxNVaLGef3MVmsPXKX3YHN4/evSYwed67tYfPYvKTeo2/LKkaPz5vkAlijuGxS
        UnMyy1KL9O0SuDLWNf9iKpjJVnF050vmBsaNrF2MnBwSAiYS//vus3UxcnEICaxglHg5ZzYj
        hPOFUWLO8bcsEM5nRoltH+8wwbRcerkLqmU5o0RL42GEllmT5rCBVLEJGEp0ve0Csjk4RAS8
        JZZfUwSpYRZYzyhx6csssOXCArYSlxt/MILYLAKqEt3bG8E28ArYSfz5epcFYpu8xP6DZ5kh
        4oISJ2c+AYszA8Wbt85mBhkqITCVQ+Lq3R42iAYXic8LX0DZwhKvjm9hh7BlJP7vnM8E0dDO
        KLHg930oZwKjRMPzW4wQVdYSd879AjubWUBTYv0ufYiwo8T+7lvsIGEJAT6JG28FIY7gk5i0
        bTozRJhXoqNNCKJaTWLW8XVwaw9euMQMYXtI7PkHcY6QQKzE3KffmSYwKsxC8tosJK/NQrhh
        ASPzKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMAUc/rf8a87GFe8+qh3iJGJg/EQowQH
        s5II78PbQqlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEebVtTyYLCaQnlqRmp6YWpBbBZJk4OKUa
        mKK4vyov3nkuyTXVOc+2kTPoqmL6BZ8pGx6EaPDOjp3aWHZmt4jcbu/UI4f7GtVuaJs2rPU4
        cfzDmrPte29Unk584ZJcr5V9l1NG98bWY+8T5HqYfQrmuZ4zTppm6CfC8+fhpMW7rvexbXu/
        9OnWs5ZufhqmFneeJfXL1YkuXGzMJ+k649f+pe8P3r2eqC3n+ln7yKrSNSZ2RcyP3h23CPKe
        3m+yc89Cay5vlmMyEen/BNdu+Spbdzh10wFxL7O3gh9yGET4d05duzva4cBH85W3LZgXmr7Q
        YL3Xf7GjfZ29kw3XjuAn2fkLDFUO8Gt+qiif7+/9N2PJr88/nsQX+fUdcA0yVJy92NNR53dL
        sRJLcUaioRZzUXEiAGOXIwOgAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsVy+t/xe7p7H4qmGvzYYGbxYN42Nou/k46x
        W+x9vZXdYtPja6wWM87vY7JYe+QuuwObx+9fkxg97lzbw+axeUm9R9+WVYwenzfJBbBG6dkU
        5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GWsa/7FVDCT
        reLozpfMDYwbWbsYOTkkBEwkLr3cxdbFyMUhJLCUUWLJjXdQCRmJk9MaoGxhiT/XuqCKPjFK
        zH1+DSzBJmAo0fUWJMHJISLgK9H8dQMrSBGzwEZGif0LW1hAEsICthKXG38wgtgsAqoS3dsb
        mUBsXgE7iT9f77JAbJCX2H/wLDNEXFDi5MwnYHFmoHjz1tnMExj5ZiFJzUKSWsDItIpRJLW0
        ODc9t9hIrzgxt7g0L10vOT93EyMwtLcd+7llB+PKVx/1DjEycTAeYpTgYFYS4X14WyhViDcl
        sbIqtSg/vqg0J7X4EKMp0H0TmaVEk/OB0ZVXEm9oZmBqaGJmaWBqaWasJM7rWdCRKCSQnliS
        mp2aWpBaBNPHxMEp1cAUzeytuLQgS/AgU4RibbzvTqnjx7V2NPhtnhSdK1mXwvZh3nRXt+mz
        taP2Xr7qklykKbePS+eCoYqJX1WkwPNc/Vtpd1h3GxyxYm3+zNmiXfj7de9Zj6qGczYrVy1a
        ffyD1Kej9R7zpY9NmtPIKuj67fyt2UcXb1llcmrDyqVfP5hxzTrcNjGrduJk7d3KXxKkXP18
        wy3/Hbgy9y+fqOHXHayPeDNt+WSizjjunBktkiej9UDDdLOI4ZP/bq911nWK+J3/uNo9N9w5
        bquqzMfX77QFXW5+PC+/SuOoxj/DTL2d0hI71VzP87zZXt02ff6/p01pp2/PVNjz/9WW5AU8
        rN94DA7xnV7MGrn921dDJZbijERDLeai4kQAvw3EwPYCAAA=
X-CMS-MailID: 20230928202741eucas1p1b39edbdd390e2b1aaaeea5f8e364d58e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230928202741eucas1p1b39edbdd390e2b1aaaeea5f8e364d58e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928202741eucas1p1b39edbdd390e2b1aaaeea5f8e364d58e
References: <CGME20230928202741eucas1p1b39edbdd390e2b1aaaeea5f8e364d58e@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit 33629d35090f ("ata: ahci: Add DWC AHCI SATA controller support")
moved support for "snps,dwc-ahci" compatible (present in exynos5250.dtsi)
to separate DWC AHCI driver, so enable this driver in multi_v7_defconfig.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d08d2ccdd00e..5f752301a2c9 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -237,6 +237,7 @@ CONFIG_SATA_AHCI=y
 CONFIG_SATA_AHCI_PLATFORM=y
 CONFIG_AHCI_BRCM=y
 CONFIG_AHCI_DM816=y
+CONFIG_AHCI_DWC=m
 CONFIG_AHCI_ST=y
 CONFIG_AHCI_IMX=y
 CONFIG_AHCI_SUNXI=y
-- 
2.34.1

