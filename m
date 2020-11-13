Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB6EC6369E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D543922255
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 13 Nov 2020 21:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTLrjC08"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgKMVgx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 13 Nov 2020 16:36:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgKMVgv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 16:36:51 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45320C08E862;
        Fri, 13 Nov 2020 13:27:30 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id s25so15722565ejy.6;
        Fri, 13 Nov 2020 13:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=juJfP+fUaKyq7kybC6hgCXooc3ICN0/yZ8rqAh4sPzU=;
        b=WTLrjC08RsoX67P61YQjypa7W1PN7Ajse4lpxW1jIiINzDH6mYjlgOdMbn9slgcAnR
         WW7ewEfhDm+ULFkANdIMxPyZ3RmXBMkyFy61yF+a9gn/D1F4V1ae5DMUEXkH1ZCQ/ZUz
         b4oKiZ3uHLrYzG5ciMs8YisDHoc0/bzlvhMPeZww8QrI94rjCPA3B7Sum4aJWQHG90bi
         W+o50ui7ocWy3MThOweHDzPCfKuahYbbjqkKL8+SVPK1QeCs3gAm+//WsAhgbJWcPeGz
         fTaMbOl+j3llgDjcYSODQcRTA7Easnh5mrY34GmMKhhQXER9vjnPUEjyDbgOE/EoH5oQ
         AEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=juJfP+fUaKyq7kybC6hgCXooc3ICN0/yZ8rqAh4sPzU=;
        b=JH1h3gX2K5+n6HolMvqmdrHEJPhsb6/0uohBiQITJB+LdUMZFIC8lOC6JBjsmblCqc
         /sM4g/BBCIOvYNLNkCVw4d44VPVnT5RkPMF9sEKmkSyjyMuhN1q8k+GDR/CqV9fStr6q
         mt6B2ZhxhOgmTMYRIpYTkNSEgqV4vGTAUo+fCAVflLN3B0Dx2J8a4Ahz41l7fePz3x5r
         GDYQUIPq8KWGyWlni7vn7J0VTTSXXWNWtn4fwVaTd9OnIjuDFtNptnRs3yy6WsLyRfI0
         ndFnoVoXkoHWtUVX5xkG0putl1BAfkia40ZrbEHmPlyNL2Db+GCeHuYo3FFzDm7xaTYp
         ouog==
X-Gm-Message-State: AOAM530TnTa2tX/W1TBakk43YembHGn7J9uSvtagMcoFg7qeqqHgM3ws
        +gSyuNrnhlM+7ndHJ80MzHfDIIoB0ZsLZQNH
X-Google-Smtp-Source: ABdhPJzxGGuqc4CxPoekoHsG+xGta1Q5HekfGh7uuxuQTyv33oVrrgpcAvon3phmnsKDW2vgaASt8g==
X-Received: by 2002:a17:906:1f86:: with SMTP id t6mr3923941ejr.356.1605302849058;
        Fri, 13 Nov 2020 13:27:29 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id b1sm4688949ejg.60.2020.11.13.13.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 13:27:28 -0800 (PST)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH v3 4/5] ARM: defconfig: compile Atmel MXT touchscreeen as module
Date:   Fri, 13 Nov 2020 22:25:25 +0100
Message-Id: <20201113212525.13455-5-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113212525.13455-1-martin.juecker@gmail.com>
References: <20201113212525.13455-1-martin.juecker@gmail.com>
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
index c8ae45e5ad72..f07bde3ba9b1 100644
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

