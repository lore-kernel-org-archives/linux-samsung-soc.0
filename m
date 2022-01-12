Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32812C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 12 Jan 2022 10:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352286AbiALKBP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 12 Jan 2022 05:01:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55534
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239771AbiALKA5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 05:00:57 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2E02E3F164
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jan 2022 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641981656;
        bh=vkZ3shAsrts82aZQTD9Odzm7oGr7rqF0WKQDjTKTwd8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=PDpnVClNy95esZEpXXRH7w36lAx4hg9fp+iLER9w/DdNu/guwQ8YgR1fOvtC+/hv0
         bZhOlls1XkuJcONiXy0bZp/Dl6ZAcmPbUbUVb898exRiEURT8YBJZJnp2NWasbXAtb
         Mz134UW/GB1Arx7Zm2SkVoAODNx8BENF7yq7TVN9ONZrKMtWUw8EqjXbM8m/f9JeXQ
         +bthC97meKAD0YN0JmvGi9S0OuFL5K0LHs/lgUCOZpd5Ug7v+r+mW/7Oz6QFuNqJk3
         +vSFrh8XSQn8ZGvBGVTbJBUjnYfBrUBkeoNwbc3WtnTSe1steiEMWbuI7Gnpjxqg+w
         sHv0TTGXt4a+g==
Received: by mail-ed1-f69.google.com with SMTP id h1-20020aa7cdc1000000b0040042dd2fe4so528729edw.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jan 2022 02:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkZ3shAsrts82aZQTD9Odzm7oGr7rqF0WKQDjTKTwd8=;
        b=4CndODJiRm+005Z4KNk91a0n4uuiAgxRENYsF52rfyaHzYHf+etrjY6Drq8DhNIXSn
         pfvC7xKdn63ZraZjvMo8dDdcNZA/HPkvsspexAnhMfmeHiThbEXrneKr+etvnkE8pvuK
         tt/JXXDKhAk0eB2gBJpdt2SDIsENvUClB1fdkvwtlxFIWvZ0qfVkDuZYLYwjgzs3c+It
         cWxAm1a1p2oAxulBXsamyUj1MGoYOf1yDjj0JRJw4VIfaoQ0INPckgzrt9FZwm3LmDkB
         rf6P5rhvvsO2HJHoLxyiGkdLIjusVgdtAMPyZUMnUXQV3H7KiBWWOwPy915gL2r6Dq/3
         yERw==
X-Gm-Message-State: AOAM5314WHarVGCP9DdoUFJOwIbXtieuU5dXPj0TjdAvIQCTEmd2omkM
        HQCMXbHIXXjFy+t3kPLSe5gpqoR4WV1A9bKf+YOCxOpXutoE+q3ferPRohlp1flhevNhXSiLtMb
        SrkkZgG6/W6LlAsyRckd0LGJmMP7V2g62c+GEbdfT44sUxabQ
X-Received: by 2002:a17:907:7295:: with SMTP id dt21mr6749940ejc.453.1641981654830;
        Wed, 12 Jan 2022 02:00:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr7AHmnhL8e6o/jXCWgESvLqrOYDTSQTTXkoaFmOMriyvAZ3QFfDrNia5S1pL4Lx8Q/Cv4WQ==
X-Received: by 2002:a17:907:7295:: with SMTP id dt21mr6749917ejc.453.1641981654645;
        Wed, 12 Jan 2022 02:00:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id hb11sm4311083ejc.33.2022.01.12.02.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 02:00:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 4/4] spi: s3c64xx: allow controller-data to be optional
Date:   Wed, 12 Jan 2022 11:00:46 +0100
Message-Id: <20220112100046.68068-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220112100046.68068-1-krzysztof.kozlowski@canonical.com>
References: <20220112100046.68068-1-krzysztof.kozlowski@canonical.com>
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

