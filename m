Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D99C433E5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFE97221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738958;
	bh=Pet8usq6vLkfnEHsRK3Hoaw0sEG6UxMvBQ2LZDWxbX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=s7J7irgRv5bic3QENQZZMvwl+LE51W9UpqhMpxSWop6CyFZln3KM91/mMxDyirVcO
	 zkekzF6dsr2KLMoj/8PnEIOp11NHp3BFOjoXY4UkD8gUk7kPiYs3dVf/0NTUnl5YuD
	 B+fe/maNSJiwD2rziPuGHbqrdjqDdmmwODUYMSVM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728545AbgHFSf5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgHFSem (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:34:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA36C0611E1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:34:25 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 3so10619321wmi.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=cHjEsDNnLESlbmnF7/uZ1Vy0zXzrTNau071242zF1Q4=;
        b=myxfpUF8VgZZ5PHWXr8qM0dXioXZFW7DAkZ2WWMIJW6Q/LSMC2ejx+r63L/jFaFlPW
         jc7YZzBrjDlrUaCqwxpyX9FWAZ0h0Q/DDwGfRlEKNmZmu9hcxnGhpIsTPBcR4vB3w9nI
         egFYM8TRcVNhYhJNAtpYWFqgnHdymyBNg++y+uCcCzwvmUlUeDywQZc5pUYnHeiuWmmh
         KDujx3t8mSDIXE6LTuvQs8X49ghA8py5AiurLkvMdS37ifM37l+TZEv0TbxBsMtlXsJT
         oqPn1IEUUbCHNlhEWq0KlkMxqwJWdASFWsgdG44EaOocvn2eTPINHlQlU/n6Ua1VuYs2
         MuVA==
X-Gm-Message-State: AOAM533evm9p93DoJprvfowD7JvaXPDc/HPjDo6/u/BrolUtCNqzS4Se
        fYjINOST2tLZcTRt8W2aYk00FuAJZO8=
X-Google-Smtp-Source: ABdhPJyYSK4OKh0IFouXiuF/dZ1A15vUyInGfWlYYF+wsMVaLvuDSV5YnsDGk/CbEulC/Fe46VFZUQ==
X-Received: by 2002:a1c:62d6:: with SMTP id w205mr9805657wmb.154.1596738863494;
        Thu, 06 Aug 2020 11:34:23 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id h7sm7524022wmf.43.2020.08.06.11.34.22
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:34:23 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1541934lta;
        Thu, 6 Aug 2020 11:23:55 -0700 (PDT)
X-Received: by 2002:a63:380d:: with SMTP id f13mr8202326pga.16.1596738235465;
        Thu, 06 Aug 2020 11:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738235; cv=none;
        d=google.com; s=arc-20160816;
        b=vuPGINIZ0nfq8Qvjp3UFo3bYyn3Hkv4AnUU0AqZhkG19v3W0HBRC169QDQV5S9qXcT
         +EYwCyz4JRJpPYkYuBCYX3T7SRrxACqtcBSrHOci1DF4rPtqkHIYHSespOp3rspL/+BV
         IDW6fDmDzCzgF6RFoS6JLf6TSssZR7xLEJ2ENaa2tDIodRFyh3aOjOgxq1WpIb9SPeRF
         H835TbfrMh7haCDCYL3WTBEJzeXMl1CZFc1zRGRFY2Q3DaTyypI2D2hvvJSB2Fuz4t+U
         fa7jb9epg7IFiVYsDxTk1+qFuXFdnwxqGBOGh+tQnkWP8bJN8mBGEMdOMJLFobzaIuud
         qShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=cHjEsDNnLESlbmnF7/uZ1Vy0zXzrTNau071242zF1Q4=;
        b=z1ng5HSRJ2J8D5fh85nnkWD9Thx9VEXjdTvFM8iSVFYKInVYD6tflKyiGMFM3S2cXI
         2xMOa+3Rj/4pprgIEsIRDQO3A1C2zqCvQXoGaaflhFDeWRWSKxAKOwE04mvI4wwbG1Qo
         YPbqGK3Ot57oMl4apod3yAC3j7tT6V6uJJyFy9VUQsmr+apOKc9nvpMs4WD2ZHss58VY
         kjeZGPZMhCHY1MjvLAI1dzHfVn22RnuhifOwnAduI6RGPXBBjmQjHrpUdhRLGp2LiEcl
         RLMTty5NWqznie01t7X0K866RUwxxjxk4SamsGzfUBS+8j4Be0rxb5eqiDZGE4pIpSSU
         6xFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=sNZ8uaLT;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id i66si4106092pje.96.2020.08.06.11.23.55
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 9151822E01; Thu,  6 Aug 2020 18:23:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F05C022DFB;
        Thu,  6 Aug 2020 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738235;
        bh=Pet8usq6vLkfnEHsRK3Hoaw0sEG6UxMvBQ2LZDWxbX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sNZ8uaLTB8z7OBL1r9fze2clYnyHVuQpkCzQwikVT/fhc1Ss3R/g6hspvDb7cpf9y
         qza6LVvffD+IIkKD/ln2C6v98BLiFwTmWArYvzgWGIvHQuPkep+8qYJipkEKsv0xtl
         ISl0iwwBcUvI8aq3AX1ourJu7enNTENDFoOTmIEM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 30/41] ARM: s3c24xx: include mach/irqs.h where needed
