Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4069DC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 209E360FC4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237861AbhHDLsp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Aug 2021 07:48:45 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:44780
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237836AbhHDLso (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 07:48:44 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 957FB3F328
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628077711;
        bh=tMhbSJd33Y47U6GjgAsHtEsnbos4pp9tr5S63DrVWrM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=b2jnhCHOX9KjNPTOJLCdyttD5F1wULyw9aYwQ6fAW0MsNhc0sDjILimGvCIe0v+9x
         uEMSNJUP1tURr99vCLc/jA3oFO3+Nja/opRySg7Iusd9BRoiy+PqSdFqKKGjoZj7jZ
         sVzgUTBktCYrNUSPOzeQf92KfYRh27r15wvuFwck7jrx2oH539brEIeWTrv6fmdXyd
         ++/Nay5/cm253qCGz2zj/cjAgOi7iWxhOowdG8jhCGWDsV3xLMoeGH0IgyzkjNjuMJ
         5i2FB+Vkh6i1ZYEA3c8jRUpyZr9W6l31iCd1rZW7+ZM2rBzq2HqvmdDX/609RDDUMP
         3P9r78slj+ERg==
Received: by mail-ed1-f72.google.com with SMTP id n24-20020aa7c7980000b02903bb4e1d45aaso1305699eds.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Aug 2021 04:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tMhbSJd33Y47U6GjgAsHtEsnbos4pp9tr5S63DrVWrM=;
        b=f3svjPL4iNosz1B/z+YlEiO2ZzEaCVpXrLsDoJ+cnuGGMHwbWG1diOsWu4o2QnhRL2
         JBfMDpTcRaMC/Xx3W8mVlGqV+VfE4tLIUXBuRmTx2RiSSF7gxKEuTTMtsvsnWLC7qxjh
         hybnGu/nzDRtEAsvIK5BZOKyvh1SOVFWUudFNxYvGD1pqqA8O/3QTEwnU/DYZbZZ+Cyu
         WW2La8ljqb+gVGzo4+OFkxOP2Asm81v+k5S5jDVyPRyEqPeLqc5AAbsfbjkqexc6hywK
         bkS4DHQsJAKvJSscrEFYg2PNTQFw3ie8eiB2YUgtArYujESmZBORtTQXjfqvmcF/ruLp
         ObLQ==
X-Gm-Message-State: AOAM532p5vRwpwwuxnDb7vzKzxWzlDDo5a2PXjMYb2grNxJhHvmjY5PC
        FjlYeT2NRlKRZJvE10PB/uFwYh9WSg9eliBXvZ6ODSihmD4CDX6geBEQcXOlIgx3FylNyAfJFy4
        o3rwODiT+P++7ONuX3/8plrxcpX+LP/s5Q6rpu9t3QEeQ3W/L
X-Received: by 2002:a50:ce45:: with SMTP id k5mr31297888edj.168.1628077711187;
        Wed, 04 Aug 2021 04:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz1JuI2wwWVfNsvgCD6IontIiSgpJPdXAInWolV92t4U1jmScRlUPBnjegyq1MDUsGkv3GHg==
X-Received: by 2002:a50:ce45:: with SMTP id k5mr31297876edj.168.1628077711044;
        Wed, 04 Aug 2021 04:48:31 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id i14sm845463edx.30.2021.08.04.04.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 04:48:30 -0700 (PDT)
Subject: Re: [PATCH 3/4] rtc: s5m: enable wakeup only when available
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
 <20210804104133.5158-3-alexandre.belloni@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3dde6cbd-6822-ff49-51f5-0ab20db0c56e@canonical.com>
Date:   Wed, 4 Aug 2021 13:48:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804104133.5158-3-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/08/2021 12:41, Alexandre Belloni wrote:
> Call device_init_wakeup() only when alarms are available and the RTC is
> actually able to wake up the system.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-s5m.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
