Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A60C77B7D
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 May 2023 18:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjEMSuY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 13 May 2023 14:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbjEMSuX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 May 2023 14:50:23 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690F8DC
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 11:50:22 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so99260363a12.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 11:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684003821; x=1686595821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPztQ4ysSm8CI2wA0uE15k28FITvSfHGliPiFsdgAxY=;
        b=GFxiA3x12RZw7/KFiB77zyI6i+oO28ferVOUkRzQBkN2czSkTeEvp2OJUxcKqgygC9
         tMuOl07beoP9i7edYYURBQA6Z7mSpDas1PqwdL+c8OTLko/Oqp0KzbOojmnGS41A8qZA
         FB1ZzddNAANqCzbqWrbobWl6e/ZxYnJvNCs4PHqK0KfEQEod2mDkUSVAiZOIPXsc8K/h
         OWa+G84b/9leETthM4DJWkc8zL9DerqpLS5pxD6p6OFVfWp0YiqyX/Z/9VoS1lZNY3/P
         b1+OrHISjkBWx3X1ywYgpYOlmJWPCAJ12Z5Tw2QAJIejozSUaVF8qXVhpmScHYfWdg9w
         h9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684003821; x=1686595821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPztQ4ysSm8CI2wA0uE15k28FITvSfHGliPiFsdgAxY=;
        b=WGDbmeLVt/z/AIud9+L2kEHFbpgyDbraQBeSF+/h0gNzK1gUG5KRvZncVsHT/7XDNZ
         K7LvwpMk3S+Gcz0j1QCx9nPJ7q7RFsH1gfVQnkFadjufGOPwkBFDba8clnaa9v+O32P6
         b0YxZLcwyfK48R6qOKWiWT2fHxbWsK+wcmJpCeZMY4ydTJIR5CSZwUUJmGNLxDvhXqVQ
         Mh2TnugCkMJi+LSLPVncnvAFUn1mVLhKFyc7A9R2jTNnQGuHlf5XbzddN5jYwqAhSLLy
         U2rLxTvDARpLZdgBSe0m3Bd4iELuJuZOmLR+LQDHucic+21/3kPTdJcf0jpB8KXLYse0
         GU5Q==
X-Gm-Message-State: AC+VfDyq4HYE3fE9uKxCPaicE1/KhBwKdyETrMcCkT3h9bOWsExnCiNe
        zHmhl+K36wdsLKlqqt8BNrR8Bw==
X-Google-Smtp-Source: ACHHUZ7cM/4sDDsWPTlMqC7K237m8lTf25p1JBv3zCY6hwb7iFthgLMbZuJHxqnpO7F/CzUvjQexCg==
X-Received: by 2002:a17:906:5d13:b0:960:6263:138f with SMTP id g19-20020a1709065d1300b009606263138fmr27091674ejt.27.1684003820858;
        Sat, 13 May 2023 11:50:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id n12-20020a1709065dac00b009663cf5dc2fsm7122023ejv.66.2023.05.13.11.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:50:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 7/7] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
Date:   Sat, 13 May 2023 20:50:18 +0200
Message-Id: <168400381592.12030.10842902628648015143.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308233822.31180-8-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org> <20230308233822.31180-8-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Wed, 08 Mar 2023 17:38:22 -0600, Sam Protsenko wrote:
> As described in the corresponding binding documentation for
> "samsung,exynos850-pmu", the "clocks" property should be used for
> specifying CLKOUT mux inputs. Therefore, the clock provided to exynos850
> pmu_system_controller is incorrect and should be removed. Instead of
> making syscon regmap keep that clock running for PMU accesses, it should
> be made always running in the clock driver, because the kernel is not
> the only software accessing PMU registers on Exynos850 platform.
> 
> [...]

Applied, thanks!

[7/7] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
      https://git.kernel.org/krzk/linux/c/858fd147234dbb66401bc102968a479f92e7ad43

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
