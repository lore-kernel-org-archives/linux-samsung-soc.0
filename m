Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD42C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 08:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344812AbiCHIKb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344763AbiCHIK0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 03:10:26 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84FE43E0D2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 00:09:30 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 56AC13F625
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646726969;
        bh=29Pf3ZsU5JJVOHBIO1WRfRouMVWJymQOmYuJyfmZYy4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=LkfbNmA9Vjt18uCAYkD/pVLrecoVDZlQhW5ah475s/GQnogj6tnEjYQ6nHpDib1X3
         R3473N8FT7FF25HiCF7EMiaMW6GYb2rCOMD99DeNX7sxtMEEGck8lzy7sT5Q3vpxBI
         XpwVT0ILex4z0miDeiAXMaognDhTvvCh6Za3ur3q8nAHkbimbx6oDPLOrHBm/uPr/A
         FAlsUBQA2n30Pq5et4NQzOgBQh3/2PWjbNK7MkxTLiLz3HpdqfNd4kkvD7NbRB7dl9
         IbuMAczN6X4DYZi8g9FL42hBwyVVENMDDSSZby3uCMcI2qOufJ7M7nnCTPFuV9pVTh
         irARfJ5mM/3+Q==
Received: by mail-ed1-f70.google.com with SMTP id l24-20020a056402231800b00410f19a3103so10133025eda.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2022 00:09:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29Pf3ZsU5JJVOHBIO1WRfRouMVWJymQOmYuJyfmZYy4=;
        b=WSru+BrIByQ13KHCNSrPcoNW/oJXLKLA1uh6UiAqaYAn0c3uFwmhK/jQcWpbXWAw7o
         +CaZjKZV3zGyyUBi7foNOY39HkRTz7ruFRjohtT1qBD9Xgz/WOsgzt/PvovL4pvY2QCC
         YJcCigk0wS+KWx+gr6VwYQGeGMqIuTMJNZi1d29ecZh2O/rPiCeD/htlXwuHamo5e23P
         4PILjb0Tsh02wxlrDBmKbe9Zozdcl4/CkuOkLSdUJUkS49Qof3FiL/iSfkkerzZ7Z3Hq
         FUvTC0AR0q05+dbppa3cy1SCYblnJcJjgjJuh3P0lOD2/29tS4C41N9b4BLNC9Paej4R
         43TQ==
X-Gm-Message-State: AOAM53235Cx2zVcGIXVYkmNv9O9tMnTQWslSdPsUI+iJXzR8Axe94Eqv
        ur4yiKBkioz4rtS7p0DBdl7hIJiiDGn4aPW72DD3mJ0pWLCTvL1qbMfKjv24dqfcfOLMV/wh+Pb
        rv+o3cZx3nJ/kg6CZ1k90Vgc5qA4FlqnqlfcfMo1rTQ8TMJPR
X-Received: by 2002:a17:906:9bd7:b0:6d6:e920:8d04 with SMTP id de23-20020a1709069bd700b006d6e9208d04mr12389909ejc.547.1646726969063;
        Tue, 08 Mar 2022 00:09:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCDpyzVeafJO+tBKmLNUmXCUwu/pvO8ES0IOzwYdYS55Y3KidkwCIqb81SC/LBMvb5FhouCg==
X-Received: by 2002:a17:906:9bd7:b0:6d6:e920:8d04 with SMTP id de23-20020a1709069bd700b006d6e9208d04mr12389895ejc.547.1646726968858;
        Tue, 08 Mar 2022 00:09:28 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id t4-20020a056402524400b00415b90801edsm7385697edd.57.2022.03.08.00.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:09:28 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 5/8] tty: serial: samsung: constify UART name
Date:   Tue,  8 Mar 2022 09:09:16 +0100
Message-Id: <20220308080919.152715-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220308080919.152715-1-krzysztof.kozlowski@canonical.com>
References: <20220308080919.152715-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The UART name from driver data holds only string literals.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/tty/serial/samsung_tty.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index c4b13f2d6e26..7025306f76b7 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -63,7 +63,7 @@ enum s3c24xx_port_type {
 };
 
 struct s3c24xx_uart_info {
-	char			*name;
+	const char		*name;
 	enum s3c24xx_port_type	type;
 	unsigned int		port_type;
 	unsigned int		fifosize;
-- 
2.32.0

