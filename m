Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D805AC05027
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 29 Jan 2023 10:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbjA2Kkr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 29 Jan 2023 05:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjA2Kkr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 29 Jan 2023 05:40:47 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C71212AC
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 02:40:45 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h16so8599770wrz.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 29 Jan 2023 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKh+XybqNbJwTS+RVODYj3gQs42RNsq1kxtqGoR4Kjk=;
        b=TDnhKPPsYH68DdPdxnsqSr8n2hNmvFXcfEVfz3DRssMOaF1ISTuReRrEw0vxsvr2JS
         QXA48RrhxZuBSBI1o3SchuI6LsmRZVnke1HqdIn0Z7En2J+FBoPKeF4JcZquIZGUzLEC
         lIlMIBv+hVLzyDeEJdUGeuzzxma3mPSJuzWm+PJw9Db2V7nYarrCQeIzyGVIqt/PzVrv
         cenwFGpTCk9C9+uuZq/emINhDuabB9r4zNvOzSYQUzLxMbNAInKLVhaKVSlDirmYE1KQ
         ENtjpbASmu2zAK//iJ9i2Xjgfv5JtiFMAilSyWVqySPuTz1O+/U92/s3ceH4yKziOaOg
         muiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKh+XybqNbJwTS+RVODYj3gQs42RNsq1kxtqGoR4Kjk=;
        b=ch7yLh6q4HjvgnyBd4sjXwiJzsaiBOIaQcipuz9EbxiE+LD82Vx1kbOOHetg93rVM9
         rmVyVx0Ng5BoNXK2l+FM5woIJr/MSG6Ug5cvt8zygpWOckKbWFSO+TCpsGro1y/Q00rA
         hORHP+oJR0F21A1D1d9A1opEgpjMCJzwuIY6sR1+DBdaTJ9BxRFiQ6HO2+P1o+UXA4Of
         FemKLxw4kZK3f7rQbcH+/1ZWr3PyU9eruCQlOUQ/XkdF9WVijDyAT1jJYeq1D2/cnrfb
         VDorXRpXAsDK3jNiV2O6D/z5vsvmavvtWWYF9TxwdrcTE2N+/foL8oNabrknGHOd2OcA
         bKcQ==
X-Gm-Message-State: AO0yUKXXC+n934UA2ILJc6Lw5D2Ba03wj9Q+hjHaB0IvOedc36U+66d8
        /pf5dZ2f6hpz+EzMt1Gc4dtJOA==
X-Google-Smtp-Source: AK7set8aaEjSgjREY25nSXIG/U6o5JXvwCrhED8l4ohr7GN6TUNZeYgiRV5y6JEEVt4naNnwzQSrZg==
X-Received: by 2002:adf:eb04:0:b0:2bf:bc75:1730 with SMTP id s4-20020adfeb04000000b002bfbc751730mr12200577wrn.70.1674988844225;
        Sun, 29 Jan 2023 02:40:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a056000180200b002bfb5618ee7sm8803443wrh.91.2023.01.29.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 02:40:43 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     replicant@osuosl.org, ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        phone-devel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
Subject: Re: (subset) [PATCH 1/8] dt-bindings: soc: samsung: exynos-pmu: allow phys as child
Date:   Sun, 29 Jan 2023 11:40:39 +0100
Message-Id: <167498882911.7239.17446486264996020803.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-2-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org> <20230127194057.186458-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 27 Jan 2023 20:40:50 +0100, Krzysztof Kozlowski wrote:
> The MIPI and DisplayPort phys are actually part of the Power Management
> Unit system controller, thus allow them as its children, instead of
> specifying as separate device nodes with syscon phandle.
> 
> 

Applied, thanks!

[1/8] dt-bindings: soc: samsung: exynos-pmu: allow phys as child
      https://git.kernel.org/krzk/linux/c/fe6a952b567f6a771d087d2e969914f31574d6ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
