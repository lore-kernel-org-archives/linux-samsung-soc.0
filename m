Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9D7C43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 10:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348858AbiAKKNt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 05:13:49 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:32772
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348632AbiAKKNs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 05:13:48 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 075EA40A58
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641896027;
        bh=vkZ3shAsrts82aZQTD9Odzm7oGr7rqF0WKQDjTKTwd8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=AsSy6TnxbEX9P9XkYo75tUEdzUi/QNUnxZtzQQaEXG6LEu4gKkiGy4eVjmoLUcapY
         6WhAAT6NaSssf2deKGqTP5U5jZYXk7hhw+U/cJS+iv0P+ORut60tC8iyd9b5uapSPx
         kVWatiiAuxpf2eDOocJu1vVSgr6/QMbI4b9BkHbdOTPdWLB9QdvQR4T2ljnq+hHq9T
         y5UOgs9lYQmmXx/3HWNlKNS6WOSjr84AFsVabhwUoHQS1AkBkX1MDXWF83j6I+e+fW
         ocYfMXcQcrWTUjQb/Dn1WtERIg3u2lBlYQTU/ZmKWTLIy90/yagUddaoF1XJH3iLbE
         Lt5i00s/sOUXQ==
Received: by mail-ed1-f71.google.com with SMTP id g2-20020a056402424200b003f8ee03207eso12885318edb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 02:13:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkZ3shAsrts82aZQTD9Odzm7oGr7rqF0WKQDjTKTwd8=;
        b=3JPmU7wlHpKYZbacDMrlK4yybOthcYcM5K1KmA/t8X1cBQbTWs9mSFRaUA3rCqzSLH
         mmT+55jwRqMlUY73n79B0/hhZs4rVv8uLRKwzay+dfkOp2ScAc/0gRI12o4isGrNJuN6
         e2eqPCp50S+rvM4BQMCpst/g9ZYHhFkANU4Joo+/1YtYxi2XY6UOPRkHsjkdHLsa9EHz
         8Pp/E7cQd32R7DdvbEZuYbq6zv2pldoNvJx8WMA2/ls+LxzDZ+ecNv/q7FydSwwf5b5V
         eceuURTPTVRRvIh+EvyLtkW0CUF6ut4mpKOLeLg6fTw3aGgvIo081fc+aSx8fdHctkHN
         l4Hw==
X-Gm-Message-State: AOAM531u1J8Ttk7Bsr1VHxvcazPHxZOTblw7TLsYF6uSttFlbR58anyH
        7SjIogISU0+KBi7DHrZAfd83J4AG5gCgXQmekSU4oKhl8gdkz3YDYCMj8E/QdWfJ9sAga6adVQd
        qUQ7NHU4iTwfmK4grdaUzb4iyc8SWscXBp60NJDYZhPsuumOO
X-Received: by 2002:a50:da48:: with SMTP id a8mr3517608edk.155.1641896026737;
        Tue, 11 Jan 2022 02:13:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrMWwC4F5CYCPwNtrsTc93H/KSEUuKQ3dZ2KWyqGsikQRFJIiGNhQmyHnezI5HUpc6kJMojw==
X-Received: by 2002:a50:da48:: with SMTP id a8mr3517597edk.155.1641896026571;
        Tue, 11 Jan 2022 02:13:46 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 26sm3431268ejk.138.2022.01.11.02.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 02:13:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 4/4] spi: s3c64xx: allow controller-data to be optional
Date:   Tue, 11 Jan 2022 11:13:38 +0100
Message-Id: <20220111101338.58630-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111101338.58630-1-krzysztof.kozlowski@canonical.com>
References: <20220111101338.58630-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung SoC SPI driver requires to provide controller-data node
for each of SPI peripheral device nodes.  Make this controller-data node
optional, so DTS could be simpler.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/spi/spi-s3c64xx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8755cd85e83c..769d958a2f86 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -796,16 +796,14 @@ static struct s3c64xx_spi_csinfo *s3c64xx_get_slave_ctrldata(
 		return ERR_PTR(-EINVAL);
 	}
 
-	data_np = of_get_child_by_name(slave_np, "controller-data");
-	if (!data_np) {
-		dev_err(&spi->dev, "child node 'controller-data' not found\n");
-		return ERR_PTR(-EINVAL);
-	}
-
 	cs = kzalloc(sizeof(*cs), GFP_KERNEL);
-	if (!cs) {
-		of_node_put(data_np);
+	if (!cs)
 		return ERR_PTR(-ENOMEM);
+
+	data_np = of_get_child_by_name(slave_np, "controller-data");
+	if (!data_np) {
+		dev_info(&spi->dev, "child node 'controller-data' not found, using defaults\n");
+		return cs;
 	}
 
 	of_property_read_u32(data_np, "samsung,spi-feedback-delay", &fb_delay);
-- 
2.32.0