Date:   Thu,  6 Aug 2020 20:20:47 +0200
Message-Id: <20200806182059.2431-30-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: jb/9BSsfG08E
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Preparing for a later conversion to sparse IRQs, this ensures that
the mach/irqs.h header is still visible in files that reference
an IRQ number.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/bast-ide.c    | 1 +
 arch/arm/mach-s3c24xx/bast-irq.c    | 1 +
 arch/arm/mach-s3c24xx/common.h      | 1 +
 arch/arm/mach-s3c24xx/irq-s3c24xx.c | 1 +
 arch/arm/mach-s3c24xx/pm-s3c2412.c  | 1 +
 arch/arm/mach-s3c24xx/s3c2443.c     | 1 +
 arch/arm/mach-s3c24xx/simtec-usb.c  | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm/mach-s3c24xx/bast-ide.c b/arch/arm/mach-s3c24xx/bast-ide.c
index 067944398f46..ee6fbb407640 100644
--- a/arch/arm/mach-s3c24xx/bast-ide.c
+++ b/arch/arm/mach-s3c24xx/bast-ide.c
@@ -20,6 +20,7 @@
 #include <asm/mach/irq.h>
 
 #include <mach/map.h>
+#include <mach/irqs.h>
 
 #include "bast.h"
 
diff --git a/arch/arm/mach-s3c24xx/bast-irq.c b/arch/arm/mach-s3c24xx/bast-irq.c
index 03209fefa5db..a6db5e2c910c 100644
--- a/arch/arm/mach-s3c24xx/bast-irq.c
+++ b/arch/arm/mach-s3c24xx/bast-irq.c
@@ -16,6 +16,7 @@
 #include <asm/mach/irq.h>
 
 #include <mach/regs-irq.h>
+#include <mach/irqs.h>
 
 #include "bast.h"
 
diff --git a/arch/arm/mach-s3c24xx/common.h b/arch/arm/mach-s3c24xx/common.h
index 8d2e2c6ae7eb..86826cafa15d 100644
--- a/arch/arm/mach-s3c24xx/common.h
+++ b/arch/arm/mach-s3c24xx/common.h
@@ -10,6 +10,7 @@
 #define __ARCH_ARM_MACH_S3C24XX_COMMON_H __FILE__
 
 #include <linux/reboot.h>
+#include <mach/irqs.h>
 
 struct s3c2410_uartcfg;
 
diff --git a/arch/arm/mach-s3c24xx/irq-s3c24xx.c b/arch/arm/mach-s3c24xx/irq-s3c24xx.c
index d2031fecc386..b0e879ee14c1 100644
--- a/arch/arm/mach-s3c24xx/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c24xx/irq-s3c24xx.c
@@ -25,6 +25,7 @@
 #include <asm/exception.h>
 #include <asm/mach/irq.h>
 
+#include <mach/irqs.h>
 #include <mach/regs-irq.h>
 #include <mach/regs-gpio.h>
 
diff --git a/arch/arm/mach-s3c24xx/pm-s3c2412.c b/arch/arm/mach-s3c24xx/pm-s3c2412.c
index b1d0ad07301b..2779d67d2c07 100644
--- a/arch/arm/mach-s3c24xx/pm-s3c2412.c
+++ b/arch/arm/mach-s3c24xx/pm-s3c2412.c
@@ -19,6 +19,7 @@
 #include <asm/cacheflush.h>
 #include <asm/irq.h>
 
+#include <mach/irqs.h>
 #include <mach/regs-gpio.h>
 
 #include <plat/cpu.h>
diff --git a/arch/arm/mach-s3c24xx/s3c2443.c b/arch/arm/mach-s3c24xx/s3c2443.c
index c278cfc10ba5..3c05d04bbbeb 100644
--- a/arch/arm/mach-s3c24xx/s3c2443.c
+++ b/arch/arm/mach-s3c24xx/s3c2443.c
@@ -25,6 +25,7 @@
 
 #include <mach/hardware.h>
 #include <mach/gpio-samsung.h>
+#include <mach/irqs.h>
 #include <asm/irq.h>
 #include <asm/system_misc.h>
 
diff --git a/arch/arm/mach-s3c24xx/simtec-usb.c b/arch/arm/mach-s3c24xx/simtec-usb.c
index 3488988316a8..693a2a9a7349 100644
--- a/arch/arm/mach-s3c24xx/simtec-usb.c
+++ b/arch/arm/mach-s3c24xx/simtec-usb.c
@@ -24,6 +24,7 @@
 #include <asm/mach/irq.h>
 
 #include <mach/gpio-samsung.h>
+#include <mach/irqs.h>
 #include <asm/irq.h>
 
 #include <linux/platform_data/usb-ohci-s3c2410.h>
-- 
2.17.1

