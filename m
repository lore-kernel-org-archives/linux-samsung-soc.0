Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5150EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243124AbiAKUSG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:18:06 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59978
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243144AbiAKUSD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:03 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BFF1B40A54
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932282;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=gBPSdawEbjql+kRk6RUy4TtO+OjSKC0q02G9QAs6b3vatpmj7aYnSdH8u5rgdyQVE
         05rhju9+wFWfPViwMPFy6xc2NK1chTzM3O+ZAx1i/YFdNXfNrc+FnL7iFNN5Xqol0D
         NidSzQGbNJrD2sj/ECii4t+kRodYlPiMMISEHhWSCqUQMROI1UanFvNwgaHYYyBIDa
         NA53FBEnxGfyV47WXL7xPSeFOU2dTYL0uptACLlSznKtJltco3H4TY0tYp4YoA+Oma
         6kYH7PIRGIIW9oPI4sC+x83+0znww5Du0yVujMvIe0wfVbqIElgi1G/z7MXPuijTdL
         vGPuoARiUGTjQ==
Received: by mail-ed1-f72.google.com with SMTP id q15-20020a056402518f00b003f87abf9c37so175256edd.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        b=UMzD7Bt7mxS64c2tJK8ZR9QbH24eNT23UiuW2BvL3xCsAyMNyJ5c085uxF2lczm2hJ
         TUAll5TwSBtOHofa0VGLSIt1nhFUUBnGdFgT9fPFyRPfA31L7tJIsbHPoiVNzQpU4sfe
         1CVtsdqB1JprDUWS6SbZG3VM1muRgijyZQULX9ODtHhsqQVLhtkqvWCAiZPNY4oB5NHl
         EMHeJuken0LiG9savfPvx1rmD7/mIJ3EE+8Pf1o5+Vw7UgnRqHvoj5hV/2a6LaGG3o9g
         YkFHCgw9vyd700GO72IPGKtrBfgZJNHzATICLa6vDZ16V08Eb8E9uVTulLRcxUDLWpMe
         Vcbg==
X-Gm-Message-State: AOAM531mcbZ1J2I8DTJAj7YLgSS86gfwTJy0FPg4fRmoeMpiTN8gv+Ta
        9uauayFbdvrcPOxtREZNnSVpDeovCKAojfnAG7e1njm/IqdS10KIAIXD+Gryd6BYHb2T0TpdZ1x
        iSRyTSKJkzw6d9OxiRvKyAlo/ykNiB4ET65zqjIpK0qp2Rlez
X-Received: by 2002:a05:6402:2926:: with SMTP id ee38mr5851997edb.213.1641932282519;
        Tue, 11 Jan 2022 12:18:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsuhLrTEsItilqaRBXNonfCCsK7u7PWJtW46W8/0QM8Ys5Q4lSWFlZbTeB4QhKWwzSlFxGlQ==
X-Received: by 2002:a05:6402:2926:: with SMTP id ee38mr5851985edb.213.1641932282391;
        Tue, 11 Jan 2022 12:18:02 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 09/28] ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
Date:   Tue, 11 Jan 2022 21:17:03 +0100
Message-Id: <20220111201722.327219-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Simplify the nodes of S3C64xx pin controller with wake-up interrupts by
removing the artificial pinctrl-interrupt-map mapping node and use
interrupts-extended.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s3c64xx.dtsi | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index cb11a87dbc42..67a7a66e11d5 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -178,20 +178,12 @@ pinctrl0: pinctrl@7f008000 {
 			interrupt-parent = <&vic1>;
 			interrupts = <21>;
 
-			pctrl_int_map: pinctrl-interrupt-map {
-				interrupt-map = <0 &vic0 0>,
-						<1 &vic0 1>,
-						<2 &vic1 0>,
-						<3 &vic1 1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				#interrupt-cells = <1>;
-			};
-
 			wakeup-interrupt-controller {
 				compatible = "samsung,s3c64xx-wakeup-eint";
-				interrupts = <0>, <1>, <2>, <3>;
-				interrupt-parent = <&pctrl_int_map>;
+				interrupts-extended = <&vic0 0>,
+						      <&vic0 1>,
+						      <&vic1 0>,
+						      <&vic1 1>;
 			};
 		};
 	};
-- 
2.32.0

