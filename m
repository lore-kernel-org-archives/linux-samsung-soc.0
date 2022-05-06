Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA88C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 07:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389724AbiEFH4S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 03:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389648AbiEFH4R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 03:56:17 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B5E67D09
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 00:52:34 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 129so3935814wmz.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 00:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gMeYUcunQ9s7ulEnRlF5vKDKL/0JjyKSw80VuJAbcaY=;
        b=Aho85y8yggkvIcNTBvN2ySStCMWKvXOE++5WTQ1nWsY/APWLTtz8NbH/T8+AL+uk6i
         HYEV16PfXYgM6s5O9OkqrxTXt0BORdJ4Bp+CPpblnkwETLcEwUCuS93cspfSW4hA4mNS
         0LnCc2qsyRVru3A8K1oS9cqXLLWfJUG+36OhVF8BVN/XORdx/fwDWCZPggPxUFnUCIJj
         bHT2nHVGj88c/v81JCkZTfhANHJZ1pCwkz/5OQ8A1FO7SE6oywpfzNoTDIx6GPV8HVS5
         i4bg70ObD8nDHrEItV+W9v89StkToAKyD/j3J8kUEJdpar+pJdFD3/e1HIhM7J3ZGdbw
         +70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gMeYUcunQ9s7ulEnRlF5vKDKL/0JjyKSw80VuJAbcaY=;
        b=VcDI6MG6hkIjNF3bvUk8urFNdfElSvEylo2L3qg/evA28xyDBkYEPAffBNkA04s9kL
         nj7U21jd3hD9oLAbM8ncn10gJzT8HvjVcV1pZ46qX0ll5r/V2onVMzc/w+agtJb6MdN3
         F6ZG+iKtPI6ndd676e7gwv2crZIIoxTL7/t4r9lTBvU/Xyb8jThsS3l+nZNdYCqRIlSq
         WLSIopdFQXSf71521ucVT9PDPoTZntLspLhsP4faerfIBo1QYhx459uTEt5Km/YyyUmJ
         68nKo6qkiSTodHgjIviZhmTRyyxirFdgSSwjGG0nNPT6T9fWOrDQO9c+e3Tj2Yhh1p3E
         Uulw==
X-Gm-Message-State: AOAM531DeKRNYkOLBZQ5ekARo+RRl522j1m0G3JVF7jwnbDLqH47zUMM
        DS0duCeE4dZz5iBPGu5j3FxxTQ==
X-Google-Smtp-Source: ABdhPJwbl8yjl/Xxp5ORYcUlHPMyIQHV5om0GxDNcFsIzsx17MOQuyljt/6IxM7sSwEamGITfOqtFQ==
X-Received: by 2002:a05:600c:190b:b0:392:95b8:5b18 with SMTP id j11-20020a05600c190b00b0039295b85b18mr8490715wmq.152.1651823553220;
        Fri, 06 May 2022 00:52:33 -0700 (PDT)
Received: from [192.168.0.223] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u26-20020a05600c00da00b00394517e7d98sm3291109wmm.25.2022.05.06.00.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 00:52:32 -0700 (PDT)
Message-ID: <60612719-a41d-3523-0109-2f2406d31d6e@linaro.org>
Date:   Fri, 6 May 2022 09:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] i2c: s3c2410: fix returnvar.cocci warning
Content-Language: en-US
To:     Yihao Han <hanyihao@vivo.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com
References: <20220506073134.6544-1-hanyihao@vivo.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506073134.6544-1-hanyihao@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/05/2022 09:31, Yihao Han wrote:
> Fix the following coccicheck warning:
> 
> drivers/i2c/busses/i2c-s3c2410.c:388:5-8: Unneeded variable: "ret".
> Return "0" on line 551
> 
> Signed-off-by: Yihao Han <hanyihao@vivo.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

This was already reported:
https://lore.kernel.org/all/0d1a0027-e74d-9f07-3b96-372b5ca14ae3@canonical.com/

Please apply instead my previous suggestion.


Best regards,
Krzysztof
