Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BE4C43460
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Apr 2021 14:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9DD3613BB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Apr 2021 14:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239774AbhDMO64 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Apr 2021 10:58:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58497 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344031AbhDMO6u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 10:58:50 -0400
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWKUo-0005EM-3T
        for linux-samsung-soc@vger.kernel.org; Tue, 13 Apr 2021 14:58:30 +0000
Received: by mail-ej1-f72.google.com with SMTP id p11so5152514eju.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Apr 2021 07:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KXFmnreZUFvpdeZOE3YRnkGXbB2aVTyeo59QFjsyW9I=;
        b=bxqNvg85OnSfLAaV5vxbe+b+f4RWiHB7lEn6pipLHBrLE+y4mS6CuNvR0/gsniWnsG
         vV/64ntnvzXgB7Kbla4/cvW1j8ZqEeYkpF5NQGa2y0bFPvZsA410N8M+8k7ffl2sFsBP
         ecDTAWCQwQQKWD3CGn26WO3QjrLJ8iv0egj5Hykeq7ijgKEtqPGTyIaYWooJ9nmY7y/V
         EKXsHej6/Sh5SE/4JMnks36jmcQgk2EIs6d/dHId/0wAiqI58GJFQwfSHcjRDJgx1w+W
         h+PHIenO+oaBwYXqXpr1776wzxnqlSi6V+DoDnYfdojQjJrazOrnsTceUBipaB89Q6oq
         9/qw==
X-Gm-Message-State: AOAM533MJgGrv7YmXtwIVCw8iceZwkoRty833GbYE+ALRN9GodWIFzzX
        +wgT2M6mXRPTvafiUi+7Qy5MJaGDIOIoaBZiGN5/pfAbO2yvYYUWxpHhcyOaCsrNqCvsuzFhpx/
        KsRm1IMq8/MJ85xksqdMOFLDAStqjDU++ehBFgRdL6EYR7mrT
X-Received: by 2002:a17:906:4d17:: with SMTP id r23mr12011599eju.134.1618325909552;
        Tue, 13 Apr 2021 07:58:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu/pDogwwsc/dyeGnbfzo8QIv9u+6fKHlBwiNUQ2rfPdi8E5CISH90Pct1hqzIndiuUYdomw==
X-Received: by 2002:a17:906:4d17:: with SMTP id r23mr12011590eju.134.1618325909449;
        Tue, 13 Apr 2021 07:58:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id p3sm4395217ejd.65.2021.04.13.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:58:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] memory: samsung: exynos5422-dmc: handle clk_set_parent() failure
Date:   Tue, 13 Apr 2021 16:58:23 +0200
Message-Id: <161832589345.71964.47710078429514068.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407154535.70756-1-krzysztof.kozlowski@canonical.com>
References: <20210407154535.70756-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 7 Apr 2021 17:45:35 +0200, Krzysztof Kozlowski wrote:
> clk_set_parent() can fail and ignoring such case could lead to invalid
> clock setup for given frequency.

Applied, thanks!

[1/1] memory: samsung: exynos5422-dmc: handle clk_set_parent() failure
      commit: 132c17c3ff878c7beaba51bdd275d5cc654c0e33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
