Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DF0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 07:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79DAE60ED4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 07:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhJZHVi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 03:21:38 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33628
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229635AbhJZHVh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 03:21:37 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 338F13F170
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 07:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635232753;
        bh=FH1FFNDft+d4UJ5a+Tmcxa+X/KfOXYaodjYUQBDcIiY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=X9YKydnowX/gZZAQum56yZlQqvX4KwqOOX81DnTLUjRYO1IMxmYaoQvmeFrFesI8T
         WxP39UWTS3YtwF18rHUDusI5F1uJhNACpiYqCqyN02SSMoU+gHOXAbNWSDGIb8LDZv
         AE2U2BHMRVpQpcN1HZ1GInoPUvJlYcOlnkWaftshHVgDATJFsT/iiPVdWIkz9J60Wj
         V5u9DrroR/9zVFjYSP/nbqwC+CC+9kgmgalvJo4JArRAy/7gJFU/yNr4ZRHqTxljNm
         2h9N27ixPCvEYgfl+0XDa6FNSvxuxplc6AL9668oWiViEn8XjdxdPLMf+Dm/vZ1mVn
         hvLJdpPr+xGDw==
Received: by mail-lf1-f70.google.com with SMTP id k15-20020a05651239cf00b003fe1ba9c94cso5941773lfu.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 00:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FH1FFNDft+d4UJ5a+Tmcxa+X/KfOXYaodjYUQBDcIiY=;
        b=5RcVlpFBHDPeE9A2o3EJZSl/c2FZbNdh2NpCOfceIxAAcOLKj29MMjoQfHR629ua/A
         TzUaVFzfTDnlCdw/9Sf7a2GUHXVSIoculJzDCFKkMULqeXIfFm/ZUh/iignPsNg3EwTZ
         RWmSF8o3zqY7oShRZgQ+6ANAIRoBWhLXppjv5TaVzLCDy6C21qQvm9hpKuPTvXLlWW9c
         T7zdxkOGPAAfXvv5epIQnqs7RwWUz3+DmeE8sqNztoeZQT7zGccTe27YU7k3EVagNGJP
         5iwXWEVKqQRaIpwzzwFargQi3IjYFEWusgXfbXnPyzU1lp024Dt3UDxGrdatCrrxYlgk
         bFkQ==
X-Gm-Message-State: AOAM532UhjKw1LjI2G3LmAIYK0Xxtn821V+0XEHQeSiDw7yH7KFjNb4q
        22O57I/Hhyurb0dx8zXANT4JIExjBfCyhLxuX7FTlkrWOnjxOdGYligCpycFHlm0Cdpjz7FGTy+
        GkszYLF0ulFKpLvl6TLxH5m/rb0enaFowy+TT90idJ1lsaCMj
X-Received: by 2002:a2e:320f:: with SMTP id y15mr25674969ljy.286.1635232752689;
        Tue, 26 Oct 2021 00:19:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFep4eQkGOg6ikMGtLloYXk5saWxNeaFxIJ6XGZjp3Lsi8CjpAUf27QhwVxKDsy8yNRRLhkA==
X-Received: by 2002:a2e:320f:: with SMTP id y15mr25674929ljy.286.1635232752320;
        Tue, 26 Oct 2021 00:19:12 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m7sm488263lfu.110.2021.10.26.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 00:19:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH 0/2] Add exynosautov9 chipid support
Date:   Tue, 26 Oct 2021 09:19:09 +0200
Message-Id: <163523273932.18107.17184430610258109480.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021012017.158919-1-chanho61.park@samsung.com>
References: <CGME20211021012310epcas2p2745335616ece50729db4a6368676b450@epcas2p2.samsung.com> <20211021012017.158919-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 21 Oct 2021 10:20:15 +0900, Chanho Park wrote:
> This patchset is built on top of Sam's patchset[1]. Exynos Auto v9 SoC's
> chipid is compatible with exynos850. So, this uses 850's compatible.
> 
> Exynos: CPU[EXYNOSAUTOV9] PRO_ID[0xaaa80000] REV[0x10] Detected
> 
> [1]: https://lore.kernel.org/linux-samsung-soc/163428419206.64320.1460944164027641564.b4-ty@canonical.com/
> 
> [...]

Applied, thanks!

[1/2] soc: samsung: exynos-chipid: add exynosautov9 SoC support
      commit: b417d1e88f32645ed62a00d43c347b4386a0a021
[2/2] arm64: dts: exynos: add chipid node for exynosautov9 SoC
      commit: b2f217cc7fbd3e6a097021b8b663328a649ea232

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
