Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4092FC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24F5360FE7
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbhGaJYu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Jul 2021 05:24:50 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47704
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232931AbhGaJYs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 05:24:48 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 423CE3F23B
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627723482;
        bh=ERP8Nj6BhzRSI6a/TCOdFNPpRXHoJA+/4PhYRhY4Cn4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ltZcAAlNLOY43R5wfUoIv463WaIZosnP5B0zkDYpunVh2xACR1sFOW5AZD8GBimRZ
         xpjawjZYOB2AMsCs4abW/yzJDj/UWFONqW4Z2Di0+v07/haMi+nGLRzYyL3+ZVcTRv
         G92Xffrnie/6DP0T9n0AivJbqi6fHKm3kvEnEOlm3YwP3MaisjiyAEK+V+iqLWTzvy
         Fa2uOG47+8SeNIvuguOtcMDoitht1rB4B/nFA1Td/hq9oFLBgN3GH6hYsPNdUA0rRI
         qcWAXsk/kIkf8bRDi/dnbVlqFZysXMrwqiNkSEmi+NTZ1tRtlOseUkP71kRR6NlZZd
         k0Y7FCSP/7VCw==
Received: by mail-ed1-f71.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so5886984edu.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 02:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERP8Nj6BhzRSI6a/TCOdFNPpRXHoJA+/4PhYRhY4Cn4=;
        b=YB4REAqtU0yEO9JMh1TSECy5OibACjJ8BUUR53iZL9HNY+cshfFLM7ZXFdQD7HH2ZN
         5G2YQNEXLwq3boY4/6ke5ZJuAtaCh/hYXubR69wef5NSsA8RMq3JLxsjWF/fpGZhOUzd
         +FMwEWPNoiOAYJX/TJF8UxKPMBoIbV+qr6JJ6gNLv2VvF6JRFoHOdrPxSzHhnM8Zo+lM
         rky9ijblEmzkBODxFfPgGuQ+cZ4MQp317Dv/w56ttessi/ND6qzy5vfwo+VUQY/Y1M98
         hsi9qHIKsoHJePlCGoaLEDcIIQVM+gV8yJ4+6N9E4b9AX+tgdOJSrHZZWjE/KSk6WFqF
         +jrA==
X-Gm-Message-State: AOAM531XFMeY+Se5/99w+PtFnb01oqo85Z4ew2xc6WfP9VJhgRNuub67
        78pfRrzIR0jku5kJg26Uz8h9EXcYsfBxU05N19ZqIPcZPqFq8YlMV8EMRmuri92h8iEzHg60hMq
        jq56tPtMScgY7AtzBm9xqIjiUzE+4qM5IzS89jY1n17r+6wLb
X-Received: by 2002:aa7:c2d7:: with SMTP id m23mr8435691edp.30.1627723482013;
        Sat, 31 Jul 2021 02:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWDPnTDXwoerV0fH7BKZWtc51zibHNXd/dd+1kecWozTV2HkLy5eSAhhDXTpFxZ0+A24W0fA==
X-Received: by 2002:aa7:c2d7:: with SMTP id m23mr8435672edp.30.1627723481915;
        Sat, 31 Jul 2021 02:24:41 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1947693edt.15.2021.07.31.02.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 02:24:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 7/8] ARM: dts: exynos: add CPU topology to Exynos5422
Date:   Sat, 31 Jul 2021 11:24:08 +0200
Message-Id: <20210731092409.31496-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
References: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe Exynos5422 CPU topology.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5422-cpus.dtsi | 32 ++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-cpus.dtsi b/arch/arm/boot/dts/exynos5422-cpus.dtsi
index 4b641b9b8179..412a0bb4b988 100644
--- a/arch/arm/boot/dts/exynos5422-cpus.dtsi
+++ b/arch/arm/boot/dts/exynos5422-cpus.dtsi
@@ -21,6 +21,38 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
 		cpu0: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
-- 
2.27.0

