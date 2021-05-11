Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F5C43460
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5FC86191C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhEKMjH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 May 2021 08:39:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51166 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhEKMjG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 May 2021 08:39:06 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgReB-0002kw-BA
        for linux-samsung-soc@vger.kernel.org; Tue, 11 May 2021 12:37:59 +0000
Received: by mail-ua1-f72.google.com with SMTP id y47-20020ab048f20000b02901f8bb2a8695so2435924uac.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 May 2021 05:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WcE5bq5wNwB/It9SUbvJNqFIhta1GVHKu5RzbulM91k=;
        b=SklANkTa1CcQJQRVFLe/NoFLwn/udj30qIK6KjoCJNnQ4Tp29QySZDvU7R6a7OAZW7
         Jjm1y5jKJ3TE+6v5wRMwf9MgLGBzKYIYoNv+7IQ1zliw5WB9FMoUI3Td2QEFtKZ+l6OR
         9O6AQOrIqj6a8iQexBaBC1SW6UPU9G6FA8mkpC1yj0FLrShAXyUlgXktZxMkPepQOxxW
         d3876eZcjI7Q5jS4bmFGmN5vkfFFkvLtV/qZgtmaYuSeruloPXmraC4U/DzyFqJ6SVsR
         RWmIybhTFo9KVGxKP8TzzS9jzlCtLLcAUGGi3CTXcqJsQHYxTsW3NgCJaXorGj0aM4Dp
         nZ/Q==
X-Gm-Message-State: AOAM532M4lQ1CQOvfWyT9Dk97LInVgly/1h+0X8OIH4ZZahj9e9vtVs8
        DwVRpgQjqBQyNS2xMY/J7h3zFqoEkGckSTju66DNrpeTWBiqk+tXxni8hLCWtn/Nnf4AIs54uTG
        Nu3oL4ZWLOIPgtfmFp0QslD8U71dUo+v1Ux4WVU6JergFOAcT
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr24169910vsg.21.1620736678129;
        Tue, 11 May 2021 05:37:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRLAGfnI9L0po9Bb5C8gz/134T5moqEUU0jXhpN/br1HUWCJqo8M1FCeaGmyr4qyowqsn1lg==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr24169881vsg.21.1620736677988;
        Tue, 11 May 2021 05:37:57 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id c69sm823434vke.48.2021.05.11.05.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:37:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: exynos: add missing of_node_put for loop iteration
Date:   Tue, 11 May 2021 08:37:43 -0400
Message-Id: <162073661213.12308.10055643507451347667.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425174945.164612-1-krzysztof.kozlowski@canonical.com>
References: <20210425174945.164612-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 25 Apr 2021 19:49:45 +0200, Krzysztof Kozlowski wrote:
> Early exits from for_each_compatible_node() should decrement the
> node reference counter.  Reported by Coccinelle:
> 
>   arch/arm/mach-exynos/exynos.c:52:1-25: WARNING:
>     Function "for_each_compatible_node" should have of_node_put() before break around line 58.

Applied, thanks!

[1/1] ARM: exynos: add missing of_node_put for loop iteration
      commit: 48d551bf20858240f38a0276be3016ff379918ac

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
