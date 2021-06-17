Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3ABDC2B9F4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Jun 2021 11:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8010D613F9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Jun 2021 11:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhFQLiA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:38:00 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:23652 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbhFQLiA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 07:38:00 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210617113550epoutp047fc8b3de01506ce2866057a2612417d2~JW4Ec5KAA1028710287epoutp04d
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jun 2021 11:35:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210617113550epoutp047fc8b3de01506ce2866057a2612417d2~JW4Ec5KAA1028710287epoutp04d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1623929750;
        bh=qDXigxVra/5pZtQ1wUkDfHrWD1KLEnG3NPV2b/Qa9PY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=jU+WF0OuVRI2I9NPtMVdLQezAvqak4PrWkCMmrcd1Sg6H4bSLusQv2UqjuDubJCwb
         70iSclRoEGCx34r4RMvTOHCTD3V13YwrYErp4ehTcWEdofECv9vNcTgUAvWedMOvhn
         zGaQSgEtg7y94mqfDkMJDYDDz9PbbwnJ7eLqS/7Q=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTP id
        20210617113550epcas5p130a2b5dbaa1dd8e52f7fc8cc288a92dc~JW4EJRxia0166001660epcas5p1B;
        Thu, 17 Jun 2021 11:35:50 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        0E.07.09697.6933BC06; Thu, 17 Jun 2021 20:35:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
        20210617113313epcas5p1fb3fff0b301b9e67a771349e72c2445b~JW1x1Ikdm0716007160epcas5p1T;
        Thu, 17 Jun 2021 11:33:13 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210617113313epsmtrp2848197646249b270c9faa251f5d72b89~JW1x0dakw2285222852epsmtrp2L;
        Thu, 17 Jun 2021 11:33:13 +0000 (GMT)
X-AuditID: b6c32a4a-64fff700000025e1-58-60cb3396df83
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        B6.98.08163.9F23BC06; Thu, 17 Jun 2021 20:33:13 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210617113312epsmtip261b2b076043724d1cf6cd413f54ea3d8~JW1w0I7N62977429774epsmtip2H;
        Thu, 17 Jun 2021 11:33:12 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 1/2] arm64: dts: exynos7: Add cpu cache information
