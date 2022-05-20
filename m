Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D29AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 May 2022 04:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237024AbiETEvi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 May 2022 00:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbiETEvh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 00:51:37 -0400
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B721EEE6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 May 2022 21:51:35 -0700 (PDT)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20220520045132epoutp014f5b59b5da60a61b0fbb9634d45f5134~wtwQ9_Q7C0435404354epoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 04:51:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20220520045132epoutp014f5b59b5da60a61b0fbb9634d45f5134~wtwQ9_Q7C0435404354epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653022292;
        bh=0s/WE1fRITBuNFHC2Z39v8u36PMK9xRG27XBcVT667w=;
        h=From:To:Cc:Subject:Date:References:From;
        b=uVxDyj75i+Mvgzogj+gs2kquKeeD6Qyt9ERcvRy3Qiqd4C2PB5JYqQcbH+4scV4gL
         NND8rF3BqT2x6L17DEMza92raGAohd813IgY/xX9opXvIjHGJ35AZlE/EXdvp2DXql
         7CRy4l8yW/WVWTod1bs7KVyQ2O44Oby/HqbjnRxg=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220520045131epcas2p4a892b08378e752803693d1170ec3ecf6~wtwQV-sZx0684006840epcas2p4H;
        Fri, 20 May 2022 04:51:31 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4L4Dp83cfRz4x9Pv; Fri, 20 May
        2022 04:51:28 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        15.03.10028.C4E17826; Fri, 20 May 2022 13:51:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220520045124epcas2p12235472b7e9f7588003a7c8c238e8866~wtwJfJhTV0743507435epcas2p1W;
        Fri, 20 May 2022 04:51:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220520045124epsmtrp24bdc8a9f36b68e7bd9e0f65929326d56~wtwJeb0yh0544805448epsmtrp2R;
        Fri, 20 May 2022 04:51:24 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-9d-62871e4c2624
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        6D.75.11276.B4E17826; Fri, 20 May 2022 13:51:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520045123epsmtip2f2cb8aee8d578ca5265e7bc482cb0130~wtwJR3Swi2365623656epsmtip23;
        Fri, 20 May 2022 04:51:23 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] arm64: dts: exynoautov9: add syscon reboot/reboot_mode
 support
Date:   Fri, 20 May 2022 13:52:10 +0900
Message-Id: <20220520045210.55132-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmqa6PXHuSweot1hYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoCiWF
        ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFpXrpeXmqJlaGBgZEpUGFC
        dsbuK/1MBSu5K3ZvDW1gXMzZxcjJISFgIrH8wErWLkYuDiGBHYwS9//9ZYFwPjFKbL7VzQzh
        fGOUePF9FhNMy6yDbYwQib2MEp2H9zNBOB8ZJVqPr2cDqWIT0JXY8vwVI4gtIhAvcf5NI9hc
        ZoGXjBInLj1gAUkICwRKHFv6CKyBRUBV4s7sm6wgNq+AnUR3+wEWiHXyEhvm9zJDxAUlTs58
        AhZnBoo3b50Ndp+EwDl2idXvD7NDNLhILL7xHepWYYlXx7dAxaUkPr/bywZhF0ssnfWJCaK5
        gVHi8rZfUAljiVnP2oHO5gDaoCmxfpc+iCkhoCxx5BbUXj6JjsN/2SHCvBIdbUIQjeoSB7ZP
        hzpZVqJ7zmdWCNtDYvL332DDhQRiJb5N3sw6gVF+FpJvZiH5ZhbC3gWMzKsYxVILinPTU4uN
        CozhsZqcn7uJEZwStdx3MM54+0HvECMTB+MhRgkOZiURXsbcliQh3pTEyqrUovz4otKc1OJD
        jKbA8J3ILCWanA9Mynkl8YYmlgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODil
        Gpjab5jm18oJRlxYV6bjGjHZXeqvw8xv29wf6kVG+XxtnGJ43HJfy5KQ+16yktpndDrnbt3y
        XNn32JRIxsh7Pamae4qEGyvt+aTTlgTPUX2qpWGw51nlWys+q2XLNVovPzyeY162cOtlruN9
        OrLl4XMzhVnji5cXmnPo5LxkObtg8/LEN0dWa88oOuH6PZNJ7ZuYhVPzdOcLscYGBw8Wu55e
        FT19KqfLi7v36rOWN31RiHi2MeK9ZtajqXJLyg47spdZVCl271/KfrlG/nZHg7E37/R7wVGH
        FFuTFoQu5Entv+u3afEc62W5D/Z/6l4cNkmOS6Jx32W7yvBzKzs0RZ+k2X+V0Xr9cMrJC+vU
        0pVYijMSDbWYi4oTAX9yt7QSBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsWy7bCSvK63XHuSwZedlhYP5m1js7i8X9vi
        +pfnrBbzj5xjteh78ZDZYsb5fUwWrXuPsFs879vH5MDhsWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
        JYrLJiU1J7MstUjfLoErY/eVfqaCldwVu7eGNjAu5uxi5OSQEDCRmHWwjbGLkYtDSGA3o8Td
        jadYIBKyEs/e7WCHsIUl7rccYQWxhQTeM0rc/ANWwyagK7Hl+StGEFtEIF5i6bkfLCCDmAXe
        Mkr8ezATKMHBISzgLzFltx5IDYuAqsSd2TfB5vAK2El0tx+A2iUvsWF+LzNEXFDi5MwnYHFm
        oHjz1tnMExj5ZiFJzUKSWsDItIpRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzhAtTR3
        MG5f9UHvECMTB+MhRgkOZiURXsbcliQh3pTEyqrUovz4otKc1OJDjNIcLErivBe6TsYLCaQn
        lqRmp6YWpBbBZJk4OKUamGZ6xkf7dDY0xm1/e7l95nG1zTfN9P6fdpKbv0Jw1aYAH8ZnJsYp
        lSuXVt84+GBpy8Hlst99278p3S69k5z73jFma4GfYWbhm9wzl2O3vnr4IPbXsi0ljTraJe4v
        Zh+8bJqfNCH2q3CJSLqFO8vbooagRNep34xS/8quj12y7nadJb/kHJHe99esVyXmmln6nIkp
        1H15TIjjUuODbvE188M32ISEqeedCtGzmmX/f3KP+9TK5BUHUze9n5mlkXmfgyPfWvOU0Iyj
        hz612UsmPVyTIbx6x6JlDItKggJmfhKWeDWx0Nn+yJd1XqWRp6sa9626E+U65eMSttMSU/SX
        7/tsOv2YS93VtR8mfWwsPaLEUpyRaKjFXFScCABS6PrBvwIAAA==
X-CMS-MailID: 20220520045124epcas2p12235472b7e9f7588003a7c8c238e8866
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520045124epcas2p12235472b7e9f7588003a7c8c238e8866
References: <CGME20220520045124epcas2p12235472b7e9f7588003a7c8c238e8866@epcas2p1.samsung.com>
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
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 0ce46ec5cdc3..d99e53406ee0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -312,6 +312,22 @@ pinctrl_peric1: pinctrl@10830000 {
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
+			reboot_mode: syscon-reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x810>; /* SYSIP_DAT0 */
+				mode-bootloader = <0xfc>;
+				mode-fastboot = <0xfa>;
+				mode-recovery = <0xff>;
+			};
 		};
 
 		syscon_fsys2: syscon@17c20000 {
-- 
2.36.1

