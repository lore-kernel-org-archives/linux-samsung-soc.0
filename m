Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096ADC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFBFD6103B
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Jul 2021 09:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbhGaJYq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Jul 2021 05:24:46 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47664
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232568AbhGaJYp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 05:24:45 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 4C6B63F239
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 09:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627723477;
        bh=2SsoeL69SAbyVLuagHDmvrXJo7lE3+dC0c+iRSlRnVc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=qFsTkO4eepm/DqCMQXppe8VxSEAFM3YwAlxSrj2U6Eq84QGni2PVt4TurlipA1zpi
         3T+zZjyKCuW6zs+t68drgEnyrmxHbgnk9NH22iluQ2ukdq0DAZ119RXehvWPRvMC0i
         yoMK5TDyeJxIITephJ3EqPUSs6O/F8Z1BZVYYZI/egfu+4SjbnXrBOgG0Ahi+FyDWb
         1H7eXVDPMMSnSAmqlZ76yGqap3y5+avNcSU4WX9nqQX2ZwBdLjdgQnkZlczwZLH8XQ
         j2O5ef3z3dMcMSEwLvWNJi9pBgRa/rsEnUeDlIx2tTSL8ueR2l6mTch8Ks+E4v8YFl
         9XbeRaN0KSLpg==
Received: by mail-ed1-f70.google.com with SMTP id b13-20020a056402278db029039c013d5b80so5901678ede.7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 02:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SsoeL69SAbyVLuagHDmvrXJo7lE3+dC0c+iRSlRnVc=;
        b=K89oEQFuEUmxv8be4ZruOyoPodKEChvz38C+N3bk+I7vEmONory8CQSGwCzQBciEK5
         WgnpBsNZaM33O3CbtdEnPQ6EWvgmax5bcDNYb2sIEuL3Vx7m8ucCnv9sv2TQkprK6BPc
         0r6ZYocgn7q9chbK585FwmWPWHQOaMlw17Mz4jhX8ZnKQX+7OOCchY/DfkG5BJYbxUGR
         HW774j9ppQXBb5jxpRRmXTnA+AO1AEAnVlOyAVkpBAR6sZw4bzLZhrZGLtfe/V1MlIo1
         VeJ6HJUUJcivTy0wH3Nnj7+9q9u2zUyXpShiDhBl0RAMlKr2cRVqECJ1qIdTaPJG7g2m
         JwIQ==
X-Gm-Message-State: AOAM531tjjC/aYyngCtggsB9lDbzXrfNxChSlRCI7WBMk93i5pKXQF+3
        1zIZCZ2K2Mmm2/wMIM1M60+Qe8k3A3O3yYjw2OPz8SxJ5D7lS0E2+IJz0zR5UNuKhg0S+qznWHi
        dcah14Ohbb+bF4a2CIzRSL+DDqUNNrDFAZOdwJ9iAOUQn/H0l
X-Received: by 2002:aa7:c3d1:: with SMTP id l17mr4578539edr.299.1627723474536;
        Sat, 31 Jul 2021 02:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeAnPajwclK+eQXY1ZtPp0NIkRYZP3KRr0MLG5lY5FR1vkdqt76BV8Rkpf4D3K9sS4iN6vpg==
X-Received: by 2002:aa7:c3d1:: with SMTP id l17mr4578532edr.299.1627723474425;
        Sat, 31 Jul 2021 02:24:34 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1947693edt.15.2021.07.31.02.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 02:24:34 -0700 (PDT)
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
Subject: [PATCH 1/8] ARM: dts: exynos: add CPU topology to Exynos3250
Date:   Sat, 31 Jul 2021 11:24:02 +0200
Message-Id: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe Exynos3250 CPU topology.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 77ab7193b903..a10b789d8acf 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -50,6 +50,17 @@ cpus {
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
+			};
+		};
+
 		cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
-- 
2.27.0

