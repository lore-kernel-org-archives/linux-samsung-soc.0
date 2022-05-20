Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893BEC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 11:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348756AbiETLwa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 May 2022 07:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347933AbiETLw2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 07:52:28 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC075B8A8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 04:52:25 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220520115220epoutp04c8f80ce53a0e5a5f759c4a1aded65a44~wzfrSNNMK0522705227epoutp04y
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 11:52:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220520115220epoutp04c8f80ce53a0e5a5f759c4a1aded65a44~wzfrSNNMK0522705227epoutp04y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653047540;
        bh=CbnJ6r5RJx+x5uEep6BdpxgGR6fmdjU3WvQatIu4L9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=do9Kb7YvWwD9Jx+YsXutBEZ3ZoMLZtq+zZwaPC3sic4shUFPGkJwEd6SuQnwUnaBT
         bhuN7l+aUgs7Cl7rErdJOJYp6Sv1y0xTGuP0qfz1xrhH5zQooxx42daZ9YtcAlw8iW
         Gmy3SCoyUHfvjkBiaQDMxtypyk+Uy+7D2d8EJCpI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220520115219epcas2p106c28aad08deb416e9e27f88dc235e01~wzfqxWnTY1157711577epcas2p1_;
        Fri, 20 May 2022 11:52:19 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.99]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4L4Q7j2YqCz4x9Py; Fri, 20 May
        2022 11:52:17 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        81.00.10069.1F087826; Fri, 20 May 2022 20:52:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220520115216epcas2p1de431047122f853ed129785653b787a5~wzfoG6dcq1157711577epcas2p13;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220520115216epsmtrp23244d4367d58410e3f18ae2ce24cc54c~wzfoF9ZVt2723427234epsmtrp2b;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
X-AuditID: b6c32a45-a8fff70000002755-5f-628780f17944
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F0.EC.11276.0F087826; Fri, 20 May 2022 20:52:16 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520115216epsmtip2230eff181a1ae990a3afbcf64bab6b1b~wzfn8EOQI1018710187epsmtip22;
        Fri, 20 May 2022 11:52:16 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v2 2/2] arm64: dts: exynoautov9: add syscon
 reboot/reboot_mode support
