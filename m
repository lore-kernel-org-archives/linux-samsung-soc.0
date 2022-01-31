Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F73CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jan 2022 08:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbiAaI70 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jan 2022 03:59:26 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33870
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229446AbiAaI7Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jan 2022 03:59:24 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 77A153F1FD
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643619563;
        bh=pMJK2Xv1q3g4vN3RnCds6GMoulsCTJy14ZNk7Yje5qU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=aAkDhOGIrr0VzELs4zB9rfz9voMBUXmcyicon9dM8nFWdkTE/QPaeIkkFF3fcMEdC
         Sz7Z5m4LQJ8SkFjpyhBhCv/bb8PgF1bdT3p+PJ2l/h3s8/t6rjfpqrB/mxtWlHks7K
         +B98TyGwTL1moDCHjQ6pIgctDNjBn2owBzk3WR9A2VXPwBQKpo7kAXpz7skG4dgKgV
         cNYoTG648iDFSobhO5KhcDKx5urliDL/A68AQIbw8w9S5cIMDw3lbdNZMh9fDP5TWz
         8a5w0CHPos6sD6JXL61lhJXYlAzlOvks1ZA9lvgBKoFb+v5PFwSqdkZpi/+H6uFBaF
         KP8kR7vfM59WA==
Received: by mail-wm1-f69.google.com with SMTP id f7-20020a1cc907000000b0034b63f314ccso5555400wmb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jan 2022 00:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pMJK2Xv1q3g4vN3RnCds6GMoulsCTJy14ZNk7Yje5qU=;
        b=JaVCqJ00jjv50DeZpXdfVDKVdqphZIwdUI0Np+/xH3ZiPa2oRApcwtqJzvyZ+pAWPx
         urH5+lbP5SK6z02geplyUHxLVWHL5/1ZFxa4NO4G29KfeGKzKi9HjDlt6AwDLvBujQjd
         VxJpf0D7rnr2LEUxanHBPCkOLLwEzDz/7UoSdbGLdPziDdRS8EpUfS/TEQNfD+95FoWp
         VHVQlZfxK8vSWIzv8NlK4BsUqrNuwUkYh19FQLYZJ/llCPtBFbldn9J7O1U5C7T5RGRG
         t1PnDYMKNN2HmlalvEavrcG+3YXyBs/j3SHJFgKQKUr8FpXEWrAwBZpUyAf4Nif4ZqnY
         wR6Q==
X-Gm-Message-State: AOAM531Fq5/T+u2S3pakX32IHOBa7e0uwou4TiSMA1qIjXlP9gxt/lhR
        yINkh1/BAYJFoSFEZjIs16Ixr7UfnBJJiy4RhSKuH3008w7odOfPcwa+ys8FHyCmTS2oti/L+U6
        f/xAVSBcG8wmJZ+adly7UEXFjSVvG1g/fIp1zG2xr6saUs4Ca
X-Received: by 2002:a05:6000:388:: with SMTP id u8mr16014923wrf.688.1643619563182;
        Mon, 31 Jan 2022 00:59:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRdxEbb/p7MmVe0JMFTBCBfNrU8zbUNuZxM6kQpBXslgt/YMYqxfcBoukWJmqqgU5iQVwc9Q==
X-Received: by 2002:a05:6000:388:: with SMTP id u8mr16014912wrf.688.1643619563004;
        Mon, 31 Jan 2022 00:59:23 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f13sm11237701wrp.105.2022.01.31.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 00:59:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH 1/3] ARM: dts: exynos: update dma nodename for exynos3250
Date:   Mon, 31 Jan 2022 09:59:21 +0100
Message-Id: <164361952065.14120.582076973615108824.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220130075520.49193-1-alim.akhtar@samsung.com>
References: <CGME20220130080810epcas5p425f29e7a017b4b1690509e60651d4245@epcas5p4.samsung.com> <20220130075520.49193-1-alim.akhtar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 30 Jan 2022 13:25:18 +0530, Alim Akhtar wrote:
> Currently dma node name does not matches the pl330
> dt schema and make dtbs_check report below warning
> 
> 'pdma@12680000' does not match '^dma-controller(@.*)?$'
> 
> Update the dma node name to match pl330 dt schema
> 
> [...]

Squashed into one commit, that's a tiny change in each file.

Applied, thanks!

[1/3] ARM: dts: exynos: update dma nodename for exynos3250
      commit: a5a881a33f8d6d5427a4150ee1a24a8790ada270
[2/3] ARM: dts: exynos: update dma nodename for exynos4
      commit: 0e1434e19717309c2c3a0770bd4ef5c3a937fe03
[3/3] ARM: dts: exynos: update dma nodename for exynos5
      commit: 51d6d2cb2523c3d979e94efc065a7c88a9c8dd61

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
