Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B56C4167D
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BFF260F43
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241384AbhJHLoy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 07:44:54 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47492
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243035AbhJHLmH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 07:42:07 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6A27740001
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633693087;
        bh=3lioRcCn3/5I7Byd/FEr0VTjZpCEaYjPURKLlNwW7t4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=L4m3LXfzJPrmhKKmCayaDbEUQpBkYUWnc2uSQ8jDt5o0ZrnBXtzIIO51mIFMHYP8Q
         xq/TjhGu+14IAEMTyVaNuivhLnprtbx0LpwyTbc1t/JN0CgGeMZRp9EkJZvI0cbwdn
         jNHx/mekwZUJDvTJSl8SdIA9NQ4AiGcTqV75bys8AA7MtTA7XhC0vQ4Un6B1IJYWne
         +3YfZMFsrjowNMAVl8VWpreO+M3S9KYRjf9QNvq3QLr2NW9DFTFq5irNRPE8jT0Alz
         zKT2OLLKKQ0SJgvT06+g6FUTA1X1gTRuXAY8xzEQ8ZLt9czQ7TCqWRyMHhLNR0iWbg
         MNtbBR4sEmY7g==
Received: by mail-ed1-f70.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso8901134edt.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 04:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3lioRcCn3/5I7Byd/FEr0VTjZpCEaYjPURKLlNwW7t4=;
        b=pbfqqWzbmB2JUw8lQS+0ZwwL4yaF9Vncul6/JCaIaw2jf/Nwdgm8uEzcWBWQaqAFbF
         Xzp15BEpuNPOImqHD0SwKT6e+gXYm5nAZI1Me7Fuw7hfonD1Pkns8loI236ASNHReQIr
         0EPjTOeH1un8Q1IYu+gRiXfKpwmyTO1lJOt+p9jozpsRDYzPAHV0vcsvES0+jrN+A829
         fYa4wAoH9zj1HFasFORvzTGkuvAekfgR7gocS0xdviEMdGdRGuV5+I2v5gk0icDJZ9EZ
         ARSpnifAeqTk2ul7vZJqyYegTrbchmbnm4uJPb9vfk5mAxDTFfv8PSgmxmAH7IrNXMyj
         pb6g==
X-Gm-Message-State: AOAM532enDoy7HzXDpLg8saxxo/D8NqugarLRV7N4jtPfzhFUlXI45R+
        kV2cfTN64IrhoZcy/OtFXbNnTAdUilJqZWp0rVZq0Bdmi6IjDM8tl3PPaZrWcNxzFqLql5g/cgm
        350mL5zU5q98S5WJEyqLZTubbxJGqnm3BFxmLvNf/6AnGY6Fl
X-Received: by 2002:a50:e1c3:: with SMTP id m3mr14475696edl.28.1633693086682;
        Fri, 08 Oct 2021 04:38:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSgOOTxmIz6/eUaO3XLb/7FHGRRj5wImxJqfZ/8ppuVdIQh/Aapau2ufIxWL+mBrSjYqbxmA==
X-Received: by 2002:a50:e1c3:: with SMTP id m3mr14475657edl.28.1633693086467;
        Fri, 08 Oct 2021 04:38:06 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id la1sm819948ejc.48.2021.10.08.04.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:38:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>, stable@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 02/10] regulator: dt-bindings: samsung,s5m8767: correct s5m8767,pmic-buck-default-dvs-idx property
Date:   Fri,  8 Oct 2021 13:37:14 +0200
Message-Id: <20211008113723.134648-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver was always parsing "s5m8767,pmic-buck-default-dvs-idx", not
"s5m8767,pmic-buck234-default-dvs-idx".

Cc: <stable@vger.kernel.org>
Fixes: 26aec009f6b6 ("regulator: add device tree support for s5m8767")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
index d9cff1614f7a..6cd83d920155 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.txt
@@ -39,7 +39,7 @@ Optional properties of the main device node (the parent!):
 
 Additional properties required if either of the optional properties are used:
 
- - s5m8767,pmic-buck234-default-dvs-idx: Default voltage setting selected from
+ - s5m8767,pmic-buck-default-dvs-idx: Default voltage setting selected from
    the possible 8 options selectable by the dvs gpios. The value of this
    property should be between 0 and 7. If not specified or if out of range, the
    default value of this property is set to 0.
-- 
2.30.2

