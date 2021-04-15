Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C577DC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Apr 2021 09:38:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87F9160FD8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 15 Apr 2021 09:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbhDOJij (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 15 Apr 2021 05:38:39 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40259 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbhDOJii (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 05:38:38 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWyRz-0005zl-5f
        for linux-samsung-soc@vger.kernel.org; Thu, 15 Apr 2021 09:38:15 +0000
Received: by mail-ej1-f69.google.com with SMTP id ji8-20020a1709079808b029037c921a9ea0so725042ejc.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Apr 2021 02:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4aRJNj2Va0WuSj7bZqa+mg+YnYSMlodN/I41H1ztfK0=;
        b=LKdA9XZpYpiE5nKrqlCgT5ktFVAm+wfZA0jepInm2BF3lG6sFyh6RSSzerRFj+VXO6
         Thq3MNm1OGDMa+6tY139HGL1cntIvvTo9cSCb3U3YnSi6mJnI1iujSZvGWiXOA3tV527
         QwWMXF06tt//4x9YuNuaYZhJ9WhwSaS8OWFmgZqU1hhMLru4JOCC7hfI/818ujWzfE9/
         BeQ1dz4ifXk4XCMacauPQX/4JuhgfNh7RuS5aiERZB4f8b5Ba7aULQ+uckUTrUEthATS
         lB070D5ABByd9Jta9WDYAQxOByA2TzKXJK1mNR4nOBP5F+p4kdHJ2gapjtNw/CES0cRy
         HhGg==
X-Gm-Message-State: AOAM531RJ++hIgMs181qKCWbhNoib4J86Rmh7V8gVgR+YVmPRtGO825W
        ukc8DXxOFtiytZye7LIS6HyNAEJ5lF+ChXdWajRJlxzBULaZpyC9FCUDinU+N9KJZ/EWgi/88eo
        8bekfAnMXR0zlWfslNaKFHXxBdJP7skwSyeD4mJJw/HMs+OO7
X-Received: by 2002:a05:6402:12c3:: with SMTP id k3mr3104009edx.86.1618479494841;
        Thu, 15 Apr 2021 02:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8hCXucMNCy2MFa0IAxrCmDHgzWOO5+IZIekrpsC964e9WmaUDMs8NNfahxQW97g1nkmD62A==
X-Received: by 2002:a05:6402:12c3:: with SMTP id k3mr3103999edx.86.1618479494737;
        Thu, 15 Apr 2021 02:38:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id cq26sm1954088edb.60.2021.04.15.02.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:38:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: [RFT 2/2] i2c: s3c2410: fix possible NULL pointer deref on read message after write
Date:   Thu, 15 Apr 2021 11:38:03 +0200
Message-Id: <20210415093803.162673-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415093803.162673-1-krzysztof.kozlowski@canonical.com>
References: <20210415093803.162673-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Interrupt handler processes multiple message write requests one after
another, till the driver message queue is drained.  However if driver
encounters a read message without preceding START, it stops the I2C
transfer as it is an invalid condition for the controller.  At least the
comment describes a requirement "the controller forces us to send a new
START when we change direction".  This stop results in clearing the
message queue (i2c->msg = NULL).

The code however immediately jumped back to label "retry_write" which
dereferenced the "i2c->msg" making it a possible NULL pointer
dereference.

The Coverity analysis:
1. Condition !is_msgend(i2c), taking false branch.
   if (!is_msgend(i2c)) {

2. Condition !is_lastmsg(i2c), taking true branch.
   } else if (!is_lastmsg(i2c)) {

3. Condition i2c->msg->flags & 1, taking true branch.
   if (i2c->msg->flags & I2C_M_RD) {

4. write_zero_model: Passing i2c to s3c24xx_i2c_stop, which sets i2c->msg to NULL.
   s3c24xx_i2c_stop(i2c, -EINVAL);

5. Jumping to label retry_write.
   goto retry_write;

All previous calls to s3c24xx_i2c_stop() in this interrupt service
routine are followed by jumping to end of function (acknowledging
the interrupt and returning).  This seems a reasonable choice also here
since message buffer was entirely emptied.

Addresses-Coverity: Explicit null dereferenced
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index ab928613afba..4d82761e1585 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -480,7 +480,10 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 					 * forces us to send a new START
 					 * when we change direction
 					 */
+					dev_dbg(i2c->dev,
+						"missing START before write->read\n");
 					s3c24xx_i2c_stop(i2c, -EINVAL);
+					break;
 				}
 
 				goto retry_write;
-- 
2.25.1

