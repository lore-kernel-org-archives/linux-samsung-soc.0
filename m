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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9E8C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Mar 2021 14:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 514E761938
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Mar 2021 14:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhC2OEN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Mar 2021 10:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbhC2ODm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 10:03:42 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E98CC061574;
        Mon, 29 Mar 2021 07:03:42 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso5216903pjh.2;
        Mon, 29 Mar 2021 07:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Cf0NNvh47dChgP3j4zNoZHInMqCN/9vYPVY+E6bHrQs=;
        b=Z2gYkc3U5Zhl7zDWCo6YlOy71NL1T7SEzccpf2919AIxGGmOB/RZQiK5ax4eJPTNIw
         +KH7pH0Nzs7QUo+SS1CDL5dcIkqTiM9L8TJ7u8iljZUNvNWV24N9rlUG6rmTNy5A+n4I
         qyzzhjK8iFJi3m4OAMWiHPc0sKnRhryYAL/jtJWorT7a/emlOMD1QTTFnHUct9O75KDs
         cs7ylXR1BFuPLi/IgYqetg2dm3V0rwnfgpASlw0gJziDeITl5MiVosHF26mL0H+oJejM
         1+5dWuig2yUvjofe2MzyIE+UlVd8O6Jco2u3CSLE4FXrYZbso0dG/PP7EZ64uBRtcRq9
         7mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Cf0NNvh47dChgP3j4zNoZHInMqCN/9vYPVY+E6bHrQs=;
        b=UaNuIDwdlwglBziVb2VZ61z2Ei3JTVPiZkXPZB3dX8qQ9Iv0bDyTJpWXyqgsghnvBP
         QOsdoRji2+bkQ/LkZzIGuQl6N0J4w1bEh/qOWr/CA8naf9q80vUIXHr6IJicnIifTyYj
         DDUiW7041gPa/2fnUuSrLkCLVzRUKNWWVXcF0il6XLfYgPlOeU2UeW75xzro3gCDZRVC
         MdOn1dNvQqavSFJFtBBXR4REZbuIeM0BHZ9g3CtpUZj382c9SCJ/OhXucBwjog5c3j4S
         cRgtO9Uloj3ixA6GKXoX6vgjRHLoPhov/WuTUYXuGYbD9jtogdh8xZ/QhgrCBNhvAzlp
         +wNQ==
X-Gm-Message-State: AOAM532EP2zDwpTfvo+SjRC9hhBD4Ng3XOJDjR8aLv3P95Iar8YZmzYz
        QYiyrUWT1Qx/5MANLFIfWQ4=
X-Google-Smtp-Source: ABdhPJzbGV11FRlYScAIalAmnglofusziOLm209WvMmkMR6J84X/EyLxqq6fcnKU6jcLENB95q7C7Q==
X-Received: by 2002:a17:90a:5b11:: with SMTP id o17mr27793616pji.32.1617026621403;
        Mon, 29 Mar 2021 07:03:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:4ed:8f53:adc7:b574])
        by smtp.googlemail.com with ESMTPSA id i10sm204271pjm.1.2021.03.29.07.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 07:03:40 -0700 (PDT)
From:   Aditya Srivastava <yashsri421@gmail.com>
To:     balbi@kernel.org
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com,
        gregkh@linuxfoundation.org, krzysztof.kozlowski@canonical.com,
        rdunlap@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: exynos: fix incorrect kernel-doc comment syntax
Date:   Mon, 29 Mar 2021 19:33:18 +0530
Message-Id: <20210329140318.27742-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/usb/dwc3/dwc3-exynos.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: expecting prototype for dwc3(). Prototype was for DWC3_EXYNOS_MAX_CLOCKS() instead"

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 drivers/usb/dwc3/dwc3-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index 90bb022737da..0ecf20eeceee 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * dwc3-exynos.c - Samsung Exynos DWC3 Specific Glue layer
  *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
-- 
2.17.1

