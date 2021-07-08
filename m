Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4418C07E99
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Jul 2021 07:02:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFB9761CDF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Jul 2021 07:02:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhGHHFa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Jul 2021 03:05:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59101 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbhGHHF3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Jul 2021 03:05:29 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1m1O3b-00065k-SP
        for linux-samsung-soc@vger.kernel.org; Thu, 08 Jul 2021 07:02:47 +0000
Received: by mail-wr1-f69.google.com with SMTP id h15-20020adffd4f0000b0290137e68ed637so1584012wrs.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Jul 2021 00:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3f6AjuDr9DREq/BYb5H9OJJObGL5I+SYWgZP05BzVcc=;
        b=a1v1sCyzqppRkO4aNMcXUAT1IPWyOREwc2BN7d+HIsgXI3+V8+g+YTKu0T7BMJZR56
         snpPsDdrPxZh2Wm1U31NCejvFuuGnWpxdPTGOwXCSpAGhxqlCUw61dta6281Cnpr4uil
         rrhFjv1GAW1D4CdjHAcqCXNy9xpPhyd9qzBwOUQI1kDPIwildv3u9cDvIlz0G8YnMUF5
         lmUBNbafDeNjhrj67fnhO2g3XMt5GZ3sP26ozZQKATZOFUWuvzpsVbdeQgKrxmNCGzJq
         5H7dPxe6xWuOQeXxoL5Cyjw3FJNEvp2fFsCGvvKo+bmOSQ8GKaerq7IR6MKCdyg2T3nT
         mqRg==
X-Gm-Message-State: AOAM5316wgIe21L0Uy30rHIWgXSh2peqPzEdfiR3JBHvp/ySnZnIwZMY
        b+iCKC02XdoYAfksXAIayKtaiXvsC3Iq8hJ3SDzsrvcVE9FNXo5eefKdv44r10ojOiRJneWlN0I
        9zv7u6oQCZOYqVDUq2TN5zEQ0usy43LYwZX9iFIpbf4tCbDlo
X-Received: by 2002:a05:600c:3644:: with SMTP id y4mr3525078wmq.85.1625727767037;
        Thu, 08 Jul 2021 00:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/hWFlccAvYQ22p30X1RqIfOvCiR1jNxi8oOhZT6XSobV1yvvN4f5f+DV9uS9QzoXy2W9Cuw==
X-Received: by 2002:a05:600c:3644:: with SMTP id y4mr3525047wmq.85.1625727766822;
        Thu, 08 Jul 2021 00:02:46 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id p15sm1025526wmq.43.2021.07.08.00.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 00:02:46 -0700 (PDT)
Subject: Re: [PATCH] rtc: s5m: Check return value of
 s5m_check_peding_alarm_interrupt()
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc@vger.kernel.org
References: <20210708051304.341278-1-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b584f0b3-9f2b-761d-6c33-8ebdab9f1120@canonical.com>
Date:   Thu, 8 Jul 2021 09:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708051304.341278-1-nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/07/2021 07:13, Nobuhiro Iwamatsu wrote:
> s5m_check_peding_alarm_interrupt() in s5m_rtc_read_alarm() gets the return
> value, but doesn't use it.
> This modifies using the s5m_check_peding_alarm_interrupt()"s return value

Avoid "This ..." type of sentences and use simple imperative:
https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

> as the s5m_rtc_read_alarm()'s return value.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  drivers/rtc/rtc-s5m.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
