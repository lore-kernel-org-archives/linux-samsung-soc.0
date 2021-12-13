Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ECAC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Dec 2021 11:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhLMLMs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Dec 2021 06:12:48 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:45998
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234481AbhLMLMr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:12:47 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DEE034005B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 11:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639393966;
        bh=FMSEJMWB19MJ5un0naaJgLGMwQh7w2xxe+NRt2wvP6I=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=V5xvwzknfqO16mjVNGIblj8LxaFArR6SQFll08DHcUJtYbs6YY901oSZ3+bWoBIQi
         qMHqX0+g5AOUuRHbeOH8HsOpT1MZwrwL9DrvmpVzbBGrEtWLR0YjC4P/Rql8+ZS3C9
         JS75Xz7hmVIErAVhiZgXO+Uh6PMuJM9+doimYzOndqDiJs8n1trj8FNpxr97znBs+4
         2Ql+A7gRA2PbTp7o71wWCrc+tkVBTregw/+iGgPRGlRovhmNU9kVuuarmKOVJCtNCV
         iwMdi5NPxI2w64EJN7AemCjkjpvWYnOZE1QuDCRHXlXval2ta29qGiRW7v3hHyEE0/
         CPd4q/1r8t1EA==
Received: by mail-lf1-f69.google.com with SMTP id e5-20020ac25ca5000000b0041bf2d8f2e1so7348896lfq.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FMSEJMWB19MJ5un0naaJgLGMwQh7w2xxe+NRt2wvP6I=;
        b=vevxC6fYokmUXi6PVVXcGN6zDEkntYMZB3u8cN1JIfCIIvCN1Bn5V5Qk4q/oWPCdlX
         YsDr1z8wtgE3dPykOjxbHM9QOSGGz0I8VFx6RTfAi99hqCfKtzNkKY0zTgM6Qc7+Ev0L
         OTJY/W3wwK/trW/VbzmZBpNqy/QXWybTcj3nntgFbEz8rYlEb3Pqzmac1P8/5RgiNQ7h
         puuxEdHsCbzSnrIVd8NWAgx5oqwbqGbWoLSyRl+Qjx+uxHxxPEvZLKEeiwzFoRZc/aeF
         90TSZ5PGuDsmZYbnSiFeD+Ma/Owntza6UJIs/6qLi3+u8PEA1C5zb7MLTdrB/t7HawRl
         +X4w==
X-Gm-Message-State: AOAM5315/z1YLHkd4Ul2O5B+WiQyJ5Dk88qlN6oUE3Wu6oVsHqo+AaoI
        ALWpHzbuxmfZJfYLbV2sYuQQaFTYJCV0ne34gs91kTZflbvyMaP2Fltzqnf2OPzHzSpNSmX9+tG
        4WOv8kyknioqtzHemwmFwZeWTYM49kwa4uTnsBmr7BcH2MiyI
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr29777706ljj.223.1639393965696;
        Mon, 13 Dec 2021 03:12:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEhn19N9dmWSefufj0sS+SE52ZpsFM6hnx/XdA1Kb8kvUIW90VKYiArQTWBmcr1sR0Y6R8xg==
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr29777688ljj.223.1639393965543;
        Mon, 13 Dec 2021 03:12:45 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i11sm1387791lfu.141.2021.12.13.03.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:12:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 1/5] dt-bindings: soc: samsung: Add Exynos USI bindings
Date:   Mon, 13 Dec 2021 12:12:41 +0100
Message-Id: <163939390678.7492.14453883652552774452.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211204195757.8600-2-semen.protsenko@linaro.org>
References: <20211204195757.8600-1-semen.protsenko@linaro.org> <20211204195757.8600-2-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 4 Dec 2021 21:57:53 +0200, Sam Protsenko wrote:
> Add constants for choosing USIv2 configuration mode in device tree.
> Those are further used in USI driver to figure out which value to write
> into SW_CONF register. Also document USIv2 IP-core bindings.
> 
> 

Applied, thanks!

[1/5] dt-bindings: soc: samsung: Add Exynos USI bindings
      commit: e522ae91b8ff7bf89d22d9322308aba1a6326996

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
