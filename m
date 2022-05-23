Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585EAC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 12:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235373AbiEWMMU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 08:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235372AbiEWMMS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 08:12:18 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328A229C83
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 05:12:16 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220523121213epoutp02309781be59d9b0b987a969430638ebfc~xus5NBlZT1164811648epoutp02-
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 12:12:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220523121213epoutp02309781be59d9b0b987a969430638ebfc~xus5NBlZT1164811648epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653307933;
        bh=CbnJ6r5RJx+x5uEep6BdpxgGR6fmdjU3WvQatIu4L9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FW0aq4UT8sH0UbKaXm+apVprt/9DGNd9KlIgP0bodkYvrhrPSjZLgR6J7hGQgBACC
         ZaKnsIe28EporqUymmdQDO/4fWr9hU26BsQdmCQeHsdi+3LrDRyc4oOPymPwxV/Ar9
         RyjkY0Ksb45EJ27pkT8LO03rhA8JOmXRQojX3UXU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220523121213epcas2p1512ebc0af5c4266f295b5d208316a371~xus43mIes2307023070epcas2p1Y;
        Mon, 23 May 2022 12:12:13 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.69]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4L6GRG5YPyz4x9Pv; Mon, 23 May
        2022 12:12:10 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        D2.16.09694.A1A7B826; Mon, 23 May 2022 21:12:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220523121210epcas2p101300d7187b70e310fa8f92b7d53ad72~xus2eInNS2307023070epcas2p1U;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220523121210epsmtrp2ce9f2b50131cbaf1e3c56c7fa8caa75b~xus2dbesh2440224402epsmtrp2u;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
X-AuditID: b6c32a48-47fff700000025de-99-628b7a1ab3d7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B8.7F.11276.A1A7B826; Mon, 23 May 2022 21:12:10 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220523121210epsmtip2d52eba55075cf70e868b5a21fdb2a798~xus2P5hcZ1576415764epsmtip2P;
        Mon, 23 May 2022 12:12:10 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 2/2] arm64: dts: exynoautov9: add syscon
 reboot/reboot_mode support
Date:   Mon, 23 May 2022 21:12:44 +0900
Message-Id: <20220523121244.67341-3-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220523121244.67341-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplk+LIzCtJLcpLzFFi42LZdljTQleqqjvJ4PoNbYsH87axWVzer21x
        /ctzVov5R86xWvS9eMhsMeP8PiaL1r1H2C2e9+1jcuDw2LSqk83jzrU9bB59W1YxenzeJBfA
        EpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQN0hZJC
        WWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDAwMgUqDAh
        O6Pvxnn2ghO8FWferGVuYFzK3cXIySEhYCLx7fdJpi5GLg4hgR2MEpPvbWKHcD4xSqxvvsgK
        4XxjlGi89p8VrmXae0aIxF5GidmfrrFBOB8ZJZrfzACrYhPQldjy/BUjiC0iEC9x/k0jC0gR
        s8BLRokTlx6wgCSEBSIkevteMoHYLAKqEtNmPWAGsXkF7CSmfJzFBrFOXmLD/F6wOKeAvcSS
        rStYIGoEJU7OfAJmMwPVNG+dzQyyQELgLbvEqZkXmSCaXSR+fV4KdbewxKvjW9ghbCmJz+/2
        Qi0ollg66xMTRHMDo8Tlbb+gEsYSs561A73AAbRBU2L9Ln0QU0JAWeLILai9fBIdh/+yQ4R5
        JTrahCAa1SUObJ/OAmHLSnTP+Qx1gYfEjJa30CCdxCjx7sZJlgmMCrOQvDMLyTuzEBYvYGRe
        xSiWWlCcm55abFRgAo/j5PzcTYzgdKnlsYNx9tsPeocYmTgYDzFKcDArifBuT+xIEuJNSays
        Si3Kjy8qzUktPsRoCgzsicxSosn5wISdVxJvaGJpYGJmZmhuZGpgriTO65WyIVFIID2xJDU7
        NbUgtQimj4mDU6qBSfhuMCfrqbiUdddmSmd8ze9598/7/52sPOFnK1/5L8q/ynh8zTQb5XCp
        tC1Vi1q2fLgi+eR+2wa2hxGp2lvNlysv3TzdY0eM8DTHl/vvv9l6IKN3n7rTegVWkVn+725X
        dPa2/UhIK51jJ3Wx9+H3B6VltV3LFP43Nv64lJ6/0X7B0c31DdN+7pib8Wau/JKHSR69JkGc
        7E/0p35sapR5UOSjuPHZDJd5ixZs/Xvy8os5aUX3jFc+Edh+9NlL7zVSprsZ/mYk1cpOz7Ly
        bFi0Tf2r0JqZh/Mu10gYqIsvb/p8eDvXbqHY2zMtZnSsFj++0t4vRL1dWf6Shyj7/nkHrDNE
        o1qnhU6WkP03cWlJ0HslluKMREMt5qLiRACWqusxIAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsWy7bCSvK5UVXeSwb0/YhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JYrLJiU1J7MstUjfLoEro+/GefaCE7wVZ96sZW5gXMrdxcjJISFgIvFt2nvGLkYuDiGB3YwS
        m36/YYdIyEo8e7cDyhaWuN9yhBWi6D2jxP3l21lAEmwCuhJbnr9iBLFFBOIllp77wQJSxCzw
        llHi34OZYAlhgTCJa63PmEBsFgFViWmzHjCD2LwCdhJTPs5ig9ggL7Fhfi9YnFPAXmLJ1hVA
        gziAttlJbOzJhSgXlDg58wnYXmag8uats5knMArMQpKahSS1gJFpFaNkakFxbnpusWGBYV5q
        uV5xYm5xaV66XnJ+7iZGcFBrae5g3L7qg94hRiYOxkOMEhzMSiK82xM7koR4UxIrq1KL8uOL
        SnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgYmk+dPBV6TKGXW9quDjPTn23
        dd2N0lWXM6Y9lFnr2OdYti/MSsUpw0/irtMbs0IViYB1HQYFneuKW56s/3W/ZWrbmhPxS0Q4
        SpeFcqf/+bSo8ilLtLCYWOPh3T8kBPduvvr76ewE/5wX36MMb735du+MpeTTk04/VOfWi/bt
        e5R8+2f6tmfHZnJJ5fEujF+g9fPKjUnHL7lbR1Q7CRqaiBp1tCWwht1Q5yjlPHjyzU/zXRFX
        Hvn9ZQ2+bXV97dPnW2rNxIQv6Nw1vzFbS/PcJEGlo1vSP8085Xc/+G7v5E86Wl8vKWdcKun/
        35AqP+vmF6ZvFw4k3uVSt2M7kK8n8WnuNbV7d1v/yjSYbqqZX6PEUpyRaKjFXFScCAArUIyD
        2QIAAA==
X-CMS-MailID: 20220523121210epcas2p101300d7187b70e310fa8f92b7d53ad72
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220523121210epcas2p101300d7187b70e310fa8f92b7d53ad72
References: <20220523121244.67341-1-chanho61.park@samsung.com>
        <CGME20220523121210epcas2p101300d7187b70e310fa8f92b7d53ad72@epcas2p1.samsung.com>
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

