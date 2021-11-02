Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50142C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 06:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 367BA60F56
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 06:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhKBGzH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 02:55:07 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:56780 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhKBGzG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 02:55:06 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20211102065230epoutp02c8fa17a047296c00219a9e87858cd368~zqCFDPhkB0274302743epoutp02-
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 06:52:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20211102065230epoutp02c8fa17a047296c00219a9e87858cd368~zqCFDPhkB0274302743epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635835950;
        bh=wS/jmuvM4qAKR807Ic3nzZ+xQuFDJ3F6FgK1M5KZxME=;
        h=From:To:Cc:Subject:Date:References:From;
        b=j3iAMkb22n0e60Ks1WBbt8z78S83GjHMTDi5ufjL/hpuBjVrIe5hWldPFxjwt8HwP
         JIs1Xim/2JJ8hmuRxgTJ+qgw7z9wJgrjl8DYoBzXB52OwtUwL50UBt84mIbPf9Z3k7
         SUkyy5JmD5pvtEszxrWy1BmyPYwMOY2Ck1kH16P0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20211102065229epcas2p42104f4ffe535c684048d521849933b61~zqCEjfhl43242432424epcas2p4h;
        Tue,  2 Nov 2021 06:52:29 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4Hk0vJ4bcHz4x9Pr; Tue,  2 Nov
        2021 06:52:12 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        69.9B.51767.810E0816; Tue,  2 Nov 2021 15:52:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
        20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c~zqBwuha470205102051epcas2p26;
        Tue,  2 Nov 2021 06:52:08 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211102065208epsmtrp1a4904db0730b039650fda05d91c5de38~zqBwt0Kgr2140821408epsmtrp1u;
        Tue,  2 Nov 2021 06:52:08 +0000 (GMT)
X-AuditID: b6c32a45-447ff7000000ca37-dc-6180e01881eb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        CC.AE.08738.810E0816; Tue,  2 Nov 2021 15:52:08 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211102065208epsmtip27929960488e5cb593528a17f9f6660c4~zqBwlIgJz1529515295epsmtip2e;
        Tue,  2 Nov 2021 06:52:08 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] arm64: dts: exynosautov9: drop
 samsung,ufs-shareability-reg-offset
