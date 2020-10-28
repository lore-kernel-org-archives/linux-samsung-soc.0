Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B170BC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 02:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B00420720
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 02:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDIv2msW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgJ2CNZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 22:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgJ1VgL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:36:11 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E884C0613D1;
        Wed, 28 Oct 2020 14:36:11 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bn26so978011ejb.6;
        Wed, 28 Oct 2020 14:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dOPkG51cqcEG4Loikdan84KA22neIPGBmd1iXgPOKvU=;
        b=iDIv2msWfduRF2KUPmTlwpSPN7p2DRaRX3aZ5hTffZ/cqBxD9HXlc+D7ru4zK7oEdE
         GK/1YB95Caxv7AYmph3nuO8X/nCYcRIVwU5YLPwJLsFr5LlcCwNHpD8TuuBGCiDBokPa
         6gsvmVLuYS4RxWuUUatoEfqi3145ApZYC4n0n8l2WQfkbS/Sqz/dJtLsk0zvxOzEWo/O
         Jq00xGMnE/sI/maF54/cVDUZdzJDSJEMP8kKq9bdMCljNkTDA8FJVa1VvGxvhOXVcmrS
         icg8DaoKJzfTtIfUHRGnLRSJPmFA3k2Yx+PTmsfgHtxAnAX0xlZFs8Fp23GLWlQYNWUF
         EJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dOPkG51cqcEG4Loikdan84KA22neIPGBmd1iXgPOKvU=;
        b=fIY7SJptVH+0TpRdqadIiWaYY3taw30RUFmsSkUia7fDLMBRuBlFvjVvmh4SzowCN4
         BKq4SiGbpc1uCMf4K43c0m6AuOxXeUA0UfHOqb0oJvktJNoKtyhL4t1ooJjGrudL8n30
         ta9yys7ycANaOk8Bt+cIQW21A6FdXGAskQmO0B4go1gucfjk2SwCAh1MKxESO8j2w8M1
         hNa0Zx8caEgxIFDQtua69IZgfjppHKc98tbswNuiwTU9YVgWyLnHnxILJe8GDW1dpia3
         sUrh6L12R6PxX+vzGm1D3TQjs2Q6A1EoobI1Agxb3yfRpVYNKhp7qmJeVi5Uc6GEKcM1
         4ciw==
X-Gm-Message-State: AOAM5323HKhgBEBfXWdHvpGUv+1HWy8i//g7HnuBOSnjCPTWgjwniPAF
        /bbNsXfuYZmcWtl+6q3JF2nNei2LBR0=
X-Google-Smtp-Source: ABdhPJz8U5e7kOuZlcVkoCb+Fk2dIbgZSZkC0ZmwrNSPTAHUTS1jsLlYq8a778c/jEL/XkeyVB5Umw==
X-Received: by 2002:a05:6512:3fa:: with SMTP id n26mr319207lfq.199.1603919313380;
        Wed, 28 Oct 2020 14:08:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a315:5445:5300:a6d2:8b6b:ef28:12ae])
        by smtp.googlemail.com with ESMTPSA id x6sm67712lfn.185.2020.10.28.14.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:08:32 -0700 (PDT)
From:   =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To:     kgene@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com
Cc:     robh+dt@kernel.org, a.kesavan@samsung.com,
        naveenkrishna.ch@gmail.com, thomas.ab@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH] arm64: dts: exynos: Fix reboot/poweroff issues on Exynos7
Date:   Wed, 28 Oct 2020 22:08:13 +0100
Message-Id: <20201028210813.49874-1-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In vendor sources for Exynos 7420, psci is not used to reboot or
poweroff device. Instead we should use syscon reboot/poweroff.
Previously it was not possible to poweroff (no syscon poweroff node) or
reboot (because it was handled by psci and this way is not working for
Exynos).

Fixes: fb026cb65247 ("arm64: dts: Add reboot node for exynos7")
Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 959918f4ca45..47d54c369d03 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -117,8 +117,10 @@ cpu_atlas3: cpu@3 {
 	};
 
 	psci {
-		compatible = "arm,psci-0.2";
+		compatible = "arm,psci";
 		method = "smc";
+		cpu_off = <0x84000002>;
+		cpu_on = <0xC4000003>;
 	};
 
 	soc: soc@0 {
@@ -552,6 +554,13 @@ pmu_system_controller: system-controller@105c0000 {
 			compatible = "samsung,exynos7-pmu", "syscon";
 			reg = <0x105c0000 0x5000>;
 
+			poweroff: syscon-poweroff {
+				compatible = "syscon-poweroff";
+				regmap = <&pmu_system_controller>;
+				offset = <0x330C>; /* PS_HOLD_CONTROL */
+				mask = <0x5200>; /* reset value */
+			};
+
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
 				regmap = <&pmu_system_controller>;
-- 
2.27.0

