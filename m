Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6264C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Dec 2021 11:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhLMLAb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Dec 2021 06:00:31 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:45272
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232422AbhLMLAa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:00:30 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD0CF4003A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639393228;
        bh=oPxIYppN3M08WPSh+FUwx/WTHd0f19tpTgpTR+J0vso=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=QEJQT1gCS2301OpKRzovG+KaKoPdq+9rSYdbrqwfp1g4lZ5rPHvFfawU2nXA4gcad
         1jvbgAlhf6lTtvuO4odJKuhp65uIlnMmp4c1OkIOf5FSrB5Cz6wd+alrsFaJExAP+3
         OrTkiIclSBI0FKoSiN/1z4XmS9oOnjV56NbYbUoAWczYAAI3GryG7/wdwqCfOGqKPe
         jQAY7M0mLHbUtkECLKaMKlT/hL0BSs84OuSvW8VV5znc09TeHesCrhi994hxhpk+lw
         Hi99iBCkf7pP4zmJT5iy+Clp7goBhHnm06Q8ucHarinHCYT1CrpEtKeX5A6p0lafLX
         g6BdG2EQaDSUA==
Received: by mail-lf1-f71.google.com with SMTP id e23-20020a196917000000b0041bcbb80798so7345043lfc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oPxIYppN3M08WPSh+FUwx/WTHd0f19tpTgpTR+J0vso=;
        b=vzzem1ZXMOnsiT6Y34eD0fMi0FeWaOqxPfHPMV1w18A+QhyIQSaL3/28VugcihVWgU
         yaisiwqaGL+lGxs98DzJo7WHMD3+3e32l0kd86IiwiJNcyTzgfAiUu/HsgwM66l/Mv1y
         2aRe3Gd9LRUfddSH2WQYCXgYf+jyzV4JH69JgOsCvO9ryYQnimyWEJ8Wh0DLT7bMkGMd
         Q6FmaYs/MA5OkTfbT/6zlIZYyGs6er3auali6Z2OuY40U3RuFtkMRjh/bLqIE1z/+LIT
         ADjkjnT0NxRu3dSnE2ovnbusC81vJ/BO0d4C6ysQwJilxD1zNCImGK8ueMwZq6YQys9T
         TKqQ==
X-Gm-Message-State: AOAM532VSs/DFyRm/StF3pZriIsZ6jBuqMxnQzg+rFpKukNOy/qQ+Bck
        lSd7KcCRJm+JUOp7x1TRSul2iJWtfDYxo5QwUzs494M1pfkg+OtsVWFLHJH7FEKPKjqLYLmFc91
        kG48IqoKfe+3LdK9xRRdygbeMKqibHMXfjhI7FVceIj3zTgUS
X-Received: by 2002:a05:6512:c25:: with SMTP id z37mr27246227lfu.160.1639393228061;
        Mon, 13 Dec 2021 03:00:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAhZVupAQj4Ctos4E4tzeNhHXTV3N6ad1L0/m+9uXiWRs4tbCEa22HF2XhyXJEMAq2lBo4Dg==
X-Received: by 2002:a05:6512:c25:: with SMTP id z37mr27246200lfu.160.1639393227812;
        Mon, 13 Dec 2021 03:00:27 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g10sm1388745lfv.113.2021.12.13.03.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 03:00:27 -0800 (PST)
Message-ID: <e9472cec-7aca-92c4-6184-f442c0f88d56@canonical.com>
Date:   Mon, 13 Dec 2021 12:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 3/5] tty: serial: samsung: Remove USI initialization
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211204195757.8600-1-semen.protsenko@linaro.org>
 <20211204195757.8600-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211204195757.8600-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/12/2021 20:57, Sam Protsenko wrote:
> USI control is now extracted to the dedicated USI driver. Remove USI
> related code from serial driver to avoid conflicts and code duplication.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - Spell check fixes in commit message
> 
> Changes in v2:
>   - (none)
> 
>  drivers/tty/serial/samsung_tty.c | 36 ++++----------------------------
>  include/linux/serial_s3c.h       |  9 --------
>  2 files changed, 4 insertions(+), 41 deletions(-)
> 

Hi Sam,

Does this patch depend on USI driver? In cover letter you did not
mention any dependency, so this can go via Greg's tree, right?

Best regards,
Krzysztof
