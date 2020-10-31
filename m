Return-Path: <SRS0=vFf2=EG=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4856DC388F7
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 18:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04B27206E3
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 31 Oct 2020 18:00:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY2APgCe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgJaSAV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 31 Oct 2020 14:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgJaSAV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Oct 2020 14:00:21 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A6CC0617A6;
        Sat, 31 Oct 2020 11:00:21 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id h22so5703489wmb.0;
        Sat, 31 Oct 2020 11:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GhAOWaWIlyhIBd+vE/eqpDFIiE9Ns5tUs5jw9i9fY2g=;
        b=RY2APgCeqHXqEsMAeyUrotvlG7/NwpTdLdDkVAQHBQWcBxm3eKKKpldnAlRT32rpAF
         b5i4YrXK7db+flxcASnvMLiLRmCYk6uDbIohNMUFAqnuFre1zoUDEV3jNJOt4tf9Hahq
         PZPWSM3YBMlXb0ABNU0j2vIeNTikT2ERp45oX4HDKYabuSy7pw0Opy8j3Pdx1P4UYher
         oCHop0M0mgUGyxvJ1z0kJu70GAAbtJS5pBxqMWv65j/YPk2TgBYvlt0OkCRvm1zVQ7Oh
         JVWQbQ5REblGwuIGxZjxSlZlSD+uesxd+X1id4Gj4k9RULmoRgA9/oofDdBGV5mhVBV5
         Hbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GhAOWaWIlyhIBd+vE/eqpDFIiE9Ns5tUs5jw9i9fY2g=;
        b=YiKLOyOZvJeerpAgIzNEej8UHkH4IrP06V3mYthcOACk1pfFkgzcj1IeXDhoCd+qND
         JAyOlnZ0ORSxrImkhuKAv5LPM1iqU1pJ4/3Io+uAhS1zq+eqktY3wdX47iOpFFaHszCU
         wtnV1dPtSsuzOq1PpncHtw1Bp1gup9wwpk8ORYUD+jU2wc/eOgU5ekkTYBinotazmKe7
         rd8lgAhobPphSD2kcj+s6OI9LOTdjWmw+ikz8ptwtjrK/TAwQ+HSzfNDjBKfSr1j13w2
         AXqboylS9XuF4LKoP5kr6TzCbtQKIqbHiq8bIokiXJFfHKgxO//4XzzRbver5A9d4onZ
         2BWQ==
X-Gm-Message-State: AOAM533a3MnaDPKaYpVfb92aAZlgPtaRXZCdzXPaKhbDC4TNUGNDxHoo
        FvB+2HMaO914Tr5Ov9xXNU4=
X-Google-Smtp-Source: ABdhPJykHrOmZOR6p5+VReJaErPdIHHNlW0ztpD9mVsKBMz8h9G5XxomUvEo+6Edc6cNk02MZiEYfw==
X-Received: by 2002:a1c:67d5:: with SMTP id b204mr9396761wmc.92.1604167219977;
        Sat, 31 Oct 2020 11:00:19 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id z191sm9494144wme.30.2020.10.31.11.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 11:00:19 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH 4/5] ARM: defconfig: compile Atmel MXT touchscreeen as module
Date:   Sat, 31 Oct 2020 18:58:36 +0100
Message-Id: <20201031175836.47745-5-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201031175836.47745-1-martin.juecker@gmail.com>
References: <20201031175836.47745-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Atmel MXT touchscreen can load firmware and settings from the
/lib/firmware directory, it makes sense to have it as a module to have
more control over the loading process.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 arch/arm/configs/exynos_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index c9581e603a32..bad4f3d306ba 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -125,7 +125,7 @@ CONFIG_KEYBOARD_CROS_EC=y
 # CONFIG_MOUSE_PS2 is not set
 CONFIG_MOUSE_CYAPA=y
 CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_ATMEL_MXT=y
+CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_MMS114=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MAX77693_HAPTIC=y
-- 
2.25.1

