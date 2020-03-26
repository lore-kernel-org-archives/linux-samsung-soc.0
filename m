Return-Path: <SRS0=zaGS=5L=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA93C43331
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 08:35:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C25B52078E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Mar 2020 08:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kb+vvGCq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgCZIfb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Mar 2020 04:35:31 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48859 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgCZIfb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Mar 2020 04:35:31 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200326083529euoutp01539e796a50314f96a040838a4e8ea483~-zatSRaF61823218232euoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2020 08:35:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200326083529euoutp01539e796a50314f96a040838a4e8ea483~-zatSRaF61823218232euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1585211729;
        bh=rwK7sRBDXGqJBmouPPsFSgtMupavES8fhVCu9E4tVFg=;
        h=From:To:Cc:Subject:Date:References:From;
        b=kb+vvGCqAQlJnCngwv82AsjvoSOJ2qWYd/As6D+n+ObTXUq+KJmdrsXPPQxFPNoJU
         KG2lB+MbfQr+2G1M7uqcOeOBBJUMUJwI5EyC670MVpYVyoNq3au0lTAf9ZHtnFGMaR
         ZNzCwg97B9r35l0SkuQ+wAvCAN9QQW62S1TGSXbA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200326083529eucas1p12c52b02ed7e7665858f545f437cd96e7~-zatGTodm0217702177eucas1p1b;
        Thu, 26 Mar 2020 08:35:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A3.71.60698.1596C7E5; Thu, 26
        Mar 2020 08:35:29 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200326083528eucas1p2f2e265f3776e4d34116f36b68d07731c~-zast5QWn3089130891eucas1p2k;
        Thu, 26 Mar 2020 08:35:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200326083528eusmtrp1864b12e1d9ae9c6432621b5299372d61~-zastFZMs1695216952eusmtrp16;
        Thu, 26 Mar 2020 08:35:28 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-97-5e7c69512116
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 91.46.07950.0596C7E5; Thu, 26
        Mar 2020 08:35:28 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200326083528eusmtip1f9ad37c3e102011ddde511accf77bd45~-zasZmjGJ1681316813eusmtip1i;
        Thu, 26 Mar 2020 08:35:28 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] ARM: dts: exynos: Enable Bluetooth support for Rinato
 board
Date:   Thu, 26 Mar 2020 09:35:23 +0100
Message-Id: <20200326083524.19577-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7djPc7qBmTVxBi/eilhsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoLpuU1JzMstQifbsErozuTUtY
        CtazVxw4vZGxgXE6WxcjJ4eEgInEutubmboYuTiEBFYwStz/8w/K+cIo8eLRblYI5zOjxL4j
        l9lhWnq/vWaBSCxnlPj5+hUzXMvcT/tZQKrYBAwlut52gS0REVCV+Ny2gB2kiFlgG6PElt4H
        zCAJYYEgiYs7bzGB2CxARctP3ARr5hWwldh+t48ZYp28xOoNB6DsLWwSUy5mQNguEtceHmWC
        sIUlXh3fAnWejMTpyT1g50kINDNKPDy3lh3C6WGUuNw0gxGiylrizrlfQOdxAJ2kKbF+lz5E
        2FGib85eFpCwhACfxI23giBhZiBz0rbpzBBhXomONiGIajWJWcfXwa09eOES1JkeEjPXdIL9
        LiQQK9H0tJVxAqPcLIRdCxgZVzGKp5YW56anFhvnpZbrFSfmFpfmpesl5+duYgTG+el/x7/u
        YNz3J+kQowAHoxIPb4R5dZwQa2JZcWXuIUYJDmYlEd6nkTVxQrwpiZVVqUX58UWlOanFhxil
        OViUxHmNF72MFRJITyxJzU5NLUgtgskycXBKNTCG9TDN7T+5MaDnw+7uTQuerne5nrj+eOl1
        o7t3NII0V81Luii19cJSk5qwrH7e7vJr4kyFk+P+M39L2THX6Pdjjty5h6adSj/pNmNLqPxT
        6TS1+c5HDbWeHVzewhoy95pcvpqeTLkCp33bbpaQl4fOXuOb8ueZu+nvqznPBP4eKC/8lBg9
        SVFAiaU4I9FQi7moOBEAr/VX1O8CAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsVy+t/xu7oBmTVxBh92W1hsnLGe1eL6l+es
        FufPb2C3mHF+H5PF2iN32R1YPTat6mTz6NuyitHj8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzuTUtYCtazVxw4vZGxgXE6WxcjJ4eE
        gIlE77fXLF2MXBxCAksZJaavmM4EkZCRODmtgRXCFpb4c62LDaLoE6PEtL0LwBJsAoYSXW+7
        wCaJCKhKfG5bwA5SxCywg1Fiy463YEXCAgESH5vvs4PYLEBFy0/cZAGxeQVsJbbf7WOG2CAv
        sXrDAeYJjDwLGBlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBIbXtmM/t+xg7HoXfIhRgINR
        iYd3g2V1nBBrYllxZe4hRgkOZiUR3qeRNXFCvCmJlVWpRfnxRaU5qcWHGE2Blk9klhJNzgeG
        fl5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkaezqzvHG/urNkp
        oCrG+zriqFOjatNH63Sbbj1ewQUL+0SPd8kzxryMYnzXbflk44RN5S8D3iXzNOvcP62S8tA4
        ISG5ZsJsj9thbM3xoXmZ/Gby5Zf9D1qde1tbs9Zv1ttTB6e/P+peFGJ6+cdKHn6HQgWzy4fW
        JDuf+iopxGY9775GpZP5CyWW4oxEQy3mouJEALhYI/hFAgAA
X-CMS-MailID: 20200326083528eucas1p2f2e265f3776e4d34116f36b68d07731c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200326083528eucas1p2f2e265f3776e4d34116f36b68d07731c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200326083528eucas1p2f2e265f3776e4d34116f36b68d07731c
References: <CGME20200326083528eucas1p2f2e265f3776e4d34116f36b68d07731c@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add a node for the BCM43342A Bluetooth chip on the serial bus #0 on
the Exynos3250-based Rinato board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index d215e8993d19..e511f1726182 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -663,6 +663,15 @@
 	assigned-clocks = <&cmu CLK_SCLK_UART0>;
 	assigned-clock-rates = <100000000>;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpe0 0 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+		clocks = <&s2mps14_osc S2MPS11_CLK_BT>;
+	};
 };
 
 &serial_1 {
-- 
2.17.1

