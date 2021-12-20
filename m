Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CEFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Dec 2021 11:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhLTLyX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Dec 2021 06:54:23 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59328
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230511AbhLTLyX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Dec 2021 06:54:23 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1019B3FFD9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 11:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640001255;
        bh=5eM8zfWkW/pWK8AnysGnJolct8dbP/FVpa+LnPDHIiQ=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=hpqZXvQpsNkUr5FeeYuCdTeM7uCRqBbMGqvIflj5IrcDemIRNHBi8SvMpwa54n59E
         jOvWHeyGEaSw8rFRdaFKYXyl9AgeODJw20YvEIyLGifMMFdpLuN1XdgimJF9OqTdQ4
         UrgSbW0m5Sd8RE4u05uqSha2haO3qvRqyRQePvnm6et3mYWAPY5bFCUGpVVpVnPzle
         l3aaM0qdDRZa5awrW+KIS7NItTKwWjCF6KHMABeN48DmbUHUMKAG3K7jh+Jb9rzC/t
         /Iv1wr5ISTbu1egOm69g9n9m7iExPWrSTctRk8H7giA6qso5txYeVrSx5dG+ja2mYU
         2hlB2pGIGI/8g==
Received: by mail-lf1-f70.google.com with SMTP id w18-20020a194912000000b004254e83978cso3947803lfa.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Dec 2021 03:54:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5eM8zfWkW/pWK8AnysGnJolct8dbP/FVpa+LnPDHIiQ=;
        b=vU9kbYYBoJPnnlhImeHzxwTx5tqMRwIXb1xEOgdJGI50DuMmzTO/orseeKfoG5MbAd
         j+6Jl4wSZXntqaIRn3BwJtvKFL7AVJf3YPfa6yYkED6g9dG5/zIHyM726hyqGGXMQlbQ
         SUe9+XG1iaxTTl9NZe4E7L1XiQALwe7AhrxC3Has0yb5/QJiA3JYp9WJuClup8AsmwvZ
         oesdyHVtIAtOqlYGWfxkp6NmJy/MoNyM7DBUhvxFxBCFqrWslB+BxBYnU4t9ddi5IjjY
         gGcnaBe6InsWZgOvQPlf51uD2izhH97+WZJ3V8Hoaz9adFQP2j4mbI4PawQSTeWzAlux
         JOeg==
X-Gm-Message-State: AOAM5337GvIYV7rePr6W0mGutrVTMqgU2Gz76UakiUF+jQjodSKoFgzQ
        NsocU3HbqsEFxJFNv8aHLppN1q7L2k7es2+YmBUkUJzleorYRtIu82v6K2avp8KSN+xUZKwhHO3
        if/cveyxh5FwRNaR6Au026d2J9X473iFXoNzkyDzc/1lMHkNv
X-Received: by 2002:a2e:8848:: with SMTP id z8mr14290845ljj.429.1640001254382;
        Mon, 20 Dec 2021 03:54:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyncoh05JrY8CfHDFYfJ23eACvQDvVEoyPx5BQRDX8S1cvSRccYHmnJfLGek7iKuSmCNJeorw==
X-Received: by 2002:a2e:8848:: with SMTP id z8mr14290820ljj.429.1640001253937;
        Mon, 20 Dec 2021 03:54:13 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a4sm2339486lfo.96.2021.12.20.03.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 03:54:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 0/6] Samsung for v5.17
Date:   Mon, 20 Dec 2021 12:53:59 +0100
Message-Id: <20211220115405.30434-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof,

Four pull requests and two separate, trailing patches (arm64 and defconfig).

Please see the "[GIT PULL 1/6] samsung: soc: drivers: for v5.17" for future ABI
break explanation.

Best regards,
Krzysztof
