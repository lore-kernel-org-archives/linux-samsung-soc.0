Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB43C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 01:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhLQBaQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbhLQBaN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 20:30:13 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0EBC061748
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:30:13 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id v15so985497ljc.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yaqftt3owVOthmZsTXu6qqocFp+xmA+2zpi/aE8bycA=;
        b=TLZOSUI03KuFnA1xZYtVGpPq9/JPzlRqU3ouxE4ZGiUNAlF1JsLqHIAscta9jcbX9y
         1d1yZBPVe9NynqBAkznN4XrKy4vP42CwDGpRKo2PAkOhMnYYc0gdd2Th6DndX3fBkpb4
         irCii+x9r3K1UjsmrIbb5k032XIOin75WEenmZyeNWnIMp05qr03wNo4K210cD6dhGia
         Atzb+gog7xtVAmliaw8t/vhkCexx2OSIGVkdKQjP3sbJiPB7S/QmEiruNn0ltOA/2cRV
         rLvakuwraY0wzyAq1Wl7YMV+FxCfCitpJdGZN29knxZYkUjtHV5gxc7GGNEXDJx2O2zE
         uMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yaqftt3owVOthmZsTXu6qqocFp+xmA+2zpi/aE8bycA=;
        b=2XPoqenJlu7O0m21fm93bJe+BgV/HpIy3U2ot71TpoGQs2/Y40borFExgxV8ramaPR
         6Hk2Z5/VFt6Tka1CWMgSjV+UMLV6b5VLxOiz5TfF6deXa/ThTZhPIAI/qmvlYna3ROHI
         RIjFvSdB09lkteLGtDrNHyQOnuhBuWUhrd9eU44VA/35R29xqfe7yBmnQVdJsBFQUHiw
         HY8Ze+lljw64F/KiVts3Cr+4rkMKeQ6Dxc5NmeYoCVdR6gxltUKpbSofNP1YgxDvkn/A
         9zHUQdm+AGj4/3MUXSVKuqNm9a4BS/+xuKmK8T8kMArH2kZLQx70lUty+SAdojsQsgJM
         qj8g==
X-Gm-Message-State: AOAM533cqphw+p86ky0rgKB/32sigQCAXEgn0uoxJw5En51PAgs0bw0j
        b9sl7xU2UzU4nMBWPkXLiXNUcg==
X-Google-Smtp-Source: ABdhPJwbfqITVZVw2cIK5V1Eikggxn0UrJT2uzmDNO9847zh341zXw0OoMimI2SF7q98jMIS8+7cnw==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr705346ljk.216.1639704611423;
        Thu, 16 Dec 2021 17:30:11 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z18sm414147lfd.8.2021.12.16.17.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:30:11 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: Add vendor prefix for WinLink
Date:   Fri, 17 Dec 2021 03:30:01 +0200
Message-Id: <20211217013005.16646-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211217013005.16646-1-semen.protsenko@linaro.org>
References: <20211217013005.16646-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

WinLink Co., Ltd is a hardware design and manufacturing company based in
South Korea. Official web-site: [1].

[1] http://win-link.net/

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Added Ack tag by Rob Herring

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 4698213611db..25f94c723cbc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1328,6 +1328,8 @@ patternProperties:
     description: Wiligear, Ltd.
   "^winbond,.*":
     description: Winbond Electronics corp.
+  "^winlink,.*":
+    description: WinLink Co., Ltd
   "^winstar,.*":
     description: Winstar Display Corp.
   "^wits,.*":
-- 
2.30.2

