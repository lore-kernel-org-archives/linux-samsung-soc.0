Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B13FC43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Nov 2022 21:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiKHVpB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Nov 2022 16:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbiKHVpA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 16:45:00 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88682205F0
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 13:44:58 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j16so22978954lfe.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Nov 2022 13:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7GvA9tWHY9AZLa68stWjC6ce95xZqCDLqklXANIaMI=;
        b=FDTIpogtFzwz+utu1RvLlPJwx0Ac3AjlCx2mmoVLjD0dF7IjEEJljt/bM17A7MQBlQ
         C5wNLCHdVn3mfaQ5H7fZccsgqaxGyh2U8EkO2Adq17rr4Cnf9L/Y4PcSw8AYDHrICljs
         HrJEMHHoTBlurNSypUQ00jnZV2WB9REb8u/2lNV7BWF59fuQvtvat5Ti5wIcTBul8BlK
         EVaSUxNUEXxaxHz1EcL9zpwv+AKzqPiCpg4XNw4i6UquLHXqCDaeREksiNU9aVikxV5V
         lNgjZNu2BKnCLPX52tW0Fu7CzBy1LmexnKXLszY9wOLHTh5SPStyU82Fh0IfIskEUqsK
         sS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7GvA9tWHY9AZLa68stWjC6ce95xZqCDLqklXANIaMI=;
        b=hmqIV5CSxosEUspZh0ZhBgvyNZ/pW5c+uhEvrWDk+8Tmy+O+kZiwbeEw75QBDbjVFR
         TxbJ0kfi1FGI6Z7mMAyQ+3XPn4rpqHiZqS21GuaPpTcRTsEWJPKJFGJ/jxyi+Mz7QHdM
         30FWRDCjn0uTloLYnOk10zKbK/E1vEiSLdzinoF6FM/fqjz4Qcojpruiv/u0eUC5sBxj
         i9TaRpFcTB87m5M6rVCnqkuUe5rUepzQkGSVmfTUa0jxQtFXqB8/RUeUc6kRd2xhRFU5
         RCwqMzr0zs46Y1TszNP8RGqKasTbRrmoUphCNkBg2MRfXO52U2j2yEs8x+Td1GeZTKlX
         4Svw==
X-Gm-Message-State: ACrzQf32KpMMuf2U3k+/bHwAzx3sL8T1l532ztQy02IsY0VJWNhQHcu0
        m7sCjrVrDs+vJ7aVW96oZ4Ytdg==
X-Google-Smtp-Source: AMsMyM7bk4YRCc7fnjkk2YezhdntiCoZAiuwNqo1hcV86e5RpCoobNCXy3pEDPEGqk2X0JmcRwj6RQ==
X-Received: by 2002:a05:6512:3085:b0:4a2:7d80:d4b4 with SMTP id z5-20020a056512308500b004a27d80d4b4mr21488256lfd.534.1667943896931;
        Tue, 08 Nov 2022 13:44:56 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id k16-20020a0565123d9000b0048b003c4bf7sm1918463lfv.169.2022.11.08.13.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 13:44:56 -0800 (PST)
Message-ID: <0da15378-ca0d-4f26-c21c-184de2a89350@linaro.org>
Date:   Tue, 8 Nov 2022 22:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] clk: samsung: Revert "clk: samsung: exynos-clkout: Use
 of_device_get_match_data()"
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "Minghao Chi (CGEL ZTE)" <chi.minghao@zte.com.cn>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vinod Koul <vkoul@kernel.org>, Nishanth Menon <nm@ti.com>,
        Mark Brown <broonie@kernel.org>
References: <CGME20221108213728eucas1p2aa97d7925e280b7347bb9e76d3c9a177@eucas1p2.samsung.com>
 <20221108213718.32076-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221108213718.32076-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/11/2022 22:37, Marek Szyprowski wrote:
> of_device_get_match_data() function should not be used on the device
> other than the one matched to the given driver, because it always returns
> the match_data of the matched driver. In case of exynos-clkout driver,
> the code matched the OF IDs on the PARENT device, so replacing it with
> of_device_get_match_data() broke the driver.
> 
> This reverts commit 777aaf3d1daf793461269b49c063aca1cee06a44.

This was untested, automated commit and there were several other like
that from Minghao. Other driver owners should check if they have the
same issue. I made a quick look and seems fine, but it all depends what
was the of_device_get_match_data() argument.

> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Please add Cc-stable tag. Do reverts need a Fixes tag? I guess as well...

> ---
>  drivers/clk/samsung/clk-exynos-clkout.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 


Best regards,
Krzysztof

