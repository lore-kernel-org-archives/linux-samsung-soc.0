Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE26EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 30 Apr 2022 12:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352195AbiD3MWd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 30 Apr 2022 08:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349893AbiD3MWd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 08:22:33 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C138D26121
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:11 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id j6so19926416ejc.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Apr 2022 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lhzs630Ku48cr1hsvUIAdB76W0wVhhR948l4JWHPvns=;
        b=d9Q9DkqetFM3OzssY3M5rpFVWC1QKfFxCU8E3RAoRj9Cs6XLK7sBrbQuxiJErNSsbb
         OyYNBMA2LOjH96nTDZJx+dDSI9sxoHeFx5hv73lCrAWvKnM4nJ8EKLH966sWqOLlxfkW
         T69bVd7/1lsu7N+clMbj8EvwKQnmBVaCyNIPQArT6KewQ+8hUGAYfyoOQffj0X+RD8Ui
         Bo6lrAP1cT35vGVaFzvnqZNbJo2fEQnp2ElIwZcBuVVVCJccBOS2ce94nASn19tEYK7U
         ZVpyi6vUsuQPrV7k057ylb/tdarvxih5PafS8mcS4CfXOmExd/90v3JizzLicFKj3NLr
         n9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lhzs630Ku48cr1hsvUIAdB76W0wVhhR948l4JWHPvns=;
        b=13Ibe8MR51mMhEkmXrEslUU4K/Quo+YfXceTUCve4/gqBnT2S0aUdYb1tNyrwmkkQJ
         dvKTtrcjWUqmcGZX3KDxcwwXa44/bea+xlOoqx/jhKMDPgnve9zHtd1cCA3JICQH7poP
         i6hEcz2chyjYzjMMB//Xbdv2LXFW95QKuUJOUOMFQmou2PRpkCqSh4OpVVg+Oe4Q5/2X
         zzQKTL4KPaMXPgeL19n4Brs47+obgKMsrScp+4WmzgEMz8H3TkCX2P4QYemXQAwCX9L3
         neIWx5pHk3nv5PecF1iIEPMBgcqJDxw6nXSkIWcfQiv6t/94sFAv6c8wo2HURGLiQui3
         kIBQ==
X-Gm-Message-State: AOAM531Witlh4RAjXbj174HRSJuGXJkfhUa6B+Go31S4eMN2k7KiPHNo
        f5vbU0sclAgfbzNiE0srH1S/Cw==
X-Google-Smtp-Source: ABdhPJxNi5omVt9+ibh14BfAJmJrUJ8HVnpKDSYGjjSBZN+woQC0gqCzDIx3YnH6MvxyNKtTPB2XLQ==
X-Received: by 2002:a17:907:62a6:b0:6ef:8118:d3e2 with SMTP id nd38-20020a17090762a600b006ef8118d3e2mr3564918ejc.605.1651321150246;
        Sat, 30 Apr 2022 05:19:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm4059091edv.91.2022.04.30.05.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 05:19:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/9] ARM: dts: zynq-7000: drop useless 'dma-channels/requests' properties
Date:   Sat, 30 Apr 2022 14:18:54 +0200
Message-Id: <20220430121902.59895-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The pl330 DMA controller provides number of DMA channels and requests
through its registers, so duplicating this information (with a chance of
mistakes) in DTS is pointless.  Additionally the DTS used always wrong
property names which causes DT schema check failures - the bindings
documented 'dma-channels' and 'dma-requests' properties without leading
hash sign.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding acquired review tag because of significant change.
---
 arch/arm/boot/dts/zynq-7000.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-7000.dtsi
index 47c2a4b14c06..c193264a86ff 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -343,8 +343,6 @@ dmac_s: dmac@f8003000 {
 			             <0 40 4>, <0 41 4>,
 			             <0 42 4>, <0 43 4>;
 			#dma-cells = <1>;
-			#dma-channels = <8>;
-			#dma-requests = <4>;
 			clocks = <&clkc 27>;
 			clock-names = "apb_pclk";
 		};
-- 
2.32.0

