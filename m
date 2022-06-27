Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48903C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Jun 2022 01:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiF0BBJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Jun 2022 21:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiF0BBH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 21:01:07 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCC62AE1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 18:01:06 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220627010104epoutp027ae364b74397dd32095cf9d48f00db3b~8VH5cv3fR1837618376epoutp02O
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 01:01:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220627010104epoutp027ae364b74397dd32095cf9d48f00db3b~8VH5cv3fR1837618376epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1656291664;
        bh=VYDwT3yjv5mplGmmyx3EsaqYjg7u4jDIfz6C0vAwKRQ=;
        h=From:To:Cc:Subject:Date:References:From;
        b=pIjIDlZGkBO7DUTNw1V//pzPD9hgUk6EAa9SuGJ0kt0UdhjcFZeDKC8iW5o/HawOw
         3lrucNQ2vLUkjCddS42hlYanPZXjtcbBNqDmh7BGCHa0PHqlEZytPiWUFtclgI7Ykb
         x3KLyx3LEBFzea3wv+78LD3BBMK0nda2lUPSfpso=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20220627010104epcas2p2c260e1cb47a058961241e207086c7fd8~8VH5DWTgr2656326563epcas2p2p;
        Mon, 27 Jun 2022 01:01:04 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4LWTtl4zLSz4x9Q2; Mon, 27 Jun
        2022 01:01:03 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        03.72.09650.F4109B26; Mon, 27 Jun 2022 10:01:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220627010103epcas2p174bb652624219cadc106275abf51f83a~8VH4ISUMZ2361823618epcas2p1r;
        Mon, 27 Jun 2022 01:01:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220627010103epsmtrp1ede817fe1491f48544fbc962efabc083~8VH4HkqbT1106311063epsmtrp1R;
        Mon, 27 Jun 2022 01:01:03 +0000 (GMT)
X-AuditID: b6c32a46-8bff9a80000025b2-49-62b9014f0a35
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FB.3B.08802.F4109B26; Mon, 27 Jun 2022 10:01:03 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220627010103epsmtip101fcce148c4505bd93035896300f7232~8VH38lfGo0439904399epsmtip17;
        Mon, 27 Jun 2022 01:01:03 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] arm64: dts: exynosautov9: correct spi11 pin names
