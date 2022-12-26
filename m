Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF13C3DA7D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Dec 2022 15:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbiLZPR2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Dec 2022 10:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232025AbiLZPR0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 10:17:26 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF2E2BF4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:17:24 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g13so16253754lfv.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7LUtQ/NFK1DKNX14coOlEGA5tALLtNHJHcpgwHfXsQ=;
        b=aFbuBL7r4MAdWhgnM0/sOq/R3TQvUc91BDpYmredH9GNmTiicpMj6GM9v+4DJ4gtEF
         LCu7t9LTCUTNmw3iXuhZxK3nZzzfdZFrLLBbkfG9tyYwZjZ5qQKnFNyKFvsTBwPpYAkJ
         cH+I5nPtNrqDw87pCqYtJUG48bZfFEFSeuHLy7YAAwW5hl5SvGhKK6H7SJLXhpbHWT3Y
         jtywXc9ulcWy1gP6MVrAeUEN22dJQ7ylyx9MZmKB8B3kndCwknKwnbbDWP0w5FR2Dga4
         UgKIxdejLzK8tRNEmXeDfy9Z7mi7z3wsik7ftwnXhUZwC3ZJ6siosgspk35conrBawwa
         2wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7LUtQ/NFK1DKNX14coOlEGA5tALLtNHJHcpgwHfXsQ=;
        b=wxwX0QbskZfV9yb1sLr5z3G2g0JfZ2wCEE3L0ojg8xJg6nC8zzmyJ+ZAOlVJURFKck
         3oCVyzy1NV3LBq1O63U71xo0/yS6dVyZ36o5I6snFcrhX56fLmE/clgGtpQEC/Saic9J
         WUcYs+sgodDpmTdYI/a69dSaERmDn+ntwb/HyailNIZ4oYAP+moiG4AIkvsh79LxvMfs
         GUOYd9o8iVMoScAladAGm6O2MWRh+re6ToYKpHbrflJgy/Z0z/a1m4j4h2uCotyrEq7n
         mHTETU1FLo/LVDuboFzToQi2o3653Da4uoQaFTN+CSyZja7otnv151zWH1zm894tVRZL
         hufw==
X-Gm-Message-State: AFqh2kr3qeNFqqv3M3Z98gFgdF0bwHp7kp09j0O/oQIeeCBFWMSeAHHv
        oyYNFbSaxB+PKnuhmIojn4fymg==
X-Google-Smtp-Source: AMrXdXuXngDIxOp5mZ0HCgnPN2J5wsqeMtyuWeH1mcF/gQvbvf1AquafYMnVz4z7AkqzMpPVder7+A==
X-Received: by 2002:a05:6512:141:b0:4ca:f887:fe99 with SMTP id m1-20020a056512014100b004caf887fe99mr2966923lfo.25.1672067843170;
        Mon, 26 Dec 2022 07:17:23 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k2-20020ac24562000000b004b4ea0f4e7fsm1821286lfm.299.2022.12.26.07.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 07:17:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, sathya@samsung.com,
        krzysztof.kozlowski+dt@linaro.org, ravi.patel@samsung.com,
        devicetree@vger.kernel.org, Sriranjani P <sriranjani.p@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/2] arm64: dts: Add SYSREG nodes for FSD SoC
Date:   Mon, 26 Dec 2022 16:17:16 +0100
Message-Id: <167206781676.20416.9194159751999354965.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129115531.102932-1-sriranjani.p@samsung.com>
References: <CGME20221129115540epcas5p370eb47c404a8d2c08ab4f264ae983481@epcas5p3.samsung.com> <20221129115531.102932-1-sriranjani.p@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 29 Nov 2022 17:25:29 +0530, Sriranjani P wrote:
> FSD has few system controller register blocks. This patch series intends to
> add support of device node for system controller registers group that
> resides in PERIC, FSYS0, FSYS1 and CAM blocks of FSD SoC. As these will
> be used by PCIE, EQoS and CSI module. Patches for adding support for PCIE,
> EQoS and CSI are already under review at [1], [2] and [3].
> 
> Also this patch series add required DT bindings for such system controller
> of FSD SoC.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: samsung: exynos-sysreg: Add tesla FSD sysreg compatibles
      https://git.kernel.org/krzk/linux/c/7e03ca7429b23105b740eb79364dc410f214848b
[2/2] arm64: dts: fsd: add sysreg device node
      https://git.kernel.org/krzk/linux/c/beaf55952d46fb14387d92de280bed7985ea85e5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
