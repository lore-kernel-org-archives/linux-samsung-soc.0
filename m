Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D40C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:27:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6655E60F70
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Sep 2021 12:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344030AbhIGM2q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Sep 2021 08:28:46 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33970
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234142AbhIGM2p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 08:28:45 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1026F3F322
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Sep 2021 12:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631017659;
        bh=VowlVOnHwTh6fwIAxHIe0aATqP59Ww2WwB63U4ZOWes=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=D5FVfmdHtePvR2eNtkX6bF6lhRGYh6r+BuM65toYLHgYo4EO1Mc08PW0rd6xbvh5t
         pnRBVKJlDjDOHra+6Ak6FHfY4GcIm1yMud+LNCu1SCGTEWZDXKDil9q95EnvrfpBIJ
         vvZzqIQnm2AWGsNEC2eObaAywLiLFradbWIPU1BaXthkXa6r9XQh+70cEgo09xYFkK
         QROKiWOEMMLPPNxC/LFYFi/UzrQv7+v/hssXn32VPXN+p6YIP9TGIYzHO+H9KRzM4j
         HHOXT/DYqHjUlCylUFteRqgS+EKqBFFtrZwvGqYXZeE5VUIKqFqbBNqLbydjUgPgi3
         YJQS+/ZQbq/YQ==
Received: by mail-wm1-f72.google.com with SMTP id r4-20020a1c4404000000b002e728beb9fbso1113638wma.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2021 05:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VowlVOnHwTh6fwIAxHIe0aATqP59Ww2WwB63U4ZOWes=;
        b=pSh+Om23k5o2soOGnCrLI1M5HFo22bkt/dnNYJoCOOBtZLn3pgjmBoeNNzHg9tkDXE
         x3LS9IqGwpih+FdrZSCtknM+IEZAud6D/fJ3UK3MP8DEXxPQHQgVty7c8eYntQkGELJS
         1Tf7qyAY6vUg/LwAQSSzgCV5TcQJ7MBleyLRHQKXRhuq9fE3+eVcEciC9u1124mety1i
         ckvKW+A/A00BXv1+t9lUGa+fl/S0cqtfqFdMv+aW+tvdUh8Fp/P+0YOzlvXR2CK6FUfe
         /IW9wTXxFH7G74/KEXCP6AVRjlyQ+BlHQgKA3fgRSxmWNpnc3WSD9Dotr5ndXvJdr34j
         70Pg==
X-Gm-Message-State: AOAM530wcnaYm366E3/iEZLfhWjc1mSHCgoCT17phabtxnnAdYr+GTk0
        FwVqKg3Ursxk9wWQZdpLnq1G/RSxoAsb23ONjq4TwdUvY7YrXAOUKqPKPX5pSiGhzeAEu8aZV2Q
        XI3bffJZhd3byEktuoDj23bmF3sE+HHBSu3F73R7qOlcAnZF1
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr3731391wmq.83.1631017658784;
        Tue, 07 Sep 2021 05:27:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN3PfRE6+L1K67g6ewYU4vWSdNIvr1vNdsH6qFmi/JuqzzwcOU+VPDXX3AOLJKbFlugMmSHA==
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr3731373wmq.83.1631017658651;
        Tue, 07 Sep 2021 05:27:38 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.15])
        by smtp.gmail.com with ESMTPSA id r25sm10326524wrc.26.2021.09.07.05.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:27:38 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: exynos-audss: Make use of the helper
 function devm_platform_ioremap_resource()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210907085100.4152-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6e1b964b-0986-af51-b380-270aeb44e6bd@canonical.com>
Date:   Tue, 7 Sep 2021 14:27:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907085100.4152-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/09/2021 10:50, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Just send it as a series (git format-patch -4 HEAD), not one-by-one.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
