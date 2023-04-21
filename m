Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B223C77B7E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Apr 2023 09:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjDUJ5l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Apr 2023 05:57:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjDUJ5j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:57:39 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07566A5EA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Apr 2023 02:57:38 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-504ecbfddd5so2097122a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Apr 2023 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682071056; x=1684663056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oHpDG2NFTHiJKeL0NreEJ/zw2aOnV+F8kaX5Ii5zVog=;
        b=GtLFK4AGXdMtOXz+kfxIxStURuoCfjWNX7T9PLSxaOE4vaTEDD9Q24ifc+yUVkDhqa
         pXq28re0GGbI+LE2VCM4tR0fXanS1Wlr5bn5y1WgL53DXrC7egbPhVg8hvckoLjnQbQi
         mwl1V0cwQzD0Y5Qr+3rHfqeUL8yQKEhtjgnw71HaF+LkTEPNNcYztY50MtrxNaDxi6RX
         YQoDWchpBxi7RiD2NmyXJMzUYD8Ztyl/S6t7B6eTeRGS++LjHXB7DGQYNJhFRo2cZWUw
         ASfvhMoHFQ6rs7YM+3A7xy9Os57lG6+kDiTPzocMy46w80/YQpQOKxbgRhFmt5RkDn1m
         2Fdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682071056; x=1684663056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHpDG2NFTHiJKeL0NreEJ/zw2aOnV+F8kaX5Ii5zVog=;
        b=LxVGiQU+0cZ3I6onjsikWqN09ftW3cWmKCz/R7/tEjGQPvL6GCSyRUK/iFylZ0lHOq
         FHcI/uCumIAB0hHAWMU/1rXKePHI1314f9qbvWiOZjBJUknJi+n6Yt/Q0EyiuX6PPimp
         b3onHBnZA7kFGtjTK3pLiy5Sxn7MbpuQPMIq/Kquz9OFcoajZeFm8pJonWMfHjGcVdJI
         NjNpTG/n0n8JC27IwfewFQWcth6p4hbFqQqdDmRwEAlTYPhb3UBMxUyWsdZMDtNOWUYY
         /Oe2Mq6gwneZCgDktvZradW0pQTHp1bmKC6/whtUTnQ8Vv2xpBGwFxTyJfSiLUUIaLno
         PKxQ==
X-Gm-Message-State: AAQBX9cEtG15+uobHEJ5eeBx4g0gs5cI6Y2w9LjfnT7C2jTrEz/tL7Gh
        HyUMH30NI6KjX6X1VFoufNe6arPeXet6GAtHrNU=
X-Google-Smtp-Source: AKy350brurKh6ztiJQMzGbml9x3XPmS0CuNx0oUEUciJh5hj3eeB4wyqKXl+umFreGX4NJiRww2PnQ==
X-Received: by 2002:aa7:da41:0:b0:505:4391:398 with SMTP id w1-20020aa7da41000000b0050543910398mr4726331eds.33.1682071056475;
        Fri, 21 Apr 2023 02:57:36 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:668b:1e57:3caa:4d06])
        by smtp.gmail.com with ESMTPSA id f7-20020a05640214c700b004fa380a14e7sm1686062edx.77.2023.04.21.02.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 02:57:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jonathan Bakker <xc-racer2@live.ca>,
        Pawel Chmiel <pawel.mikolaj.chmiel@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] ARM: dts: s5pv210: align pin configuration nodes with bindings
Date:   Fri, 21 Apr 2023 11:57:18 +0200
Message-Id: <20230421095721.31857-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Bindings expect that pins in initial and sleep states nodes end with
'-pin':

  s5pv210-fascinate4g.dtb: pinctrl@e0200000: sleep-state: 'gpa0-0', ...
    'mp07-7' do not match any of the regexes: '^(pin-[a-z0-9-]+|[a-z0-9-]+-pin)$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210-pinctrl.dtsi b/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
index 6d6daef9fb7a..ae0b4a423746 100644
--- a/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
+++ b/arch/arm/boot/dts/s5pv210-pinctrl.dtsi
@@ -19,7 +19,7 @@
 #include "s5pv210-pinctrl.h"
 
 #define PIN_SLP(_pin, _mode, _pull)					\
-	_pin {								\
+	pin- ## _pin {							\
 		samsung,pins = #_pin;					\
 		samsung,pin-con-pdn = <S5PV210_PIN_PDN_ ##_mode>;	\
 		samsung,pin-pud-pdn = <S5PV210_PIN_PULL_ ##_pull>;	\
-- 
2.34.1

