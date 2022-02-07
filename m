Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E020FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 18:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbiBGSAl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 13:00:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239191AbiBGRzy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 12:55:54 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5730AC0401D9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 09:55:54 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 030CD4025B
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644256553;
        bh=/iBTMJ+6ky1LxQGNpybYW4PAzENXOdLtJcm5RBsECOE=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=V5d0m/4qdB7Nm6++fc67OeUMzx2V68AtjKom+YqGUa+23fABwUKuXR3H3sQeYoDDD
         yYAGgvWQBBDG/YrFxwy8Ncooki5TEHCAVEpY5YQAG9lKQ4wOzyYve5zwvWnQyZIgGi
         +BwNkfbCnj2+VEQVJnyL9QzEwW3va+rsTqXa7lnOspXtu5UfTLNUrMuPGSDrWn/5+z
         OFP3cyfRv5MwXeco5Xb9Qk0UCmY1OdwnvLejuopdzzzqE/ecItrwu04tFErEb0sPZX
         7Yu53M83oQH93END6tvXb92TgNDM1Pc6d+CyYbDiy/KvKalJl57G6iBEWNh8c/nfOy
         /b2hQQR5HVMxg==
Received: by mail-ed1-f70.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso8249876edt.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 09:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/iBTMJ+6ky1LxQGNpybYW4PAzENXOdLtJcm5RBsECOE=;
        b=am7KaXSoFKpE6CGtyHQ8wwhZoNY0udOvAR0hIntEfC4Q8qsoiuzjHS8z2n0fbo7Q38
         bMwPtwdZujIEoxAcdHVrGWGQOC6KrzeVTxbms5zDLcuVpQqHjmVAFRkXVttsRZDogk3z
         1spS96IfiMBuHrfhxZMsiw05BxQNyFePpnGyOOyn9ypwuywReBaPVBhyb3HFpkxc2Bqc
         2x5VGrP8BoJZFzOyMvLwFMFchQnwIEbnjAx6rwcICjAYLfBzrY3YGFqXOtD+7rdXYhyT
         cPupY2iUrq8eSOYjTm89mxaVi4ljTKTT78MG0UU37c71yNUT8MG85B39CftI62oa/mtD
         ZGmA==
X-Gm-Message-State: AOAM532OSN7A+sLs3zKMpzIsIRUEKjMsv7nFAG7rs5Iv8Hz946MC2/ex
        AQdWiXqYqPkb1FulM7vAAWeKcOz8HJlNT3EjGS8TYeeuajSlbzSQIS0u4EBcP13WoH2e1xoVbX9
        S7/gMKIcmxi7d3DayvlULUlk17he+If/3n58sxcRlh1aUhtoH
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr645540edd.354.1644256552643;
        Mon, 07 Feb 2022 09:55:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfa4i/V4nQftL4p3cvH4Fqz5Bqxsqs8spXP4wBR5nEJrSoNdf/WpjgVi+7ZOVjQ3pIOe/m6w==
X-Received: by 2002:a05:6402:26c2:: with SMTP id x2mr645526edd.354.1644256552505;
        Mon, 07 Feb 2022 09:55:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c20sm3765210edy.41.2022.02.07.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 09:55:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] MAINTAINERS: arm: samsung: add Git tree and IRC
Date:   Mon,  7 Feb 2022 18:55:02 +0100
Message-Id: <20220207175503.425200-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add already used Krzysztof Kozlowski's Git tree for Samsung
S3C/S5P/Exynos ARM sub-architecture and IRC channel (#linux-exynos at
Libera).  This documents purely existing state.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49c897fa56af..e219ba2c5ac9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2577,7 +2577,9 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
 F:	Documentation/arm/samsung/
 F:	Documentation/devicetree/bindings/arm/samsung/
 F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -15346,6 +15348,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+C:	irc://irc.libera.chat/linux-exynos
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
 F:	Documentation/devicetree/bindings/pinctrl/samsung,pinctrl*yaml
-- 
2.32.0

