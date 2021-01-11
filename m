Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95598C4332D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 00:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 748FF22D5A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jan 2021 00:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404135AbhALA0F (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Jan 2021 19:26:05 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53447 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404217AbhAKX70 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Jan 2021 18:59:26 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id A37455C0199;
        Mon, 11 Jan 2021 18:58:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jan 2021 18:58:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm3; bh=QJyc8uMExPnjvCSQaDC9bp9jZW
        tmdd8pCdXh/3fwRSs=; b=thkTohomJd4BWoaPxwekTk6xWZT/gKc3aCdHzAbbhU
        o/lZlmyOOmzCUPvuiWQNsCXv0ccSw3jeP4awfftBbuyvUdGwlZgkKm6tbfUrBiAp
        y9UjkW7Vyf8BW7p1if0KjH/2LyvcY4yfRb9ua2MPvJX+1vmDZESjhEhheaSF5VyU
        LDxn4JD8ow+5sMpvyUwxshKaIccUZoHNJl87xGNkkL5I7/k/KB/wW1mvOV3XqEuG
        JSUxDjSbh0GzZSzmSd6z+JwmHlyUgrmDFRyUReRGpel5G0ctqIRZ7oeTkCetkmMu
        GtrSqS8IRyXXhgeEpCo3WouTfqPXgsiEnOv6skZjGTAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QJyc8u
        MExPnjvCSQaDC9bp9jZWtmdd8pCdXh/3fwRSs=; b=BR5Ic2zNeyZpk53iscZKnU
        pCcaFO2HrRuCDgzb4CMKfrF1S1LhkoG/M3A8g3OqxuDWSGPdYZ6EHlDK08bO8Dv3
        Jw4PJSFFXWKUAS5s14GqNJ9uVdV8ADwyA8lhpyxBa40pC0A629KRuWuhFLWxVJln
        /pKlqyndhJh69EDGVxHXlNusgJNrLj1ifg/yHV9Dl6dZZLTn65Uiz9l55VcL4Dzy
        bs6oHXAVk9YRRdY5OQ0+hMRvpn/+aQfsnSHNVApCcyvJHv99w319+e5hUOXaag1n
        oAWaDQvQ3Zdea+u09pP7Nppudom210dwIpbiac3SgrxgMv/5nbVtVvwp/l8LxFew
        ==
X-ME-Sender: <xms:E-b8XyqgxKg-BQGcQmSRYOXZTpDoOJuLTm65tA07tRhPyaTX1ifrug>
    <xme:E-b8XwoKTN7PQwf2QV9rUsyS2Jx6PPnUT5katzgiFwmCnpayVCUSEXMsTUw7zfK3f
    8gO9GPbaXEVdxlKF1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegoteeftdduqddtudculdduhedm
    necujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgrnhhnhi
    cunfhinhcuoegurghnnhihsehkughrrghgtdhnrdguvghvqeenucggtffrrghtthgvrhhn
    pefhudevudfftdejkeejgefhleffteefkedtveevieefveeggeduiefflefgheelteenuc
    ffohhmrghinhepghhithhhuhgsrdgtohhmpdgvvghmsggtrdhorhhgnecukfhppedutdeg
    rddvtddtrdduvdelrddvuddvnecuufhprghmkfhppfgvthifohhrkhepuddtgedrvddttd
    druddvledrvdduvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegurghnnhihsehkughrrghgtdhnrdguvghv
X-ME-Proxy: <xmx:E-b8X3Oa_dvQLJx9_3Si5OpT_HiJN6TeK8Ti0cc0xddS3Q5ClnZ1Yw>
    <xmx:E-b8Xx6BpeSOjMP8v_ZaxBta_gCSv7fdRL1VfZhN6jf2FxMw3AhQPA>
    <xmx:E-b8Xx6yZFRh4Gn8KvlU4-UwHQidjz5YkAchi5btGo7xhWbw7Lb9ew>
    <xmx:FOb8X01vMvLnUnHnomVmjECT2ijs_xVnvygo9km3J_sNpy3OKMDfmw>
Received: from pinwheel.localdomain (unknown [104.200.129.212])
        by mail.messagingengine.com (Postfix) with ESMTPA id 24F2A24005A;
        Mon, 11 Jan 2021 18:58:11 -0500 (EST)
From:   Danny Lin <danny@kdrag0n.dev>
Cc:     Danny Lin <danny@kdrag0n.dev>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: exynos: Add energy model for Exynos 5250
Date:   Mon, 11 Jan 2021 15:57:16 -0800
Message-Id: <20210111235717.321153-1-danny@kdrag0n.dev>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This energy model enables the use of energy- and capacity-aware CPU
frequency scaling.

Power and performance measurements were made using my freqbench [1]
benchmark coordinator, which uses EEMBC CoreMark [2] as the workload
and measures power usage using the integrated PMIC's fuel gauge (DS2784
in this case).

