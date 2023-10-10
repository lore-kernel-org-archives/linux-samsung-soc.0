Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADC1CD98D0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344338AbjJJWvC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Oct 2023 18:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344259AbjJJWua (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 18:50:30 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C541A4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:50:17 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32c9f2ce71aso1127905f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978215; x=1697583015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s37SUcPotioxZcjEHmhq7GzFTfw04ERbXr6RSb1B27c=;
        b=YLflrFqBNoeyMQu4V1GkkHdtxG9kaosjv+MB38MkhKDT1STbCHbvuO1/XAHB58CVHo
         yeHIWoHJdykr3+pxcRY0yaQ/h6a8jyDE4y0UD0vVrNVKjmurwkTe5tpgIf7VH5uNDw8j
         eu/vfjjG7fuCIZo/KFu14RZ0Y/lMSiKDd2U/TeA4SIn0lpfLPAA+HHGILEJdokfnEIxo
         +3s7s0dZAZg6Qpfo7Ne/wLrpwNaRzjTeFojWAZYNIkhlCmNN8+pacwCslnefZiw/7tay
         qsPZ/XlOM+MQz9Sueam/yYbA7zRPIbB0PNWHX0Eom5ugKIgUedc0qzFen/YouEOP/Cbn
         QdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978215; x=1697583015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s37SUcPotioxZcjEHmhq7GzFTfw04ERbXr6RSb1B27c=;
        b=ZIuHuUpjE411F8F6O/JL2K1J8mhNY+zgu9/2TG8HotjJihYPLnurGTNK3OFxlSoyPZ
         +CxB4444MYcKzYhLyY7e0Y4WfPijnEZUWPSFjbZqzFSUVXGktecHLBa0nCq4HTDbi5BU
         qzZsdxzxXuOabZZBTYicp3bvr0qEdtqmoy9+ZOrU0ylGpIbaai4bx/FYVSP9/AQbtOHv
         vNCAZFsm6oE0TYdLlvPF6ynyCjg7aovc5+EBC48rj7SqaTqiFEg50urZcu45tWS2upSZ
         4sDE0UBu6YAtLbJqYPInxqFmOdvT52529y2gJgBH0+D3bxwH8kcgfbI/5K2DiXAlYpKT
         saqw==
X-Gm-Message-State: AOJu0YySWejBYgbzmN8Z1N3UiHKvCA9az8DR9iW8tuQJIiNi4Ab6P4C4
        T0GBfFUTc0mMC7B/BEiByTJOMw==
X-Google-Smtp-Source: AGHT+IHJw3S0mLbaumsobRC5IL/pZDMQtHIFgcBqimA/C5vlsITA5NsDBJI4cgvehYn3duSLLOm7Lg==
X-Received: by 2002:adf:f84e:0:b0:324:8353:6e51 with SMTP id d14-20020adff84e000000b0032483536e51mr18255367wrq.45.1696978215668;
        Tue, 10 Oct 2023 15:50:15 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:50:15 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 20/20] MAINTAINERS: add entry for Google Tensor SoC
Date:   Tue, 10 Oct 2023 23:49:28 +0100
Message-ID: <20231010224928.2296997-21-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add maintainers entry for the Google tensor SoC based
platforms.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..149a0c364309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8836,6 +8836,16 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/firmware/google/
 
+GOOGLE TENSOR SoC SUPPORT
+M:	Peter Griffin <peter.griffin@linaro.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+F:	arch/arm64/boot/dts/google/
+F:	drivers/clk/samsung/clk-gs101.c
+F:	include/dt-bindings/clock/google,clk-gs101.h
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.42.0.609.gbb76f46606-goog

