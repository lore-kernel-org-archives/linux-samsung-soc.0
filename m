Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90084C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Jan 2022 13:15:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbiAVNPF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 22 Jan 2022 08:15:05 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:49200
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232711AbiAVNPE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Jan 2022 08:15:04 -0500
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B027640049
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642857303;
        bh=sq+GqGoHGm/8ryzGZ8Mwkyq3rI/NbpNjgK3K63Ee+P8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=bM6D4ueVZSs4micVd1HbbXDpXx8iPO4QeNglB/kaRoQdUTe4VlZ6WVl1X6J19v+zK
         FsFw257c1NRV0EBwUUU9FFIWmM2uVDMAIrrNpJxPiv3kQkaaF35i06P2O3LMbzHXfi
         gnBiuYMMkmEYwBBKacrs8Iy/tu9Io+OclDQX4NvY0k/0zdeHfuDXMgEWh2TEjMdOqT
         8EwQQ0R7v5UKGn6wCxOsXSW9pJFZV8g3sT/92/PEdMteWCiTWZc8uC9Cvm/m8MED5r
         ywhxf40yOlTyjbBu59ZXOM4wJCF6B1SgYFJuic9LfL30b3kuSkhf/GfGxbG8d4VEr7
         +ZdgoN/lLOPZQ==
Received: by mail-ej1-f70.google.com with SMTP id rl11-20020a170907216b00b006b73a611c1aso241765ejb.22
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jan 2022 05:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sq+GqGoHGm/8ryzGZ8Mwkyq3rI/NbpNjgK3K63Ee+P8=;
        b=m0haf2IHb5dGl0kqvJ4U9Tx7YdJuaIgNK4PGzt+3qlHTIbatqreBd7FXZ7Ud/VBzbx
         EBDYokWp3BBZKJ8v41oESmBDP1BoTCCabGyotf1+aoE86mkDyvpNxDxPBnYzCr+ID4SY
         zIGbHkAW5zIcAVLjYjo5blsIem5/u46bGDVuZ7Z/NOt4kVIQLRoYOlZtLbhvhKHYPS8G
         IjtD4tiFTT6eCw/FFqp99MFeFaSCmVLyprCAXnyXQ1C3IWwf6JiDEZBtQCF50e7mSMH3
         BiFIPiOy6rEc7BbVpAdWwYV3GJ1dIUF3ScY0lSiXDLUU7L9RgVSDBGsznM7+4b9ACdEK
         /Tlg==
X-Gm-Message-State: AOAM532Q3Jz4wEWLVK2/DjarnWGdkH/xS+Wm+v/lXMshiy9PHHQPEjXD
        PizXwzTj38x9oZXNQZhc7t1oYmTNf1TtfOFw7PTZz25Wie9KsQZS7rZMgfvEovcgsMoOSXsQsNP
        9Raq5vqdTxDg+hyXe3hKy/NoteXxxS+Wsu47jQGUXlrvhv0Nj
X-Received: by 2002:a05:6402:1d4d:: with SMTP id dz13mr8232526edb.80.1642857303215;
        Sat, 22 Jan 2022 05:15:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVyWY/MniL6pE8Qvx42ZDYAQcz+ygoyMbJ7Fg2vbPe6otymoWSlG8GropeNe8ENplv5ATIdA==
X-Received: by 2002:a05:6402:1d4d:: with SMTP id dz13mr8232515edb.80.1642857303023;
        Sat, 22 Jan 2022 05:15:03 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id k20sm2914823eja.14.2022.01.22.05.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 05:15:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: exynos: use define for TMU clock on Exynos4412
Date:   Sat, 22 Jan 2022 14:14:57 +0100
Message-Id: <20220122131457.63304-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Replace clock hard-coded number with a define from bindings.  No
functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4412.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index d3802046c8b8..aa0b61b59970 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -813,7 +813,7 @@ &tmu {
 	interrupt-parent = <&combiner>;
 	interrupts = <2 4>;
 	reg = <0x100C0000 0x100>;
-	clocks = <&clock 383>;
+	clocks = <&clock CLK_TMU_APBIF>;
 	clock-names = "tmu_apbif";
 	status = "disabled";
 };
-- 
2.32.0

