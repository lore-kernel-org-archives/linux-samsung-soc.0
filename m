Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7568BC00140
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 24 Aug 2022 13:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238046AbiHXNMS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 24 Aug 2022 09:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238026AbiHXNMR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 09:12:17 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BE7220DF
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2022 06:12:12 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n15so2857017lfe.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2022 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=r+ASC3oRaNs40i1Zi0sR0tnL7ZgVnCM0wgXLHL0rIow=;
        b=z66l8KV/M2ajnf+BKwBbC2pfnne8mNrvln8Edj/p8+WH8xvpRh83bB4lfw5csZkOGA
         dJf5dGm0pqzUIw+WUcC3WbKw0nx4eFIKUsQ2fUSLunE1QigLbjXsnrLeVKnrWq/XHVEc
         Zl9cJCaeyUSfJCtJfvq4Cvqv/+MBzYXhWeWsasTH0sfqBtujxI906nNgulGnD7gkg4D5
         09N2yvcmYLdqXKqtMRoZ3IXgvEhgQSauqTTQy/pqi0tX5u8og6iACqgMlrCZru6JO1Cv
         wn/8NL4smIoUWMBwa5ogYxm+apnxbizeyBAT/sGtXzcaPxLTIVwMDyowwH1qHxxIcn6m
         h+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=r+ASC3oRaNs40i1Zi0sR0tnL7ZgVnCM0wgXLHL0rIow=;
        b=gPIrziED40MnW1kQs2ZF6jbnNl/4aGf2zlpeweT+ymdekCPc1KFDRqxTPb1Z7hje42
         nYxWW7xutzlO4Y9PlzzkFCjwNQmbt3ZKk9g2WdxFKys+oTe4A1MONeXLhVgabvfHJeOO
         WMiKO5p00GtDK8ZrxE9bkhCnXYMMyzTQamWVpd5pGyjxWRHYi1ouVvUqF7y6asoN8uXD
         Vp4WZwUpwIFZFGj/ZMQflcvGoWHO8K7SKZjKq9+C9rUnTWKHPv8KuOQVRPenDkY4ljwE
         GLz8VeAQMYuQ/zk2eegzJEeDl8IxJZWyNdNgmRDWw3cecZ8TIOM7o1rnwCOFG34tX8Oj
         wt0Q==
X-Gm-Message-State: ACgBeo2HfUzNnv+bzUD2R2fdooYml8bzuQ1X2peKQeTDPjGIXLPiK/ig
        y9pAFhCEOUqioISY09r3xNLdLg==
X-Google-Smtp-Source: AA6agR69XSYfJplsCoH90jpaWGzP3LcQMrKD5PQUFuRSK50NVKpyjOuIvqcqBdr6NfAuT8UOI7UMDQ==
X-Received: by 2002:ac2:4d29:0:b0:492:e965:b6aa with SMTP id h9-20020ac24d29000000b00492e965b6aamr4111277lfk.495.1661346730825;
        Wed, 24 Aug 2022 06:12:10 -0700 (PDT)
Received: from krzk-bin.. ([194.204.13.210])
        by smtp.gmail.com with ESMTPSA id w17-20020ac25991000000b00477c0365b20sm3013046lfn.188.2022.08.24.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 06:12:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     sboyd@kernel.org, cw00.choi@samsung.com, tomasz.figa@gmail.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        s.nawrocki@samsung.com, mturquette@baylibre.com,
        alim.akhtar@samsung.com, linux-clk@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] clk: samsung: MAINTAINERS: add Krzysztof Kozlowski
Date:   Wed, 24 Aug 2022 16:11:26 +0300
Message-Id: <166134667696.17579.16496249801589294435.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823073154.359090-1-krzysztof.kozlowski@linaro.org>
References: <20220823073154.359090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 23 Aug 2022 10:31:54 +0300, Krzysztof Kozlowski wrote:
> Add Krzysztof Kozlowski (already Samsung SoC maintainer) as Samsung SoC
> clock maintainer to handle the patches.
> 
> 

Applied, thanks!

[1/1] clk: samsung: MAINTAINERS: add Krzysztof Kozlowski
      https://git.kernel.org/krzk/linux/c/ef96c458888fa2a329b14efc7991530f645fbddb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
