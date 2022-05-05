Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84730C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 May 2022 07:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245698AbiEEHMd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 May 2022 03:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245643AbiEEHMa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:12:30 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DBE4757A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 00:08:51 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p18so4138914edr.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 May 2022 00:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WGJ+szBbyr2lzfc4ahud7APtOvfcKd7YgtYN/CgLr0w=;
        b=X27TsmJs56DbhuIALDeRkZQzi5L/yk9t/o9wE3w4G+q++/+FAzu9hrnvMkjyDGygL/
         vznW36EnFdurGGjpe8nxVAme2Y8KXVeIb4LLWLDZ/pE2rtSuATOXTrYGFIdzUY6OoPQd
         H7Q3wuoyHMU3amdIvEv1GCO6f9rHIjyCEtqxnri1qfTWLa8Qn6I6DeMaVmbyW+MX7h1x
         1YL4UzPbbLrNo+AbpiW9/nmIx3W67z6NaOfh1ILi54Xz+EXKs91S1RvGpxNUQvdmIM/3
         /4v2talsuH9H2aM1OimiskpM80HUpZlgEd9T4CLcLsneHHdL8d35McydGsC+zU3XbxxV
         Kl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGJ+szBbyr2lzfc4ahud7APtOvfcKd7YgtYN/CgLr0w=;
        b=KWjz6Rux33+MI4hsgVorQVReo5eS9p1RlwTG6+/pz0ytTvphPGLc/7S3/+cWvwRRd/
         SQbFO/00ErYZiQpAEy3+IeCMY5D34YdAnEKOrViLPzPQOexShqHsiJV1DrfEMPfqHDcu
         A+88jzbb1M06/CcxgdHgjbQuCHY/PeLTGAvBnc0I7rq9FlgdBPvcgDv0oNk6YjXpzAqE
         8WsS6L5Y22fqhINhmiPoJKYDieEnnYx17qqPSyVDw4J8tWHQBvZakwyRLIpUQ3afNHoh
         bT4gQFjlLBpRFsZaqbe7xqk8epOkxAfauJZNSlfOS2/xIJrJNlZSLn+m3s7/wdTqCdt+
         L6jQ==
X-Gm-Message-State: AOAM531RmGnunzJeNaK1C4ZBz+TCsqGKMtwPMjL33ibmJ0P07b9PYq0j
        ryEonmyKZMCrzcqEQqVRX3eALA==
X-Google-Smtp-Source: ABdhPJw5kWuCg7nKubB0wZpuA/MM0CAuFhQJvm5izqo5Xou3V4vNMVSIWFEVzYucLGDYKQD6EQdx/A==
X-Received: by 2002:a05:6402:3490:b0:427:b471:9e1e with SMTP id v16-20020a056402349000b00427b4719e1emr23694016edc.36.1651734530550;
        Thu, 05 May 2022 00:08:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b4-20020a0564021f0400b0042617ba63ccsm394386edb.86.2022.05.05.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 00:08:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH v3 12/12] arm64: dts: exynosautov9: switch ufs clock node
Date:   Thu,  5 May 2022 09:08:45 +0200
Message-Id: <165173452272.31721.1625762819657409764.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504075154.58819-13-chanho61.park@samsung.com>
References: <20220504075154.58819-1-chanho61.park@samsung.com> <CGME20220504075004epcas2p4d082e1aa4b35ec4720ea8ed2308878f5@epcas2p4.samsung.com> <20220504075154.58819-13-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 4 May 2022 16:51:54 +0900, Chanho Park wrote:
> Use cmu_fsys's clock node instead of dummy ufs clock node.
> 
> 

Applied, thanks!

[12/12] arm64: dts: exynosautov9: switch ufs clock node
        commit: 9882948322874b1ffdd559e6887397de4c903440

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
