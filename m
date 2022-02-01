Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AC2C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Feb 2022 08:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235341AbiBAIO7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Feb 2022 03:14:59 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56570
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235336AbiBAIO6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 03:14:58 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 013003F1E9
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Feb 2022 08:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643703298;
        bh=boQfkEd/Axzz4Ha9OlxxnWi1WdYV8vP07YnaJvP+r/8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=aGET5u5KasPNknv7IWD8pFjU6x9xtcZSZ2sIi4PfX4dZvuuFxY1V0qYt+szqL/Bpe
         1DQ87Kw38iQSYVopAK36Cri/cGQtKFexdS8rr/lk8SDWSxMztbmnNOjWDE7GYZSCSX
         nA22T9yvtZiWJosgtlXMEZTF6q1oA3zhl48YkUeaAzCe2/16d4/TqHTNhixuEyfZ7e
         ei4z5x4zyIvVYP7buGWCmrocRtXJwhijKDywhuFHSoNepl3n1iGxyIrI48hp3gnTw7
         vdqDpKElViZCRLDRv9gMLrO6fuvN60muclWesY94dU0hYccUtOEsEhkWa8XsKYPv7v
         Mf+JNEmK4egfA==
Received: by mail-ed1-f69.google.com with SMTP id w3-20020a50c443000000b0040696821132so8250097edf.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Feb 2022 00:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=boQfkEd/Axzz4Ha9OlxxnWi1WdYV8vP07YnaJvP+r/8=;
        b=fGjhRO0oL2NG4kW0coKyNLbI6ttVq8R77doqTYI0w39o9daK9mL0CyMiiTDxngmXDZ
         H5Jit6zoDjPySHd/foptrz7GoxrHQ8jFzffe+dRFseJdktHC7wn7E8At+us5B+g9hY5K
         qPKUhlqFFRNgmriS1rQM5Y+m5+wCsG1jPWpEMq8H9uRdmR6n0jX4qUkRIfXeBJ9L1ivW
         uniqNE4zof64bmjDzEMcgOoITquCeD9rkmlBxJLENOXELXct8DkcUcE+jvjgi6dnKsLM
         G4asq2Gq4U9FCNqKUN4lOatkARH1+H6C+j+1jOetFdT4a/1UEFzuApEMNe+0QmhEMG2f
         7lmg==
X-Gm-Message-State: AOAM531MAij84N6+vzWQo7WxaGIPUuu8PhDTPJJAq2CbG3nKjKcGrR9b
        GfZEQaaOyAd5UZvcpkWs+j5GPXEjZHj1YaxVC9murJXm9VNtiQeIKiD+uwX78JiOVXP0yvNbQtX
        bjXwvPEpHV4q7jJMqd6ax04DA3/LQtOZPJm1TfDbn26D42RcX
X-Received: by 2002:a05:6402:2754:: with SMTP id z20mr24075552edd.235.1643703297540;
        Tue, 01 Feb 2022 00:14:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgfi4y9EhHDRDWpF0JFjBFlkVKbHHjVy1Mb8dmncTyyzB+oiFhGTButtSrBYmktoLV7QbEVw==
X-Received: by 2002:a05:6402:2754:: with SMTP id z20mr24075530edd.235.1643703297366;
        Tue, 01 Feb 2022 00:14:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id g12sm19113517edv.89.2022.02.01.00.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:14:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] pinctrl: samsung: improve wake irq info on console
Date:   Tue,  1 Feb 2022 09:14:21 +0100
Message-Id: <164370325802.11962.5143419688902708508.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220130232122.GA119248@adroid>
References: <20220130232122.GA119248@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 31 Jan 2022 00:21:22 +0100, Martin Jücker wrote:
> Improve the wake irq message by also printing the bank name and hwirq
> number that matches this irq number.
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: improve wake irq info on console
      commit: 3652dc070bad335d6feb31402bb4ab1ad58d5cb6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
