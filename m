Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7D7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Mar 2022 18:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243755AbiCNSV0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Mar 2022 14:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243746AbiCNSV0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 14:21:26 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485BC366A2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:16 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CE87B41C45
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282013;
        bh=fp8gzCHSAGGAhHxY8/ZkxcekCduFjxC+Ysw+LEh4qoM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=kIhJ2wXnpwhgr7mSyRsmNbipc7cqW3ghJ/v9tw44EMY4Da019f1aKrN87k6yhGcnI
         iJ5dKKm/+2AQi2i3lazyJH55G4NjDQHgMcOOUIEGMY9eHC8MMxyw0iG6svSgw3fdbv
         Hn49JZWPcqwy29yZxj/tHgRORAnI/WoBIJZZKLIFnMNQWjo+0z10v4oljK7qNPpBQD
         ct1tbJRv3PqJr26Yh2/gFBpUvdR499XhGEtPCUahxp5PpGkGg9ujpYLburUs8U/eeQ
         xy3YCCZzftYZTaTb/1RAiWKAKuseVFv8RRefwf+RWIQmGYnqvMweBPZSGjZTYKCra/
         zlnTOA27feq9Q==
Received: by mail-ej1-f69.google.com with SMTP id jy20-20020a170907763400b006db62b6f4e0so8367298ejc.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fp8gzCHSAGGAhHxY8/ZkxcekCduFjxC+Ysw+LEh4qoM=;
        b=3vm3DYWfeXgDRJ1m+HhmEWjUx83DIo2rSNmcttsqYd+NhgrW/uj7XE+ow+Nb71szs2
         hnXsoE+qo5tQpdnCBkBCiNIUEOCSCahh/MADfAOwZs/8OGh4yMZO/VcFtjsm/DH/Id9X
         GIqjWnAgXzHtSCwInpPeNu9iTXstNwFn24J2xgcOm9taMLUzTt3l/C8s3J27lltjpu58
         QOM/1iHKeYpuDpER5fY+DYUeVSQl67WEgpsvUo8gYIhTjgJP/lyIzTy5+OBapEi6+qrO
         1Ql/xg+trXvE7JVG7yok8JiJSqLd3/V3lGP7XrXRSUZqQJqKGMebmPukFeNBI9aS6kDK
         sfpA==
X-Gm-Message-State: AOAM530Gg0cCQLXTv1n93d9lT/433m+s0wPXBX2MtyXvfOpcQxJjGMyr
        B16p36e3prVbyDiGx1OY3rGWVWfGq5/zryXGBwP7z85wwAhRWzDoKzGDSH4j7aMoHKBdCTVPCtc
        ygPQ+yoLDU+4wGBXbr7Ol4UhnseuQvH3nPIl27Ev0G6pNRiMY
X-Received: by 2002:a05:6402:5cb:b0:415:e04a:5230 with SMTP id n11-20020a05640205cb00b00415e04a5230mr22004445edx.352.1647282013436;
        Mon, 14 Mar 2022 11:20:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfJEfoRq9Vs7yHaKY2O3oU3VWB2UJaMc03+F75wKvACaBfz72jl5h/d9vBhLJ488DLA/DFXg==
X-Received: by 2002:a05:6402:5cb:b0:415:e04a:5230 with SMTP id n11-20020a05640205cb00b00415e04a5230mr22004429edx.352.1647282013219;
        Mon, 14 Mar 2022 11:20:13 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?UTF-8?q?M=C3=A5ns=20Rullg=C3=A5rd?= <mans@mansr.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/5] ARM: dts: s5pv210: Use standard arrays of generic PHYs for EHCI/OHCI device
Date:   Mon, 14 Mar 2022 19:19:46 +0100
Message-Id: <20220314181948.246434-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Move USB PHYs to a standard arrays for S5PV210 EHCI/OHCI devices. This
resolves the conflict between S5PV210 EHCI/OHCI sub-nodes and generic USB
device bindings.

Suggested-by: Måns Rullgård <mans@mansr.com>
Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index a7aca54832d9..4ea1e638432a 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -434,14 +434,9 @@ ehci: usb@ec200000 {
 			interrupt-parent = <&vic1>;
 			clocks = <&clocks CLK_USB_HOST>;
 			clock-names = "usbhost";
-			#address-cells = <1>;
-			#size-cells = <0>;
+			phys = <&usbphy 1>;
+			phy-names = "host";
 			status = "disabled";
-
-			port@0 {
-				reg = <0>;
-				phys = <&usbphy 1>;
-			};
 		};
 
 		ohci: usb@ec300000 {
@@ -451,14 +446,9 @@ ohci: usb@ec300000 {
 			interrupt-parent = <&vic1>;
 			clocks = <&clocks CLK_USB_HOST>;
 			clock-names = "usbhost";
-			#address-cells = <1>;
-			#size-cells = <0>;
+			phys = <&usbphy 1>;
+			phy-names = "host";
 			status = "disabled";
-
-			port@0 {
-				reg = <0>;
-				phys = <&usbphy 1>;
-			};
 		};
 
 		mfc: codec@f1700000 {
-- 
2.32.0

