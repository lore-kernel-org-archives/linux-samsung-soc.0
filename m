Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5597EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 12 Feb 2022 16:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237298AbiBLQbu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 12 Feb 2022 11:31:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiBLQbt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Feb 2022 11:31:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B202C20E
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:31:45 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE5483F4B4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644683503;
        bh=8Lhf7r5GEcQMqlZAoHA91Tt/jKDSvbsuMxA0NCPyhiA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=sivynLE25EijRoVmirwHj6XKP9KQ+CGld4jJjMWMIjwc/tDQeiZ2Lcs2YfaGHl3Oj
         8I4zSmhHo/K+IL/cnCFqCCXn9V5GQ7avQPsOilG9Eqd86MlibuIZIjKpb2mkK3LwaF
         6ziPdIHBkkfdIh6m7Pn4ZTxkrDApsQ6EnqvsJ5Ce4MStJKTKV2MyQvOeIoMyoIXbX7
         h/GqOGEICsCcdc+XSCJVe0MgsCziFlElFzZaYH1OrItkum4EnbcowDM9528op4a1rR
         3WLShrcFLOeyG/94lRmm+uu0/q4JTSs8pJOxXAhytVQgnKOm7fYBM2TFNw50el/C1p
         4Gh709kwUHWbg==
Received: by mail-ed1-f71.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso7349789edb.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Lhf7r5GEcQMqlZAoHA91Tt/jKDSvbsuMxA0NCPyhiA=;
        b=dEvy4hYo+40N16JzccQekt9zmAp39gzC3LblqnAYvPwPRfQK1K/L7rWPP2813oKqb+
         okp+7NErBkFHa+HNyeMMsW5xtUnOpPqGoMyZfq0uTp8lzQgwoU7MgGR+indNU8u1q0Ue
         JmBl9BnM5y92ZRydntFTep3uBjaFF1JyBr9nbmm1dHsBefsG5tIX2DiLtHJcx01Vv2qA
         DUEqTxDKSfbzIIuCfzF7wU06uVZMMJKoDBWeozHNR5JlRhriO1b2IU4AB2d5Z5PhidVG
         hIUU3zNl/oGaQbnCRHweFW5Nsdm8jqwCQF5D8acXeS0Vu9G/zyI+TggIjbIhhiFYbBx3
         /Idw==
X-Gm-Message-State: AOAM533bVnbCHVzM1ZxEcMJQEFnXk1o9Mf3itJtO6rTcAr6JdckufTSB
        11NCb9FajHdeygZ77gzVnuUB/+2owJQ4iIl3wdrx0Xz6k+F/p8sT6yVEtKrM6Ytx/ObU/+vlUld
        mGphjvFlaWrxrUL7RfMrHCnjb1z4oBf6E0VJxemipuYLF8rUE
X-Received: by 2002:a05:6402:b9c:: with SMTP id cf28mr7316745edb.295.1644683503674;
        Sat, 12 Feb 2022 08:31:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPLJ7SWTPKzXbJuCVaehwlh0yiOX7PnxNdHbnZKzKFslpm8C19hbTGaOtSxRwZ5jyH8Kbndg==
X-Received: by 2002:a05:6402:b9c:: with SMTP id cf28mr7316732edb.295.1644683503542;
        Sat, 12 Feb 2022 08:31:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h6sm4472412ede.50.2022.02.12.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 08:31:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-kernel@vger.kernel.org,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: (subset) [RFT][PATCH 3/3] arm64: dts: exynos: drop incorrectly placed wakeup interrupts in Exynos850
Date:   Sat, 12 Feb 2022 17:31:40 +0100
Message-Id: <164468346864.47019.15604871002670498638.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211230195325.328220-3-krzysztof.kozlowski@canonical.com>
References: <20211230195325.328220-1-krzysztof.kozlowski@canonical.com> <20211230195325.328220-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 30 Dec 2021 20:53:25 +0100, Krzysztof Kozlowski wrote:
> The pin controller device node is expected to have one (optional)
> interrupt.  Its pin banks capable of external interrupts, should define
> interrupts for each pin, unless a muxed interrupt is used.
> 
> Exynos850 defined the second part - interrupt for each pin in wake-up
> pin controller - but also added these interrupts in main device node,
> which is not correct.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: exynos: drop incorrectly placed wakeup interrupts in Exynos850
      commit: daeb1c2b50fb98118d6318b5fdbd9ef9bdfaeaf5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
