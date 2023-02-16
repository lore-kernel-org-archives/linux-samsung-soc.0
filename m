Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BA6C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Feb 2023 10:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbjBPK72 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Feb 2023 05:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbjBPK7X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Feb 2023 05:59:23 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F22338669
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:59:19 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id lf10so4201871ejc.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2023 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUO21HiD9AwPPk2yVyNNeKr/3WbcLbkpbjx6Ehu0Tmw=;
        b=D1XSSLIWGXwR9w6YIJRb6pI0ieOpzo5hYIm3tOAx37MZP8cTkCTkZq8cn6ppUH9GWg
         4DWCxcjbZrfko7IXHSmnybSJYvRQ9t11TWX03SzavoDVS6jD5rGwHzsVlncGeRqnR2L3
         ZDC7tlbaLKIoxfYpDGrr4iKyGU0C+JGf8zLGHWGB0e//hkCkY/MTtACWb1PzscxzpxvF
         znMZ/1FSdFeVYjSSN/lrgldYNS7L/qn4PYC0tFIO3jzdEv0TAuPOKtAJol3qaUD/jGF2
         3UhS0SFOZ+2+WLKGXzGe+VMHCej1NRocgiGu+dne4F6JLyZN9T7G3a98xM73+TRAGaSC
         msIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUO21HiD9AwPPk2yVyNNeKr/3WbcLbkpbjx6Ehu0Tmw=;
        b=ANvd216MhHeT9ZtYuo0mq5SoyzipbQZftIdbP7LU578dc786dnEraQUGKLlfEh/iu5
         hgI9/iKQPvfc/vVK+YN5R7jvYKjTXewDshD+VnmrUAHIdWz24rKgmN8dGSo9DtapFuwZ
         b80CfH/ywaippBbVK7+3Fcs3nLOb2TTF71cWan1OX00biFHWs1P+yltRbes4Uy6pFZnk
         +0YrjFghwrPcuqQKy8tB8PxDahg8oV1NCb8Avx+apeHGmR2SvujpFlsO8gZ+yBMrxQgF
         lHuZKeBIzMPsconfGpjmUKyGK6czYDpufi/hiW4qWw1/OrKTNdy/QCfCUBvFn/HhBuc2
         Pt4Q==
X-Gm-Message-State: AO0yUKWw97A0T9j8b2MkvCUqLcsjY2tIqX7BlrJWNppxlNgjodp/ALud
        uN1Z0ZMqASxFQXpz/XIbAyMACg==
X-Google-Smtp-Source: AK7set9kqT0KWfYBEgpPpqbE3mXf//cnTThDSrhMXoaZ2Z562G5Cb5Fwxv17Ew0mW/1P8G+LQlFOxg==
X-Received: by 2002:a17:906:71d0:b0:8ae:f73e:233f with SMTP id i16-20020a17090671d000b008aef73e233fmr6938108ejk.32.1676545157943;
        Thu, 16 Feb 2023 02:59:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t22-20020a170906949600b008b149bdacedsm670578ejx.12.2023.02.16.02.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:59:17 -0800 (PST)
Message-ID: <4e7f3fe5-3a5e-d4c3-d513-642184bbdb23@linaro.org>
Date:   Thu, 16 Feb 2023 11:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/16] PCI: exynos: Rename Exynos PCIe driver to Samsung
 PCIe
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Shradha Todi <shradha.t@samsung.com>, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co,
        pankaj.dubey@samsung.com
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121411epcas5p25efd5d4242c512f21165df0c2e81b8bc@epcas5p2.samsung.com>
 <20230214121333.1837-3-shradha.t@samsung.com>
 <d0d1db7e-e2a7-dddf-5c28-fed330b44cdb@linaro.org>
In-Reply-To: <d0d1db7e-e2a7-dddf-5c28-fed330b44cdb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/02/2023 11:55, Krzysztof Kozlowski wrote:
> On 14/02/2023 13:13, Shradha Todi wrote:
>> The current PCIe controller driver is being used for Exynos5433
>> SoC only. In order to extend this driver for all SoCs manufactured
>> by Samsung using DWC PCIe controller, rename this driver and make
>> it Samsung specific instead of any Samsung SoC name.
>>
>> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
>> ---
>>  MAINTAINERS                              |   4 +-
>>  drivers/pci/controller/dwc/Kconfig       |   6 +-
>>  drivers/pci/controller/dwc/Makefile      |   2 +-
>>  drivers/pci/controller/dwc/pci-samsung.c | 443 +++++++++++++++++++++++
> 
> Rename missing. I am anyway not sure if this is good. What's wrong with
> old name?

OK, looking a bit at your further patches - doesn't it make sense to
split a bit the driver? Maybe keep the core as pci-samsung, but some
other parts in pci-exynso5433?

Best regards,
Krzysztof

