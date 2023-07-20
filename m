Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F22EB64DD
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jul 2023 19:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbjGTTAX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jul 2023 15:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjGTTAV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 15:00:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71261173A
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 12:00:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fdddf92b05so1405619e87.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689879619; x=1690484419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ujTh5UmKEDSKTenMtxBAdE9mDjrAQ930PzSC8IqC6Q=;
        b=xghr8q17c18wW7dXqb9NO2Qr2e+RjU6Uk5qefPuNxmbKkgEhryRnuVs3B05XuukZ/p
         XredteMRHtxGIBczNrlW3mplnMeidO17FnyicvSXFRUrsckF/NkDRGb4MhTkf0aRP9Ov
         tKQ/YBJYpffXwLmqGou35EkB52zmtkLIBkNLRmW1BGCnJvm5SN+bgEDa8oOXIbvWrYkF
         pqlgh+5Ust1O677xT4CIv/qjFpYXvZJXDbSuLXw7wp1k6CrfsXop5jv81fdgO6Il6j8z
         43yymq99GwPYKxIMGfW9glaOh3EyZDjJMCcDtY5gwEWFhO/fu1BjXkfzo4D95FHqY2sg
         TC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689879619; x=1690484419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ujTh5UmKEDSKTenMtxBAdE9mDjrAQ930PzSC8IqC6Q=;
        b=arwVo37SPMJCHTTK5B6wQaSygkIJ6Vik8IRxj0MJldSKJXI0DEsWqK/VGi0+PEzLcb
         GoEi4Uu2FPt1ngEUTy+y2JbyW7J2aF/nwKluypFexeZifvKQoMHnGKvYYzDm4zWfMRX5
         jUzvuEYmjWTagiPkCr114uZR07CT0Q9x0jFfWzhGv0EjjaTxP5vggnVlxgLn3IbfHL3E
         qee+9QYy6dtVULGnxRyHP6CUE1h/LmFeO3Tl5tvpX6xA39TAtbu10B3dPhOMgslBgVNr
         vcomhkrzKt+926LosxQGCx/dWdJlKK4400CInEB+Y5qbu1v95VQrTrXfm+7ausfRYrRg
         MLiw==
X-Gm-Message-State: ABy/qLZ3zttPmHMopjn3OxWjvSy8xw1Q6eZ+U6zqXEczgGkvOYYqOk7J
        fQS5miCPN4UP8GH4CucG0pCQkA==
X-Google-Smtp-Source: APBJJlGT7g82L+Hkwe8xj95tuxpUpxZWcf2IaXzPx9bPpdXMBveogBFlZKgmneiMXJunYel+lZG4Rg==
X-Received: by 2002:a05:6512:2015:b0:4fd:c923:db5e with SMTP id a21-20020a056512201500b004fdc923db5emr2682237lfb.21.1689879618531;
        Thu, 20 Jul 2023 12:00:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s22-20020aa7d796000000b0051e2a5d9290sm1104842edq.77.2023.07.20.12.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:00:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Artur Weber <aweber.kernel@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] ARM: dts: samsung: fix Exynos4212 Tab3 makefile entries
Date:   Thu, 20 Jul 2023 21:00:14 +0200
Message-Id: <168987960900.215967.4720344822144706929.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720141537.188869-1-krzysztof.kozlowski@linaro.org>
References: <20230720141537.188869-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 20 Jul 2023 16:15:37 +0200, Krzysztof Kozlowski wrote:
> Makefile targets are DTB, not DTS.
> 
> 

Applied, thanks!

[1/1] ARM: dts: samsung: fix Exynos4212 Tab3 makefile entries
      https://git.kernel.org/krzk/linux/c/838cf5a4377b9af926731cc68876e9c081873ea6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
