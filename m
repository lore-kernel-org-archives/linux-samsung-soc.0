Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E31CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 13:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235082AbiAMNVF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:21:05 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52412
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233400AbiAMNVF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 08:21:05 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D983A3F1C8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080063;
        bh=wDhZU+ZCOzAWYEfifJv+1WyYVoJtwb8GVGdyzI9FKek=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=pqN6GfjGuLLF7dAWn1l5yicJ7pHbLVX/bXW48Rst2RSwxV1ABeYo2bHI1j0YDOk+I
         awmyaVtD8g56CYYXRPSB61T6gy3326SRxSehzf0/wwnEPQIGLbk7LghVCniflx8BPK
         60VEnj1sS0SXbW4qvAvJvw4MYT5dDRFobYm5djmhtSytRLKbNlAX8JdkY2teuHJAwb
         t1tyAMFzgCsSwFXdbWAASvNqI/ywHTE0rE5GQRs/v2iQ19wKRp6BGS7IMhDl8qzxpl
         zJgNw5MgvynWH0HrCpmqh3Pp4BBC5+179HFpJ9zArGuWVWcUm/B3vELtkCK1F0yAS2
         06dj6tV5ZZnrw==
Received: by mail-ed1-f72.google.com with SMTP id m16-20020a056402431000b003fb60bbe0e2so5313300edc.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 05:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wDhZU+ZCOzAWYEfifJv+1WyYVoJtwb8GVGdyzI9FKek=;
        b=Fk5cdbcUoCTvKaE+Eje4EqQ6k6LjuP43d5894VuA93a6csFJ/fzmwI4IftbppRMMcz
         jqnMNgHET/GYKGRvMYwPdDm6zMLdmotGlt1HuVmbvVIVxEnbDqC54N+W/fEfKn6XSHeg
         +15Wx5X9ePwDBMGj6X/zRLIlq3LE6mBVUSr2Yw+xTwuyNG/9tGHwjZkghAo2iZxEE2On
         f/xdKXk/hEESyRmBASiqaBE23/6dvgZEA6p/1jI4eckQrnxLI41fr8llYZR+qH4sodyJ
         JRX83bW1cFTWq8Elq1Fg92SAN7GxcvOzx4vi5DfYQednQcVGtpxzXFj06tfiX6mZ1QqJ
         NZbQ==
X-Gm-Message-State: AOAM532Puqh5k5EokSTZInXW/VHiyGfmbNKYo58D/XXB0KQf0jtIpH2U
        rBB8IbGKZ8A5pD6eVBsDo8HDOknWFgAVjPnCc+loET8dF3vYRaa7urNl/5txtCD/D5vTDXoJsf3
        xCD91wyVOSC9mV+Ox72qNLqboGmxrS/Kwjgt2Jk3rI8l+xz7r
X-Received: by 2002:a17:906:478a:: with SMTP id cw10mr3411062ejc.39.1642080063227;
        Thu, 13 Jan 2022 05:21:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjpHVm/kyvq/k9DvoV9wE1ANwk87SXDg69GoUVpA6UcGba7Z0TUVTx/35US4JZ+QG3PKmo5Q==
X-Received: by 2002:a17:906:478a:: with SMTP id cw10mr3411040ejc.39.1642080063052;
        Thu, 13 Jan 2022 05:21:03 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e18sm873252ejs.78.2022.01.13.05.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:21:02 -0800 (PST)
Message-ID: <138009e6-6097-3ebf-fd20-ca9babb156e8@canonical.com>
Date:   Thu, 13 Jan 2022 14:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 17/23] Documentation: bindings: Add fsd spi compatible in
 dt-bindings document
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Adithya K V <adithya.kv@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122427epcas5p1885d8b3b735e8f127b6694a309796e5a@epcas5p1.samsung.com>
 <20220113121143.22280-18-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-18-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds spi controller dt-binding compatible information for
> Tesla Full Self-Driving SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Adithya K V <adithya.kv@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-samsung.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please rebase on upcoming Samsung SPI dtschema patches.

> diff --git a/Documentation/devicetree/bindings/spi/spi-samsung.txt b/Documentation/devicetree/bindings/spi/spi-samsung.txt
> index 49028a4f5df1..3af2408454b4 100644
> --- a/Documentation/devicetree/bindings/spi/spi-samsung.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-samsung.txt
> @@ -11,6 +11,7 @@ Required SoC Specific Properties:
>      - samsung,s5pv210-spi: for s5pv210 and s5pc110 platforms
>      - samsung,exynos5433-spi: for exynos5433 compatible controllers
>      - samsung,exynos7-spi: for exynos7 platforms <DEPRECATED>
> +    - tesla,fsd-spi: spi controller support for Tesla Full Self-Driving SoC

Compatible - same discussions/questions as with other ones.

>  
>  - reg: physical base address of the controller and length of memory mapped
>    region.
> 


Best regards,
Krzysztof
