Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9ECC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44E8661439
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhI2OCT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Sep 2021 10:02:19 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51314
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244721AbhI2OCS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Sep 2021 10:02:18 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3F93E40293
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Sep 2021 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632924037;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=K6hx4/MlybAigm6+naCREZIJEvectP0NFoxkTFVG4AZ7ak2MsrpSNhIRmJ6pBldhA
         4Yr3RLcIajoXR+V4+oLJmPy/ZT3n/6j0UIdOLGdXR9G956kXYlbDsfOXu5hVHr6ilW
         B2E5vQg899MfDVJvdpVPvfjMUwuiLMNhPrqCG/4diO2wEMu0nPBG399mjQz3xyP2Ke
         fGwR7Q58sMfZ7iVL0xuq87gDpHitoRMikM3fahuEANd87NOwP8Qpw7neAMoAsdAsZ3
         /pYf8IzHDegNwiogXWbIcaNvmWvIJmYQWMugc1JKzXcP+vRK6cIzvjM+X3okSzeKYG
         SGjf3jlCxV22w==
Received: by mail-lf1-f72.google.com with SMTP id m2-20020ac24ac2000000b003f524eae63eso2482616lfp.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Sep 2021 07:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        b=4zUt5+bNQuuuhZPXvR/x8yMIckZkApd39h4cRdLIgiYL52uOLPe4Ldajr214ykeM/j
         l2z6vxEW0mttclr+RkRyIg6qvO0X/ofc9rK777+kBZJDRk+G1HQW8oKYnAW/quCTvZjp
         sdeuTE5/ENiByfuXF2GrQmJYzo6m1rYh2qVZw5yJ/Or1/oq+4oG7Bq65nvUbOg94ufXE
         zir90mapVlVmzHYXribCFQQoJhIEEQkhe20gBVHoKCeSrz6hqwd3THCVrgEoXw66F45A
         2RLlGEMn61LkxO7np5urQkPVECLQjHqZjFcWP9HcM+4DtXDv3EJC2A28BUawrp5m9eWo
         LbzQ==
X-Gm-Message-State: AOAM530teCZJnJ9RdRgX4a61/P6tipuaPHWWawwxhhz6ITsadlYZr9e7
        /9m/hC9t9MTk1UigiMMK1hEzAyMX9uSe7CaexahOVTIthPg0oiI5mdvlNQ75QNXfGjUa6u3lNE3
        fGVanAvSXeRInb1g5EmOdFHtTD01th++QcCyjTiH6KRf+86T3
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61858ljm.474.1632924036481;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKt5l2t81qxHBKi3o/CZN3L1oKUtNTtom/CYUokyE0JkQifqqKnv7EtIY4e4dm53UQ6EHscA==
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61835ljm.474.1632924036320;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id t135sm252900lff.203.2021.09.29.07.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:00:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Will Deacon <will@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will McVicker <willmcvicker@google.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
Date:   Wed, 29 Sep 2021 15:58:49 +0200
Message-Id: <163292392314.29281.7860159491587813094.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928235635.1348330-2-willmcvicker@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com> <20210928235635.1348330-2-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 28 Sep 2021 23:56:18 +0000, Will McVicker wrote:
> Now that EXYNOS_CHIPID can be a module and is enabled by default via
> ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
> remove that.
> 
> 

Applied, thanks!

[01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
        commit: 6ad4185220e6e3b7ebac7c7a5f55197aedd000da

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
