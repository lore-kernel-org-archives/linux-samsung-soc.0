Return-Path: <SRS0=q3lv=DQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B24FC433DF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 13:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A31B5222C4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  9 Oct 2020 13:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Z7fKRvby"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732613AbgJINtY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 9 Oct 2020 09:49:24 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58083 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732456AbgJINtX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 09:49:23 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201009134911euoutp012e945e8e8a6d27b76bcc81a90f1d45cd~8Vx17uvFT1565315653euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 13:49:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201009134911euoutp012e945e8e8a6d27b76bcc81a90f1d45cd~8Vx17uvFT1565315653euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1602251351;
        bh=EahdMNdWkMceONdfRqQ74CaSxT3XY9QL7by0PjyKjks=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Z7fKRvbywWHbvwPyv1QDdCFse1GuxynFk+RUE7Ojz1gG06HVl6CTnkanLnMZ4jVph
         nKxRuxJyspp8Xg0vZRA5IPK5+kHb6Rm6uljIsTRB1NLW71eLvNUGxWQaSqAoepoVrL
         969NEO/lGE6UL3ScFltZ3w+E5cl56ySweoHKHDOw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201009134902eucas1p22f49a70d6b596c9287d2f8ac76b6b774~8VxtxG8t52251622516eucas1p2J;
        Fri,  9 Oct 2020 13:49:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id FA.5C.05997.E4A608F5; Fri,  9
        Oct 2020 14:49:02 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201009134902eucas1p235927ef59cc78854e34d2c1f4700c29b~8VxtdZ1fK2267822678eucas1p2H;
        Fri,  9 Oct 2020 13:49:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201009134902eusmtrp2e2ed05d5200f1d4aba25491c54680f25~8Vxtc3XdU1419514195eusmtrp2j;
        Fri,  9 Oct 2020 13:49:02 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-72-5f806a4e5d9c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 23.FB.06314.E4A608F5; Fri,  9
        Oct 2020 14:49:02 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201009134902eusmtip187f62455417c050036ba228b2eb94433~8VxtIZfuF0698606986eusmtip1f;
        Fri,  9 Oct 2020 13:49:02 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] ARM: exynos_defconfig: enable sound driver for Midas
 platform
Date:   Fri,  9 Oct 2020 15:48:55 +0200
Message-Id: <20201009134855.4520-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsWy7djP87p+WQ3xBq3/9CzOn9/AbjHj/D4m
        i7VH7rI7MHtsWtXJ5tG3ZRWjx+dNcgHMUVw2Kak5mWWpRfp2CVwZM17vZCloYav4NmsFUwPj
        AtYuRk4OCQETic8v5jJ2MXJxCAmsYJSY/H4iC4TzhVHixcpDUJnPjBLPr1xj6mLkAGuZOsEP
        Ir6cUeJ980F2uI6W0//ZQeayCRhKdL3tYgOxRQRUJT63LQCLMwtESNxrnsgEYgsLBEj0/FjO
        BjKUBajm6lN5kDCvgI3E1+O3mCDOk5dYveEAM4S9hk2i928QhO0icWzCQ0YIW1ji1fEt7BC2
        jMT/nfOZQO6REGhmlHh4bi07hNPDKHG5aQZUh7XEnXO/wBYzC2hKrN+lDxF2lJj68wcLxJN8
        EjfeCkKczCcxadt0Zogwr0RHmxBEtZrErOPr4NYevHAJ6kwPiSN3VjOClAsJxEpcWmAwgVFu
        FsKqBYyMqxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQJj+fS/4192MO76k3SIUYCDUYmH
        tyG5IV6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJI
        TyxJzU5NLUgtgskycXBKNTBqhOXpLUo65q3jIx3XHi6wJmBt49O8S1v96oq3J7At7t9i3nvt
        he/pndtn1bufOKew+3P/7mCT1mQ+x5e+Hwuvac/Uy3FSE19VvkT0kWXcEcOqXZNOBMzbvN62
        9tCaXbV7Zr2Ir/KSsp2rlREj8CQjLu1ulAarxaSYJaJLbFX2bU7TY15ckq7EUpyRaKjFXFSc
        CADRobum4QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKLMWRmVeSWpSXmKPExsVy+t/xu7p+WQ3xBu/WilucP7+B3WLG+X1M
        FmuP3GV3YPbYtKqTzaNvyypGj8+b5AKYo/RsivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyN
        zWOtjEyV9O1sUlJzMstSi/TtEvQyZrzeyVLQwlbxbdYKpgbGBaxdjBwcEgImElMn+HUxcnEI
        CSxllFi5+TxbFyMnUFxG4uS0BlYIW1jiz7UuNoiiT4wS7YunMIIk2AQMJbredoE1iAioSnxu
        W8AOYjMLREgcmLoIrFlYwE/iyu+TjCDLWIBqrj6VBwnzCthIfD1+iwlivrzE6g0HmCcw8ixg
        ZFjFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGETbjv3cvIPx0sbgQ4wCHIxKPLwaiQ3xQqyJ
        ZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EaAq0eyKzlGhyPjDA80riDU0NzS0s
        Dc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1MDZHvHfa+lB7856Gs1Zli8xnl37L
        1r168thnxUDL2/1V6f+V1Hx2PL/y8fyfaRn6j7MEhCSrzYxXrH8fOGdDgJTPWw3925wWG504
        qqZVFPEcUzxrs6tE52tg28Jjy4Isbt1d+0Ru0fp1m3UzvFJyNvVN6mfXlDK5vNPTr2d5/NZd
        /gFf4uec9lZiKc5INNRiLipOBAD7pUwfOAIAAA==
X-CMS-MailID: 20201009134902eucas1p235927ef59cc78854e34d2c1f4700c29b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201009134902eucas1p235927ef59cc78854e34d2c1f4700c29b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201009134902eucas1p235927ef59cc78854e34d2c1f4700c29b
References: <CGME20201009134902eucas1p235927ef59cc78854e34d2c1f4700c29b@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Sound driver for Midas platform (Exnyos4412 SoC based) has been recently
merged, so enable it for tests like other sound drivers for Exynos based
boards.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index cf82c9d23a08..8c1fd6408108 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -245,6 +245,7 @@ CONFIG_SND_SOC_SMDK_WM8994_PCM=y
 CONFIG_SND_SOC_SNOW=y
 CONFIG_SND_SOC_ODROID=y
 CONFIG_SND_SOC_ARNDALE=y
+CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-- 
2.17.1

