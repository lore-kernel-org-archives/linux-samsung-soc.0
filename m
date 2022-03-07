Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41919C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 08:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiCGIKq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236136AbiCGIKn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 03:10:43 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474EA4BB9E
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 00:09:40 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 16B993F610
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646640576;
        bh=qtWe8unaq2gnuH4T5GX8K7Uz0Sk1ucH1nG+ntQuiss8=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=vCZaSo1HP8djnJ+LH5Lx3pkLoOhvUtkLFtEDhFoQ5cKORlhX/0N0fWBvLTIzq8rgM
         gPqo6Nbdjd4lABJS06JS61XylDcav1BzryOvPEOjsQD5lA8zVF4NKlC7K2rPdnz4Su
         mxVC1nKbsKlBTBxU1BS3vuOO1f40y9bMt7mWU7tTf8wJJDSrYIrOQ3fOGQhGoD+8f4
         z+caJltrlKf8jXuIbhjETqcC/kNe26g/ao0nqyQD6n0osFVmhxyouHQjOScUs9aWJ+
         lbz/ZSusQVGWtv8pDaSCt5G6bevUIo3ZaelC7CSv8JOpQLqTmRcIp8sDQ+AFf2wnJV
         0siCYGTsbhWgQ==
Received: by mail-ej1-f69.google.com with SMTP id 13-20020a170906328d00b006982d0888a4so6554179ejw.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 00:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtWe8unaq2gnuH4T5GX8K7Uz0Sk1ucH1nG+ntQuiss8=;
        b=Cnk1aFs0AD+b4/0Dyxh71FqJOeSyfmvUJBA9uMJMCv+binNAY5fzfuEKO13qe0RTMK
         29rssRcvaTBPgBAGAaXl1MBC3Xe73js3bjrclMlKXvCchznoraz40I6VFmMR4DPsddBH
         8qUEEskw/BDXL3YztD44kELh1CKYX2EYKg7lpXMJXghm7UoUqZdWEFJAm+hNfCEeHfZM
         OzXJJpgraNHuB9X3J6mlCxgzgypNkReOI2ti+hwrs8DOTUlo5ki3nRAlGpBqCbE4qtLt
         LJc3xJQ/LDl3PovJsv8h9PgQ1YRJltF4GrWm1JIWhjSjo/JMRYXUYRGVBQ+Dpz5uJ2Ys
         QC4Q==
X-Gm-Message-State: AOAM530F0M5AWWvED+D/latp5bV5iQFKIbOIQtuXU4MsGLQm0nKdRjsc
        CWB4OnSLeDBTehI1gRbqE1nSPzotNKTYzk+zl8b4UVGGKQJmpz+XJhPSpOGh2Gkg+Zdn2D6U6Bi
        hFQZRM5Po5J1gN3/RxKTJ4wkCnIzG5f8tNa4+S7MTfCtl4UAL
X-Received: by 2002:a50:9505:0:b0:416:4496:5ec4 with SMTP id u5-20020a509505000000b0041644965ec4mr4323941eda.309.1646640575279;
        Mon, 07 Mar 2022 00:09:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2xIp5JRTTzEh0b9kN02MCecpWBHOKgNZ/2vrmHcEo1ZMQRcV8NeBt353n0K2lxOS7+4TSFw==
X-Received: by 2002:a50:9505:0:b0:416:4496:5ec4 with SMTP id u5-20020a509505000000b0041644965ec4mr4323929eda.309.1646640575081;
        Mon, 07 Mar 2022 00:09:35 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fq14-20020a1709069d8e00b006da650af5a9sm4472594ejc.3.2022.03.07.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:09:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] tty: serial: samsung: simplify getting OF match data
Date:   Mon,  7 Mar 2022 09:09:25 +0100
Message-Id: <20220307080925.54131-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
References: <20220307080810.53847-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Simplify the code with of_device_get_match_data().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/tty/serial/samsung_tty.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 3ffae912217c..61c530bb377f 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2150,23 +2150,16 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 
 /* Device driver serial port probe */
 
-#ifdef CONFIG_OF
-static const struct of_device_id s3c24xx_uart_dt_match[];
-#endif
-
 static int probe_index;
 
 static inline const struct s3c24xx_serial_drv_data *
 s3c24xx_get_driver_data(struct platform_device *pdev)
 {
 #ifdef CONFIG_OF
-	if (pdev->dev.of_node) {
-		const struct of_device_id *match;
-
-		match = of_match_node(s3c24xx_uart_dt_match, pdev->dev.of_node);
-		return (struct s3c24xx_serial_drv_data *)match->data;
-	}
+	if (pdev->dev.of_node)
+		return of_device_get_match_data(&pdev->dev);
 #endif
+
 	return (struct s3c24xx_serial_drv_data *)
 			platform_get_device_id(pdev)->driver_data;
 }
-- 
2.32.0