The energy model dynamic-power-coefficient values were calculated with
    DPC = µW / MHz / V^2
for each OPP, and averaged across all OPPs within each cluster for the
final coefficient.

A Google Nexus 10 device running a downstream 3.4 kernel was used for
benchmarking to ensure proper frequency scaling and other low-level
controls.

Raw benchmark results can be found in the freqbench repository [3].
Below is a human-readable summary:

===== CPU 1 =====
Frequencies: 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700

 200:   909     4.5 C/MHz    132 mW   36.2 J    6.9 I/mJ   275.0 s
 300:  1366     4.6 C/MHz    212 mW   38.7 J    6.5 I/mJ   183.0 s
 400:  1821     4.6 C/MHz    286 mW   39.3 J    6.4 I/mJ   137.3 s
 500:  2253     4.5 C/MHz    375 mW   41.7 J    6.0 I/mJ   111.0 s
 600:  2740     4.6 C/MHz    446 mW   40.7 J    6.1 I/mJ    91.2 s
 700:  3199     4.6 C/MHz    513 mW   40.1 J    6.2 I/mJ    78.2 s
 800:  3673     4.6 C/MHz    678 mW   46.1 J    5.4 I/mJ    68.1 s
 900:  4090     4.5 C/MHz    764 mW   46.7 J    5.4 I/mJ    61.1 s
1000:  4586     4.6 C/MHz    878 mW   47.9 J    5.2 I/mJ    54.5 s
1100:  5060     4.6 C/MHz   1084 mW   53.6 J    4.7 I/mJ    49.4 s
1200:  5515     4.6 C/MHz   1225 mW   55.5 J    4.5 I/mJ    45.3 s
1300:  5933     4.6 C/MHz   1396 mW   58.9 J    4.2 I/mJ    42.1 s
1400:  6395     4.6 C/MHz   1662 mW   65.0 J    3.8 I/mJ    39.1 s
1500:  6897     4.6 C/MHz   1895 mW   68.7 J    3.6 I/mJ    36.3 s
1600:  7332     4.6 C/MHz   2198 mW   75.0 J    3.3 I/mJ    34.1 s
1700:  7826     4.6 C/MHz   2497 mW   79.8 J    3.1 I/mJ    31.9 s

[1] https://github.com/kdrag0n/freqbench
[2] https://www.eembc.org/coremark/
[3] https://github.com/kdrag0n/freqbench/tree/master/results/exynos5250/main

Signed-off-by: Danny Lin <danny@kdrag0n.dev>
---
 arch/arm/boot/dts/exynos5250.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2ea2caaca4e2..cc2fe0afcfc7 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -58,6 +58,8 @@ cpu0: cpu@0 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <800>;
 		};
 		cpu1: cpu@1 {
 			device_type = "cpu";
@@ -67,6 +69,20 @@ cpu1: cpu@1 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu0_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
+			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <800>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
 		};
 	};
 
-- 
2.29.2

