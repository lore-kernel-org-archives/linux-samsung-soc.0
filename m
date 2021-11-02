Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE51C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 07:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B81DB60F56
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 07:55:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhKBH6K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 03:58:10 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41684
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229970AbhKBH6J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 03:58:09 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 671BB3F19B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 07:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635839734;
        bh=TL9ujWaRC5QrK/omsBGAzgL+mAn1UaLwIFZhjmwNN9I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ExQCg3V+trrItHD3VZ6u7EPN285MG1j7302uaICCX+DirvLS8Qcnxusodz+LCKh/3
         euVrH+Scp5HK1zKc7hwRgOYoaID9vpyA0zW6poT8k5pNuoSDS8FFJj0WM5BMUAFVHq
         vlL90A6KAd9wKzQlyccLkbCtN0efyGwuPWhK+4zIeEVvMpNx/B+MenjIWetoBoMFyp
         Y3SdVfmM4ANZyz4K1+6aNJQMzbqX4ad+n/9XzRaC2mgpfjpOL4Iil+BOcsj81dh69h
         wNs//havHbZeS3ODg5DDVvdy8BcYzIJsrudZD3WCpKpwV0rmr/rZ3IMWlTKUiPuMsk
         qDgA4Lz+KYjkA==
Received: by mail-lj1-f199.google.com with SMTP id h19-20020a2eb0f3000000b00211a00d15acso7324850ljl.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 00:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TL9ujWaRC5QrK/omsBGAzgL+mAn1UaLwIFZhjmwNN9I=;
        b=bKA9C2zsTWobMIFFSo5OfNEWF+BgRaf6crJ0zVnO1hRITXQ7HB3TBhhOKKkFb9Pp4V
         x++4fTHB1Pl/GJxi/jv+1eVjtxV5MF6ZcgFqcH+9EKXqiFEDgWOtMNX3280pFBOX93jE
         KZxSu0jo6xv9bSF93J/fx5ySR4A355HVfqFKMwV4ohLNjVwkOWe6rLHjXSquxkEAqd42
         UDjdlrPiHYujLBKafYwtFLqTJ0LT1dz3pELPd11BVDTKri4nAAuUydeLw1wlhF3hgy4t
         xYPE/S3AZxsZXCwCyXE5iz13F/uXP1592l15fH3IJatRqXd6USQUHt73XiKo2SXog2xj
         UpWw==
X-Gm-Message-State: AOAM532eUzAz+QwdJJlJoGLQI3cdcYkXy0h8Qr6dGVXbZ6OIJBT6g5Ju
        2uNDfSnzmin8Houq1/VaHiTqHEoYNArp3PAE9CyiJaBnlRQsn8xdUnpunueptz6X9B6zHFjy1b9
        +eMRkqGd6mqTJwBc6Uq3lhRjxXB0TkOpxOrwBJLE3xQSB3UUd
X-Received: by 2002:a05:6512:b83:: with SMTP id b3mr32712043lfv.654.1635839733924;
        Tue, 02 Nov 2021 00:55:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWfHYARD0cMK/UpHT4OBoPI1WgrZQDQUCrOlg/dE4Y6zJh9PI9MVX5Aw/N+Qh4RKsTqWkJwA==
X-Received: by 2002:a05:6512:b83:: with SMTP id b3mr32712035lfv.654.1635839733798;
        Tue, 02 Nov 2021 00:55:33 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s1sm111943lfi.124.2021.11.02.00.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 00:55:33 -0700 (PDT)
Message-ID: <a7697cc9-1872-d466-0fb7-683df9c46af9@canonical.com>
Date:   Tue, 2 Nov 2021 08:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: samsung: Document Exynos7885
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211031231511.46856-1-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031231511.46856-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/11/2021 00:15, David Virag wrote:
> Document compatible string for Exynos7885 SoC.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - (none)
> 

Both patches look good, I'll take them after the merge window.


Best regards,
Krzysztof
