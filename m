Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36F9C4707F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 May 2021 16:01:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7285613C5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 May 2021 16:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235089AbhE0QDQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 May 2021 12:03:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41835 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236736AbhE0QDN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 May 2021 12:03:13 -0400
Received: from mail-vs1-f70.google.com ([209.85.217.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lmIS3-0003BS-Om
        for linux-samsung-soc@vger.kernel.org; Thu, 27 May 2021 16:01:39 +0000
Received: by mail-vs1-f70.google.com with SMTP id f26-20020a67e09a0000b0290235a378d2f1so357356vsl.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 May 2021 09:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VT2B96LV3Sud6lFqUqI11ryilsp1126vHCKGDpUyUJM=;
        b=LIza+UJ11oK0d8Mgz5xg/imGpAuBZwebakKDkWDQLNBk66XeySfuNwbN/SCjTdMX2U
         E8h/HFjSlQ3MQ3U2E8xdgnE5XH45ttlgIlWpQaalSIU3m8z+2nZYS0Vwoo0R8dSAAteF
         0JV408BbqF0nHOeuN8hyiO4A1L3SOZGogscGvJdjyq9fb+fkdje1tO2nCLp28PDBxYoB
         +ihhdv4w0av0uevz8Su6lPbwqEic9QJVJWUyW7MTe9U/2mrGI87o+VJaYpXmhrDSLi9m
         GHc+Sy80gAoMzaqlV+wfguzbBXJ/dwB8qZiE5POvWKqqD8dMk5MbGBGcy3HfiMccuZCF
         IOag==
X-Gm-Message-State: AOAM533z8Mj46NRqAd+b4umxrNxs0I3qjrl/xd9BXCh2h+GEn23LKiKO
        YE3YWDwLVEu9GpwC8gpWWQ1BI9oQj7CwAuhBJykmj7Ax06ilvpnoD3YTAPohVT4l+I/10I5TsGv
        A1erRHcdx2hLkvEcLsG1O/aCQOGf0u3bA8n1F8dG/FY8SQ6Br
X-Received: by 2002:ab0:4507:: with SMTP id r7mr3173271uar.28.1622131298298;
        Thu, 27 May 2021 09:01:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsgj2B5pbbVzbAMrL6Yx0irK7rICPVdIXuyTA9xUcByUWQGFiKYpETQbEAAtWdKJLaTMrsjQ==
X-Received: by 2002:ab0:4507:: with SMTP id r7mr3173252uar.28.1622131298122;
        Thu, 27 May 2021 09:01:38 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id i13sm368094vkp.45.2021.05.27.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 09:01:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: (subset) [PATCH 1/5] clocksource/drivers/samsung_pwm: Minor whitespace cleanup
Date:   Thu, 27 May 2021 12:01:30 -0400
Message-Id: <162213127799.85759.10470691755359057532.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
References: <20210506202729.157260-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 6 May 2021 16:27:25 -0400, Krzysztof Kozlowski wrote:
> Cleanup the code to be slightly more readable and follow coding
> convention - only whitespace.  This fixes checkpatch warnings:
> 
>   WARNING: Block comments should align the * on each line
>   WARNING: please, no space before tabs
>   WARNING: Missing a blank line after declarations
>   CHECK: Alignment should match open parenthesis

Applied, thanks!

[5/5] MAINTAINERS: Include Samsung PWM in Samsung SoC entry
      commit: a6419e53c779302f8d5dd409eccf5b41ffa184a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
