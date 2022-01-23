Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C517C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbiAWLSi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:18:38 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56094
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236275AbiAWLRA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:17:00 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E4C193F1C9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936618;
        bh=7G+hY+R5nLZKUZJkJX/xGI67gHlSdcGiauOov4lnBec=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=QQaU9dLeMJ+8ZKHQsNNwQaJMapp8hhPJ70gar55FFG12hXy+LgWt0ZaAMZyUnBI7E
         dQEbsOQNnuCfL8qkmLUSezCjbsPV+FrUy2vgekOyHd3NmBLiZdf/YEGQmwC17cXtCY
         CHAIvgPa6n0k95kKukwHQMYnnXT9/OuJayvCI2QF38A4Bj74ybkFMDlffjsdicsosT
         rq0ivFDGmySEuA6dhsWAoh7SqBv8E2TMpm8w1YxsqtN3ijsPeWuc82HqrfifTJ/G1F
         Wl2eukZdB/dgdrB2lOSv/zUfp8OBTdCDeX1uG7vfvN/ytockB2iSo2uZ0VQvW1ihpB
         d3zWfjWekVQbQ==
Received: by mail-wm1-f69.google.com with SMTP id s1-20020a1ca901000000b0034ece94dd8cso2950656wme.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7G+hY+R5nLZKUZJkJX/xGI67gHlSdcGiauOov4lnBec=;
        b=BgYifyHGeaujFbw+wsg/bfWHgZXN4ydDw8EnSc1/PLe4m0OYr37UtTvcjGk9Ai7xbu
         gBhUlQsjFIWkWlwD+YC180IlQIbn9d1zSK98319MZOYJMEfnlroFjjDJZ/9eb7viDPRR
         sTU9L0SRL0VE8VKQGGL2URls26czE+FJlJEFIpz0d+LmHKfgS3xw/vYKJc3TSroIqjUJ
         nyid0Dl6uuqalA4/GAs59kBp/VaEfoKyn9nGHEymmxN0reasng7iPlq6nohOAVxViv6w
         nnJsFeRrpIzHAlfDC3E7NtwVHVpRY+ZbRPYbk5kOnWBAhbkSyXGP0YJXtiNvda8ZqCgy
         ZcEw==
X-Gm-Message-State: AOAM531KJGVMeO9JBeuqZNjtffdD1tU79HgpRS73TheJDBgO4J0TJxI6
        nmxFYcDYtCIbPHr8wq3OluWDnnjdlphMpbBzW0M02hhseEZ+lIlxc0VAvsdfWwTSsSj022qoDpB
        WHWjddFjB1p724Cn7Yy0rvKCbREdlHapT3K8/Ml5JkSi3NSkK
X-Received: by 2002:a05:600c:3b8e:: with SMTP id n14mr7635817wms.136.1642936615422;
        Sun, 23 Jan 2022 03:16:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmZiv76Qfw8F68YMkxoE3Zz0Ow5IhFbzrvbpiFnZTw5RuvqW1IyxGcoXhMn0pmZj+he53E6g==
X-Received: by 2002:a05:600c:3b8e:: with SMTP id n14mr7635808wms.136.1642936615301;
        Sun, 23 Jan 2022 03:16:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] ARM: dts: exynos: add USB DWC3 supplies to ArndaleOcta
Date:   Sun, 23 Jan 2022 12:16:38 +0100
Message-Id: <20220123111644.25540-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
References: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add required voltage regulators for USB DWC3 block on Exynos5420
ArndaleOcta board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index dfc7f14f5772..ffdf0e247c15 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -825,3 +825,13 @@ &rtc {
 &usbdrd_dwc3_1 {
 	dr_mode = "host";
 };
+
+&usbdrd3_0 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
+
+&usbdrd3_1 {
+	vdd10-supply = <&ldo11_reg>;
+	vdd33-supply = <&ldo9_reg>;
+};
-- 
2.32.0

