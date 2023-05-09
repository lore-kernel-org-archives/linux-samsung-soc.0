Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304ABC7EE23
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 May 2023 18:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235111AbjEISKD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 May 2023 14:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbjEISJv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 May 2023 14:09:51 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463C25278
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 May 2023 11:09:49 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50bcb4a81ceso11262344a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 May 2023 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683655787; x=1686247787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTAOCVPOPtOy5y17r+mtI5VSueoAcoLIpQdMbfiTcg8=;
        b=D1PFvAm7SlYpPsPFpbjzQy80gA8ralWcfpyiMeU/EMEfyrmde5hbToU9wgYycOcF5v
         YAGOBiJA9kXiZKh8/GLzZg7upeXk909wM4m461AZhHh7bb2RhFQ8yBduQ0nJJ4Nq/o2K
         RJBJUS6ydoWHlz9PeO/s9mEkytwTeKthMGp9hCNp8d2M6W/gi66naI1GvRJq+QY4uGz3
         ajzSsfVMOtdHHDtZEvJR4ZoDkE3zvfXq1G47DUgEzDOobj7be99w7fHB6KSl80Yqzuw4
         Bzc8ItdSUVWIHCFNGojsGVJQUzgptt6T3EG/wu3hWZwAytyZn5TQuhJcJP6Fph8ngztz
         7J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655787; x=1686247787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTAOCVPOPtOy5y17r+mtI5VSueoAcoLIpQdMbfiTcg8=;
        b=DFrCaivsLChvo1+r+F5VO5z7sHGQZ7ORcih3xo2lkaDWShknLSYVt4t1PMTFS56Oei
         LhGLCcTCWlJgBpjDpyTs9lcsWcbePpXlO4Yev/l9ew5WvnTizRZouQh0Lpo8U6eVITO3
         n0B5qyHu3XMAso+0Fbw0v/aUEvys5TNS+NsPd8y8DFXfV2H5MBDIrLMsyOtLQxfZsEqr
         t8WFxsleuJ/T553tYuQ34dkpZ+LPkoElliE4pCx8qe0/a6qbKkf7ctY8TtNNJnlsJcZG
         x4zCvINQZrKpFntbXS3TCoBoiFOhBVRoO2bB9Q1pwKu57dkBIzqlAGL0NwNb23rfbbMK
         08rg==
X-Gm-Message-State: AC+VfDz8bgqjTbJ3HkPYUoSHu1TTzEjyh5ACTBFyk2/pzhug1Rlpsgck
        3/CFDDEt9JvdJpcs4jIGIVcRyQ==
X-Google-Smtp-Source: ACHHUZ5hovFjTjykdEntWpkRkWy8gjb9Ub7wb8Lh4BgtsqFJo3AnBC7o0FPzHT4uW5ImOYI0KpKMUA==
X-Received: by 2002:a05:6402:10d7:b0:50d:bb87:247c with SMTP id p23-20020a05640210d700b0050dbb87247cmr2359508edu.1.1683655787536;
        Tue, 09 May 2023 11:09:47 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id dy28-20020a05640231fc00b0050d8b5757d1sm1015286edb.54.2023.05.09.11.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:09:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v3 05/13] clk: samsung: Add Exynos4212 compatible to CLKOUT driver
Date:   Tue,  9 May 2023 20:09:32 +0200
Message-Id: <168365575565.242810.6906601762854965924.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501195525.6268-6-aweber.kernel@gmail.com>
References: <20230501195525.6268-1-aweber.kernel@gmail.com> <20230501195525.6268-6-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Mon, 01 May 2023 21:55:17 +0200, Artur Weber wrote:
> Support for the Exynos4212 SoC was originally dropped as there were
> no boards using it. We will be adding a device that uses it, so add
> it back.
> 
> This reverts commit d5cd103b06f9d766295d18798de484528eb120ea.
> 
> 
> [...]

Applied, thanks!

[05/13] clk: samsung: Add Exynos4212 compatible to CLKOUT driver
        https://git.kernel.org/krzk/linux/c/48b359732e166d0f5d53649e21eac8d9343b8e13

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
