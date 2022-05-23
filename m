Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16927C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 May 2022 10:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbiEWKU0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 May 2022 06:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233942AbiEWKUY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 May 2022 06:20:24 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D27049CBC
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 03:20:23 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id br17so12430945lfb.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 May 2022 03:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/l3QYEtFbojLl7lV5pai3cRHfBZ+h0566izYZj5zobk=;
        b=K59cYs+R0/hJqebheRWM0OtWviQ7SBQiO3HxShG4pomW6xuJKMaJ/Ny2bZDHYTV1ar
         gU7vInJNHABXi/t09KDUiAjvius/JfHMpmSJFznCBEbtaG/9mbKI7UaxHsjcaAh3T8L9
         W2g0LOQJlUBELDPnHmLriHDRtyKVKm9NBi+67oaG65ZzeHnM7RPLSMB3bW0aH5NhK+3F
         HtQuIerABd+B+b5v5vPbGBn26R7yvgNuc393NRCyHG7qRvWKkcL9CYg/0MKLj6kkkEUA
         gltqQU3c7ixAKZgCaC3XRBsBOW8i4n9spp+mQSbI5fnPQABtNoEv3bPPtLt17CxR/V/R
         z7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/l3QYEtFbojLl7lV5pai3cRHfBZ+h0566izYZj5zobk=;
        b=5/18BG2kKJoyc6XtWhaVTU6ezhEC4rRL7QOtmzK6KB5BIyykgqNzJe6GK8FtxVdPpb
         GX2M3zlZAGWWfCD/L1BQi7vkL5VQiCeXxpjcP5eDq14tJEJbdsE8KSxrRDSTkZp5pPyA
         aeVGiihuLsGJN9/sCFnQfWOBiye9anM3UWJ+1V5ePVjrv8dqszJLAGXtdR7qp03CDN26
         SLvM69hkxkAHRbuOQAPrntIkSlBK/4lXz4NHx3J16IwnImNX0r38FNQxfHNuAr6AHchM
         9NrKXyOZSRN/ii+BPoo8eKQ/zB0dvuQQHGzOuqbaFbR6nlO5v4gjhzSxf+UD5SyvmCAU
         pmHA==
X-Gm-Message-State: AOAM5338ZlS2mQZehP7JdolO1sSHkQMaYL6a5FYALzWOUZp8l2ZTGSYa
        /KDOJJk+femuz7y3De9nhm9JaQ==
X-Google-Smtp-Source: ABdhPJwLWF++6lXrwJkvOsyZfcT1dMhLQpWYwo9OWZ4dveIyYXhHtW42YvshQ//qURY2eqhdqiaI4w==
X-Received: by 2002:a05:6512:3f92:b0:447:769c:1b2c with SMTP id x18-20020a0565123f9200b00447769c1b2cmr15767086lfa.387.1653301221953;
        Mon, 23 May 2022 03:20:21 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a1-20020ac25e61000000b004758e5076eesm1901718lfr.118.2022.05.23.03.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 03:20:21 -0700 (PDT)
Message-ID: <b5994aac-f471-52bd-e6a1-6f8cbba62d60@linaro.org>
Date:   Mon, 23 May 2022 12:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/3] iio: adc: exynos-adc: Add support for ADC FSD-HW
 controller
Content-Language: en-US
To:     Tamseel Shams <m.shams@samsung.com>, jic23@kernel.org,
        lars@metafoo.de, robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     geert@linux-m68k.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, alim.akhtar@samsung.com,
        paul@crapouillou.net, linux-fsd@tesla.com
References: <20220520145820.67667-1-m.shams@samsung.com>
 <CGME20220520145802epcas5p2153cb572493e3bccd702e0ecce1171fb@epcas5p2.samsung.com>
 <20220520145820.67667-3-m.shams@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520145820.67667-3-m.shams@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/05/2022 16:58, Tamseel Shams wrote:
> From: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Exynos's ADC-FSD-HW has some difference in registers set, number of
> programmable channels (16 channel) etc. This patch adds support for
> ADC-FSD-HW controller version.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>

The compatible needs changing (as commented in bindings).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
