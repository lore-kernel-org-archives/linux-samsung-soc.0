Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FB6C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68D4861622
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbhEKMjG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 May 2021 08:39:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51154 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhEKMjE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 May 2021 08:39:04 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgRe9-0002kR-GW
        for linux-samsung-soc@vger.kernel.org; Tue, 11 May 2021 12:37:57 +0000
Received: by mail-vs1-f71.google.com with SMTP id u21-20020a67c8150000b029022a6f03b431so6081968vsk.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 May 2021 05:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YhaXTvaayEOzoq0QjzmBPdXnRVsB0DBQyw7HOMA/2VM=;
        b=AfoAYPK94wvyhslZO1OLnmv3GaUBdsDSBzgaEgwOHgeaUpvVCBeg976MDTVQg88zd3
         r2+xP40r6VbyxaS+V3S9ZcPIommdXT0gvkRv16sLhsdhv5iOw8fVnojGu9giF80lzw+4
         tU5eqx/jtVMaUv/11Lo8lUF6QzXgooaHsVhIoYN7RxfjWN/HOdOysz5WrX9coqmTKyVS
         O6+5/tAbkuF/QZSigF4ozhiyZDXZvvWbx4kRx2NmOkyyv7UU+CvAVeqJrH19AogjOpN8
         QRv/zZ9yj33Azw0xkDSHhgS9rI//zDZ/xmFaQ4lR3gYV1x59Tv+XEX0juS8mlyg+JV3g
         r9sw==
X-Gm-Message-State: AOAM533L90qlqyvx7KHsLLKrEgkiz7r+5a1WRXW862wonm3ZLnGHBJyT
        oyzsGlCQV4CJI6Y6sM2pAst+adQqeAj25sEi4zYee8loAhcDO/SgvS66/ZjMHFficfriXQj28D4
        PZOmKGNPWioUNMttlaCrptt+uVgRchufB6REqvxiIdYYbV1I8
X-Received: by 2002:ab0:596f:: with SMTP id o44mr25517826uad.8.1620736675842;
        Tue, 11 May 2021 05:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXNWN45OqkMAHJDZh/zGUfEUXLkG+LvL4VP0sEIb56QoNjxAOq9rxkqZYo4mO9Z+Y5kcvoUA==
X-Received: by 2002:ab0:596f:: with SMTP id o44mr25517783uad.8.1620736675545;
        Tue, 11 May 2021 05:37:55 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id c69sm823434vke.48.2021.05.11.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:37:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: s5pv210: remove unused Atmel touchscreen properties in Goni
Date:   Tue, 11 May 2021 08:37:42 -0400
Message-Id: <162073661213.12308.11074899946393736120.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506152044.37579-1-krzysztof.kozlowski@canonical.com>
References: <20210506152044.37579-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 6 May 2021 11:20:44 -0400, Krzysztof Kozlowski wrote:
> The Atmel bindings and driver do not use custom properties like
> x/y-size, burst length, threshold and so on.  The driver gets necessary
> data from the device directly.  Remove unused properties to fix
> dtbs_check warning:
> 
>   arch/arm/boot/dts/s5pv210-goni.dt.yaml: touchscreen@4a:
>     'atmel,burst-length', 'atmel,orientation', 'atmel,threshold', 'atmel,x-line', 'atmel,x-size',
>     'atmel,y-line', 'atmel,y-size' do not match any of the regexes

Applied, thanks!

[1/1] ARM: dts: s5pv210: remove unused Atmel touchscreen properties in Goni
      commit: 8b7e0f72ef7123460b31fbe0652e1871603d2b70

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
