Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67DAC07E99
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Jul 2021 07:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F81161415
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Jul 2021 07:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhGEHtO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Jul 2021 03:49:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47330 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhGEHtN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Jul 2021 03:49:13 -0400
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1m0JJL-000218-NX
        for linux-samsung-soc@vger.kernel.org; Mon, 05 Jul 2021 07:46:35 +0000
Received: by mail-ej1-f72.google.com with SMTP id hy7-20020a1709068a67b02904cdf8737a75so4113374ejc.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OUlQvFhnqw4yNB5g21FpiNDLoa74ksIlL0BX+hEIYks=;
        b=to+IcFHnAUsGibmXcPpehTPoeSP2AD6iazdA1SuxbdtOgfaUc43mP/MHBsyeCg9N8/
         wZBn4W6ZjzBljmfhYmjeAH06Z2T65Wid47dmE291cN69+I/4g2wQCf36fJcjzatutC3y
         pAneo7wGswXowREbyB9pHRTj1L0zyVTBjRXKZSvvFoL7Qein/8m20VNyGBSbv6Gavk9n
         l8HluW/ALLEciFFcn4BXylPD9X55AF5EECvI44P1FOKacA2cOGt6TUJQZG8V0UjQN+J6
         xiiu8AEBSxIqdnL0Kn2U0NQxosPqLZTQos6/3kDrNvpufDG5rHOlU690HSSB0ACBlzEU
         TUbQ==
X-Gm-Message-State: AOAM530+7Z4Jzt/szFvx7VV4/nX6dp1Lp+1EULpR7ryoK9QaP5VjQmc9
        oWyfTD2SYb1vfGm01x5PbjNg0+EBH80RnfoQJe6ELN0UHvgrjnR/42+puZU5iSHkri90zqfPRc/
        J3kX3Z7lPyAKOFW34QdJ22IZWssK878tCUeD09VlgoQKYXkb4
X-Received: by 2002:a50:fe08:: with SMTP id f8mr14916118edt.186.1625471195550;
        Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW6PoBTiPiuHziQf0PYt2MvNb01/YBP8mxrJfN2emEpQSWFsLcmPfpPNgmeKiK8cDlYK2oLQ==
X-Received: by 2002:a50:fe08:: with SMTP id f8mr14916107edt.186.1625471195398;
        Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id k25sm3450686eds.77.2021.07.05.00.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 00:46:35 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] i2c: s3c2410: fix IRQ check
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <771d94cf-5e82-0cb7-fb1f-5af2f0b10dd4@omp.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2a76179d-b901-b971-ea99-b68833dc56cf@canonical.com>
Date:   Mon, 5 Jul 2021 09:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <771d94cf-5e82-0cb7-fb1f-5af2f0b10dd4@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/07/2021 16:45, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
> 
> Fixes: 2bbd681ba2b ("i2c-s3c2410: Change IRQ to be plain integer.")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
