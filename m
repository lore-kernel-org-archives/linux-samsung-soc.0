Return-Path: <SRS0=iB35=AY=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DBEC433E5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 14:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3274820738
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Jul 2020 14:51:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DbeFOb5v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbgGMOvB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Jul 2020 10:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbgGMOtm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 10:49:42 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C2FC08C5DF
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o11so16902089wrv.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jul 2020 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P+J7h3HQX+/joqPOy6WiQHR4eToAn/yJ8zMEtEk80iA=;
        b=DbeFOb5vGhFBYRRXUN3KuTiXpQyQb3lNhA1qOhQUiHC1bngSe4WmjRro0MewmO5SvA
         nU2LN9gEPVX+pqlbP3P/6gx85OWfPOTlSSL5eIOSiqO+xx8m+3sk/8jDl1P5ToG6v4iV
         xzohAIXFSKqEnzj8P8sAjTkMJDk7vXufjDAJNitdG7U7ZqCNMd1cw71tgP5dsF4+neFo
         4QGFwMEkoZgQreEWsEAO1Apoc2zj4HTbRKtE03gaHTRxV/xqxVbhULD+La1zvby6h47N
         q6x3zcpwTLs4SEtqV+P488sD/Q7iBq7XP+vpVTEANGL4+8Bk9dQJGqkYc5Ttqy1ae81V
         zmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P+J7h3HQX+/joqPOy6WiQHR4eToAn/yJ8zMEtEk80iA=;
        b=Ac5Vo9Ey/5+Wv53EqfzJ085LUOPA4qIMQ1G+5OP4/NtAOd2xhnJxcvK2GyHRqr9caH
         uA7Mt/a3TQKIGLv4W/aZGGFN/J/2i3jLYsd8O3GoXtfComadeYoy+L6Z/Pjffcjbsv+G
         SXPSxWtL1NDmmM6G9itPS53wwzFS2EYJW4vgJV8HqrtSkdCAfQY6ZFD//aK8orZBi3Ol
         Kjg1JemSdBtmjs6FiRLUhuzwN45BoEbp3+lh5OivOOrEVepVZ1byAfl34qJMjjnCjUOT
         fnpGLFavSzAlMmJCbOwomexVm8lYCAIeuYGmrI5T2LDJa8tPBLtvwAgMYmBvTkAWp4Nw
         /SUg==
X-Gm-Message-State: AOAM532QkrM2TfjDMv4NJEgyE3BqU2CPkyqPOUYqzqCIzRCLhDvpC1OQ
        QUHE5PEQranDHIB7S/a1ZJmX4w==
X-Google-Smtp-Source: ABdhPJynb3r4L6mscx+7FfoIIg3IVDr+bEskwUShaCmWgKsXhKMf81Y2wb/k1/OuQoXOJOxjXBXLpg==
X-Received: by 2002:adf:e3c5:: with SMTP id k5mr80764064wrm.121.1594651780552;
        Mon, 13 Jul 2020 07:49:40 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
        by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:49:40 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/25] pinctrl: samsung: pinctrl-s3c24xx: Fix formatting issues
Date:   Mon, 13 Jul 2020 15:49:12 +0100
Message-Id: <20200713144930.1034632-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Kerneldoc struct titles must be followed by whitespace.  Also attributes
need to be in the format '@.*: ' else the checker gets confused.

Fixes the following W=1 kernel build warning(s):

 drivers/pinctrl/samsung/pinctrl-s3c24xx.c:100: warning: cannot understand function prototype: 'struct s3c24xx_eint_domain_data '

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index 9bd0a3de101dd..5e24838a582f5 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -80,7 +80,7 @@ static const struct samsung_pin_bank_type bank_type_2bit = {
 	}
 
 /**
- * struct s3c24xx_eint_data: EINT common data
+ * struct s3c24xx_eint_data - EINT common data
  * @drvdata: pin controller driver data
  * @domains: IRQ domains of particular EINT interrupts
  * @parents: mapped parent irqs in the main interrupt controller
@@ -92,10 +92,10 @@ struct s3c24xx_eint_data {
 };
 
 /**
- * struct s3c24xx_eint_domain_data: per irq-domain data
+ * struct s3c24xx_eint_domain_data - per irq-domain data
  * @bank: pin bank related to the domain
  * @eint_data: common data
- * eint0_3_parent_only: live eints 0-3 only in the main intc
+ * @eint0_3_parent_only: live eints 0-3 only in the main intc
  */
 struct s3c24xx_eint_domain_data {
 	struct samsung_pin_bank *bank;
-- 
2.25.1

