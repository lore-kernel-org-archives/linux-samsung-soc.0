Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA34C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 08:04:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 944616115B
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 08:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbhJ2IHS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Oct 2021 04:07:18 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52478
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232353AbhJ2IHS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 04:07:18 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2F7DB3F19C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 08:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635494689;
        bh=gORZX0yVzoq2Pz3qmNV7v4k3dxqbLEeJY96EVFHtvGw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=A9+qlYg+pnHiTo6U1qfzr2T6F/HQg0173/8EGOsQuIv0b+2S0wpnaZemEt7tzDCf2
         F1srM3lcIrdfLKnlKGxGkpJBe5Cc8LorXseEpVFkzfCCHKqlO3GVf2qLCbCGHDExab
         asv6r/8fm/hfgr5bYsC0WGot6RrO8xNu7E/8gr5dWgLWrWAp6IBIfroR33/o66wDyg
         yBoPRsAV2SU5+p5TL+BdzXx5fJOBtbNa+YoQvzVKjtg/JTm7VWc+xDEAljPu3Bu6Jj
         f0L1/L5FY6st7QWTFrNIxalQONV21AMQdkueGIsS1OM2sJKmLHckZ4cecx9IVxnPq7
         Nhauvb8FS6q0g==
Received: by mail-lf1-f69.google.com with SMTP id d5-20020a0565123d0500b003ffbadeb642so3809804lfv.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 01:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gORZX0yVzoq2Pz3qmNV7v4k3dxqbLEeJY96EVFHtvGw=;
        b=OrKD8pL6AyiQd9pD0ugM2PJfKWwqU5RqkPrP4qOc1l13XPL1Lc24BNj2Q1BubxxSfi
         DCs+0zlInH8wOQI89csoHNHlECeAGDtzpKLs/18veSGVyYCpWlOL0tv8wF9vbAPh5dJ0
         w44Ey23DmcjuEQNOdhWE1c652GAOHPPySjj31xDNe9JtHAU3XpDFAGM7Wx2z6XyoeKnZ
         wVq0LiQeJYN/x7gUY91rDMQHFkuoQpgLMREXPzXsqBs2cQDpYmDHiILdImCmG/Ap8lHJ
         HEXsmBAyp7blXYXy4rwstPwcHTnZeFvShPLtIr6JHEBIz5qUma+H0Y9NmSNDTMxkkmqL
         S+vg==
X-Gm-Message-State: AOAM532xvyz7mQWMWUMD2wRrt5hVH2eoXp1UhtMdraKph+R4YOm6ctOj
        xZ59voYUS6NzJPXeKKoOxn62GMZ4QEoir2ZyTZ7kdU6w0CqqxWqjZdgQy+rrL4fJoqZI9eEe9Kq
        AC/DpU+ALJLqKo22RmAFshM2fxTl7DPwJYtDB2INQnz12btu4
X-Received: by 2002:a05:6512:114f:: with SMTP id m15mr9740359lfg.140.1635494688393;
        Fri, 29 Oct 2021 01:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbyLMzs+ms2kQOLdOYd2/yiv+HtnDZo2M293OptXi22K4l4nItsFMCPCA4hNH+rhY4cNTzlw==
X-Received: by 2002:a05:6512:114f:: with SMTP id m15mr9740342lfg.140.1635494688236;
        Fri, 29 Oct 2021 01:04:48 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c24sm537891lfc.155.2021.10.29.01.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:04:47 -0700 (PDT)
Subject: Re: [PATCH 3/7] watchdog: s3c2410: Make reset disable optional
To:     Guenter Roeck <linux@roeck-us.net>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-4-semen.protsenko@linaro.org>
 <b9c33def-6b12-1e5a-4449-b1e0869a0e3a@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2a5ff8d0-c665-e25e-cb40-51326db2e26a@canonical.com>
Date:   Fri, 29 Oct 2021 10:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b9c33def-6b12-1e5a-4449-b1e0869a0e3a@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/10/2021 02:16, Guenter Roeck wrote:
> On 10/28/21 11:35 AM, Sam Protsenko wrote:
>> Not all SoCs have AUTOMATIC_WDT_RESET_DISABLE register, examples are
>> Exynos850 and Exynos9. On such chips reset disable register shouldn't be
>> accessed. Provide a way to avoid handling that register. This is done by
>> introducing separate callbacks to driver data structure: one for reset
>> disable register, and one for mask reset register. Now those callbacks
>> can be checked and called only when those were set in driver data.
>>
>> This commit doesn't bring any functional change to existing devices, but
>> merely provides an infrastructure for upcoming chips support.
>>
> 
> That doesn't explain why the callbacks are needed instead of additional
> feature flags.
> 

Or why not skipping the disable operations if disable_reg is not provided?


Best regards,
Krzysztof
