Return-Path: <SRS0=3dq4=EN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A103C4742C
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 13:39:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB2C0206ED
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  7 Nov 2020 13:39:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pp3Nijb3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgKGNjl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 7 Nov 2020 08:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgKGNjl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Nov 2020 08:39:41 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AE0C0613CF;
        Sat,  7 Nov 2020 05:39:40 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id y16so4609144ljk.1;
        Sat, 07 Nov 2020 05:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c5vk1HU4LMO05/HvLhuFLID0YfaxsQiSjHZGb3JZL+k=;
        b=pp3Nijb3qelAlJYoXTJYgO4SDTsvHQB1JVzF89P6cF7PNLT/RAQs2CvY4zJ2L+s657
         Rncm1TbS0AhZp5RWhK17AA9nfGkJuPjqOuiTzG5SUXR0X/CBwILioM5AcJwIQfNT3oNi
         6l3Iz82nm4lT7T+93ohGSnSSQK2e0WzReQZ6oDBR1YsM0b2OGWCkPUBtqGJXh4R/zsbe
         KIFr52Gn7obgs+qgg1HXxFe3Q+6Ig0nlw89gQ2rUe1ccXEJ9GVn4GcREF7Z1huS2l5MB
         wGPvhOufbRsForGk7jLelkIHSAe/hKG7VFQ3BOthkkFnmdb6qq1eWE5eUd9JYdKtVV+w
         mESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c5vk1HU4LMO05/HvLhuFLID0YfaxsQiSjHZGb3JZL+k=;
        b=aT+9E0ex+1rgp4p+UufwbYMQ5EHxD0GLtqyhf2/eooOm5yECywHKRf4NUCBZj/4DQO
         INwxfEmvivFDx9uFOLy6EPpJ0XA7fPyuaT+x0Uqeahy9co7Mkx0Lc9SB9sIyok6c1iCN
         ll9HW47ZxQrSqJVj5j+DKXebntosDVHpM4OMqnCmYmqxpF90q4l+rZ6aJj4CwgXTASNo
         VOjh3fBZ70EmdAhpcOn3x+tRGW4EGptbyxn8bqxbjQXmBbwmKALrX03I2oSAfvWngIz7
         TeIdPMqDT52U/WZXyl02o0a5RST48dm1YpAFyRhZXT3rswbf0mooYVZXS8aeOzvrtbCa
         7SUQ==
X-Gm-Message-State: AOAM531RI9Ki1QqIEE9mQYuRanFJkgGo1VuHcuMUv8ryN9ND++kYeI+F
        mYzLh8Do5aLFSUvgGN/No1c=
X-Google-Smtp-Source: ABdhPJykwd8X4etetyGtEH9KC2jai7rgshQmz5xZq3TNNHZcMixp/o1ZAsTHgBT0IRpaPnjMLSR6FQ==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr2412087ljj.247.1604756379480;
        Sat, 07 Nov 2020 05:39:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:a315:5445:5300:d646:fcbb:9c5e:1da1])
        by smtp.googlemail.com with ESMTPSA id y27sm524189ljm.74.2020.11.07.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 05:39:38 -0800 (PST)
From:   =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To:     kgene@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com
Cc:     robh+dt@kernel.org, a.kesavan@samsung.com,
        naveenkrishna.ch@gmail.com, thomas.ab@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 1/2] arm64: dts: exynos: Include common syscon restart/poweroff for Exynos7
Date:   Sat,  7 Nov 2020 14:39:25 +0100
Message-Id: <20201107133926.37187-1-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos7 uses the same syscon reboot and poweroff nodes as other Exynos
SoCs, so instead of duplicating code we can just include common dtsi
file, which already contains definitions of them. After this change,
poweroff node will be also available, previously this dts file did
contain only reboot node.

Fixes: fb026cb65247 ("arm64: dts: Add reboot node for exynos7")
Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
Changes from v1:
  - Split into two separate patches.
  - Include existing exynos-syscon-restart.dtsi to avoid code
    duplication.
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 7a2cba4220d9..723f5d5fcf00 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -624,13 +624,6 @@ hsi2c_11: hsi2c@136a0000 {
 		pmu_system_controller: system-controller@105c0000 {
 			compatible = "samsung,exynos7-pmu", "syscon";
 			reg = <0x105c0000 0x5000>;
-
-			reboot: syscon-reboot {
-				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
-				offset = <0x0400>;
-				mask = <0x1>;
-			};
 		};
 
 		rtc: rtc@10590000 {
@@ -818,3 +811,5 @@ atlas_thermal: cluster0-thermal {
 };
 
 #include "exynos7-pinctrl.dtsi"
+#include "arm/exynos-syscon-restart.dtsi"
+
-- 
2.27.0

