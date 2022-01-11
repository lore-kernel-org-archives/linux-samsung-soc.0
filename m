Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B79C43219
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 17:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344390AbiAKRsx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:48:53 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:32930
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344579AbiAKRsw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 12:48:52 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E19C840043
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 17:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923330;
        bh=b8unpukURFoj9tYv6hEHKZIOPqKdbI+UT8tS2dxzJ3A=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=feFkn4szcvNFN/VhwFtXLsTqOixJl5WHL7zaniP9SAo3AfMzLwDi6uTrPGuy7AwEn
         h7Vyc4+y+0ZKG6R2EdlaNI9fwn7AiZ3NoOzXhx69i0fFZZSJcWhG53gx3Tvc0Qb9BB
         Z7r4W049G9V3zO9Hy/ejS2H+gi7Rpg59oG9S4NPgZ0hXlf5PRKWLFH0z44A73WknXN
         Stm81Fv00lnOh1jXRe3OxqMhr3pGb4SicDrVLu7Ex2FCLDQLXhxhsGf/IjTBvpEot6
         l5xzXfY6x7CtN0AlgNVm+/pZh8J8dptAVeezLD6573EWFdJdDJx66mcOUXAduNemSY
         zAh+bvHi49Yzg==
Received: by mail-ed1-f71.google.com with SMTP id h11-20020a05640250cb00b003fa024f87c2so13996401edb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 09:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8unpukURFoj9tYv6hEHKZIOPqKdbI+UT8tS2dxzJ3A=;
        b=U4zZYQyRXtuNwIH48c9dNRws85I71WZVEOWJWKqT0uEvPGM6C3Q7npF5q/w0MK7lvh
         w5AVnhzpFKFjKpAPZmUOsPs2N4VyaGm8PjU3acYGDk4MezDyHhrRDP2gOPSm0WSdcMlY
         S+ZYoFMZsxNtc7lz+Vnymnqf/1G21d7cYVskKLjFAjUrKwcWtPE8LfNQEdxOaIThf3ku
         hDbqOTM/ahk5alCnPghWIteayv/2ZB7KpUgr56eYVLCLAFYMAStyQRtd/+O1Uuy5K7If
         QK4qnXc3wYKsf1k6DbcTTo1GbxOMOm7lQooGUaBuQ+Fy3OuPlKhTRHzR6K+Pybz3XBxY
         xPUQ==
X-Gm-Message-State: AOAM5314oQLwsI0cIHVGsqOxTIUGj3NCIKnm5G38eMYoUMYyLofqSBOF
        lqM3wl8tN6P6qsBjr9l82wVpGfDa33Fh/u78UxjU7tI1iVaeEC0TRw2wh0Sp756MCnV35Qk4BqL
        HPp1SjN4si/71qJgA919VsoYO4zGnh0UdsFjWfe88wD0ELsLP
X-Received: by 2002:a17:906:f214:: with SMTP id gt20mr4859165ejb.458.1641923330636;
        Tue, 11 Jan 2022 09:48:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAM0/Z9YVcu804le5q3yh75AgpsHjTUH68ArlTniLkfQouy/WQEvSuRTc1ZiHTwflEmE8bPg==
X-Received: by 2002:a17:906:f214:: with SMTP id gt20mr4859157ejb.458.1641923330509;
        Tue, 11 Jan 2022 09:48:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i23sm5224489edt.93.2022.01.11.09.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:48:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 5/5] MAINTAINERS: mfd: cover MAX77843 by Maxim PMIC/MUIC for Exynos boards entry
Date:   Tue, 11 Jan 2022 18:48:05 +0100
Message-Id: <20220111174805.223732-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The MAX77843 is used in Exynos5433-based TM2 boards and shares some
parts of code with MAX77693 (regulator and haptic motor drivers).
Include all MAX77843 drivers in the entry for Maxim PMIC/MUIC drivers
for Exynos boards, so they will receive some dedicated review coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5f2758531bc..d1f8f312f322 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11693,8 +11693,10 @@ L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77693.yaml
+F:	Documentation/devicetree/bindings/*/maxim,max77843.yaml
 F:	Documentation/devicetree/bindings/clock/maxim,max77686.txt
 F:	Documentation/devicetree/bindings/mfd/max14577.txt
+F:	drivers/*/*max77843.c
 F:	drivers/*/max14577*.c
 F:	drivers/*/max77686*.c
 F:	drivers/*/max77693*.c
-- 
2.32.0