Date:   Tue,  2 Nov 2021 15:48:26 +0900
Message-Id: <20211102064826.15796-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDKsWRmVeSWpSXmKPExsWy7bCmqa7kg4ZEg7uvmCwu79e2mH/kHKvF
        xrc/mCxmnN/HZNG69wi7A6vHrIZeNo9NqzrZPPq2rGL0+LxJLoAlKtsmIzUxJbVIITUvOT8l
        My/dVsk7ON453tTMwFDX0NLCXEkhLzE31VbJxSdA1y0zB2itkkJZYk4pUCggsbhYSd/Opii/
        tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSoMCE7Y9LCBSwFe7krOm62szYw
        tnB1MXJySAiYSCx6u5C9i5GLQ0hgB6PE5vVfmCCcT4wSzZcuMYNUCQl8ZpRoa4qE6fj58Toz
        RNEuRokD+9azQDgfGSVebJvECFLFJqArseX5KzBbRCBe4v68x0BjOTiYBXIkHm1RAwkLC4RK
        bN19iQnEZhFQlVjWtZwFpIRXwE7i4IUKiF3yEhMn3GMHsXkFBCVOznzCAmIzA8Wbt84Gu0FC
        YBe7xNRlCxkhGlwklmw4wQRhC0u8Or6FHcKWknjZ38YO0dDNKNH66D9UYjWjRGejD4RtL/Fr
        +hZWiDs1Jdbv0gcxJQSUJY7cgtrLJ9Fx+C87RJhXoqNNCKJRXeLA9uksELasRPecz6wQJR4S
        bXuqICEYKzHtRjvTBEb5WUiemYXkmVkIaxcwMq9iFEstKM5NTy02KjCEx2hyfu4mRnCy03Ld
        wTj57Qe9Q4xMHIyHGCU4mJVEeJmPNiQK8aYkVlalFuXHF5XmpBYfYjQFhu5EZinR5Hxgus0r
        iTc0sTQwMTMzNDcyNTBXEue1FM1OFBJITyxJzU5NLUgtgulj4uCUamCa+dRa9O+PnM2Lk2cf
        WuaecXOZ9fL8eVpCVnV/ZbYcX/pDTCcvkjnx+ZUPOY4VV251rpjnHdewuVF0y9T0RJX1qVJ/
        N8k/T2sLTt0x9+/aD1rxyn9z51xbrZhoYrpra/fniBtTIj52c+hkHr5yerFKWNfCvbPzQgXk
        pX1uHnf8FdvKy7rhS+CBm1OcKnSVxVI4b/733D/hrMunV7uzXZuSZ08Pru58lfnKzUpQT1xg
        oXVMS8Jjhm2vryVrv/1mz6F28eNV8YAb+847bnCdsP9d+JXirxuyN3aV1EikO6zvKd+WG6v3
        hO9gEOeZlVeYZ0/33itk5BXYdiyZxfCNwZnFwgtc+u4tYTNzDv4qUXdWiaU4I9FQi7moOBEA
        IB39TP8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHLMWRmVeSWpSXmKPExsWy7bCSvK7Eg4ZEg0d7VS0u79e2mH/kHKvF
        xrc/mCxmnN/HZNG69wi7A6vHrIZeNo9NqzrZPPq2rGL0+LxJLoAlissmJTUnsyy1SN8ugStj
        0sIFLAV7uSs6brazNjC2cHUxcnJICJhI/Px4nbmLkYtDSGAHo8T3fc+ZIBKyEs/e7WCHsIUl
        7rccYYUoes8osenVHjaQBJuArsSW568YQWwRgXiJ9YfugdnMAnkSf5dOAmsWFgiWOLvmJTOI
        zSKgKrGsazlLFyMHB6+AncTBCxUQ8+UlJk64B1bOKyAocXLmExaIMfISzVtnM09g5JuFJDUL
        SWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgINTS2sG4Z9UHvUOMTByMhxgl
        OJiVRHiZjzYkCvGmJFZWpRblxxeV5qQWH2KU5mBREue90HUyXkggPbEkNTs1tSC1CCbLxMEp
        1cCk1n7zVolAtTLHtaSwHQVKvfv4tVfWSUwTUvq8j7sxVIp30eewdZsFO0+vydU/Pm+9jc1q
        xja/2P77jjOUZr/I2vEj6OQuT4tfJWeMPq2SkJ959PhjPpXXrxJD/l18XH/iWsni13fXse3w
        XJa9fM4n8+7lK03VXPzVuj6Lmm5m/6Sj68C6YgO/btX9jpakV9Z810tvFj3+szhX99ysJbVs
        HO+W5F15MOfY48LmOfe8ElbKZh94xso5ceMe12CWDP4p0gFPj9xd2WE4afdRYbnoc8tbt3yW
        adv8q/o2/54djWJPdrH7ldpY6TV/Vbu6V4OrKD9v+zGVryyXG61D777xkpZXMP3DyuDud2Rp
        3pe/SizFGYmGWsxFxYkAP7s10bECAAA=
X-CMS-MailID: 20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c
References: <CGME20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c@epcas2p2.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

samsung,ufs-shareability-reg-offset is not necessary anymore since it
was integrated into the second argument of samsung,sysreg.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
This is a modification of [1] which is already started the pull-request.
It has been changed a bit while reviewing DT property[2] and the changed
version has been merged into scsi tree[3].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/commit/?h=next/dt64&id=31bbac5263aa63dfc8bfed2180bb6a5a3c531681
[2]: https://lore.kernel.org/linux-samsung-soc/011e01d7c410$4a420340$dec609c0$@samsung.com/T/#u
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?h=5.16/scsi-staging&id=cc52e15397cc5dc773d3c6792b98352d3209f93f

 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 3e4727344b4a..a960c0bc2dba 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -296,8 +296,7 @@ ufs_0: ufs0@17e00000 {
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_0_phy>;
 			phy-names = "ufs-phy";
-			samsung,sysreg = <&syscon_fsys2>;
-			samsung,ufs-shareability-reg-offset = <0x710>;
+			samsung,sysreg = <&syscon_fsys2 0x710>;
 			status = "disabled";
 		};
 	};
-- 
2.31.1.442.g7e391989789d

