Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F3CC27C7C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjATRby (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbjATRbk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:40 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6561DA113
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:31:24 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so6332417wml.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyAO0ggLkugTbmjL8T0rTpiHk71ZjtlH8av65wk9BAQ=;
        b=m6tsvSeI4ao0UUTKLDkiByuqXXc2FaQGEzVB9V8E7aqstGcCXgnCGbkAkH0K+EFvgi
         f1y52Lv5vIIo2rH+6keNv+OplditcWJfumyNsk6xEv1ljPFzbtQxoTZon2qi2FJs0Zt4
         VAdvL20Dj6PK3L6so+67nt8e2j3sgDMvNi62NH0NYQLiVZUhSXrnS92o1sKr10AtMEVi
         50SYzQ+l5wPgXaf+B92pb/JUGVPyckOgwpq7rCLct/5cojOJv7sRe8wo4S3hCvNo7lfn
         1dWXdDngtgxMXN0EjiQtp/ZnUzpWWuxgNPP0VvTgXNqgqDMBKrztrMZ/dSy5QbpAN9qi
         VTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyAO0ggLkugTbmjL8T0rTpiHk71ZjtlH8av65wk9BAQ=;
        b=bphCiYVzWNCHmmErR4hQnBbsj9+rXDDiQqVwYjPydy3vS/8jZfm6s9oCqSZYpERxK4
         MGS7xnH3qbpyw/9tkMCQH1oWaxBfJgmjacsU/BsSAh6sgE9uaHwNJ3r0HIhNa1kE2sET
         05fYP3vJwhjrUu6j5NcgZjZ5Z4LsLi31VhVa7KqAlKWeqH7DIuSK9O+2XDXL8jpuey4Q
         OkP0uifEj+ZIA2ZPYtH0Bf32f60XkmMzdKpN/6URzH6MLrkZCyvxJz8nNGJfVHMXTP0D
         nUfWnkpqIZmRe6Z9t3EFOWS6psUkKGok6NVFvF3W5T3LE9C2K6l/lNmcCxABi0TMSqRj
         YJcQ==
X-Gm-Message-State: AFqh2kqyayaGeLcvKq4vMCWzazl/HxP0v8v2g1Ag7jIDUqASyvKYOBD1
        t+GIKc2DNXL7axzwqY8LGqMUk0c2z9xN6Nuc
X-Google-Smtp-Source: AMrXdXskZLKqyM0OBnAZtcD8h/EPC2ylTQFXkugT8TggR3ynJAOHqiZHz9cmQ72VKbksu9/gjkHOqA==
X-Received: by 2002:a7b:c4d7:0:b0:3db:2fc6:e124 with SMTP id g23-20020a7bc4d7000000b003db2fc6e124mr3624107wmk.7.1674235883284;
        Fri, 20 Jan 2023 09:31:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d22-20020a1c7316000000b003db0dbbea53sm2819179wmb.30.2023.01.20.09.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] arm64: dts: exynos: correct Bluetooth LED triger on E850-96
Date:   Fri, 20 Jan 2023 18:31:13 +0100
Message-Id: <20230120173116.341270-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120173116.341270-1-krzysztof.kozlowski@linaro.org>
References: <20230120173116.341270-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Switch source of LED activity to hci0-power from RX, to match bindings
(same effect expected):

  exynos850-e850-96.dtb: leds: led-5:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
    'hci0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'ide-disk', 'timer', 'pattern']
    'hci0rx' does not match '^cpu[0-9]*$'
    'hci0rx' does not match '^hci[0-9]+-power$'
    'hci0rx' does not match '^mmc[0-9]+$'
    'hci0rx' does not match '^phy[0-9]+tx$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/a85c256af01f64389a078c2b37c3b72a27d97536.1668005062.git.geert+renesas@glider.be/
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index f52a55f644f7..6ed38912507f 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -106,7 +106,7 @@ bt_active_led: led-5 {
 			gpios = <&gpg2 7 GPIO_ACTIVE_HIGH>;
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_BLUETOOTH;
-			linux,default-trigger = "hci0rx";
+			linux,default-trigger = "hci0-power";
 			default-state = "off";
 		};
 	};
-- 
2.34.1

