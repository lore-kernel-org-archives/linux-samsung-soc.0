Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF99C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 13:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1874561090
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 13:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241595AbhJGNfG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:35:06 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36598
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241580AbhJGNfG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 09:35:06 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EC6413FFE3
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633613591;
        bh=XOOtcMxu4VGplGw4HdBrnq8LT8wk3wMvDJtbbxYgvsw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=oXr0TuLEVYaA8nn9awAxnjCfnrynPzJZoYKviNqp165mVUGxe6djl5CGXN/2pG9vc
         cosj92LDgllLduMNCEEZV8bjirhnO4ZoQXjA3+sNw2Bb0xSVTnrtWC8AsDiww2cEeM
         yPUKhr4Xsgsnw8YNdCnYy/MzdfgD1axuHQS7DzgvGZvcOM5WJLYPSCB/xacYn09tu4
         DDc1023LxhOvkWuKIEOMHfX1xjKsbTBrJcdbnb6zAnou2lTAsXI3iKYUMZMITZpzNH
         iNQbKvuVhtTOovJTaad+s5DvfRLy2gq7b8HuT/pYvvODnPGMyKXl0Erg1+U3ld8Rdj
         F9cDl3vlrJauw==
Received: by mail-wr1-f72.google.com with SMTP id a10-20020a5d508a000000b00160723ce588so4703852wrt.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 06:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XOOtcMxu4VGplGw4HdBrnq8LT8wk3wMvDJtbbxYgvsw=;
        b=pv0KkBDJuFVFxnBFCotEasZVCOkBPeK7Dd18pqppLvNkkoO3peJbaxGnCQrEjdJTPG
         UHLozGE0ykN9nTO91NL66BQIWl+RZWClP+u10fKMm5g1ZE0uQTLNm6VUXbD4cExZMAmv
         Izr/QNUrV2KR7yBITjdYFfdhUyDwcOgnB1Xnm0QUzbNL6qsx7hjZsbPrKtfJReQNvmDq
         y7dp6keLWHvhIjGQTNMnGtgQRjMs0fVBqRnZdepnxrw8azlW5M0P5HN8UjnbxkXVqUbE
         bFgfXP3elExqbSEzgjvjdlfdvAUpXWjap+GG2lsX/Gp63yevKRBOuSqKpfkm9d4HpDjE
         HEPw==
X-Gm-Message-State: AOAM533IzFza77Jv9jzTmlkU5JQujCrRoFtOK/bMJYFExXJ5Ct1YdHbJ
        GLzzz06hsG7s+m9vyaQBx4/hU/H3F2X8pot5hxhfZ24ZDert2X5QbQqAsGPCk9J/tyB2d5HhDSW
        ocUHOh05TG2V4DBKvqXWYH6llRvr1YpnqNEzxXaeMF7bMxm4d
X-Received: by 2002:a1c:4487:: with SMTP id r129mr16396832wma.127.1633613591678;
        Thu, 07 Oct 2021 06:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjsCDvHGtPoTWQUiPu1xD+rfOLwo1X6CpLXbYUd/gRjlfYdJKXG9PE5H5BcQatFGmrqVvqCA==
X-Received: by 2002:a1c:4487:: with SMTP id r129mr16396804wma.127.1633613591523;
        Thu, 07 Oct 2021 06:33:11 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id y1sm13474952wrh.89.2021.10.07.06.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 06:33:11 -0700 (PDT)
Subject: Re: [PATCH v2] tty: serial: samsung: Improve naming for common macro
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211005095800.2165-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e2e8cf83-b888-9472-c25d-03c4068e25d3@canonical.com>
Date:   Thu, 7 Oct 2021 15:33:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005095800.2165-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/10/2021 11:58, Sam Protsenko wrote:
> Having "_USI" suffix in EXYNOS_COMMON_SERIAL_DRV_DATA_USI() macro is
> confusing. Rename it to just EXYNOS_COMMON_SERIAL_DRV_DATA() and provide
> USI registers availability for all Exynos variants instead. While at it,
> also convert .has_usi field type to bool, so its usage is more obvious.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Converted .has_usi field to boolean
>   - Used true/false instead of 1/0 values in
>     EXYNOS_COMMON_SERIAL_DRV_DATA() macro
> 
>  drivers/tty/serial/samsung_tty.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
