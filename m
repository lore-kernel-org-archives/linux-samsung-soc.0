Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0E4C47088
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E24B6124B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 May 2021 12:51:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbhEZMwn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 May 2021 08:52:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56899 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234882AbhEZMtO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:49:14 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswn-0000yf-Js
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:41 +0000
Received: by mail-ua1-f72.google.com with SMTP id k17-20020ab071510000b02902351d1972d8so696460uao.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WIVLcdNNtMYgH1JGfFPDDOgy1+OAkNQskR3ugQF/qLg=;
        b=WlD393USfE9dPdE6zKzHGOMlTEqlGankyBvfDMck872w5vA8VjgaSwgiL24FR9Otdd
         d9g8uOMrzpjz0BGeeklpyLpSmfRUte0eH7b0H/+A7x0huTrHLShNnRyjtXZcqrsJiCe+
         DEeeFGwV5P1N6MpBtphnXZfnBz4aCgJynv03GZfu2Q0bH4w9ZVGyCuWs2lUumrQCXdkA
         wxgHriJuT+xWAPkz/phXUKZsvjxcxMtvhLxBtwNyCE08kHkJIpj2dadHHPCR+hr9JBi2
         aHPptWn3waJ6OJ1S8xP6+zMAem/EItQ0HamzRPcOsFM5LnLHeFYbpzOJt1UZjgRw1iJx
         Cd2Q==
X-Gm-Message-State: AOAM531hhPyElRXZkaVhp4G3BEZr58EJib6D6z4saQRPIPrmT2xqvjz4
        3+8zoLJT8ZSEnVs9ljzbRqarYVE4qQk2UdhrtompnsWvx7++sObpVaPooJXYpGMMcQq2SHoJ3/O
        MXuTnxqYxIn4rbp99NuV9Wpz9er/1Hw1wYBphuqLJKIoJBTps
X-Received: by 2002:a67:ee07:: with SMTP id f7mr29741186vsp.55.1622033260712;
        Wed, 26 May 2021 05:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLAavyPatTn6lusqjCi70ec2x9vA5s1Emg7eGeEsn1Ovy17QVDFuG9G6nwebdsE/DwG++62w==
X-Received: by 2002:a67:ee07:: with SMTP id f7mr29741168vsp.55.1622033260560;
        Wed, 26 May 2021 05:47:40 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [RESEND PATCH v2 06/13] mfd: wm831x: Correct kerneldoc
Date:   Wed, 26 May 2021 08:47:04 -0400
Message-Id: <20210526124711.33223-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Correct kerneldoc function name to fix W=1 warning:

  drivers/mfd/wm831x-core.c:121: warning:
    expecting prototype for wm831x_reg_unlock(). Prototype was for wm831x_reg_lock() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

---

Changes since v1:
1. Add Ack
---
 drivers/mfd/wm831x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index bcef08f58fb3..c31809b17547 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -109,7 +109,7 @@ static int wm831x_reg_locked(struct wm831x *wm831x, unsigned short reg)
 }
 
 /**
- * wm831x_reg_unlock: Unlock user keyed registers
+ * wm831x_reg_lock: Unlock user keyed registers
  *
  * The WM831x has a user key preventing writes to particularly
  * critical registers.  This function locks those registers,
-- 
2.27.0

