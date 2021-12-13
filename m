Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADCBC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 13 Dec 2021 11:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhLMLfp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 13 Dec 2021 06:35:45 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:46910
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231875AbhLMLfo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:35:44 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 57EE5402EA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639395343;
        bh=nodS2e5NVXARFQhFASp0sR/B08IqmjP9+rczCuTOhcc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jP+sIBIbtTXeXdtGe6Z3uViAIsPK5XDGI3dMksNklruTtjGAtvxSu1ciupGjg194Q
         NgOIAejp6CVvq9n01Odt49m6kkgu0vHlH4sT0vvUlzO8vpk5469lUhd1Kq90fSUOXa
         imdNEydHb8NQbDfrCQvJ2VOoxzyL7t8O/GlSG3+3i+tMiUNLDAjQZ4KpbicV+4i03/
         cdZ51FfAelW//hFxe40pZ7RPZFRn0oAjoK+2GZj2nk2p3HXaIASe6QtLHQHGx+j/dr
         qMDmH0TnzwxG1wFeG/slD0XzIwrjkLIVh+lwvwdPd2cYPZLcBwkANMdczEHsXBLoHe
         air7rn9tfWc9g==
Received: by mail-lf1-f70.google.com with SMTP id n18-20020a0565120ad200b004036c43a0ddso7377076lfu.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nodS2e5NVXARFQhFASp0sR/B08IqmjP9+rczCuTOhcc=;
        b=5TEUfsG/KMGWeyBlASjfUKyegTTvVEw0/AoGi2H/gk4jmvZrxe5DqJTy2H6Rzxz2c5
         9fnosbs2Lzs4pcrowhCmwpVRnTKC0XnRaFSW3oJxuqjUjidgIoMW3ATUKDaOpJ9cuvUn
         tjzqvA0wDwmA3YmpU+UYhme4QT3Zy/KgtKAm/ILerZUSyLELiQAUL9JF+QYfu3pDAfF8
         J8E7wVQhiCShUERHOabK60yKVMcPxcFocy9K1S7LLztLVfDKCy5BQS9CfeNLcrQHscDh
         T+pyONK3q60BLB9RAMLAFQW5N030dLonj9VE+GhupdgdNw6Ro/HDLNS3gKRUQcyjjHRb
         Zf3A==
X-Gm-Message-State: AOAM531k2iXwYfXQvo6Di9Iz0y7EuecIYIqXfPlXORNHT1t0g4FmbJXY
        eCDUGtRYALiY1h6k4YRUG7E0uvqvI5j5hugjuS3pq/g9eQM945yJqlhHVn5XXh7Fkqx0cJRtNJi
        mNRvGRBZqQBfOo+V6j27aW0Y3ctJc1g6A2aHh2axstsw8qUn9
X-Received: by 2002:a05:6512:3052:: with SMTP id b18mr28771640lfb.424.1639395342835;
        Mon, 13 Dec 2021 03:35:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxizuo0EmmUqOtuIKF+AISgFO9vIOvlswxjaOaiPNB9Xf/9cI6kVjlHrPIJfjCVRZnF1n/y6Q==
X-Received: by 2002:a05:6512:3052:: with SMTP id b18mr28771627lfb.424.1639395342691;
        Mon, 13 Dec 2021 03:35:42 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y4sm1440618ljp.16.2021.12.13.03.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 03:35:42 -0800 (PST)
Message-ID: <35d48030-dd5b-0ea5-20ee-f9ea08658197@canonical.com>
Date:   Mon, 13 Dec 2021 12:35:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 4/5] tty: serial: samsung: Enable console as module
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
 <20211204195757.8600-5-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211204195757.8600-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/12/2021 20:57, Sam Protsenko wrote:
> Enable serial driver to be built as a module. To do so, init the console
> support on driver/module load instead of using console_initcall().
> 
> Inspired by commit 87a0b9f98ac5 ("tty: serial: meson: enable console as
> module").
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - Removed the USI mentioning from commit message
> 
> Changes in v2:
>   - Added error path handling in samsung_serial_init()
>   - Added console unregister in samsung_serial_exit()
> 
>  drivers/tty/serial/Kconfig       |  2 +-
>  drivers/tty/serial/samsung_tty.c | 36 ++++++++++++++++++++++++++++----
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
