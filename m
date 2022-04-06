Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED00C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Apr 2022 17:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239195AbiDFRfD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Apr 2022 13:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239156AbiDFRev (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Apr 2022 13:34:51 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF1E28EA2E
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Apr 2022 08:41:43 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id dr20so5077382ejc.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Apr 2022 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IVumMDZqt2rwjHo8Qk+yTSY8rtnOM1vqzCoA3ao9aAM=;
        b=zVB8o3Zgd/cpfJfL0Am7OUu8eY30qJZHoXMN4YADODANvu03uA3vq/LsPdIMNa/cvj
         79Xn5J/zT/yzIdDCay7AJdtG6EbZutctsan0TUjqCkHikSW7F52S0iKdx4w/02av41kC
         C4gcQ/Fgh1bkBZQ6qh33ERwqW6zDcHhVFdso9gKd5oKVrjWiywDbxGSSSEGzGREdn0rP
         XjNwcv6B8qd5UnsvcNNgD04AYyeUw90W0QPIgXJaY5JSJ/cyE2bJGtdKSwOvW9tGtEqA
         h0HUtmo83SzZLEgBjOqw7TT0xqlli4KUKMepZjsNRzH3PPc83PeU5gq+YBrU/bUXF3SZ
         vV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IVumMDZqt2rwjHo8Qk+yTSY8rtnOM1vqzCoA3ao9aAM=;
        b=wk3sH6y31ZCEBqcA6skvVBLgSPUUuJCNsujFuyeN/Dinf+GgFlBTBtgn+iblUJukMa
         tFbdwyqSIC+WWtHH1ZDWk3/FIZuNb/agX7Jgdc8RxlTocpmCzKMdLLSWtQ3IH1dfkt+W
         j094oRHLr4vP7gUTjIoEWpMXiC33rH/ClMjbCRghjm2Z6Wv9lRJ5MGvBelazf+G5Eb0e
         pq900N4PLveyqDN5g6tdgJwl1F8GoGrS+1z6wUN/4MRGq2wpItNkN4QVLKgu+45FJJRm
         ZJlfmr91g8RrBFvRtoWsLR82LY94zgl9yCzkGDPNrewxBl38lfddYjRKi2PgKxb5aCqB
         kwaA==
X-Gm-Message-State: AOAM530C0HrFy2sm0CcVOjLdV8PfWi2xC0v6WLcLBhxpIDazQDmSLawO
        /MyaCtjePR89KdtUXUHXr+xfKA==
X-Google-Smtp-Source: ABdhPJxrUbKHbP58C1B/fd6ArkIlovyAlC3CUwhuPi3IERJe3tFXIzQsIIQmlOGhmyi2L62wj78X5w==
X-Received: by 2002:a17:906:5d0e:b0:6e0:2cd5:a87c with SMTP id g14-20020a1709065d0e00b006e02cd5a87cmr8930160ejt.708.1649259701557;
        Wed, 06 Apr 2022 08:41:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906145000b006bdaf981589sm6666260ejc.81.2022.04.06.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 08:41:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: usi: refer to dtschema for SPI
Date:   Wed,  6 Apr 2022 17:41:38 +0200
Message-Id: <164925969518.491593.2533491999537917360.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220324134106.103588-1-krzk@kernel.org>
References: <20220324134106.103588-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 24 Mar 2022 14:41:06 +0100, Krzysztof Kozlowski wrote:
> After adding DT schema for Samsung SPI controller, the Samsung USI
> bindings can reference it directly for proper schema validation.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: usi: refer to dtschema for SPI
      commit: db85474594609fc6f6a37fe5d5001fa9341971ed

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