Date:   Mon, 27 Jun 2022 09:58:32 +0900
Message-Id: <20220627005832.8709-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmma4/484kg8XPVS0ezNvGZnF5v7bF
        /CPnWC36Xjxkttj0+BqrxYzz+5gsWvceYXdg99i0qpPN4861PWwem5fUe/RtWcXo8XmTXABr
        VLZNRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+ArltmDtARSgpl
        iTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMDI1OgwoTs
        jLfvfzEWrOauePpsMnsD43nOLkZODgkBE4mJazazdzFycQgJ7GCU2HvgMZTziVFi6o9WJgjn
        M6NE86OVTDAt07sPsUIkdjFK3FxzhxnC+cgosW7iUzaQKjYBXYktz18xgtgiAvES5980soAU
        MQvsZpS48H49O0hCWMBJYlv/OTCbRUBVYuuliWA2r4CtxJq2F+wQ6+QlNszvZYaIC0qcnPmE
        BcRmBoo3b50NtllC4BS7xPTVW6Huc5FY27cTqllY4tXxLVC2lMTL/jYou1hi6axPTBDNDYwS
        l7f9YoNIGEvMetYOdDYH0AZNifW79EFMCQFliSO3oPbySXQc/ssOEeaV6GgTgmhUlziwfToL
        hC0r0T3nMyuE7SEx+9IWsPOFBGIlLs+8yziBUX4Wkm9mIflmFsLeBYzMqxjFUguKc9NTi40K
        jODRmpyfu4kRnBK13HYwTnn7Qe8QIxMH4yFGCQ5mJRHe19e3JgnxpiRWVqUW5ccXleakFh9i
        NAWG70RmKdHkfGBSziuJNzSxNDAxMzM0NzI1MFcS5/VK2ZAoJJCeWJKanZpakFoE08fEwSnV
        wLRtyW1Nlso5ZhZLSo7cSX/bsjhB59yq3zfL/30wUd692ynl6qtNjtNOO7yxCLbYVPo/WG5i
        XYHaV9aZmWbM64OXT1xw64Lz5+/zDhyZxSOyt0J1IduHV6w+248eOb4tcPs1n6vO68/s2BHw
        6FN5vk3r9CIDGyUtxvRNIeL66o/maHM9kHirtP/HyYv/PvQ9fnWtsfXT3f/plz9HFmkY5E3Y
        JLQ1gpNl7xTDY4Xrp+3fEbC0QfcSR0vpu+ueb8J03PTEFhTKr7pXs8AwVf5Hfa7iG1NRz/RN
        O5Sfe1glm63fP+ecYIekXo36Mn5vxV6N3tvqK1YwZt5Sdl53NW16yLtrezleLnSPXqLppui4
        45SPEktxRqKhFnNRcSIAGmwQrRIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWy7bCSnK4/484kg+afnBYP5m1js7i8X9ti
        /pFzrBZ9Lx4yW2x6fI3VYsb5fUwWrXuPsDuwe2xa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoA1
        issmJTUnsyy1SN8ugSvj7ftfjAWruSuePpvM3sB4nrOLkZNDQsBEYnr3IdYuRi4OIYEdjBKd
        57ezQyRkJZ692wFlC0vcbzkCVfSeUeL9w81MIAk2AV2JLc9fMYLYIgLxEkvP/WABKWIW2M8o
        cbf9GliRsICTxLb+c2CTWARUJbZemghm8wrYSqxpewG1QV5iw/xeZoi4oMTJmU9YQGxmoHjz
        1tnMExj5ZiFJzUKSWsDItIpRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzhItbR2MO5Z
        9UHvECMTB+MhRgkOZiUR3tfXtyYJ8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1
        OzW1ILUIJsvEwSnVwHTYcZm4ibi3Te+ibUdMt67Wn/v67zQ+k3M/lhbN3vNh26p3LGaCk3Lb
        9nx45hsoGXTkcHpoxwfRwtm1s6d2f7/IzXDlyuW97y4UL5Q6Ir3yx6K5rBPOdIYWXbLR0OvN
        kHm2q+Tb9FfiO07FapQz7klu+P7tjFyPbxCjxqdsR+ecCZv0xCJFf+uw2szyEQi4+C2udsNp
        nfyIqVP2XxKJ/1VTrR0eVWul+mX15dQdBV+2fKxeozRfZ+KCK9NcT0kcaNzy1nD/MgPmidnV
        i/WMIg9O/ig0v/zrrfvPKjXu3Ludf3FjyiZPo2ehao5SsxzU7Q0U1rxwnaA7KeC/othx+brk
        LXPTjKYzyTgWtycueyWqxFKckWioxVxUnAgAZWuLJcECAAA=
X-CMS-MailID: 20220627010103epcas2p174bb652624219cadc106275abf51f83a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220627010103epcas2p174bb652624219cadc106275abf51f83a
References: <CGME20220627010103epcas2p174bb652624219cadc106275abf51f83a@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

They should be started with "gpp5-".

Fixes: 31bbac5263aa ("arm64: dts: exynos: add initial support for exynosautov9 SoC")
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
index ef0349d1c3d0..68f4a0fae7cf 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
@@ -1089,21 +1089,21 @@ spi10_cs_func: spi10-cs-func-pins {
 
 	/* PERIC1 USI11_SPI */
 	spi11_bus: spi11-pins {
-		samsung,pins = "gpp3-6", "gpp3-5", "gpp3-4";
+		samsung,pins = "gpp5-6", "gpp5-5", "gpp5-4";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 
 	spi11_cs: spi11-cs-pins {
-		samsung,pins = "gpp3-7";
+		samsung,pins = "gpp5-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 
 	spi11_cs_func: spi11-cs-func-pins {
-		samsung,pins = "gpp3-7";
+		samsung,pins = "gpp5-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-- 
2.36.1

