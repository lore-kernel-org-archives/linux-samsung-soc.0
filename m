Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEC5C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Nov 2021 08:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E91760F45
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 12 Nov 2021 08:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhKLIMp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 12 Nov 2021 03:12:45 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41608
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233372AbhKLIMo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 03:12:44 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B8EDF3F1CB
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Nov 2021 08:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636704590;
        bh=N0lgEvQGt1KLpLy11X2dOPKbOYo7U8IYp3IkLc+Sfe4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=fWurR8O3W7O/T0GhBRAV770vK4/uvOawof3vnCprxs6PpFpgra3dIBmjMneIAV/VR
         ik/N5qGkWdF8wx/D/XIe51CkuW9bCQ7RHiTa3/Y0ndu+4CcUSE00DQWQR7+hXPbzyF
         bjJw+mqjhNoqe0PCFgYyl4L1XEuMGT6OCqaEcbCOzVZIoj/Jv2jREZrTGlbIsfxw+e
         xyvTibNgxpOukXe3BwbuEyQA43dwyvEECworVGjVEhRzclWjHXft445AwSFYhzlspr
         I6YLYUMI28yWdWW3I5pEqcnsICkhChSROySS6F88SbnXtgC88LkwvzZaHHGDt+3box
         zOfT6N/iXbjYw==
Received: by mail-lj1-f200.google.com with SMTP id j11-20020a2ea90b000000b00218c174bb5dso2824226ljq.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Nov 2021 00:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N0lgEvQGt1KLpLy11X2dOPKbOYo7U8IYp3IkLc+Sfe4=;
        b=PnvbjU13qihQDFFUi6Qf+r+01ns5Xlcx8P5g+HHqzo8mq5NChHsuCPuV0rtwbO7Tcn
         uIt3BvLfwuQTOxHarGUwljZpE3/jKHQTQbMlK6gB4nWTBl5F1D8OZ1jFxI6ilxlNix9E
         HIkXissut6y3L+TAYe0l7iotwvrYs4hNtjUJQTshqJ81sgSpQyefLkSinYoPhpfDOLd0
         Dv00w4fhIqQisAeAwTlDbYBqHHNxa8yPyOE/rE9MLCIxnLiLI7EV47N+zv+cr55prRZD
         5E4PtqnN2jQFsbRrz1PABLQR361cbb0YGloxPpnlKbgCqlzJ64GdNinl3l3uoIJtGONk
         ng2Q==
X-Gm-Message-State: AOAM533z12NuRMl95/RC4p8Q5m6bkfIn+kCPEYSYBO6Jx1XpEGSohbqu
        v0YgnjuvxnzXu/nxqF7R7tN9/gNdvpeai6gbbHBWPdKyV/CT40DOr89w0eMfDkzWZarV5ssLfad
        dBUVGkwZoNRsZuHRzvShUl2Hlu/vYpfRTNzUQcf12FY8hCPka
X-Received: by 2002:a05:651c:1503:: with SMTP id e3mr13074835ljf.181.1636704590111;
        Fri, 12 Nov 2021 00:09:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrUNr1T5EkFtrQpcvNMsMHIHtqi+AWQMLU5dHvVzJ97JYsfxC9021l75RYC0KKSA8xJU/X3g==
X-Received: by 2002:a05:651c:1503:: with SMTP id e3mr13074809ljf.181.1636704589817;
        Fri, 12 Nov 2021 00:09:49 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a7sm346751lfk.233.2021.11.12.00.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 00:09:49 -0800 (PST)
Message-ID: <5816a13b-0ad8-450c-ff8e-2d646c7117b0@canonical.com>
Date:   Fri, 12 Nov 2021 09:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20211112010137.149174-1-jaewon02.kim@samsung.com>
 <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
 <20211112010137.149174-3-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211112010137.149174-3-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/11/2021 02:01, Jaewon Kim wrote:
> Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
> called USI(Universal Serial Interface).
> 
> As it is integrated into USI, there are additinal HW changes.
> Registers to control USI and sysreg to set serial IPs have been added.
> Also, some timing registres have been changed.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 135 ++++++++++++++++++++++++++++---
>  1 file changed, 125 insertions(+), 10 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
