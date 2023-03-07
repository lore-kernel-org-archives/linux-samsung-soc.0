Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E965C678D4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Mar 2023 07:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjCGHrt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Mar 2023 02:47:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjCGHrs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Mar 2023 02:47:48 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6993D92F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 23:47:47 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id g3so48853519eda.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 23:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678175266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3DhLATozJtMgPvFoqUY3SKZwNKda35qxdXt7pVBes0=;
        b=AgOVd2Jshcd1P7nVmgyija6vx3o4lu2Tdx2fffUGqAq3MYn+VgEEfYyq2Whc1krruW
         Ln1eakWHebJ0xe9w9thitxiPhbglfl/+FiRGEyo/MCCJnxT2g6izAsD8L7lAysP1uB4V
         i6K7Y0x8DHKld88eP/aSJX3esPf7J974Rdqdf2cvpBqn09v6yFs9lIwrb+QKjfrH6m70
         0NclLOuens30RbfFu5CSnZgOjl61uecmgNbfJmzy1jhg/A82nc/4WIjwQ2zuJEBymP7R
         UfzAdP/oixccp/fq54xXc4E0TetwJmYI7kJKEhKM+2sbXvwHvS3llimIj2NIF9SCx3qA
         AHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678175266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3DhLATozJtMgPvFoqUY3SKZwNKda35qxdXt7pVBes0=;
        b=KpZhLkJldJkZwXGCUQY4f3ex6oVcrokHXWf2ZgiUBOVzCWAm9zMSuj1LfyDkzurGl7
         WtEfpN/pLJTZ9hFDQOAAZ2m+bknVbiyosR35FNIrpCTGtEH1g4XHl3+zi9Ccw5JkaRl5
         KyMyrQsw9zxa68FBcO7hKe46iNHL8XwzNVreM97M4jzHUM+RY4Kub8Ni96oszMkUE1Wn
         D4T1Zz0Xi+SsdN/xMR4kFvs4GBL/ZrrD80kIwZp1+Q9RZr7rpvRRJtCZRWuGBkmcyybW
         kBqvPZr1Pib7U3X2IJA33UlWcVLXowiChF4r5LW+2dzhIEivohWuy7jD2M3ZSn7Xz8II
         QfCQ==
X-Gm-Message-State: AO0yUKUtQSVyWYHw6AroiM/rFdX9S9ZvTf8vdn77ujGa5Zec5XqMc2AS
        jGcPFd0DOU970xlk0iLM5li89A==
X-Google-Smtp-Source: AK7set9DV8c6V+0UvF/rPKB+JoZu2W8Fux9M3UTl8ASI9Ub72eM9wV6VrNXRM1/ge4sXzaw7R1WJpg==
X-Received: by 2002:a17:907:a4c:b0:8b1:3d15:1e2c with SMTP id be12-20020a1709070a4c00b008b13d151e2cmr17935319ejc.9.1678175266708;
        Mon, 06 Mar 2023 23:47:46 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id bl15-20020a170906c24f00b008d83ad86fe8sm5672808ejb.59.2023.03.06.23.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:47:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        David Virag <virag.david003@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] clk: samsung: Add PM support for ARM64 Exynos chips
Date:   Tue,  7 Mar 2023 08:47:42 +0100
Message-Id: <167817525834.15038.16744450666463613247.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307002423.24454-1-semen.protsenko@linaro.org>
References: <20230307002423.24454-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Mar 2023 18:24:20 -0600, Sam Protsenko wrote:
> In order to prepare for PM enablement in clk-exynos850, common PM code
> was extracted from clk-exynos5433 to clk-exynos-arm64. Also some related
> cleanups were done prior to that. More specifically:
> 
>   - patches #1..2: cleanups
>   - patch #3: PM code extraction
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: Extract clocks registration to common function
      https://git.kernel.org/krzk/linux/c/bed76f697a9adda26c40ce4a064f371d54e71331
[2/3] clk: samsung: Extract parent clock enabling to common function
      https://git.kernel.org/krzk/linux/c/454e8d296ce4267ca1728bf4f6fe6d41eabe080e
[3/3] clk: samsung: exynos5433: Extract PM support to common ARM64 layer
      https://git.kernel.org/krzk/linux/c/f05dc20243163d0218bbb258b6461681865cff5c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
