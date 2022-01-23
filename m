Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B477CC43219
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 17:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239166AbiAWRKv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 12:10:51 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43106
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239143AbiAWRKq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 12:10:46 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 152E440051
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642957845;
        bh=CZnbftvymvuP1q3lGZEsnRQ2BDlI+Mk2wJMOXZ8zt6U=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=lyKZdwptPYE7q5Op/YXYF+V27WqLBqmW3JuHb0nr7NR862teLhHoo22GG3LJb/AZn
         1La6rYTPoD7FW7pTAxT/zviIx2vgdlKsYZPrfNWVn/zKO284qkfMes6ynU9FPWzObM
         BZvkNRngqFKRrHIQtgShl+MbwBnFuU+7zOuUOPmzs49ijft0wesEFTCvosVoz8DOYI
         Lq7JkRLqoJd61SEBEIEU/lcGsazXRNCPQI5Y9zH9TdzICnBqseBDuFa+Vyg2qGpYoJ
         vTC7NBst2zBlQsDSBI9vskt+Dmo0z9/L31uy+3kouXMQzMi8zI9n2QSiJEGZJ4bwW/
         /S8xwQuRATMsg==
Received: by mail-ed1-f71.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso10442887edb.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 09:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CZnbftvymvuP1q3lGZEsnRQ2BDlI+Mk2wJMOXZ8zt6U=;
        b=39nXuw6scIcVzRMC6mwg/Xlm6B91xMf/5ZbSRjkDf3eBjy0OtSBQfwI7EW4GvUhJ5b
         dt5+0HFzmrjXNJKwofmYJFq4VbmSEapfPbBRG9a+H1kRYoeupmCwMnzb+R5raZWJFaH+
         laRV3VtC/EZg/bk7WEuYI+jM66r2IoCxj/20x5dWB7vY8rD8WQmunGyPZcWbZ3Rk5kAF
         k3Dd2JssVwM18VH7+I5SBtMLT6Fn43REj9xSI74oVsk9h7cPVvcs0wvMGrKnjKNQQIYt
         d7f4X/D0SQ6IUvLfcEMAjgm2/A0o7A3uvveLhgGNjVirGOL5CfsyvLfGYSaehNRAJPHU
         xJNg==
X-Gm-Message-State: AOAM531hsW+5WwLMaNlVhK896ZQX012rIvB7qujybK6nLJiGTvjG1owo
        VRGhUWB6d8g108FlDyALbgK8yUBsnRVj9ckVCbqZR5J0Xt4uxQtj4cdNLNsQvPHIY0nC81ukpU7
        VG1wr+eLbmmy5Z0w1+oIT80YGQS/ya8lhmcj2mhXu45E7KSHe
X-Received: by 2002:a17:906:6a81:: with SMTP id p1mr9514638ejr.379.1642957844828;
        Sun, 23 Jan 2022 09:10:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+nJ5WREK9LKclmPPHtd3xIWumFe6W3mBEhOYrTUeoyk6BgVmPqiVeHq2VMH9reyQgkB13CA==
X-Received: by 2002:a17:906:6a81:: with SMTP id p1mr9514624ejr.379.1642957844691;
        Sun, 23 Jan 2022 09:10:44 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l2sm5208665eds.28.2022.01.23.09.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 09:10:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/5] arm64: dts: exynos: Align MAX77843 nodes with dtschema on TM2
Date:   Sun, 23 Jan 2022 18:10:37 +0100
Message-Id: <164295777264.25838.6451252879069426520.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111174805.223732-2-krzysztof.kozlowski@canonical.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com> <20220111174805.223732-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 11 Jan 2022 18:48:01 +0100, Krzysztof Kozlowski wrote:
> The newly introduced dtschema for MAX77843 MUIC require the children to
> have proper naming and a port@0 property.
> 
> This should not have actual impact on MFD children driver binding,
> because the max77843 MFD driver uses compatibles.  The port@0 is
> disabled to avoid any impact.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: exynos: Align MAX77843 nodes with dtschema on TM2
      commit: 7638d3c945beb6c781acf5dd0a78e04c76f1c32f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
