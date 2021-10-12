Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45BCC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 12:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B06F5610E5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 12:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236410AbhJLM0m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Oct 2021 08:26:42 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34972
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236281AbhJLM0l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 08:26:41 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5A87E3FFE7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 12:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634041479;
        bh=2KycfGF86kW+RwIJHs6Giwt5ePbEo0G3cAzDX2fNLuM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=PKzf0Bz2KLeXtMcRGTqKdAtlT4jvAn1B7fjDlk5FAs6dfNu4i9vNTuClyo6nSoeJe
         Ajpf96+sQqVLVD/aqGVXsUJO9XD9AXhC2sk1yxisQ0k+jsvFEyP+N6j18ZwmKdFiOm
         fGr7adTa8jDZ+EZ3x2UahUIpJkelXzKB61Wjgwz0NkndkINz8voEd8ZqdA+4ZopxVN
         2OR4S8MKP4LvDYuvlFtIARp0qZ121ONNjBLqHjAeLNl6jdqazXpCc/IWHWYG2M6UQT
         26So0aNieNLTYj4sGd+2+MFzW+Bd6owdaTOaMXY27koGGx7Z6YpVU1HPPUe/edWTwp
         RtfPX0o15RyjA==
Received: by mail-lf1-f70.google.com with SMTP id i6-20020a056512318600b003fd8c8c2677so4762644lfe.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 05:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2KycfGF86kW+RwIJHs6Giwt5ePbEo0G3cAzDX2fNLuM=;
        b=HbWz/QedORuTSN3k5dTG1GXa2uNaDVmyBslUiRGi6Dpja3EfEq7rHm/ae2rwQjhqaQ
         yqnGJhJEAox4ODj7qPvBCl6mBrsMZJtNTxoBc09u2xNhYzHfNhEbBQJ0cvBT61/tQ0H7
         vAQzeGDzw7tnabS+EZEQQogfanwdPI7owALwfe7h5OQpggRUVWlfFEsGMAMSGm6lSpgK
         fRCP9iw+Tda10TMPSN9XS52UJQR+Vke8opMLYo8O7lf3bepfyf2upbwI96oRkeTH3Sj9
         FBl3+8tlHTpO8WSfwRAqIjbtlayqwq5qq432AEwm9RvPtm8HLeycs02LJr9pxx6Z4dyz
         DSHA==
X-Gm-Message-State: AOAM5301OWzUSOQAmFNWh5vqUK8VJro0YBKTu+m1T06+f54jwfNg6XOz
        FVYnUSGplD2+UPBgDEHlvHMxnEFReK9xqomREN26dBVvv81yKMIUESo3wlq7Vh3mDhC/nxRVMRH
        AyjTDBxeJjapV7fpGB2g81z5+nYwJO4zLPRo4NInHrOUD+pXy
X-Received: by 2002:a2e:95c6:: with SMTP id y6mr28676833ljh.201.1634041477349;
        Tue, 12 Oct 2021 05:24:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYKFUYAP+5FQx+G63kZ8qWv7l02qPx+Yoh7RlTIig0VJnn9ivipTNU1F6A6FXA5ZuP01sCIw==
X-Received: by 2002:a2e:95c6:: with SMTP id y6mr28676776ljh.201.1634041476653;
        Tue, 12 Oct 2021 05:24:36 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t22sm1116873ljj.61.2021.10.12.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:24:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v4 3/3] arm64: dts: exynos: add minimal support for exynosautov9 sadk board
Date:   Tue, 12 Oct 2021 14:23:59 +0200
Message-Id: <163404143358.133839.2794709357328521339.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012002314.38965-4-chanho61.park@samsung.com>
References: <20211012002314.38965-1-chanho61.park@samsung.com> <CGME20211012002533epcas2p10315d89423e02bf36a5e0c404268ca1f@epcas2p1.samsung.com> <20211012002314.38965-4-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 12 Oct 2021 09:23:14 +0900, Chanho Park wrote:
> SADK(Samsung Automotive Development Kit) is the development kit to
> evaluate Exynos Auto v9 SoC. It has 16GB LPDDR4 DRAM and two
> 256GB Samsung UFS. This patch enables only serial console and ufs0
> device.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynos: add minimal support for exynosautov9 sadk board
      commit: 2b663ae7152f785732d35ce38ad20ad10aca3116

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
