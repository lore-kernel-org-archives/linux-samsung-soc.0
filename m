Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7F5C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 07:53:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D03786103C
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 07:53:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbhJHHza (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 03:55:30 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53358
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229693AbhJHHza (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 03:55:30 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D3F153FFFC
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 07:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633679613;
        bh=J8tNJvcJVYBu0x9m4fxgROGUMF0K9V2pNV12upjHKNA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=PFgWAVEt694FPw9tus8GvCKMrRUIWIDdNNZzsqsh/o7lMwE59VRPTBvv92u8FajQo
         OL+4qFSAozHLJ0Z1s6TzTO5zo0mnO1Q36Fchcw5LTLeaxBs7e4SMFKZxM1O7JgispS
         eKt6pLYbx/swPYgf1R01E54kX+y8zF2N3XKVJNt42YFndGz5WNyBMuA7O4h6w1TAUx
         bCpimPakx3chLT/QJNEx7XViCyvQTVXtUK/z3c2812JpTeXgMwJCmIDPTMFy4DPGmT
         WwDiEVvz8bYDXhxd8WowdM9J4BRZCcuXV4MxQCqoc92aRq9sD3BHiEDKXvHyLArSYW
         IkowhxnywmCHQ==
Received: by mail-wr1-f71.google.com with SMTP id d13-20020adfa34d000000b00160aa1cc5f1so6627214wrb.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 00:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J8tNJvcJVYBu0x9m4fxgROGUMF0K9V2pNV12upjHKNA=;
        b=kUtCnL+dQ5xPRFcEpeyVDPR7vVfw6XONmW6ymGFQPY4cj8NZtQilspTCQ3kFAs1wsY
         AtVVAhKfsgf7s9o269MxqtrsXzzrG0eMf9GXwAhF/9pOc7N06qleJNmp2ell3igMVcNC
         5w3v2R1SSplTl+rk/W41BrNvoMvdK8+MhYDgUZCKk66oiaq0R8mgs6xqIrjz/qzaePoI
         WEFrbhwjWWojn//243WOpEhqEIB8GE4RQixVtXTvC4KSltxj4xAc0TZ2CBfiqZBjcIKl
         36HnmcO7TXufK5V7KbJ3hFIYYtPzRURn0foUVW1F8x2OgylNbiqvm1nbAnfUIAtC4SPp
         mNSQ==
X-Gm-Message-State: AOAM5313aSTnivN/az95/j78TcQOoswWM/ox5oi2lqyNkeQ9Q5+KP5f7
        Iha/MDJksNQ1c3/a1/jUdi0rbNOzargk7uT3ouf1XX0cCGllBdJ1m4cZFjOI+gYTHXRnJ9GF8+T
        NyyIZqAIKjhqnbvOL4pW0eAcYyzxiUPlqB5XyS+YsRY3qAQD/
X-Received: by 2002:adf:a502:: with SMTP id i2mr2014572wrb.311.1633679613581;
        Fri, 08 Oct 2021 00:53:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy55rGtLFm7Q1RFwWN7SRi5FPdu5yq/yrTSIZyZpeE9GzwuxNnqBtvJN0JTQdIYzvHIu5W+XA==
X-Received: by 2002:adf:a502:: with SMTP id i2mr2014555wrb.311.1633679613404;
        Fri, 08 Oct 2021 00:53:33 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id l16sm1812279wmj.33.2021.10.08.00.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 00:53:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: samsung: pm_domains: drop unused is_off field
Date:   Fri,  8 Oct 2021 09:52:53 +0200
Message-Id: <20211008075253.67961-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The 'is_off' member of internal state structure 'exynos_pm_domain' is
not used anymore.

Fixes: 2ed5f236716c ("ARM: EXYNOS: Detect power domain state on registration from DT")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/soc/samsung/pm_domains.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index 5ec0c13f0aaf..d07f3c9d6903 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -28,7 +28,6 @@ struct exynos_pm_domain_config {
  */
 struct exynos_pm_domain {
 	void __iomem *base;
-	bool is_off;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
 };
-- 
2.30.2