Date:   Fri, 20 May 2022 20:52:50 +0900
Message-Id: <20220520115250.57785-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520115250.57785-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphk+LIzCtJLcpLzFFi42LZdljTQvdjQ3uSwZFWQYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhsMeP8PiaL1r1H2C2e9+1jcuDw2LSqk83jzrU9bB59W1YxenzeJBfA
        EpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hZJC
        WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDAwMgUqDAh
        O6Pvxnn2ghO8FWferGVuYFzK3cXIySEhYCKx+N55pi5GLg4hgR2MEgc332OFcD4xSty91MYI
        UiUk8I1RovFgFEzH/DWboYr2MkpsudvMDuF8ZJT4s3UrK0gVm4CuxJbnr8C6RQTiJc6/aWQB
        KWIWeMkoceLSAxaQhLBAhMSHiS+YQGwWAVWJT0dvsoPYvAJ2Eku3r2GFWCcvsWF+LzOIzSlg
        L7F7+lVGiBpBiZMzn4DNYQaqad46mxlkgYTAI3aJDUsXMUI0u0hc3HyYCcIWlnh1fAs7hC0l
        8fndXjYIu1hi6axPTBDNDYwSl7f9gkoYS8x61g40iANog6bE+l36IKaEgLLEkVtQe/kkOg7/
        ZYcI80p0tAlBNKpLHNg+nQXClpXonvMZ6hUPiY55u6BhPYlRYvXsX0wTGBVmIXlnFpJ3ZiEs
        XsDIvIpRLLWgODc9tdiowBAexcn5uZsYwclSy3UH4+S3H/QOMTJxMB5ilOBgVhLhZcxtSRLi
        TUmsrEotyo8vKs1JLT7EaAoM7InMUqLJ+cB0nVcSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9
        sSQ1OzW1ILUIpo+Jg1Oqgeko6yqtQ9FLwx7Il4WvjXkfmq5S7GFx5RvbjGmxc7d7Rh/UvZU5
        IXjlxtuzD60Pz2q6Xt/ZkXF26ur46PD519VrbGc9rxEM8N9vW9bM/H3hW//wGXKChnu/X866
        w/yh5gaHxaH9zHzL0jhLi/J7o7cz5DG+K/wnurL17b5A6c/8eeV1vqf9PdPLOE6+Dam26crb
        Jv97y+Ng99XrW6QSspIY/4nlVmi06K3+/W2eQsT14q2vix6c2ne2J+76Wt7rl3LuLy9YFbzi
        9qpfCnmvpthbhsxkfV/9K8FU7+6C5yYCsduU/zRsDuJxWJfskbdl7ZyqVOf9XqcmTttz/olJ
        9nQOjqpiToXQ1NZnkjJlLUosxRmJhlrMRcWJAEg2+9gfBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOLMWRmVeSWpSXmKPExsWy7bCSvO6HhvYkg6535hYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JYrLJiU1J7MstUjfLoEro+/GefaCE7wVZ96sZW5gXMrdxcjJISFgIjF/zWbWLkYuDiGB3YwS
        b1ftZoZIyEo8e7eDHcIWlrjfcgSq6D2jxMlD2xhBEmwCuhJbnr8Cs0UE4iWWnvvBAlLELPCW
        UeLfg5lgCWGBMIk1R56xgdgsAqoSn47eBJvKK2AnsXT7GlaIDfISG+b3gm3mFLCX2D39Kliv
        EFDN5gnfoOoFJU7OfMICYjMD1Tdvnc08gVFgFpLULCSpBYxMqxglUwuKc9Nziw0LDPNSy/WK
        E3OLS/PS9ZLzczcxgsNaS3MH4/ZVH/QOMTJxMB5ilOBgVhLhZcxtSRLiTUmsrEotyo8vKs1J
        LT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qByeaSVXz1XwFGAQ5LRSuvaYriInt0
        3IIXZR5c3LjL+0Qt07mcBRmioW/m7jAIqfSXPuueE7hmQZPGeda01jNnhJY677GZE10lUL9m
        9eR9DuZHHqecMO6aVN7UpiaSyCwne6ad89GaHdX/Hi3ekGc49U3VmyUfd0verV3yIvKBKtvv
        I0/smExmne86aX/hiGl1i2rZbttbq1IL5zvHiyqV8EycsU3BefeRGU6FS96cWMdYXbPnTA5H
        xJ3nr2rfuwnseqYa2n3rzuS1cnKvv1o9NrBjSNgr5HK3Okt4T/OR7ydfMbvPXKpiup0rNMRw
        vq5y5MLzf0yd6l4vi7km5Bb8WLS9M3fJfO9ZG898/zYxSomlOCPRUIu5qDgRALK88kTaAgAA
X-CMS-MailID: 20220520115216epcas2p1de431047122f853ed129785653b787a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520115216epcas2p1de431047122f853ed129785653b787a5
References: <20220520115250.57785-1-chanho61.park@samsung.com>
        <CGME20220520115216epcas2p1de431047122f853ed129785653b787a5@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Reboot of exynosautov9 SoC can be handled by setting the bit(
SWRESET_SYSTEM[1]) of SYSTEM_CONFIGURATION register(PMU + 0x3a00).
syscon-reboot-mode can be used to indicate the reboot mode for
bootloader. SYSIP_DAT0 register(PMU + 0x810) will not be cleared after
reboot so bootloader can enter the boot mode according to the value.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 0ce46ec5cdc3..3e23db8f09d9 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/clock/samsung,exynosautov9.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/samsung,boot-mode.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
 
 / {
@@ -312,6 +313,22 @@ pinctrl_peric1: pinctrl@10830000 {
 		pmu_system_controller: system-controller@10460000 {
 			compatible = "samsung,exynos7-pmu", "syscon";
 			reg = <0x10460000 0x10000>;
+
+			reboot: syscon-reboot {
+				compatible = "syscon-reboot";
+				regmap = <&pmu_system_controller>;
+				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
+				value = <0x2>;
+				mask = <0x2>;
+			};
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x810>; /* SYSIP_DAT0 */
+				mode-bootloader = <EXYNOSAUTOV9_BOOT_BOOTLOADER>;
+				mode-fastboot = <EXYNOSAUTOV9_BOOT_FASTBOOT>;
+				mode-recovery = <EXYNOSAUTOV9_BOOT_RECOVERY>;
+			};
 		};
 
 		syscon_fsys2: syscon@17c20000 {
-- 
2.36.1

