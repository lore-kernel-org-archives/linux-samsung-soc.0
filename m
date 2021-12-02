Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Dec 2021 08:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345698AbhLBI04 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Dec 2021 03:26:56 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47250
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233134AbhLBI0z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 03:26:55 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 47D024003A
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Dec 2021 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638433413;
        bh=rih9+w7cJ/cP8O3MEgR5q3w2LjhapFkCinNHQ4NLJ78=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jOwiw+vgdJQnERjy9M5l2EwG2GWvL2LivU7FPFXJv3wEnLl2Vrcj50kZfeX1qXT0P
         1QfDX1PVKkKuP4bhVmVDZCtLBVr1p4cf2W3L5tp7r8warzQhvvZ0L9RZ16lHOVCNDc
         bltupGro3BsUxuB6+T/44698sDoVSe77yUfthIiv8PHQVCKtou+4sM3st7mu9Js7sh
         MMr4NLchvZNJ6vEDAoqIbLlpF9fiAhc0bedYZYrRsJ6J8WYYVUhKwZg1xeSSbZojlz
         I5UWhYjEawkO7Ls7aLJowfCeam+ApJaKFdDLjJbUOYEUe90LDouZ4NA9UAZK0Wc3L2
         qXjyKA6kdBVhA==
Received: by mail-lf1-f69.google.com with SMTP id s18-20020ac25c52000000b004016bab6a12so10936310lfp.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2021 00:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rih9+w7cJ/cP8O3MEgR5q3w2LjhapFkCinNHQ4NLJ78=;
        b=zmj4GVm3JGmPx0uqJ6r67mz3jKkny7g/PMy479gqeZUixG2eQkw9AwtT1pRKOmdYa4
         dThHiwsD+UkK7TUuFmwzKGmFK2Uc/Oei8Ge110BLhTJFQwNItXqlGFQgv6nOcfRRWEdy
         PD48kJdXiPvEqQ2T8GxXXwBUqKAGNHBJ5eG9S9DVChzHlzzoRbp6HGEKFMBMOrGf1aAs
         Dzb/GoHFPAcwnSxizIaVqFWoMQ1B5TJcVBN1zlq5AGIPedX+7XRVTsbvzObX5BYuATsO
         gi1Ym+N0ssnWNV+5+qsG/FeSu91iEH55CcAUXpiXAm8wQ39cvto3OVej1B2Ndb2OKmW0
         9QvA==
X-Gm-Message-State: AOAM532jJ6WLMZ0lGGaDOBOGGtnn0gEWhpI4tcX7OsrTBn8+JoguEtp+
        zwVZUcmxNEu7KNcT73zYnwlotOaNUy/7Ct71HRUBKlHtTeTEiuEOKvEIRkliyo3TOh5C4592gZU
        vxjRS/41fOzlx6top7DTkOUZTqks3AVahSGaDUeoS+zHLSRrn
X-Received: by 2002:a2e:b907:: with SMTP id b7mr10589341ljb.214.1638433412711;
        Thu, 02 Dec 2021 00:23:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbtrpMycYj4T7vdYH6j9eMSJXr5g7vASolgaaRMdZOM3Tfa+moQ6wVZjCtS18xDIr6djTlCw==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr10589306ljb.214.1638433412488;
        Thu, 02 Dec 2021 00:23:32 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j16sm259128lfe.4.2021.12.02.00.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:23:32 -0800 (PST)
Message-ID: <48c50466-d2e7-45c4-caab-8bb215f2186b@canonical.com>
Date:   Thu, 2 Dec 2021 09:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/6] dt-bindings: i2c: exynos5: Add exynosautov9-hsi2c
 compatible
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
 <20211201190455.31646-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211201190455.31646-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/12/2021 20:04, Sam Protsenko wrote:
> From: Jaewon Kim <jaewon02.kim@samsung.com>
> 
> This patch adds new "samsung,exynosautov9-hsi2c" compatible.
> It is for i2c compatible with HSI2C available on Exynos SoC with USI.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
