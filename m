Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B05EC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 12 Feb 2022 16:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237453AbiBLQhV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 12 Feb 2022 11:37:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237403AbiBLQhR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Feb 2022 11:37:17 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED9D212
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:37:14 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 42463402CF
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644683833;
        bh=7ys9/qjzPiU3SC/qBsUq9U2CJFdyL7K5ET3RMyCWmA0=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=ROUv8aLzhoTOJEDA7rN4kRKkSVduuiAXqIxLE85zeM3FC+0CgPfXm4XJOA5timhnK
         3urM2MjgwFYRGHa05vccgYpMhg+EcPlDRuefwzCPVhh9V/3i9eTeqUY/anHy5H7DJL
         qOnGZQ7VSC58cxciYrSdteO9vFsF7HDFdAGJ6AHVTk3b/XX0wm9KokF4GZW7n4TZDs
         fTQkRb52OHYzZXeGfRak8Kv5DAGZTqxdJbI3CLZ6RBlPAqmszn6jitlzVoIuAvR6Yg
         f0DkTcR4pIsLZt5JdxeT9jjgTIyLeiUL0gd9hBzQ+G2MezG59/PGbz/k9Jv0O5iPIR
         2PPkMGi5yeuTQ==
Received: by mail-ed1-f72.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so7337936edb.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ys9/qjzPiU3SC/qBsUq9U2CJFdyL7K5ET3RMyCWmA0=;
        b=XEGFiKDJkadPs7aKov5HVMOCAkPvIGr6+wC9KrzBP2DZKRaP6aOY4NwfimKdVjBGRo
         qJYy5ZPSjoP1jFEzspuu6SCp8F29vz8awcvKHrDrh5dkY42sG5dq3Eoar5xhWsZ/MxqT
         3mFiq05bzQfkglstpSYm1mAVYj63P1et8aPV0zJ0eWwN+I5zIbZPva7vJHwt0G/RCfq9
         EPxhvexjmKdFi7YjCPNMCHmtJIyOzKd7+mdQKL9WbKf8JY6lKyNo5QfO+D4G0ZpttoVy
         AuFUDifmiPAFQjzHmJFZyDO7pRVFgLvZTleMjL/iCIgUEDXp4r9fSHt3cImjfAr6YmlT
         KeFw==
X-Gm-Message-State: AOAM533YImUAgf+rCdENoEz3ILadAXxjpzEGmvTGKyEHWEMHOPXrGvCU
        +kkbqGT7whh9ivRLQK76yGi/akSi8Y0DldlKdVnBOjN3qp0jQIjqrEKJZwPgfmCBs0vEPC4Bp9j
        WQOk3C2NgiPhbnodEsCMtx6JusCSN91ldV2TiHziB2PU85Wvj
X-Received: by 2002:a05:6402:280b:: with SMTP id h11mr7446513ede.402.1644683833019;
        Sat, 12 Feb 2022 08:37:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUIS5XZJwcH/oXPkDCwlaYXgS9xWXGSa3hZYgN6Ichr2oZbBytnhatpKpWIWOfF2w+YAttqg==
X-Received: by 2002:a05:6402:280b:: with SMTP id h11mr7446498ede.402.1644683832858;
        Sat, 12 Feb 2022 08:37:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id x10sm2494443edd.20.2022.02.12.08.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 08:37:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: soc: samsung: usi: refer to dtschema for children
Date:   Sat, 12 Feb 2022 17:37:05 +0100
Message-Id: <164468382250.54495.10506365677169420285.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220211164716.120880-1-krzysztof.kozlowski@canonical.com>
References: <20220211164716.120880-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 11 Feb 2022 17:47:16 +0100, Krzysztof Kozlowski wrote:
> Explicitly reference the dtschema for USI children implementing specific
> serial protocol (I2C, SPI, UART).  The SPI schema is not yet accepted,
> so it will be provided later.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: usi: refer to dtschema for children
      commit: e465ea5cc05d1d0b45c315fca0254bd2ee04b661

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
