Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879B6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 12 Jan 2022 10:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239553AbiALKBL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 12 Jan 2022 05:01:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55484
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239621AbiALKA4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 05:00:56 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 45A3F402A5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jan 2022 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641981655;
        bh=sxpoeazVKfRv/TTxlIPcEu0VInhZebJSCyyifiEPVW0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=tUJuFG8OXmUW0dve3bTnerR9+TleH5HxCy+ksux/ROGBarSwX0SpYO8M+cUTeBHNC
         jHcHJkKb1toPOKVB38DnBLU1bLRGcAYKxYbhb4T3X/BMDpyns+MYHXQR4DxxQLl6Fm
         ckKgxd8wHFJMfBYzICnQzrLFnhFaJlbvRbjKDEE7zi4TYf8LaBlvr8pg8ebgVjzXd8
         BfUl7lmrvDKrMOHJOhSXr7JhCPQltk9B6wvNAnq7dRrggI79VolNc+64xaBqZDuMJw
         oTfXmmHCg4ExKa1y1iegY21SFGVr7ZzvVXsgrkqEfzW0bkjCQ6ePVVb49OZs/luD/r
         0CucxLchjwspg==
Received: by mail-ed1-f72.google.com with SMTP id r8-20020a05640251c800b003f9a52daa3fso1765325edd.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jan 2022 02:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sxpoeazVKfRv/TTxlIPcEu0VInhZebJSCyyifiEPVW0=;
        b=mvEsFgAlorQGkQyUNEZXzus7QwekhjsQlS5RNN0yckGKLBt3I8Roox1yAGIlPJOy3a
         eJnQlAnJ27Udxhg3+13Eb5Kw6IERJS3DwM1MRrRA/QQdULRDlvrsGoGv2XBhyuCnx2Ed
         4SVjcCvaU7rhCTn3WAQNIVcfo46xlPraztHT6guEEU73mQXs+lC8vLavKV5NlCMSfc8A
         1Frt2ToM0wMlcKxy9HsEtIOwhX+8lmT9RA1LTP83jEiaAMPh0honIYUzP/N/Cr/13ax9
         OG/YULPrjORVIKx4wXpeFgS0UfYQ3C0zKnkVX8jDCAtL9AapF+mw3l2uFjZdjq5mqrsQ
         yayA==
X-Gm-Message-State: AOAM532YYvqCxJE8RWQWcexYAbH0P97NQ8AVHS1rQM/Lw6RZRu49Asv4
        m0Wreto9MlGnrKE50wZjucGaMWvglkwmJy7CcfUOjCqwL+bnXEndCcV7a+joUCmk6kuUOymDKFR
        8N0NjPeTDb4vNYdi0I8dGLRahUjFvqH+11D5RLIti4XdEbLRb
X-Received: by 2002:a17:907:7d8a:: with SMTP id oz10mr2375258ejc.320.1641981653521;
        Wed, 12 Jan 2022 02:00:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzzXqkrKxbgq5mvkmGUzVcTyBUQLnw1MTu9OyibOn3Q74mOavVnNmdXwrnaGEsFJ/VZr09+g==
X-Received: by 2002:a17:907:7d8a:: with SMTP id oz10mr2375244ejc.320.1641981653311;
        Wed, 12 Jan 2022 02:00:53 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id hb11sm4311083ejc.33.2022.01.12.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 02:00:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 3/4] spi: dt-bindings: samsung: allow controller-data to be optional
Date:   Wed, 12 Jan 2022 11:00:45 +0100
Message-Id: <20220112100046.68068-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220112100046.68068-1-krzysztof.kozlowski@canonical.com>
References: <20220112100046.68068-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung SoC SPI bindings requires to provide controller-data node
for each of SPI peripheral device nodes.  Make this controller-data node
optional, so DTS could be simpler.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spi/samsung,spi-peripheral-props.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
index aa5a1f48494b..cadc8a5f061f 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
@@ -28,6 +28,7 @@ properties:
            - 3: 270 degree phase shift sampling.
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [0, 1, 2, 3]
+        default: 0
 
     required:
       - samsung,spi-feedback-delay
-- 
2.32.0

