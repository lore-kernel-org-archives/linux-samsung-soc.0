Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3230EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Feb 2022 08:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbiBAISc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Feb 2022 03:18:32 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47790
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235394AbiBAISc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 03:18:32 -0500
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 41BA33F20A
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Feb 2022 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643703511;
        bh=4OMJ5aSVw9egu+KfVN6MouMq2XmyI041S1HUizk8CCg=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=QeJWjHOs/TDyxxegU58iKapFRF0SpMTyDqhr9fyHhcS1hIhXhDpfrSAcNAMnVbdlG
         i8QzN0hGObFje/MwGyuENHxe4Hn4a51kayL8tVqaD5GS3HEyVmTKpTE7Kqbek8jmx2
         yD3B3e/A3PBo8k13rnq48GU65DbKStdGJ+SNy+VbSAdpFWbwGe9tUXoyR4wUGyF1RU
         GCXCPIn7ZbuQpoSiVsyJ7TAzLJWL+ccauWcZooHnh8ilwPsoYDRubBxcy3EdPzYzxj
         rMqnuAORQEvfLrs/JXkRio3O28mNaJBJhtWlRc5bupj7PLPRiJGEG2IP/+yTMxfvmA
         yP5qJfJa3A/1A==
Received: by mail-ej1-f71.google.com with SMTP id rl11-20020a170907216b00b006b73a611c1aso6147328ejb.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Feb 2022 00:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OMJ5aSVw9egu+KfVN6MouMq2XmyI041S1HUizk8CCg=;
        b=4yIAqcVFPTGZLyAKLvfS62yFzqKPwsxAeFRBKTe3HPfuKgBWdec9yznMFc07byawuT
         zvX/+pPeadniFpDP9JOxZZTwD/Gd1paJedjk7SI+GxgMB4jakP+Pm1zCoLSWaTVijtVU
         3DjMdPFfsJkr9zvupcNaSJBYK6MztyLTh6Q9KvVBvAzm8woJCh2uR4W1T2GU+YFtQFSE
         F4rUQdnDkVtPKOs4/b4sG2BE5dugF2064ZG7iOwGJABtXJIG3un/eNZ4tr+Usw7irre+
         HTi6O9hFoocwbqcbkVmw6P9Rr0+UOwISxhxcWS8HpX8rsuTn+Cr5Ym6zY3YxtmuVYsiQ
         rHqg==
X-Gm-Message-State: AOAM533KgoPqG7ge5I4MurEmh8wT7uoywj21Ko0uo7aTJRArnqmne9ub
        xAtZbfuDHEuMCH0kkPCymT2Yel5Jdg3gMIPgS2JrDMHQBwRX1CvGQ8QpFFFKsDwRYevjnVuVI/H
        z6Re+JEA7Fs7ovcoUsR1Lf6zQEo32mN1VdZFvmCSA2YUj2vXW
X-Received: by 2002:a17:906:19ce:: with SMTP id h14mr20919928ejd.407.1643703510616;
        Tue, 01 Feb 2022 00:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi9GBsiIiYtp42mt15Psk7ObFdzcgWoYjLwVXsinm40dgxMTPh5vnURxVxv53FfpPvG7hEKQ==
X-Received: by 2002:a17:906:19ce:: with SMTP id h14mr20919913ejd.407.1643703510486;
        Tue, 01 Feb 2022 00:18:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r3sm14368372ejd.129.2022.02.01.00.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:18:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-phy@lists.infradead.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: (subset) [PATCH 1/8] arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7
Date:   Tue,  1 Feb 2022 09:17:55 +0100
Message-Id: <164370347107.13100.9120518363426119036.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
References: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 29 Jan 2022 20:36:39 +0100, Krzysztof Kozlowski wrote:
> Use the same order of USB 3.0 DRD controller clocks as in Exynos5433.
> 
> 

Applied, thanks!

[1/8] arm64: dts: exynos: adjust USB DRD clocks with dtschema in Exynos7
      commit: a0d5455330ece6f50ddf9e71d530f91c302803e9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
