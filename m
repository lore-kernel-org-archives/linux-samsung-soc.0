Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07CAC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:37:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F6F9611AC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhEKMiS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 May 2021 08:38:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51127 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhEKMiO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 May 2021 08:38:14 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgRdL-0002gD-UY
        for linux-samsung-soc@vger.kernel.org; Tue, 11 May 2021 12:37:07 +0000
Received: by mail-ua1-f72.google.com with SMTP id k32-20020ab059e30000b02901ed0ddc4b08so2438565uad.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 May 2021 05:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dESI6UIanP9SYP+dA0R2Z+/ifRMzMVAqstkYDnBKva8=;
        b=niCkyXRT6GvTpHo+kJlwhZEsUIIt6Ct+205p3mIVgWYltD8a5FwpYrZBOVS3wpVSxk
         jYdsa3i70s82q9mD1zUXWULMYTWGq/DLJuk1vYM0t+pZCNmdBlffYbytYF7oVMWkl54F
         qqCMe15VcMFU1bTBrw5dwJUT1EE3K8Q6QrBdSKt826Bvq076uDmaVwcjllTqYZaavcH7
         i0uttmufo7L2x3LLfk2fGrczdvFdxMh/Kmb96C+9wY03RkXoFNAiLTS9g9eaPr95wr5S
         ph3LgKiU+/DoOPPCFuN0Tuo8W5bLKt5jnqxE71edY3aqYKZ2JXrwVh5XbQwVemwNZMua
         9IoQ==
X-Gm-Message-State: AOAM530aOr10rxzegWrXWXC64xemt34dYIWtbMvMroE7jjPei9YMV2Ai
        xemsw8x/V6KzId66JBinwN02aJCdpB9Jey9FupSYeo26W/nqHr9m8/a6iMj1Ea3FDZ2FrdqRpEU
        j8Xv4tlIO2Lg+jQ00ubxBRYCLrJN0DiyEJ9sAZWD7coZOAEDq
X-Received: by 2002:a67:c897:: with SMTP id v23mr24621289vsk.21.1620736626436;
        Tue, 11 May 2021 05:37:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsstqrCGPGwKQw+E8kDi6fNgrHq+JiyfOabiP5XD6/NP0Hvfu2ryEsA4NoNofSlOZVMSQCBg==
X-Received: by 2002:a67:c897:: with SMTP id v23mr24621263vsk.21.1620736626294;
        Tue, 11 May 2021 05:37:06 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id r12sm2039148uao.6.2021.05.11.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:37:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] ARM: dts: exynos: align Broadcom WiFi with dtschema
Date:   Tue, 11 May 2021 08:36:53 -0400
Message-Id: <162073661213.12308.14891342719817203465.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
References: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 5 May 2021 09:59:37 -0400, Krzysztof Kozlowski wrote:
> The Broadcom BCM4329 family dtschema expects devices to be compatible
> also with brcm,bcm4329-fmac:
> 
>   arch/arm/boot/dts/exynos3250-rinato.dt.yaml: wifi@1: compatible: 'oneOf' conditional failed, one must be fixed:
>     ['brcm,bcm4334-fmac'] is too short
>     'brcm,bcm4329-fmac' was expected

Applied, thanks!

[1/5] ARM: dts: exynos: align Broadcom WiFi with dtschema
      commit: cc29e39412b9a78b43f7dfa09d739f8ba9fa7984
[2/5] ARM: dts: exynos: replace legacy MMS114 touchscreen x/y properties in GT-N7100
      commit: 8bceb2a490bb8e1048e9c73520f49a65823108a4
[3/5] ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
      commit: 75121e1dc9fe4def41e63d57f6a53749b88006ed
[4/5] ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
      commit: a7e59c84cf2055a1894f45855c8319191f2fa59e
[5/5] ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
      commit: fd2f1717966535b7d0b6fe45cf0d79e94330da5f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