Date:   Thu, 17 Jun 2021 17:07:38 +0530
Message-Id: <20210617113739.66911-1-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsWy7bCmpu4049MJBm1/RCwezNvGZrHx7Q8m
        i02Pr7FaXN41h81ixvl9TBate4+wO7B5zGroZfPYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJ
        zcksSy3St0vgynh0dA9rQZdgxf63e5gbGKfxdjFyckgImEic/X6JvYuRi0NIYDejxJXHy9hB
        EkICnxglDi9zhUh8ZpR4NuEFC0zHlp8vGSESuxglGi5vhXJamCRuLuxlBqliE9CWuDt9CxOI
        LSIQI/FwzzxWEJtZoFDiRctNoBUcHMICzhJ3DyaCmCwCqhJfNiqCVPAK2Eg0X7nIBrFLXmL1
        hgPMIOMlBBaxS7y7vogJIuEica97OiuELSzx6vgWdghbSuLzu71sIDMlBLIlenYZQ4RrJJbO
        OwZ1v73EgStzWEBKmAU0Jdbv0ocIy0pMPbWOCeJIPone30+gNvFK7JgHY6tKNL+7CjVGWmJi
        dzfUBR4Sm59uZYaEW6zEscOX2Scwys5C2LCAkXEVo2RqQXFuemqxaYFRXmq5XnFibnFpXrpe
        cn7uJkZwnGt57WB8+OCD3iFGJg7GQ4wSHMxKIry6xScShHhTEiurUovy44tKc1KLDzFKc7Ao
        ifMuZT+UICSQnliSmp2aWpBaBJNl4uCUamAyWGl+2u2Us8tb07n+p+6kCubc0Oie/+lQ69cF
        HGySUpFbNb6KX97A+29GzPnH/PLVvHNvXePfP/ux2769ioG3+SUb2oX5J/qucQvcIlWadGDt
        uz6eS9tUElonvZ8elPnBaoJXnInHqSNv5O329u5z7q79PH3Pwj2qC54wz4j/+3594KGbDQn3
        df7e2ynKp3ut8mnMfTat5sctHJUnZl8/t+Gh++8romf0S1LEeOVrfdjmO0jN28Hr2eZuVXMr
        5dHTc/PlNh15HiHiePAB+6O4o09Mok38JF2VQ/YH5+/jN/livPtkYKyuxNLE80xN8maHmhdM
        vTPn41aHKcqnXsxoakx5+OowY6q/df+F34unKbEUZyQaajEXFScCAO+cjCxiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKJMWRmVeSWpSXmKPExsWy7bCSvO5Po9MJBjsWcVk8mLeNzWLj2x9M
        FpseX2O1uLxrDpvFjPP7mCxa9x5hd2DzmNXQy+axaVUnm8fmJfUefVtWMXp83iQXwBrFZZOS
        mpNZllqkb5fAlfHo6B7Wgi7Biv1v9zA3ME7j7WLk5JAQMJHY8vMlYxcjF4eQwA5GiebGWUwQ
        CWmJ6xsnsEPYwhIr/z1nhyhqYpJ4tvwYI0iCTUBb4u70LUANHBwiAnESreurQUxmgWKJ07/A
        osICzhJ3DyaCmCwCqhJfNiqC9PEK2Eg0X7nIBjFcXmL1hgPMExh5FjAyrGKUTC0ozk3PLTYs
        MMpLLdcrTswtLs1L10vOz93ECA4ZLa0djHtWfdA7xMjEwXiIUYKDWUmEV7f4RIIQb0piZVVq
        UX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1MLUotgskwcnFINTDq3os7bSMgnrub4UbCh
        8ONTKyGh9nNz11YJ+N/ddmuS+r3SdrldcySVPBmulVxu29Z9eM+kbJ0F9cc+Hsr2umup8Lfz
        9IP+mFPd/WGv9nl0eN+axMWg+nN7dDbfdKv30wzqvszJcfUI2vpFskgvy2Dmah/z/smmuzRe
        JtVu1W1hWPzqK1//HkOXFxfdp/1cpyu37M+hut3O5bwSbiX5S++fveBVUy0cIxbEHSwWKN3/
        nMtNI2LVwTnWcj3FE7LS/y91S9CRUzrntnXGjNbbz65+cH1WuSzadObTH5+khHjMmzLK7+i5
        NLjbZoap3366zHmN37374mklvpppmv9s/izJiiyTWi0/u+XhJPtbSizFGYmGWsxFxYkARUTM
        FogCAAA=
X-CMS-MailID: 20210617113313epcas5p1fb3fff0b301b9e67a771349e72c2445b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210617113313epcas5p1fb3fff0b301b9e67a771349e72c2445b
References: <CGME20210617113313epcas5p1fb3fff0b301b9e67a771349e72c2445b@epcas5p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds cpu caches information to its dt
nodes so that the same is available to userspace
via sysfs.
This SoC has 48/32 KB I/D cache for each cores
and 2MB of L2 cache.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 10244e59d56d..8b06397ba6e7 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -54,6 +54,13 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x0>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu_atlas1: cpu@1 {
@@ -61,6 +68,13 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x1>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu_atlas2: cpu@2 {
@@ -68,6 +82,13 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x2>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu_atlas3: cpu@3 {
@@ -75,6 +96,20 @@
 			compatible = "arm,cortex-a57";
 			reg = <0x3>;
 			enable-method = "psci";
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
+		};
+
+		atlas_l2: l2-cache0 {
+			compatible = "cache";
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
 		};
 	};
 

base-commit: 614124bea77e452aa6df7a8714e8bc820b489922
-- 
2.17.1

