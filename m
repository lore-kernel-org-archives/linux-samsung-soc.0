Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B26AC43462
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECEED61006
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235529AbhDAUDQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 1 Apr 2021 16:03:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45358 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235528AbhDAUDP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Apr 2021 16:03:15 -0400
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lS1Ja-0003ZR-Ly
        for linux-samsung-soc@vger.kernel.org; Thu, 01 Apr 2021 17:41:06 +0000
Received: by mail-ej1-f72.google.com with SMTP id bg7so2548603ejb.12
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Apr 2021 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=10LZoBfcnsxrENoJnS7HaRBaD24q40UPMnwxVlRqiBY=;
        b=WzK1ZMGew9gnJswa7M91pP37jwZYheI6LlY/HLR7qXXHVNqV08p7DTxJvuOaI7Jxvc
         ANuONJAGJHAxuu5jF3zDddkhKoVX8x78+N3hTj7vghZljXBtqOPGH/CR/97QaWmd10UZ
         Jh0EFWUpC3b5VkESORfDTIAadGQty2hpKkKcQZDkM0aTeZxzeTNIYjoICZbS8HyY/DUo
         0MOLddjEBxcbJhB1FGeMW77gNaQpkiwBSysFuBirtgDhi0NumIo1W8XAdrGMWUsxHO79
         ev3prgtYaysBBhc+m7Xks9Ds7D3NHdou+rmEBxHEbbZ1IAq0stUxjpptkhQKr+gBcx26
         F0aQ==
X-Gm-Message-State: AOAM530JqwGFAtVLrl3q/PniG+1XpZu5bHd32e/KUpe9rNOmptbsvEna
        Ce8z6tIdPO6VhV6/upRWLWxSMMcelFOfH7sNzNSB12uUYSxcoGx64m+Og5GLUMAdurICp8O1dzN
        1u4AmhEPX3MkeAu+/cDr8F5r6lRsNsrO7HFfJLeN/VlBx8AxC
X-Received: by 2002:aa7:cd54:: with SMTP id v20mr11340664edw.80.1617298866427;
        Thu, 01 Apr 2021 10:41:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp7X80T8hJtuVkwbrMRfiGRnA/IaN4S4nH38Uf+y6pmiIEXFsck1CHFGqH5BTWdVTb8A6Alw==
X-Received: by 2002:aa7:cd54:: with SMTP id v20mr11340642edw.80.1617298866265;
        Thu, 01 Apr 2021 10:41:06 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id c17sm4398766edw.32.2021.04.01.10.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:41:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ARM: s3c/rx1950: Use pwm_get() in favour of pwm_request()
Date:   Thu,  1 Apr 2021 19:41:04 +0200
Message-Id: <161729885474.9397.10566581741781836932.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326090641.122436-1-u.kleine-koenig@pengutronix.de>
References: <20210326090641.122436-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 26 Mar 2021 10:06:41 +0100, Uwe Kleine-König wrote:
> pwm_request() is deprecated because (among others) it depends on a global
> numbering of PWM devices. So register a pwm_lookup to pick the right PWM
> device (identified by provider and its local id) and use pwm_get().
> 
> Before this patch the PWM #1 was used. This is provided by the
> samsung-pwm device which is the only PWM provider on this machine. The
> local offset is 1, see also commit c107fe904a10 ("ARM: S3C24XX: Use PWM
> lookup table for mach-rx1950") with a similar conversion for PWM #0.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c/rx1950: Use pwm_get() in favour of pwm_request()
      commit: 19f5027e0394d2f3e1766200b6bbde660f0b7848

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
