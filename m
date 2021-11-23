Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE29C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Nov 2021 08:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhKWIkV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Nov 2021 03:40:21 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33052
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230176AbhKWIkU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 03:40:20 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 496D03F1BF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Nov 2021 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637656632;
        bh=COz8Xt5iyR6b2fbCfQiCZFl6eUlmeAm2S/sJlzQf8ME=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=bDwxxcolN8F1AdapjCIvtS8fgDxluK4WBRQPl97/UWUpdKtfiRp8wnxIyZKV3qD0O
         OlvoXWn+to/PZKNonHQl9lAb7rio5G0TngPox3FZNJo9xplDJlEN69oV4t7Fp0nPxE
         CsV9Li9nRWETbFwJl6OSKoOuzsDWkf6PBTU+hmxQc9ljJ8sdBPirqP/SSIilVOeINe
         hCdDIntQjkcK2jfigCgk04ZiJvbOXabOEHAfPnGes2ymTVDS39CMgb7YwB1fc3O47T
         3I5Li0VLI06ed3jPwtM07Lg/uecPCTU0+hjquW4z6UW5t7sOVy6kpi1W+wGQmpBt/7
         6nHK0sWiPbOEA==
Received: by mail-lj1-f199.google.com with SMTP id g19-20020a2eb5d3000000b00219f21cb32bso878080ljn.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Nov 2021 00:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COz8Xt5iyR6b2fbCfQiCZFl6eUlmeAm2S/sJlzQf8ME=;
        b=NhAWJF/w3hmcXUPW/AOhoyABPhCIZhuJo7SS19qJizUy0quIzhnliQwecCBowQ5eSM
         u97u/Zb2DO8CGhX7xXJWnobwERtg5RKaAJD/4gj3ecjO2cFl+e8qf6XHFF1jiffk1JO5
         Qi+c8kuyd3AyxXtMV3htJnt0D5osOpXBXt3Uxrm7GmlL7gyuAdRssoB6Kk+Y8JKGUhSd
         mbzZGj3ahs7bOAPhTjuRM0rnoNlm9G+JqscjnZPfDRas1OY3ebCuriLKBmvF+jcrwAxN
         a9YY1zcPIqUIDPkBF/jnQGAAR+r9nNpG5QrYV+cCPb8vqtdF7Sm5qADU9nRMUFMN9Z8s
         toVg==
X-Gm-Message-State: AOAM532ZvyWXlekCtkUe1aDU7dOcBbrtUJOCA9yJMxSjDq1dejUyTbgR
        B5OUzBrpR9yXaW+qvfxVy2nIM5ryokCA+FDKEKta1JVP0LXgeNFE6vq9NsRtAE9Udg1z4xGB8SP
        3OF80QORP+EJWaV18uMmBXMFh3oxrn8C6PABjyrxowOw0NX1I
X-Received: by 2002:a19:6752:: with SMTP id e18mr3052885lfj.195.1637656631751;
        Tue, 23 Nov 2021 00:37:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbTmlTJExHRzGjXz7RgsWigueTPgxob7fbleonTy2RgKaGipXnBNDBGRNeCgrAxkc2Kr1DIQ==
X-Received: by 2002:a19:6752:: with SMTP id e18mr3052859lfj.195.1637656631554;
        Tue, 23 Nov 2021 00:37:11 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l16sm1402483lfg.90.2021.11.23.00.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 00:37:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        David Virag <virag.david003@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH -next] pinctrl: samsung: Make symbol 'exynos7885_pin_ctrl' static
Date:   Tue, 23 Nov 2021 09:37:09 +0100
Message-Id: <163765662601.91709.15516222234511579630.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211123083617.2366756-1-weiyongjun1@huawei.com>
References: <20211123083617.2366756-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 23 Nov 2021 08:36:17 +0000, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/pinctrl/samsung/pinctrl-exynos-arm64.c:490:31: warning:
>  symbol 'exynos7885_pin_ctrl' was not declared. Should it be static?
> 
> This symbol is not used outside of pinctrl-exynos-arm64.c, so marks
> it static.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Make symbol 'exynos7885_pin_ctrl' static
      commit: 16dd3bb5c190654854c0846ee433076139f71c6a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
