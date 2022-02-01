Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2808C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  1 Feb 2022 08:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235377AbiBAIRO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 1 Feb 2022 03:17:14 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56656
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235371AbiBAIRO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 03:17:14 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3125A3FFD8
        for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Feb 2022 08:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643703433;
        bh=MItxx70iFew0YeZnNA7KR41aDD2ctvR1pwd1gDOLhyA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Y1yoJxBzrWfZFtnox+3UoAyTyMYpLsHg/B8PgoKuYofffqTwhPVl3C/wph68c64SX
         RskxcC3bol3BRKvO3Wceo7SYFl1UMaLFJR3Ezihu2InRlVIZ4ehBVOO4ik7XIO8Ln2
         IGNd1BSuXjCZZQy0VbapVuylcFVzja00ALlGagp0LTvXYpDKp9CuFORbjrSDAuc1mU
         jwPc7QSHRJop064vo8GGL5m7P6iu0mJ9HyY7B/nVXTzFeQ0rsTGruI/2Kxmmim12iD
         LtSiRoW/sbDUomHW0guZE+FHurxvogQvskw3dmC3OrMEPDl34Cml2emv/D9zbOUeUU
         jEMvox/3dlYVg==
Received: by mail-ed1-f71.google.com with SMTP id w15-20020a056402268f00b00408234dc1dfso8275454edd.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Feb 2022 00:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MItxx70iFew0YeZnNA7KR41aDD2ctvR1pwd1gDOLhyA=;
        b=20VE9uACXDw1DXg7q5yzaptFe8QT5JhZUydj0t+nZkzpaduhPRuQKS7l8nV2z4hLpI
         14LoHWpxQkGSv66N4ltKt5blKHmV8Wxc5M0GbiqYngWrCpHQWyTTtEKOjgQwQh93cKzO
         keJvAJcnwrye0z3+J0lpM12q5EyW8/AnJL56DYdZacsqmy9Jl7S0ZQyndTurC0EC42oz
         gGpJqkL2XbdvI9sKkyuLxOwSBNiKZ8PTOBwvakkU9q3vOMHWOebVqqza0H5ae4+lS/sb
         UEi8uKmFT9Jsw7d63aVaHzYlMF+43SuRPBnnNwsmyj89sHZZYB0GUFdwuVCTTcL7NbjL
         ayqw==
X-Gm-Message-State: AOAM532UqioCSc4kQdptV+Yp/87wBXeMrh4OCSmvmgiIMDeNEdspWKmE
        pj9eRYWWCjdeetFwRcWhmHovrtwPqPkS+WyHDLmNdjEhJkYYkZ+k4EH5DuzkO0nsCyehEca4Npe
        Tk3s1d7S7tsd/oQlU53IVqxxgyfL1/9SrnCHeJxRGjVXheAjt
X-Received: by 2002:a17:907:7e82:: with SMTP id qb2mr19890303ejc.496.1643703432584;
        Tue, 01 Feb 2022 00:17:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhOxyC/yzDk+upGVDMqjGzeMIciEE57Rpod35Osx007NQEYEitTAQ3J3/YfgtY6KfuQqdjZA==
X-Received: by 2002:a17:907:7e82:: with SMTP id qb2mr19890296ejc.496.1643703432455;
        Tue, 01 Feb 2022 00:17:12 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id v8sm14179485eju.57.2022.02.01.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:17:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: samsung: fix missing Tesla FSD dependency on Exynos
Date:   Tue,  1 Feb 2022 09:16:36 +0100
Message-Id: <164370330545.12265.2531636049712194501.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129173407.278591-1-krzysztof.kozlowski@canonical.com>
References: <20220129173407.278591-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 29 Jan 2022 18:34:07 +0100, Krzysztof Kozlowski wrote:
> The Tesla FSD clock controller driver uses shared parts from Exynos
> ARM64 clock drivers, so add proper dependency to fix COMPILE_TEST build
> errors like:
> 
>   /usr/bin/aarch64-linux-gnu-ld: drivers/clk/samsung/clk-fsd.o: in function `fsd_cmu_probe':
>   clk-fsd.c:(.init.text+0x9c): undefined reference to `exynos_arm64_register_cmu'
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: fix missing Tesla FSD dependency on Exynos
      commit: 0b59bc00a6936e8670b58d4307a2cfba341d40d0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
