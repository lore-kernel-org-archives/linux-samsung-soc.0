Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE22C2B9F4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Jun 2021 11:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8C4D613F9
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Jun 2021 11:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhFQLiH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:38:07 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:45626 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbhFQLiF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 07:38:05 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210617113556epoutp01f89403c51f145bc980448ad94f335f55~JW4J2unAY3229432294epoutp01W
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Jun 2021 11:35:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210617113556epoutp01f89403c51f145bc980448ad94f335f55~JW4J2unAY3229432294epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1623929756;
        bh=d+EWMXyJ0y/ivOouip2NQgjzDqHjUOuiHNgCsJW29IM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IIXlwCVmxSyrcOFnS7zv//1PkDZ+tbHLJoLYYrFwkArZXyk7PCoGmIl5I8+mRvp7t
         ZpZUOKwJMX1OM8Bovb5zetNVs+SJuk82UQJnTYwOkOvQy+SPBfPnVSRcoI7X9J2UHw
         qdTEJaV5AkYVFaDBFtuzjGzBkIdLZ4kcE1FK7uR4=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20210617113555epcas5p35b00eba18e2929ed6fb8eb320a359465~JW4JDJa2c0539705397epcas5p39;
        Thu, 17 Jun 2021 11:35:55 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F2.68.09606.B933BC06; Thu, 17 Jun 2021 20:35:55 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20210617113314epcas5p4652e98d24d7f56a7c8461175bbb25456~JW1y3quT_0518505185epcas5p4Q;
        Thu, 17 Jun 2021 11:33:14 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210617113314epsmtrp231efdd9e1b42df4e739b5fb615221221~JW1y26hTx2292622926epsmtrp28;
        Thu, 17 Jun 2021 11:33:14 +0000 (GMT)
X-AuditID: b6c32a49-bf1ff70000002586-98-60cb339b7750
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E7.DF.08637.AF23BC06; Thu, 17 Jun 2021 20:33:14 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
        [107.108.73.139]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210617113313epsmtip2238d67173ca06484a305225171411508~JW1x41cIt2453424534epsmtip2Q;
        Thu, 17 Jun 2021 11:33:13 +0000 (GMT)
From:   Alim Akhtar <alim.akhtar@samsung.com>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org
Cc:     krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/2] arm64: dts: exynos5433: Add cpu cache information
Date:   Thu, 17 Jun 2021 17:07:39 +0530
Message-Id: <20210617113739.66911-2-alim.akhtar@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210617113739.66911-1-alim.akhtar@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7bCmuu5s49MJBj23lS0ezNvGZrHx7Q8m
        i02Pr7FaXN41h81ixvl9TBate4+wO7B5zGroZfPYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJ
        zcksSy3St0vgyvi1uom1YKZ8xfTH3SwNjP/Fuxg5OSQETCTmfv/L3MXIxSEksJtRYsKWzYwQ
        zidGiS/bnrNDON8YJR4/2cUK07L9wFc2iMReRonNW++zQDgtTBI/WqaBVbEJaEvcnb6FCcQW
        EYiReLhnHlicWaBQ4kXLTXYQW1jATeLZxl9ANRwcLAKqEnt+J4GYvAI2Eiv60iF2yUus3nCA
        GcTmFLCVuH+vC+wgCYF97BLPzsxlBamXEHCRuLakGqJeWOLV8S3sELaUxOd3e9kgSrIlenYZ
        Q4RrJJbOO8YCYdtLHLgyhwWkhFlAU2L9Ln2IsKzE1FPrmCDu5ZPo/f2ECSLOK7FjHoytKtH8
        7irUGGmJid3d0NDxkFg57xQ0dCYwSkxs/cw0gVFuFsKKBYyMqxglUwuKc9NTi00LDPNSy/WK
        E3OLS/PS9ZLzczcxghOAlucOxrsPPugdYmTiYDzEKMHBrCTCq1t8IkGINyWxsiq1KD++qDQn
        tfgQozQHi5I471L2QwlCAumJJanZqakFqUUwWSYOTqkGpuabVj7yub8N1/KGzv15NTJKWTD4
        3E79fXuN9it+irLQWSS07NPNhU95PkW9Cz6wzLj66PxW9skrZl1VCPkiteP5Z3XXEuNVi62O
        f01KX//s3ZT3nP80G25ePnL85rtmOxn+xy55bPtnWC0xV5c902XFtLXlgkraU/GzD5P3aJ4T
        XtL8veaz5My6VR0qC4PP/SraeuFgk9dLQZl9TWHZG61tevM2PLFp2bPvPJuhiXqrYu/+w3mz
        GY+ty7no/VBK+qbBqVXaL7eI3975i31+41njqnnRTG9kZ+o80lRbHnwkgtv4jDrHEpvIE+/8
        c3Tun3EUuXmze/b8J58vlmi+rlpxMs53bfJmzTvmH5r/bJirxFKckWioxVxUnAgAVzzkbm8D
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmluLIzCtJLcpLzFFi42LZdlhJXveX0ekEgwsTRSwezNvGZrHx7Q8m
        i02Pr7FaXN41h81ixvl9TBate4+wO7B5zGroZfPYtKqTzWPzknqPvi2rGD0+b5ILYI3isklJ
        zcksSy3St0vgyvi1uom1YKZ8xfTH3SwNjP/Fuxg5OSQETCS2H/jK1sXIxSEksJtR4kDjRjaI
        hLTE9Y0T2CFsYYmV/56D2UICTUwSJ897g9hsAtoSd6dvYepi5OAQEYiTaF1fDWIyCxRLnP7F
        BFIhLOAm8WzjL7AKFgFViT2/k0BMXgEbiRV96RCz5SVWbzjADGJzCthK3L/XxQ5SIgRUsnsB
        zwRGvgWMDKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYLDS0tzB+P2VR/0DjEycTAe
        YpTgYFYS4dUtPpEgxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC18l4IYH0xJLU7NTUgtQimCwT
        B6dUA1OVsuyTtZNPFtrf+PIly+1N26oDPad96hp8vmpuM5+890y1uFbM4pPLFDS4RarM/qil
        PLKwN1285p3ismWvNgdfeKhy5W1/gM8asRMbf9u9Vd3y/s/vuf26d2a6bMzsXJ9yOcqII/jO
        ycV+X4tuX6jwUvyxPm1dcEzrARG1OasaUpv9A7Zuk3j4PHJxU7SbVPSFm695j/Ws3LdgXnye
        2PKK1xdzMix3vdJetWDa5Tku3/a+tdZ1mc+5ZecSsWXe99oud3P6fppTs0e80ihf7kZC+Vp1
        y7/qewXDa7YpTFFZUMqzwdl16uW21qINJn/bt++WuVTMMFHE49TO9pS05rhDLGc4L288sYP3
        8l/WLQqqSizFGYmGWsxFxYkAzuVwap4CAAA=
