Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C80C76188
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 22:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbjCJWaK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 17:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjCJW3k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 17:29:40 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD38125D97
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:16 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g3so26538875eda.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 14:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIL/eAhzd2Q+CmLa0/Vp8uh0M9mRf6IHTk8hQZUVPkA=;
        b=k9IOHxBgd0bMymkB/VVDYynw3dg0wz5WLTLxzV6gvhi0zHI1m8CQMly3VXoSXuKFCp
         8h9Sng22gMlalzZGQ190Jfc2ocLKGquLyts/VCYV4KgnzhNpLAw1lmCH08tqlBTGh9uX
         opjEMpR+/6cN4xnJkfQRHijm2E+EP866a7+7DUN7ENr4l/jbDJAouQL9++JBziQhUcen
         89Kb5I7fiA11hsVqegrlnQFLmvaJvdNzACOqIF+Q8V10Tmi8VpXBpBjWc0BjNbw236gS
         IGoWXG5ofcZOzKkhc2pkde95caIVRGE7UK7159UQqJklSACcPwP+y8SGCq20FhEImF6F
         06VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIL/eAhzd2Q+CmLa0/Vp8uh0M9mRf6IHTk8hQZUVPkA=;
        b=MNajZ9WiAiQjlv8MRWtPcwkY1Hly5GPzC0/DVccg9Aj13Ggh01ZCqXB0CHu/Z4IIUu
         cOW2oauwnKKpm5I6xmz3d6Y9aDMwkMhUBMpjHK3gv99GEj+lbnIP4AWBZMLeEg6FHxqw
         0heiUaO04bXQQ2hDjo7y2ZxefnTWaRY0OKgwqYd0uoc02kEXZuaYBv3IBRR84cyprS45
         hp/FvYRH7yugCQfqHWCm9RmpVc1uvsDwpUVlV+CGqbqUF7mIPHRTSNReybaKaNWYggDA
         aaSk9aHAiXjqRo+T2wzB/iYkzrrblbUbC15FP8nHMIlgzVbo7evxVtCCoeHp/v1cdxV+
         0EkQ==
X-Gm-Message-State: AO0yUKXehUoav1zwXIL4AK+iQiYrxER5C8MGhyngA2HBU9Shlabh3E0e
        W2KMwvU8DCtMSo05WaHXcCrJdQ==
X-Google-Smtp-Source: AK7set84qDZr9RcwJ70A6u3nLP8atYZ9eptCD6oONVkchKcqZ66qh2jURUNfTUs7WD78mR7YiVblZg==
X-Received: by 2002:a17:906:dd7:b0:87e:a34b:9e2b with SMTP id p23-20020a1709060dd700b0087ea34b9e2bmr27657561eji.28.1678487355376;
        Fri, 10 Mar 2023 14:29:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andi Shyti <andi@etezian.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 12/16] spi: pxa2xx: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 23:28:53 +0100
Message-Id: <20230310222857.315629-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/spi/spi-pxa2xx.c:1757:34: error: ‘pxa2xx_spi_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/spi-pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index a75ba2993f3c..19e996a5a02e 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1754,7 +1754,7 @@ static const struct acpi_device_id pxa2xx_spi_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, pxa2xx_spi_acpi_match);
 #endif
 
-static const struct of_device_id pxa2xx_spi_of_match[] = {
+static const struct of_device_id pxa2xx_spi_of_match[] __maybe_unused = {
 	{ .compatible = "marvell,mmp2-ssp", .data = (void *)MMP2_SSP },
 	{}
 };
-- 
2.34.1

