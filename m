Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402C3C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Jun 2022 07:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbiF3HQM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Jun 2022 03:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiF3HQM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 03:16:12 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B0A19C38
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:16:10 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id n8so11353745eda.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Jun 2022 00:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Se9PAbHiO1jMTkhXH+gjlL2eCcfcxzVHjO3BT8HcTMk=;
        b=uYDwo8yFEMZxXygiwcQLnlRPWXJzAwg5VlKHqG1W/9yzpzhTKIX/aGgDLOJyfm1uJR
         DKafO81M6bDYbiHgKa0ciXZ974TnuZbu61JRmlOIGQqwzAaWdl/3u0euTJbb9biRjwyk
         XXml/MQaTrtxaFgu8H+9iT5+5OoZemtcXQLpyH/kqVeRsmjuePHmGeUDYBb3uqXIp09l
         SnMz5+EJ6TJYY5mOy2akTBZq+MgxPUv1c9LnrTrnIBVh5mnYxC5pJcb9n3Wmr87VK3tY
         3plsKAUy0i0w1iFDPI2DLeAgBLezBCCNCi/4aDpXaJfHia7J5DjXICef/Q2/OVhj0a0I
         cSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Se9PAbHiO1jMTkhXH+gjlL2eCcfcxzVHjO3BT8HcTMk=;
        b=h4uLdUnMvokQh0PHl5SUezhoWoFGHNCRrkFSyPxPd89Np5TogMa62Auas9oDY7fU3K
         q23WjEH6bAwFXoo3oy6CFdd9zhGj0DeSP5FUJfhIvdnfG1uyBvJlnr+L/UbwREUl6AWv
         +iRn+lqXNtrU5DIHhLAU+9VvdOLcp8z3Yq+i6Ea/ee1XiiQZonWTT6iV49dDiid8HwCy
         8mP8CLhWIkiiofILa/hG1bV2r2YpwOiFaeQXzJorksqkGuYhxQwjdWwXCedB7xaLwqqN
         BJWciD1QakKRFCimZKXXxjvKLz2InJh5JzdBXHFbi0cG1mWgLlXjq5fGrX8KPkk73/22
         DUZw==
X-Gm-Message-State: AJIora+CTqWHwQCRQJACfdPEqWFTWMAkIKieNCSeDah9T8ReOtGxZ8ZJ
        4YwOFhJGTJBMV/UtwhdmAzkqMwS6ECzuTA==
X-Google-Smtp-Source: AGRyM1t3vyzgUafwfHvDRxnaU/OU/7ysmU/StzH4CO/jMHjw4lxorN8MvyI7JSU/Zjg4dNsCHV3KWA==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr9740463edb.142.1656573369012;
        Thu, 30 Jun 2022 00:16:09 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h8-20020a170906260800b00718f4d4f073sm8687223ejc.88.2022.06.30.00.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 00:16:08 -0700 (PDT)
Message-ID: <6e27989c-ab2f-821d-d855-d8cd5c492145@linaro.org>
Date:   Thu, 30 Jun 2022 09:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/4] dt-bindings: serial: samsung: add
 exynosautov9-uart compatible
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1656554759.git.chanho61.park@samsung.com>
 <CGME20220630021951epcas2p1d35e3e0b6d4267eccbe0468b15a558f0@epcas2p1.samsung.com>
 <eb82ba7e93f6b0e5c22d1e2bbad2cc4056e5cb31.1656554759.git.chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <eb82ba7e93f6b0e5c22d1e2bbad2cc4056e5cb31.1656554759.git.chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/06/2022 04:16, Chanho Park wrote:
> Add samsung,exynosautov9-uart dedicated compatible for representing
> uart of Exynos Auto v9 SoC.

s/uart of Exynos Auto v9 SoC/UART of Exynos Auto v9 SoC/
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
