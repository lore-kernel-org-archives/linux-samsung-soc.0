Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EADFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Feb 2022 13:11:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240730AbiBWNMJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Feb 2022 08:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbiBWNMF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Feb 2022 08:12:05 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA7C4A3D0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 05:11:37 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4EC7C3FCAD
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645621896;
        bh=6ItdzAIC73ba61SL64woNZZ4z8ugfh6dQKurjioqyaA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=qji3mBBEBra1Kmh6YgakCFJSNo8iv8R2NhZxdC6xji32S+1mOBFL1PbwMcspVnoVT
         82+mE6MtF2DYNa1Vi8XtYxfDVAlqhpHWpnE5HltLTQ6gYQNxGC2ptslYaElPDQR4Iv
         6LoCQRM/+G835vXX5lTaTZiD1K3M+wKVM4qv2HYNzdrDnVArhywwIJHgGtUBNRi4iQ
         wOqhPnEz9nYq9eq43vojGIxHQbfCi+xJZEXp5O34drx8WW9y/WoDaXczCQNfCN9gmz
         HtTsNB6rs32HpJ0x5Z4Iocukpk8GTZDZowXCGRGaM7wznxPwUt17or6e8Kr5eq8GWC
         ztrZ6j+w/0D5w==
Received: by mail-ed1-f71.google.com with SMTP id eg48-20020a05640228b000b00413041cd917so4875495edb.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Feb 2022 05:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ItdzAIC73ba61SL64woNZZ4z8ugfh6dQKurjioqyaA=;
        b=YonjwTvS9De1/S/sFrfB/xjLGjvf5A9Se4IAGwBZhqSQhTT4nJfWp8JaLOlz5gYf/1
         GKdB2ZM1tcdakd65ZuisZGy6u7b4X8LctUUqE7JFRQz3pj9y4+5L4eTyA3ZfNsSlQRSQ
         CBO0VsoDuEO3FF+wP0Nzk5MUIrnm/Wn/iJdzgbk4b6sYU7Vrat0Iczb7rMxBISCO7zX+
         DjrtiuCKnr0X9eV5SRS6M5mWrygxW92nzk6ZaeFY5jIQkfiNDLhguwXV2chEoPQuGfEj
         kRT5UL4KBZv2Wh9QYNYLsKOX+U1nCKFtkuihpdZB0LPjVPEaGuAiayJ8qfM6xhp9IUY0
         kWlw==
X-Gm-Message-State: AOAM530Eu9SygpxnrAjmP8XQDssp7421cDLum4sbKeBcP3jv0Kd3xd+g
        pz/WC8f4qlSZQ+azfAHJJsZwpLN5Z66AaqoM7KuEzYYw+jM0guhZSY5ZJapi6yvxzbXjiAHQ2Ae
        cg9Tgpir5Bgy/R82PRiQNc1c+lRYDAMHSjjpWwKc7yaaZr1d4
X-Received: by 2002:a17:906:e13:b0:6ce:21ca:1b91 with SMTP id l19-20020a1709060e1300b006ce21ca1b91mr23486662eji.193.1645621893964;
        Wed, 23 Feb 2022 05:11:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqN7LLprVP7W7VK/4Uq3spoFQPaiet9FLARrRJrnw6k3jKocmQL3RLligIlXMbw8qEbieF2Q==
X-Received: by 2002:a17:906:e13:b0:6ce:21ca:1b91 with SMTP id l19-20020a1709060e1300b006ce21ca1b91mr23486648eji.193.1645621893757;
        Wed, 23 Feb 2022 05:11:33 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id h7sm11800293ede.66.2022.02.23.05.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 05:11:33 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        phone-devel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/1] Initial Samsung Galaxy A8 (2018) support
Date:   Wed, 23 Feb 2022 14:10:58 +0100
Message-Id: <164562185401.52450.9639221721231378939.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221194958.117361-1-virag.david003@gmail.com>
References: <20220221194958.117361-1-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 21 Feb 2022 20:49:55 +0100, David Virag wrote:
> Add basic initial support for the Samsung Galaxy A8 (2018) smartphone.
> This phone is also known as "jackpotlte" and under the model name
> "SM-A530F". In its current state this should work on most if not all
> Exynos7885 phones/devices released.
> 
> As of now, it supports I2C nodes (all disabled by default) and UART
> console with basic clock support in place.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: exynos: Add initial device tree support for Exynos7885 SoC
      commit: 06874015327ba7bf6aae49ca825a492a2679237f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
