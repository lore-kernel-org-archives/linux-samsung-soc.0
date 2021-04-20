Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B2AC43461
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B782A6115C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbhDTQuY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:24 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49791 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTQuX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:23 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZP-0003V6-Cn
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:49:51 +0000
Received: by mail-ed1-f72.google.com with SMTP id n18-20020a0564020612b02903853320059eso4422368edv.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WtF7drMW/C8jMVcOqQFPcpIF1FOocl5b39ThslsHgGk=;
        b=S79SgjOchBsldOe9vaUGR+rlI/bxwaphtu9Q28pS3qqlf4Y9N9EJP2yQ0MpIVMYgb6
         Uj+6dM9pp30l4fYw2WOmCcpzo8K9EmbNXF6L5XTJLN2DkI4fNomlmUSSlt2uZJn0Chl0
         l0Axtq5OQb7WtFtV8x+DYfQzRO3av3fl8aM+NOUZdC+HAXDy2Cva4WUC951jPAGSGqv5
         Rdb1Zi3Kqu2OcKZ40FzxD/ppt9U0EWXXJtUeZfJk7+1i195A5rhBC9ed0WfIlMMd50N4
         Z4pYeqYxYVEbqZR94umGYgdLrJCNUIP80B/cX5Q25oTyz9/PcjnoDEAVzY2alj3ionmn
         T3jw==
X-Gm-Message-State: AOAM530Vd9S0PYbeThg5VN6PQhFgz/RaDlO5PAuQWKBc8z1F63J6K3V7
        nPmzGWEOpztGbf0EnlhXC1Nk+PgVKuqsVufBfLX9tbFoVyJ5Q/vXp1Q8wa3GVrUSB3yFs4FyDfM
        A2ARQ2+t0/4+5rx//QTW15dzJGZhLq4YFDc63NUxG3QXDu3wc
X-Received: by 2002:a05:6402:2216:: with SMTP id cq22mr5290224edb.265.1618937391135;
        Tue, 20 Apr 2021 09:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVvPEaItX2UDL57iBqC4tjCH7fETaHnfGtmtZl/hJ8UxEg3LymZw2SkKopQjwT2bKj34XsiA==
X-Received: by 2002:a05:6402:2216:: with SMTP id cq22mr5290217edb.265.1618937391035;
        Tue, 20 Apr 2021 09:49:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:49:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Origen4412
Date:   Tue, 20 Apr 2021 18:49:34 +0200
Message-Id: <20210420164943.11152-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on S5M8767 PMIC can wakeup the system from suspend to RAM.
Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4412-origen.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index e1f6de53e20e..5479ef09f9f3 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -144,6 +144,7 @@ pmic@66 {
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>;
+		wakeup-source;
 
 		s5m8767_osc: clocks {
 			compatible = "samsung,s5m8767-clk";
-- 
2.25.1

