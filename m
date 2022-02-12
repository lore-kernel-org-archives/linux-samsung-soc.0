Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95507C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 12 Feb 2022 16:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237420AbiBLQhR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 12 Feb 2022 11:37:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237403AbiBLQhQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Feb 2022 11:37:16 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103C3212
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:37:13 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B1B3C407C3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644683831;
        bh=15hMJzU1fmathDo+CvBtL4KOBTGHiJyQDvhqhMcjvDg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=meH+M87HkkM3PE8mp0ZJzpJYbulkv2fJoPAocSH03h4ATVzc3U90nG0ZGqOD9JSxq
         TPlUbZBDn1faDet1NE0BmpRs6SCZsbe3pX/Bp70YAeIJotIefWVZ6naOPppcaHJPIZ
         w6nfAVfXNQDy/w5+gE1qofPhSXC4QZ1x4PpIwvv0P2xAloYlsBfLLTVDYl4iCKh46u
         LD+OosWnAOgILQereZUmgUC5rw/np8kn7NNgX8J6KTqIKSzum0aZ3OJg0A95icEKLS
         12pg8FiBhYlbBjOhFKMHGE4pKR0IuSwWFqRrCOvMhHwx8FlGmQoYlIPf3kAy/M2SFT
         /Jhgk7GGMuFjA==
Received: by mail-ed1-f71.google.com with SMTP id k5-20020a508ac5000000b00408dec8390aso7262000edk.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=15hMJzU1fmathDo+CvBtL4KOBTGHiJyQDvhqhMcjvDg=;
        b=VselVWL3c81VuLNiDLkj5t9TdcHipVD4NRhfPUWkRdVaw8YL2mpmIl6ev1ObsCDNqo
         f4wN/ly4E6AjZM5bkkGmzh8mRjT0s19n8tgzhZevt5L/4o9+L6JgRYBBAL4kfAhPXN27
         ZlNX2QY8nPmm8eBoC6mRewDraJrLF0yxMCKrybF6t46QF4zPpiJ/FfIThe4WcqdINIB8
         lZEa7sPWuF5wJ8z+3eoiCUAN8WfRrqCR1W8/A/nd/FaaDOGhnSJsBExyG094iEDvUPne
         u4+OZqcuCQtTcKYSFNbyV7xvPVz7Nz6rqC9vqi87Da+G++Va8iab0ibbx6W2q5Mb2rpH
         nvoQ==
X-Gm-Message-State: AOAM530jkP0k/NX7gwYBZQw0Q4UT1XCrCCciCL4eaQKdfOm4JsZDf21n
        sOr277q67/VCan4tLzIfMvMfj5XMKGdHPLgSs67JljcWLsItGPSg55H9vlxY+JL0mOP67toR8WB
        cnNSO9R8EzZZofpeXIXaWE2Qrs0l4lB2JY1ccySsX/zVKCMTP
X-Received: by 2002:a50:9dca:: with SMTP id l10mr7054314edk.311.1644683831489;
        Sat, 12 Feb 2022 08:37:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKd2PgvPfnFZh8rSZyPq0B14QPo5js//TUm4+syJvIQzZKlxeHGKY7MDAVXnpzjoJMBxl36w==
X-Received: by 2002:a50:9dca:: with SMTP id l10mr7054288edk.311.1644683831272;
        Sat, 12 Feb 2022 08:37:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id x10sm2494443edd.20.2022.02.12.08.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 08:37:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     stable@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: (subset) [PATCH 02/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5420
Date:   Sat, 12 Feb 2022 17:37:04 +0100
Message-Id: <164468382250.54495.17613053424810805341.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-3-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com> <20220208171823.226211-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 8 Feb 2022 18:18:15 +0100, Krzysztof Kozlowski wrote:
> Add required VDD supplies to HDMI block on SMDK5420.  Without them, the
> HDMI driver won't probe.  Because of lack of schematics, use same
> supplies as on Arndale Octa and Odroid XU3 boards (voltage matches).
> 
> 

Applied, thanks!

[02/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5420
        commit: 453a24ded415f7fce0499c6b0a2c7b28f84911f2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
