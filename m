Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93543C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 10:17:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B2C160F58
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 10:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhKBKUE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 06:20:04 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47456
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229720AbhKBKUE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 06:20:04 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EED7F3F1B5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 10:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635848248;
        bh=qFp3q5hZCO/r7sj/TH7x8r3NQRA3y1FJzuby+NMjG4w=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gfcpNdnUer48N+OAu/NAs8rgx8oafm5+lD08FD2p9xiGztomWlxyQuBPTBz+Y9SEB
         d7PabJBnsXMGupavSRQo7MF3WiB8W+5/gvA9EdPPP3RR7oU1d4ndg8dLWjMe0t1awV
         v0KhrqTUfzUHxCszICZkZaQ7vcGU9rxxFxtRFpsJHzUs0EDzrYRpWU945QJalpvi6R
         ESS2QnqP6JZYYAmf5vF+auWS4N8h5Q+iTCoNXosin++0CYJMZek1ySEJo6ZTu41RNN
         3hx5Dq/tx5bmfM0s2fko4Gn7e03k6cNlTrIMTmEmCx0h8Y67IDLBYoOhlrRt6uLpQY
         lipjuH5X1YIPw==
Received: by mail-lf1-f69.google.com with SMTP id m12-20020a0565120a8c00b003ffd6fa38c4so6014859lfu.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 03:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qFp3q5hZCO/r7sj/TH7x8r3NQRA3y1FJzuby+NMjG4w=;
        b=jfq1wp5pBo2tRKv82YU5+any4rKPW5JCzeSW2PGTiLsCyjtAWl17YyFm3bARtXWXd7
         74iuNIRESc53F7G2xdD9UWOxWUHEtws9c4XRos9dXg6Fc9wtMyj9bY4d3KX912fs992Z
         CNc4WhkuWHiczj/kK4LYticmBbUNO9BQtOrMZV0NFewreIC4dEnkU2vh6v1+7Dp9hdSk
         4bF/EPdWc3mdGinhxmlmk0K366Ecci/2Dc50/X0TP+Vnb51gpMMzzdy3f1Yv/t2z0AEe
         9m0pH/KYbGO902Y2N7mHMXsbWfvGwlLDcjUtxzBhQVWj0XvC2ML3yfih9GC0WPrArHmA
         04ng==
X-Gm-Message-State: AOAM531AAn6vxXyZHvB33//VNmH+2FL4+DfziFZ0ayBhGIyQOu2vbxZu
        2OgnO2LOObUBqvzs0QFH+SelNorz7klDcVaW2tas1iF+XcRXisGDbukuXZxcSqEWHVZIfwjJyV7
        jZA/z8f2fbQjTOyIcOFSvqTiw/lm2hYDBc4Ete0k/1t6QU/Zx
X-Received: by 2002:a05:651c:2103:: with SMTP id a3mr22674500ljq.435.1635848248393;
        Tue, 02 Nov 2021 03:17:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxRLdyqumT/LhScAMJcZXTsrzaGJSgFs1mm13/XjJYvZICtfk8wqa9hvcNjGfVdWe7t6j9bw==
X-Received: by 2002:a05:651c:2103:: with SMTP id a3mr22674460ljq.435.1635848248128;
        Tue, 02 Nov 2021 03:17:28 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f8sm1648313lfu.5.2021.11.02.03.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 03:17:27 -0700 (PDT)
Message-ID: <3a9b2a41-03ba-56fe-dc6b-906fa948b6b5@canonical.com>
Date:   Tue, 2 Nov 2021 11:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 07/12] watchdog: s3c2410: Implement a way to invert
 mask reg value
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> On new Exynos chips (like Exynos850) the MASK_WDT_RESET_REQUEST register
> is replaced with CLUSTERx_NONCPU_INT_EN, and its mask bit value meaning
> was reversed: for new register the bit value "1" means "Interrupt
> enabled", while for MASK_WDT_RESET_REQUEST register "1" means "Mask the
> interrupt" (i.e. "Interrupt disabled").
> 
> Introduce "mask_reset_inv" boolean field in driver data structure; when
> that field is "true", mask register handling function will invert the
> value before setting it to the register.
> 
> This commit doesn't bring any functional change to existing devices, but
> merely provides an infrastructure for upcoming chips support.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - (none): it's a new patch
> 
>  drivers/watchdog/s3c2410_wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
