Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714DCCDB484
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Oct 2023 10:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345204AbjJSKGw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Oct 2023 06:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345181AbjJSKGv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Oct 2023 06:06:51 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2166211F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Oct 2023 03:06:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3226cc3e324so6849793f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Oct 2023 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697710007; x=1698314807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNH+cUkvJq9kPceEcJ89sVVgm6IQTkIk2n1XM45Z5uk=;
        b=ZyfXDo4bVVMme0ghDUVYhhps+R2YkPljIBDykBKcbkqWKtGmB6hbasy0sMudL4o188
         xNv3i3SZLdGYvJ7qFRf8kYPIiccnpB4GcwPY+/YDmqKeMFeGZC9eHFuUnB/3F2Zy20FZ
         j++i4FbQfeJjIgMD1HWSOFgkN0nG1NnmeSIY0zMWok34drIKhjiasTd7zLU/mm9gK94u
         pztSvfTDVPIWM+R2rly4SmOeuMsaq/kAxMbYckbh3fQh9KKBVw/nULOF0/m1xonU9vKI
         9fbm0hflYtKbkMw0P8Brb2PyA+sKG+/RhNxZ6jQ/eiLNosTWS4bJ8aMLOdwqiX/bXTXE
         1JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697710007; x=1698314807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNH+cUkvJq9kPceEcJ89sVVgm6IQTkIk2n1XM45Z5uk=;
        b=W6g2lbgYRObAGg67KGpNeYV9bEUswao19bAZUdlKwSDY/nUGct7vOL+LNdj3BIm7HI
         s/9lZf3IXCLzy2DUkKf/sjE7u/p+szkFAD9Qm2s4ZjHEX+c/16UtwiaDPaAZwqXFbJ2t
         Qai2PB3H+5w61sYrvrn1wCJzG/tLH9LudhxF0u+duyCtmZb4tQAyBt52evhJAzT4BpSY
         kWt5Ax8fad19VjpNq8T7BggLUwdf6kNE0w7JaREyaeV/kuEtOawyJB8Jd1Fz0a6V6+XH
         v9QHm9r0hbwab9sge/B+WnoZL+K+J0bZgFXQKFTuMci6sCzAXyNT19cbgeI1Z6p6+GVW
         jtQw==
X-Gm-Message-State: AOJu0Yy6GfoXADL54pMtWdfxFP55OOCrIusxGONFbath/ZTQQCFZCw+U
        h4VUbDjEIQ7OIW5FTqXxL82dOw==
X-Google-Smtp-Source: AGHT+IF0lSU8RSwWRVtoHZMhIoGDLuCWoohmt6sdGSIxzJpSj25BOHDGAY3DaA75D7bseTADxZLBWw==
X-Received: by 2002:adf:e80f:0:b0:32d:8872:aac8 with SMTP id o15-20020adfe80f000000b0032d8872aac8mr1164054wrm.31.1697710007466;
        Thu, 19 Oct 2023 03:06:47 -0700 (PDT)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d664e000000b0032d687fd9d0sm4169035wrw.19.2023.10.19.03.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:06:46 -0700 (PDT)
From:   =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, jirislaby@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, alim.akhtar@samsung.com,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] tty: serial: samsung: drop earlycon support for unsupported platforms
Date:   Thu, 19 Oct 2023 11:06:38 +0100
Message-Id: <20231019100639.4026283-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Commit 1ea35b355722 ("ARM: s3c: remove s3c24xx specific hacks") removed
support here for several old platforms, but kept support for earlycon
for those same platforms.

As earlycon support for otherwise unsupported platforms doesn't seem to
be useful, just drop it as well.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 6b8d4b4402e9..a74ecc78f4e0 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2735,17 +2735,7 @@ static struct samsung_early_console_data s3c2410_early_console_data = {
 	.rxfifo_mask = S3C2410_UFSTAT_RXFULL | S3C2410_UFSTAT_RXMASK,
 };
 
-static int __init s3c2410_early_console_setup(struct earlycon_device *device,
-					      const char *opt)
-{
-	device->port.private_data = &s3c2410_early_console_data;
-	return samsung_early_console_setup(device, opt);
-}
-
-OF_EARLYCON_DECLARE(s3c2410, "samsung,s3c2410-uart",
-			s3c2410_early_console_setup);
-
-/* S3C2412, S3C2440, S3C64xx */
+/* S3C64xx */
 static struct samsung_early_console_data s3c2440_early_console_data = {
 	.txfull_mask = S3C2440_UFSTAT_TXFULL,
 	.rxfifo_mask = S3C2440_UFSTAT_RXFULL | S3C2440_UFSTAT_RXMASK,
@@ -2758,10 +2748,6 @@ static int __init s3c2440_early_console_setup(struct earlycon_device *device,
 	return samsung_early_console_setup(device, opt);
 }
 
-OF_EARLYCON_DECLARE(s3c2412, "samsung,s3c2412-uart",
-			s3c2440_early_console_setup);
-OF_EARLYCON_DECLARE(s3c2440, "samsung,s3c2440-uart",
-			s3c2440_early_console_setup);
 OF_EARLYCON_DECLARE(s3c6400, "samsung,s3c6400-uart",
 			s3c2440_early_console_setup);
 
-- 
2.40.1

