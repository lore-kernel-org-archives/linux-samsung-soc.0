Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F98CC43460
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Apr 2021 15:07:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 253A6613BA
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 13 Apr 2021 15:07:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346490AbhDMPHo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 13 Apr 2021 11:07:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58802 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346478AbhDMPHn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 11:07:43 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lWKdO-0005qQ-EO
        for linux-samsung-soc@vger.kernel.org; Tue, 13 Apr 2021 15:07:22 +0000
Received: by mail-ej1-f70.google.com with SMTP id v24so1372745ejb.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Apr 2021 08:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BbLS8YFFiy7aQZZ6pW2QChOM2i4McA8DXTegdPkwtbw=;
        b=nz8fvXhpSjsU7bUfKB+jMQuiyc0eohO0G/VG9dN/jZtL1lCYK8Scq1MmPEjye8YtdQ
         s9nG4PcjRtxX8SZ07li3xvbLTLZmwm7/BFoZkVlTm+2kzOS80+PLTcnUPsGEcvFMMXRA
         98078mM6nbkV/0Tl99RgNtFrdg657Q3YLfzRrEUw+CLJD5YTHxTbSjXxqxr8FOE12Vh6
         TUwf+LEg2LkKaLk2cY6n1QU9lHil562aNBbsTL5QFnSbwo+sNsHug+IwmmcbjAAVUiYT
         HQIgIJnzvf4TM13IRV/28kztQUNAYKwKvYu1akXqwDtFvb+RvJGJAWkfiXSDafRXwjkW
         DiQQ==
X-Gm-Message-State: AOAM530hT8PWqR2cqhU4fcZqGm4pWW7jNJ0m3KWV/ukQXVdyPWwVJ9YB
        iCJFPK0usijmNaRc8UvJqTIQyQ7bUAf6cU40TtaTb2dLdSZ6RgVbUXf5jFpTGSKPKwfGIAvP1a6
        Z6yeivjXVw0PdmC4kouZ83iJCaQNFKt914LNOjPifFdcGNq6W
X-Received: by 2002:a05:6402:c:: with SMTP id d12mr34967838edu.100.1618326442153;
        Tue, 13 Apr 2021 08:07:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWppPmHJVhEQzMw3NoPRy3HSvan9DczQR6zow4e4/MKICDqAiBqgdCGfAG5MyEeiRhZhMW/w==
X-Received: by 2002:a05:6402:c:: with SMTP id d12mr34967816edu.100.1618326441990;
        Tue, 13 Apr 2021 08:07:21 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id r25sm9717507edv.78.2021.04.13.08.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 08:07:21 -0700 (PDT)
Subject: Re: [PATCH] arm: mach-s3c: Remove unnecessary break
To:     Wan Jiabing <wanjiabing@vivo.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
References: <20210409064920.1096367-1-wanjiabing@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1c1e4839-fbc7-b50c-dc25-983edf018e7b@canonical.com>
Date:   Tue, 13 Apr 2021 17:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210409064920.1096367-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/04/2021 08:49, Wan Jiabing wrote:
> There is a return above the break.
> The break here is unnecessary. Remove it.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  arch/arm/mach-s3c/mach-rx1950.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks, looks good but I do not plan another pull request in current
cycle, so I will take it after the merge window.


Best regards,
Krzysztof
