Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE6AC2D0E4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 16:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2289420709
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Nov 2020 16:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbRDxAPD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729967AbgKTQCy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Nov 2020 11:02:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729660AbgKTQCy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Nov 2020 11:02:54 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD120C0613CF;
        Fri, 20 Nov 2020 08:02:53 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id k4so10072950edl.0;
        Fri, 20 Nov 2020 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/eLqH5xxr3cLh+BXIw43htEq5kEErKjS8UKsy/0mOsY=;
        b=LbRDxAPD1zISdXoCAYFWzooOjurcJdhLmUyWHBiQqEX7ijxGDUGvMdAldPaLTq+SWm
         ZekW/yu8/kDzai0iGrUQwSY1Psip4qZ12B7/R3oAurdfWQN24FQe2RRhVqkeo/iUNfw0
         MiJBpBaI2JbIK2Ne5Ec9OdBz0qfs0oLU1OG/tW9HXd4SX/Vx2nUZfUOTlfU8WU+gyHf7
         rMF3Os72p4PheFwOa8GLISZMZk0oreLCuA9icnaFOIsyFlsNaYmuGGx4Ns9mNwBqqqgv
         aGL9zVnp5JUoDFErKdWqW5bbaNIBPiDLarRht/pd+7nhFIJITwIwF2H6uZGRwaf/RKeR
         WW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/eLqH5xxr3cLh+BXIw43htEq5kEErKjS8UKsy/0mOsY=;
        b=U4FRn/AlAFeQSF2LrGgFVvsXkXzLqYyJptJIVIVsffHoBtbWH9tv2DUF67rHlRTMke
         ezMKhlrD8jY3qAfYuqVxCS0LPWEyT1NtfuJEKNIZxJ7B0oRzeovQT0kMRR24oG7EOtgg
         HLW7M9jlEPZK5998NKXA0ZuG57JM48PNZ0cwefW8MFHmfJBA4OX49wEH2uHji0KZswOf
         OHqqB61Slqgy8ZqqQntZ/alNr2Gij3nOk5aWx1VQ7KvHgr991Sh5cx4Pxe+3/JrqNO3D
         GWn95F4qKE5RWGSNZNMOtvHpYkJAd3QTVSbxpqquDgkPbvRck3rHCryC84Yji9IVkzJ/
         lY+Q==
X-Gm-Message-State: AOAM532av2s4xDl7VZ62iGtXkXjE99eJ3Mi0WtuXo3P+oLQcMZ1gxawq
        RRCoDbPzuk7C/bMpCbDnjN8=
X-Google-Smtp-Source: ABdhPJyX0SIaUUwRAY2McS6uNcsgBs9/EI9ljcp6xQxCeeGNSDM34xBqktRyoNBAqBVLBiPeC3/PFQ==
X-Received: by 2002:a50:a689:: with SMTP id e9mr35804474edc.233.1605888172600;
        Fri, 20 Nov 2020 08:02:52 -0800 (PST)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id s21sm1295648edc.42.2020.11.20.08.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:02:51 -0800 (PST)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     krzk@kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
Subject: [PATCH] ARM: dts: switch atmel mxt reset gpio to active low
Date:   Fri, 20 Nov 2020 17:00:54 +0100
Message-Id: <20201120160053.18942-1-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The reset gpio logic of the atmel driver was changed to be active low at
around the same time this device tree was accepted into the kernel.
Adjust the configuration so that the touchscreen is in a usable state.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 arch/arm/boot/dts/exynos4412-p4note.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 0f8d4164a977..b2f9d5448a18 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -307,7 +307,7 @@ touchscreen@4a {
 		pinctrl-names = "default";
 		interrupt-parent = <&gpm2>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpm0 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpm0 4 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.25.1

