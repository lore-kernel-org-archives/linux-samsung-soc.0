Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCC1C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E242661260
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhJSQOP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 12:14:15 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59050
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229789AbhJSQOO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:14:14 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B9D563FFEE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634659920;
        bh=z7xBLmLcK2X0X5LnkmnTHSBeuEfqcw1Dw/LDIsv+Z6c=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Yy6sMLf10QPp+p7dsrHg2PmdQNn4gHZ5koJbLi8at3OGlYjSHhTWJJegaHXzEEOMi
         O10Us3rbJ8tIQpBNy/NcuYWG8JtgN7ahIpWgAYJKDftl2EEvmTlEz1KfiZk1VFT3if
         shPd6NWEL5jjWYheT+dZuSoOy3Kirq4ymnHiQOVNZYVktuiJyuZLVCD/UVovhsqSez
         WZbXeHgO7omPtD7x66LMDByzRFJ8cCyUyqJzSXyWlI5prhG8B/B9B7MyMZXBZYr5Ay
         6VuHUej+rn+l/S5lcxW0ndlFlcEdVWpDvAgBRuq/Be6Z3d4WKONq/DgOJeL/e4habU
         FF8THgsTSLClA==
Received: by mail-lf1-f72.google.com with SMTP id u17-20020a05651206d100b003fd714d9a38so1630132lff.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z7xBLmLcK2X0X5LnkmnTHSBeuEfqcw1Dw/LDIsv+Z6c=;
        b=cISOlEm/8vlhAsg4+f1UBsfVZCZ6O2cT3s4Mrkp5NidQwGZUfZ07+CrwPfMKk4P/Hy
         IlKgCE1SH7Pk7/Hn4FPSWdh8JXMuudsQZMyvz7V8mOYq3MWRZDgFG9eTnHv/2xdG/wbt
         dw3KUzkBl1Tj0yU8umqvanAhfQjE1phlbCg3Gfu2ex0InKotYXw/yHsv6ekQL7XAd2N3
         QH/hGh+AZjUUwh7KskaAK4pZrntkPN0qzMUKvQQS66pDQYw2fjfUBpzL79E1us++ALtG
         TBus48PqWOanyY0r4ww6oTmoT7cbikPkOsqLolyjekhWL34h+2i1O44qxNDJyoIt5XrQ
         orzw==
X-Gm-Message-State: AOAM532CqiKgXQoat2J6lyyaLq/WANrl3RFeC+tjNkJ3ZCPI+Mh7GiTp
        UsIrSFgReOQpV27g8GDG039tLQ+3Y/qrpNNIMsGiz4klGEj2o2zkzWB2lIV86mEiKH1xyl7YnLk
        VnzOsxuwXIg2LRYqNSYIZ0NBCILEPdEYOKe7FBokVwiZfaRAF
X-Received: by 2002:a2e:87da:: with SMTP id v26mr7525618ljj.187.1634659920222;
        Tue, 19 Oct 2021 09:12:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTg27Zf2509Smzn5DCvG7kNJj6uFchnd2mdxqTdR+kibwBRiaY/9ioxCcyspjAelLWXXAEUQ==
X-Received: by 2002:a2e:87da:: with SMTP id v26mr7525598ljj.187.1634659920014;
        Tue, 19 Oct 2021 09:12:00 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c16sm1837878lfi.180.2021.10.19.09.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:11:59 -0700 (PDT)
Subject: Re: [PATCH 1/4] rtc: s3c: Remove usage of devm_rtc_device_register()
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <85851ab2-af49-120c-ab21-b4152a2ba40d@canonical.com>
Date:   Tue, 19 Oct 2021 18:11:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019131724.3109-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 15:17, Sam Protsenko wrote:
> devm_rtc_device_register() is deprecated. Use devm_rtc_allocate_device()
> and devm_rtc_register_device() API instead. This change doesn't change
> the behavior, but allows for further improvements.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/rtc/rtc-s3c.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
