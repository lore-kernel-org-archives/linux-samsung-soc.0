Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F6CC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Apr 2021 18:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2AAF613B4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Apr 2021 18:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233400AbhDESOS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Apr 2021 14:14:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33036 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbhDESOR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Apr 2021 14:14:17 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lTTjm-0004jC-H8
        for linux-samsung-soc@vger.kernel.org; Mon, 05 Apr 2021 18:14:10 +0000
Received: by mail-wr1-f70.google.com with SMTP id f3so8645838wrt.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Apr 2021 11:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gG8foTXIek76KK7nrOQoCVDJLrfCMKqkVOw6WNO7XaE=;
        b=cc74Jyelfn2vwSnqdl2+bcBzJN/t3/UCPj6XsO2l7iPqZnUfQkOGHLSABY+ChYzKbc
         XGTcHTd0s+crf9w3fjb4sQjKgJ315xB9W/EP33AT+TgsgL2WBWn0HYfvKfKz0eEseU7u
         mrW44X+6PPuh7fHSavYJCDJ24v/Vrhrt6z8N6NkI7xYm/PBT+jOu0L2czm7Db5i04H0q
         o2G9fWZDd6UMgwJqFag8EMMrtWJTewti3bgWryV/G/QhW8PhuWW6hE5xGlwaN1a37NtU
         r5zrWC4Zs57OhC46WSh5fhTAhAj55avNs4zzATVmznafq+CnCquvgFXIOn/9RlQF9ODw
         E+Pg==
X-Gm-Message-State: AOAM532PUG3XVGoEr/VTWJIxLIIGOAGv0fPAZy3JoVgqdOX/ffw5NHlG
        GofWT1SR/163Oca+OL0sWvdjP/ajon3PEV77hBHfOTN3qJObXLUfjmbXHRbknsW79m9dfk4faEp
        ToIoMHarb0d1C/TVIyBETUhEczuBT+ibr4BF0ivvia+BGjI8C
X-Received: by 2002:adf:f682:: with SMTP id v2mr6608046wrp.263.1617646450236;
        Mon, 05 Apr 2021 11:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzN3QoJP7AbUP2fJpUtZvnPoTvp8sPGHtOVCpQs4vwVbulMlz7NKWTIrPsFa5QmNowx6rn/Dw==
X-Received: by 2002:adf:f682:: with SMTP id v2mr6608037wrp.263.1617646450126;
        Mon, 05 Apr 2021 11:14:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id h62sm374140wmf.37.2021.04.05.11.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 11:14:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: exynos5: correct top kerneldoc
Date:   Mon,  5 Apr 2021 20:14:05 +0200
Message-Id: <20210405181405.52189-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The top comment is not a kerneldoc, as W=1 build reports:

  drivers/i2c/busses/i2c-exynos5.c:39: warning:
    expecting prototype for i2c(). Prototype was for HSI2C_CTL() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 5ac30d95650c..97d4f3ac0abd 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * i2c-exynos5.c - Samsung Exynos5 I2C Controller Driver
  *
  * Copyright (C) 2013 Samsung Electronics Co., Ltd.
-- 
2.25.1

