Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF88C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Sep 2021 11:47:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31566619E7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Sep 2021 11:47:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350548AbhI3Lth (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Sep 2021 07:49:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41614
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350512AbhI3Lth (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Sep 2021 07:49:37 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B556740283
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633002473;
        bh=30GqHbSX7U2pH06RCxY6mnA48AnbCVjiQKTx0BVxwMQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=GF1oVo95HPyh6ET4npF5hWXNwBnHNiM7AbRwEZN4YJ8n5ePccKjlFp/Zv6z0QB1wq
         v7eWuQZITb7DrNn0140mv0ZQ9E7MDefd/nYP0xqIWJ0nc2mnFvVDrcLfeIqroQItud
         qJqInNRtzT/PWzXv5sK0uZwU69ijwCGJ7ckh++Shz2xtRriq9x4eZJYE55dCJ6v1ru
         v+5fu+rmjl5PU8z9cqbsNBfiLhBLpuAQTe0YmFM5H5Mqlzrh4sFHje2NMGSt74Fcae
         cFHQ3NxOzkbSGxOaRv9vteARB/3v1gVNdLL/uw/If20Hpc1HiLhaxhhjksxSEvAq8P
         UeItdgbDwWrIA==
Received: by mail-lf1-f72.google.com with SMTP id a28-20020a056512021c00b003f5883dcd4bso5366470lfo.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Sep 2021 04:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=30GqHbSX7U2pH06RCxY6mnA48AnbCVjiQKTx0BVxwMQ=;
        b=JSddoG7/Sdiil2baf1tgo4CwjGbV2CmDArKGejuwLooBn2vVR/vaRiNwHPZDxdSuYm
         FoS7B5chy3a6zQbX7qGzmDfyqtyGAzaPKYUMk8CDMVJakhewiUTnN8t/YROHmGeVLcH0
         Z4hlyIDRN5T9N8CZMVSgX+B/8h5bTQ0Z+9fDqzjDMmlpMEr2svUn7chQJKq52ftdmZG/
         ng/Fq0Xx3079ShXauxYhuPxPUhL8r/ulITylxQBG3rPo63Bcj+nKfwvp+OnbVrJjeSti
         IPO5elYGXA8lPl59jtjgsasN2Xwhs3Ox6LXCle6+4t37ICbymrq7r+PvI30iFjZCtqxn
         9uZA==
X-Gm-Message-State: AOAM53057G/dezUH0kncOjRxIyHCdwdm7dxppnKuWUvKl4Xu/TKkLYJj
        PVkbi21VKY9QBdUuAY0FyiwReq8TAdPoifpWuXxderAKIwn77V3LsP0KjIMfniA4aGdcsB1+uPS
        MV4eTfXuit5URN+eEjgyDr9eeIBNbpzppoUFZ4EcWa4/Wt+Vw
X-Received: by 2002:a19:7b16:: with SMTP id w22mr5325746lfc.197.1633002473156;
        Thu, 30 Sep 2021 04:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzlYjPDEr1fFxHxvIWWfISigHa9YDy7HSM5ztq/2c2pZmcQ6QQFrEh17DWNlIWhli5i28q7A==
X-Received: by 2002:a19:7b16:: with SMTP id w22mr5325730lfc.197.1633002472978;
        Thu, 30 Sep 2021 04:47:52 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id w19sm311349ljd.110.2021.09.30.04.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 04:47:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: Re: (subset) [PATCH 11/12] ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
Date:   Thu, 30 Sep 2021 13:47:15 +0200
Message-Id: <163300242600.178519.8912702221291105624.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-12-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com> <20210928084949.27939-12-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 28 Sep 2021 10:49:48 +0200, Krzysztof Kozlowski wrote:
> The S5M8767 PMIC does not require anymore a safe DVS voltage, if the DVS
> GPIO is not enabled.  Although previously bindings required providing
> this safe DVS voltage, but since commit 04f9f068a619 ("regulator:
> s5m8767: Modify parsing method of the voltage table of buck2/3/4") this
> was ignored.
> 
> 
> [...]

Applied, thanks!

[11/12] ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
        commit: 1d775cc371620caa12cb404771edbab944b1caba

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
