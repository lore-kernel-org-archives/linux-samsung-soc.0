Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BCFC64992
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 25 Aug 2022 11:33:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241651AbiHYLdu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 25 Aug 2022 07:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241601AbiHYLdr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 07:33:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2E3AF0FC
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2022 04:33:42 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id m3so22125454lfg.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Aug 2022 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=5f5tWhIstVtTSwKpxEt2LvelJrCKuLR3PL365pf4QS4=;
        b=pVklcWuFNgj8ttdDE9REKfypKLdUtCn9f/ySSF5qEbDM/toFxSWpQc/MYxWQdNJwu2
         Nlxa70HrmyrR9cDd2ZqKYbbg+kl+13HsP2FwR/+Rx4XiXKvXvRRdSuWC1A0icUhGCx6t
         dyQS15jw+p54nSqSS7aYeOmv5lRBCq2ZIJl3w9gYWBtDZwVXTrp2kpRCb9dwndNZKsQS
         d3lPhpObnhcUhkTmK3xq7CFa+pTwJ8rVaSIjbMnWZgnivbeSC14doHc5zQ2dow6ptE9t
         ZDrOv/Qk+ajcw68RlQ0dUOTHllKHqhtxZw3Ir/BzshJmyMCx1LVCdufFSby1sGYV316g
         ttPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=5f5tWhIstVtTSwKpxEt2LvelJrCKuLR3PL365pf4QS4=;
        b=g/d1COne2rXc61HGdrIkNtf1sJbVQRbWJctqyoleKvwqCWBXBd/sp02IKdkXBIjHyJ
         tUxcBoeUAx3QY5Lbp5EzGsQFYv+LLDg71JvePlRK6oMA7ib+hWWmQ2JlTT9ZKs7/tX/4
         P2wRy/FjOd/RhSgXAYLkOxgfU/E5k8dg5uZs0/G61ypJk1Slnv9uEe+vES8O0fljpfcJ
         5if85wcIkFKLB7EWHMyifTcjtPLweAVzDWKN04ZubAA5WJUW8iZLV9maUnsFEIdn0sIn
         vzBUkdSN4QUoZnb7ouvq6/526s3k7zbdy3Im+hN0OsrxEdeFHpszTQK7a9GjlMUxlEh+
         URQg==
X-Gm-Message-State: ACgBeo2QWlgqYsbkr1xkHAPyxFKav/QBw7pK+o8LkzkzfrxrCrgLZtrA
        fwNQB5Ewld2vaRvu6smgGJbjtg==
X-Google-Smtp-Source: AA6agR5Cwlt1QnJQbh16uHaNZuyEAqyKIdLBAYRJgSNUyF+xnOQylMkrtQ8mBl4L0+NErXHiMNgWew==
X-Received: by 2002:a05:6512:3905:b0:493:80a:46ba with SMTP id a5-20020a056512390500b00493080a46bamr956006lfu.69.1661427220406;
        Thu, 25 Aug 2022 04:33:40 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id e18-20020a195012000000b0048b0aa2f87csm446764lfb.181.2022.08.25.04.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 04:33:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marex@denx.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] dt-bindings: socionext,uniphier-system-cache: drop minItems equal to maxItems
Date:   Thu, 25 Aug 2022 14:33:30 +0300
Message-Id: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

minItems, if missing, are implicitly equal to maxItems, so drop
redundant piece to reduce size of code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/arm/socionext/socionext,uniphier-system-cache.yaml  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml
index 7ca5375f278f..6096c082d56d 100644
--- a/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/socionext,uniphier-system-cache.yaml
@@ -22,7 +22,6 @@ properties:
     description: |
       should contain 3 regions: control register, revision register,
       operation register, in this order.
-    minItems: 3
     maxItems: 3
 
   interrupts:
-- 
2.34.1

