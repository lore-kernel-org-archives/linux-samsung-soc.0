Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950F7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 09:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhLQJfO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Dec 2021 04:35:14 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41816
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231667AbhLQJfN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 04:35:13 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 560983F1FD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639733712;
        bh=z2ulb+DVZsgqJd2LDgGlq8D+/PB9tFXsgdrZEe6FKTw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dGr7HKPDvmMNTlGHP350Rq2sxz2mYrR04S0Mb2aUqxNrrYQHJpOd19+199fdLsNRM
         oIkCexFFiGFG5hojPV+UYl40F2UTTh1G7EHQXoV0u86Ri4P24pynJ2LSzazIHTpiVQ
         xCL5nRzSqPgQhZIAKYCtY5of+LHpx1dkCDLRnbe5zSblblqhg8U1nX3VgE2Ew2e2zx
         3i6XBjG+d1OXSCgNO1w6EHu5mcltPiyZHhCKwxNW9iOi0oLticnd95aW+sVbYki2cu
         nbagT4IvpyTfaipv2uTncbyI2WdEIhfS2mpM9/bLxI3bh9Os95Lmr2h1IKV5NQ7SGg
         x4w9a/fkK66ow==
Received: by mail-lf1-f72.google.com with SMTP id a28-20020ac2505c000000b0042524c397cfso792676lfm.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 01:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=z2ulb+DVZsgqJd2LDgGlq8D+/PB9tFXsgdrZEe6FKTw=;
        b=VF5uyZeAOiWgnihYGGwuFUsq1pSNQnD0viaUYFNN/zbKHQAJIVspILruaE8pZk7US0
         btMq68YO91uvvvKyQ2GGfVax7CiQ4Z0ey4SxxsV6nU3Vz3l7eFQ0HEmY1fSLjVs/bNWa
         6l9YmDvqLogAfnuA2H5J2HdwV6TFikJwtFnuvNpciQEF/VgGhXZ7Wadldnngpy1C+RDx
         owt/PC06/RBA3wK4q+AF3h0OE1UC8v4L+rnH/z7SnY3RPE8sdJ88a3zynIVXIgR4qsfW
         Tji2GGS6/oshPmkhPYs5jXv9qcY2N/okkJ1lLAxey6bzRiydC4ZbtjBe8KE9VRj5+tO3
         D/Hg==
X-Gm-Message-State: AOAM532hctIrHmQ4IggbXqE4ldFeCi7RySsviahro5i65/8KhX6Mg4l8
        A82m9eRiHg+mfel5LL52ILeozeqwW0jrRqQE6+aGhu+dJ9MbEo/zNQCmeJgwp3s8ZH98nJrEakM
        /UIQyTkL0h8uHkV5NJimJygLYgCZPCS7yg7URbKmF0rp18Izw
X-Received: by 2002:a05:6512:261b:: with SMTP id bt27mr2134401lfb.68.1639733711852;
        Fri, 17 Dec 2021 01:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3vfcxbokbMTir1a2F1ktl93PTYnZK69spGTwWf5wxnVgnRpbKDs2qjbIy8UtGLc3PLoeRVA==
X-Received: by 2002:a05:6512:261b:: with SMTP id bt27mr2134385lfb.68.1639733711553;
        Fri, 17 Dec 2021 01:35:11 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w15sm1300450lfe.245.2021.12.17.01.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 01:35:10 -0800 (PST)
Message-ID: <4e0ab991-1149-5e40-2109-d0a2405dd7de@canonical.com>
Date:   Fri, 17 Dec 2021 10:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2] watchdog: s3c2410: Use platform_get_irq() to get the
 interrupt
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211216214747.10454-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211216214747.10454-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/12/2021 22:47, Lad Prabhakar wrote:
> platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> allocation of IRQ resources in DT core code, this causes an issue
> when using hierarchical interrupt domains using "interrupts" property
> in the node as this bypassed the hierarchical setup and messed up the
> irq chaining.
> 
> In preparation for removal of static setup of IRQ resource from DT core
> code use platform_get_irq().
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> * Dropped goto and directly returned on error
> ---
>  drivers/watchdog/s3c2410_wdt.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
