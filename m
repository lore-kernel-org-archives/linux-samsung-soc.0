Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DACC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Apr 2021 20:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6D4A61103
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Apr 2021 20:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbhDFUbH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Apr 2021 16:31:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45797 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231347AbhDFUbG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 16:31:06 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lTsLh-0005vc-IU
        for linux-samsung-soc@vger.kernel.org; Tue, 06 Apr 2021 20:30:57 +0000
Received: by mail-wm1-f71.google.com with SMTP id b20-20020a7bc2540000b029010f7732a35fso1238523wmj.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Apr 2021 13:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B7+94ZBJm+NXJ3TDW1eAiyPRLMTS6GuI8L2lEKPsy6k=;
        b=qZIW+4wHr3K3BLpn8dDLwG4yrWAB17dWh9PRLaKSw6iB7ref6HeRBzIVQoJBZb8vdJ
         VmpZ+FldkuvkPvw8IIP067uLNjQ7uCNShZPNddFWYtah9RwIoksM05UqoZiFtgMHCE7g
         xGyOWsZUOrcgNc7k4/ll+aZNRMsIDa7rFAfx0vDQ19WNNvXaD8wXtogVYExvsEJXKc+j
         sVtP6bnNsT2S18BLyYxEP3uMec8n4cXHgNXHUUwVjW5cIVsStjar/v8dItUTN9c2aQYX
         ga5whEngV55bEAbgk6rGb/VJkFDU9JeHSJWOIsxGCHP3hcNm1EDttVDuIjq9tKiFRWla
         8YWg==
X-Gm-Message-State: AOAM530Jpo+m6Zgg5w1+e8SNC6PyCZ1yriTYgBngBENczm5F+GZR6i7a
        d1JfWgT1IsJ6xVdltHfxQTUgFuZFID0K5quKrEDHMK8/snHrrqI4zFD/9gpXBmFlKlISlDauQkZ
        oipW6YYHV9pyPYd+rCIPuCzSjesfOYPDnJcFUkkMNqlnSqs49
X-Received: by 2002:a1c:f605:: with SMTP id w5mr5759659wmc.66.1617741056939;
        Tue, 06 Apr 2021 13:30:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBnGGIOJEWEgxIzcQNy0Vn7tOaFRBBj1SkjOKTIQQbKh6OtpW6JLsbpoc2kT2gebyRfxim2A==
X-Received: by 2002:a1c:f605:: with SMTP id w5mr5759656wmc.66.1617741056797;
        Tue, 06 Apr 2021 13:30:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id o5sm34551051wrx.60.2021.04.06.13.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 13:30:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: exynos: correct kernel doc in platsmp
Date:   Tue,  6 Apr 2021 22:30:53 +0200
Message-Id: <161774104755.124746.8536738781662816687.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405181605.52612-1-krzysztof.kozlowski@canonical.com>
References: <20210405181605.52612-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 5 Apr 2021 20:16:05 +0200, Krzysztof Kozlowski wrote:
> Correct few kerneldoc issues, including W=1 compile warning:
> 
>   arch/arm/mach-exynos/platsmp.c:89: warning:
>     expecting prototype for exynos_core_power_down(). Prototype was for exynos_cpu_power_down() instead

Applied, thanks!

[1/1] ARM: exynos: correct kernel doc in platsmp
      commit: 6031008780efaada18087eba7ec84fe149f124a9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
