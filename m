Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD01E7542D
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 Oct 2023 06:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjJCG0N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 Oct 2023 02:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjJCG0M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2023 02:26:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5916D3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Oct 2023 23:26:06 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso82612566b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Oct 2023 23:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696314365; x=1696919165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpS0UjnQn4LpsaH9tdfp1iFcJqkQDO4RglvyM1YPFtI=;
        b=xiGumAW3xmFlWoFkpjvTuPTKmgb5sgbc8N5NQA3OTEGk9BV1zkri/Bnptg8CZ6EEFi
         RBOsf9XB1TRvq9pChU/0oAg0Tw/8i+EBM7xYVCt2H9aWkdA7KtEQXPX7+6GVuJuOS2yH
         anW1GFp8xkzhiX2gbMqjYJ7TkvLqdCpDO0x68GV+VWm8GQDBhqf1J7Hpe1RIEp6VjgxD
         EgC6jcWta5AdB3R9LyFa2KZyIgOXBHUk4PIj4j8qr/3NpxYeNu2jnp0rVVynkqz+e9Dh
         w7e4uXhAqypNvpjLKPlcxvGiBprkrOVKcF8O3g3B3klLyWlk+2uV7vInbkHRnYvoGKVk
         2fDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696314365; x=1696919165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpS0UjnQn4LpsaH9tdfp1iFcJqkQDO4RglvyM1YPFtI=;
        b=ISoBLfIqG1VwwxEHJ7lOt76EEWs4GJ9TIPyN46ySSKx+W2e2tC6PHToM6uFxos8p11
         2SSotKsPlpnkoz+LOod9wqJyrhRP3+wq2RgzObyBxWjsUACm8tHwZ+EAcNQATBRNTVCv
         6oep1ClLd9fr9Xcg/dLXFsaBUN+EAqYYtOKYYZULA7EEGsZdurIz2lDOZ9qWDUjEHcgc
         H8oSRrT8jGWUzPbDyllO4tVc5PXTIsFi95PMPT1TQMRMwWV2DgUmX/KU6wvoe1F9hF4h
         9CM3Iw5U6ardFGusCvq5WstO6ZpuFxehPNoRuxIFzmQnAcBHQykcp7f6wHSqjm8ATVVk
         QShw==
X-Gm-Message-State: AOJu0Yz6oMTrMsYUjY/ZYsmMOt+Njs2sf/5TlAzT66mxOSwS5YGT4TsX
        MrIxRtR3qw+WEZ5PbZfHmcGgI5sZHC5dVyYHvlFtpJH3
X-Google-Smtp-Source: AGHT+IFlqEHZlus//yMXO/jEnT8nr5OXXZbTLmgoM5w5p7gLAWcrjmd3afzTBjhwDDKvdYW62oBYGg==
X-Received: by 2002:a17:906:3299:b0:9ae:5ba3:9d8f with SMTP id 25-20020a170906329900b009ae5ba39d8fmr12608156ejw.17.1696314365210;
        Mon, 02 Oct 2023 23:26:05 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id fy17-20020a170906b7d100b009adca8ada31sm487583ejb.12.2023.10.02.23.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 23:26:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: make Exynos related PHYs modules
Date:   Tue,  3 Oct 2023 08:26:00 +0200
Message-Id: <169631435596.9647.13620091747493268304.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929121800.1722211-1-m.szyprowski@samsung.com>
References: <CGME20230929121805eucas1p18f8ad323c1243684436ae831f4cc563c@eucas1p1.samsung.com> <20230929121800.1722211-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 29 Sep 2023 14:18:00 +0200, Marek Szyprowski wrote:
> Exynos Display Port PHY and Exynos MIPI Video PHY drivers are not
> essential to boot on the Exynos based system, so make them modules
> instead of build-in.
> 
> 

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: make Exynos related PHYs modules
      https://git.kernel.org/krzk/linux/c/0264be0ac4069530a6fd10dc22f40d3bae343b24

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
