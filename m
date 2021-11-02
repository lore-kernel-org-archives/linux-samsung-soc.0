Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B035EC4167B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 09:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97F3A60F4B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 09:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhKBJv6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 05:51:58 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60406
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229920AbhKBJvy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 05:51:54 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6B0FC3F1A7
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635846559;
        bh=QrINL26Fq3mxvitvfD3yGH3qJYhXNEC7YRh2TlZeXPI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ZidIcpIT/dzZutOzmYBOWIchiWSsy4TSFnBTh9apON4401WvLZWdbZ0tw2OmvE+pe
         lzeSu10aSJVVAnf63Mdz+m5tL71rVQ3vI4rRF6bP7fAMQwRlmcgkl9GbdKuaju3OTa
         fe9cTbv7FC3dOp9hIOCVS2L4ZxWmN91cPqFH3p/itxn/Kz19szWRyn5SOsq1S5fCcn
         SuoixzQZdmlgzNX35wKTC/Kbc+QbCGyTJ/jZao4i2pgbDHYxBQ9w+UH5h11YcBM03r
         7K5TNcYDM8EuXcTy4BRGuKr3A89WeuH3kOjYr4XFIxvGaJc4bIzOXYiJzBh2XmMZUU
         OCf0WAPoBCigQ==
Received: by mail-lj1-f198.google.com with SMTP id r13-20020a2e970d000000b00211a01c5f3fso7421116lji.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 02:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QrINL26Fq3mxvitvfD3yGH3qJYhXNEC7YRh2TlZeXPI=;
        b=rD14LUPLZBcXj/a0gJkDZiJ3U3RDcu6yKXqtO+1PlNS1JzbhY1+hDkwo572LKag0Je
         jrmO9ejJk8eM+fuZF3cSyT8xqQDgqoBWESaOLOCoP8ZhaRgLCethaXCpbmc/u6P42jGb
         ZJITr2gRaSqYcrvHMRQ155U0HiwFXpY/u1GOtjdrgI+AkO0deUmhiKL/bY8PGpxVL9z7
         ZTMbcji3FXMgAOR3BTKhJmdtgZp1996UblZD/jbelPH+y5p3eWS+jo8/LLKbfPiPjHdr
         VN1w8NIDX29+ssQJWOw8zGvlUHuc57rlFfW3xRoX+LU7kkjAuaRGN037/+T/bw9V/qDh
         vcBQ==
X-Gm-Message-State: AOAM533Jn5meSqe2eU7RR4+Lsz+oCNrKnNmAga8sYkXLQk29vzZVI4hf
        HLW7evQfGlGUxutZyJb/+Zfyr01SYI2tT/s7t57/qCgs7MIo7tbJB/RU/VJJOpWysu5swF207A/
        HXU8XSZauWImcahcaXlFQ/eYThROzTYpazEUehVgzi8abADeq
X-Received: by 2002:a05:6512:3d13:: with SMTP id d19mr32048480lfv.607.1635846558914;
        Tue, 02 Nov 2021 02:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZhL4Q7sws34mo0mTkJjCcGCaFI2kTdF+p8TepT7dcTH529ZZiddbbTUJajTFNBjzOa96HBg==
X-Received: by 2002:a05:6512:3d13:: with SMTP id d19mr32048452lfv.607.1635846558648;
        Tue, 02 Nov 2021 02:49:18 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a6sm287917lfb.186.2021.11.02.02.49.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 02:49:18 -0700 (PDT)
Message-ID: <4e3271fd-d804-ca47-100d-7592d7ce425d@canonical.com>
Date:   Tue, 2 Nov 2021 10:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 03/12] watchdog: s3c2410: Fail probe if can't find
 valid timeout
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> Driver can't work properly if there no valid timeout was found in
> s3c2410wdt_set_heartbeat(). Ideally, that function should be reworked in
> a way that it's always able to find some valid timeout. As a temporary
> solution let's for now just fail the driver probe in case the valid
> timeout can't be found in s3c2410wdt_set_heartbeat() function.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