X-CMS-MailID: 20210617113314epcas5p4652e98d24d7f56a7c8461175bbb25456
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210617113314epcas5p4652e98d24d7f56a7c8461175bbb25456
References: <20210617113739.66911-1-alim.akhtar@samsung.com>
        <CGME20210617113314epcas5p4652e98d24d7f56a7c8461175bbb25456@epcas5p4.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch adds cpu caches information to its dt
nodes so that the same is available to userspace
via sysfs.
This SoC has 48/32 KB I/D cache for each A57 cores
with 2MB L2 cache.
And 32/32 KB I/D cache for each A53 cores with
256KB L2 cache.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 18a912eee360..8183a59e9046 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -62,6 +62,13 @@
 			clock-names = "apolloclk";
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&apollo_l2>;
 		};
 
 		cpu1: cpu@101 {
@@ -72,6 +79,13 @@
 			clock-frequency = <1300000000>;
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&apollo_l2>;
 		};
 
 		cpu2: cpu@102 {
@@ -82,6 +96,13 @@
 			clock-frequency = <1300000000>;
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&apollo_l2>;
 		};
 
 		cpu3: cpu@103 {
@@ -92,6 +113,13 @@
 			clock-frequency = <1300000000>;
 			operating-points-v2 = <&cluster_a53_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&apollo_l2>;
 		};
 
 		cpu4: cpu@0 {
@@ -104,6 +132,13 @@
 			clock-names = "atlasclk";
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu5: cpu@1 {
@@ -114,6 +149,13 @@
 			clock-frequency = <1900000000>;
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu6: cpu@2 {
@@ -124,6 +166,13 @@
 			clock-frequency = <1900000000>;
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
+			i-cache-size = <0xc000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&atlas_l2>;
 		};
 
 		cpu7: cpu@3 {
@@ -134,6 +183,27 @@
 			clock-frequency = <1900000000>;
 			operating-points-v2 = <&cluster_a57_opp_table>;
 			#cooling-cells = <2>;
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
+		};
+
+		apollo_l2: l2-cache1 {
+			compatible = "cache";
+			cache-size = <0x40000>;
+			cache-line-size = <64>;
+			cache-sets = <256>;
 		};
 	};
 
-- 
2.17.1

