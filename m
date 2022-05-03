Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377E1C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbiECJUy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233317AbiECJUx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:20:53 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC5E1F60B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:17:21 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id be20so19154238edb.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hjCHn+WZGHrnqeik6SWaiNFyoSed2pxZXBOAd992oik=;
        b=U+AVru/ceVXxbtD3LsXj5mvT5a+Fpqzu0n2a7NrjZ3eLfrXF8sIIkrgJKcvV+LC5qy
         Td58ZMVPxB+jgsZMwGY+5rmhJhzi8dfGoKD4ehhWTKB8fAW97wKq2AIAxXyVx9/OMC/1
         mgbDaKWfHchtpEKmp6+UVkdtPhxO4Yl1Rv8MGWZRv8DXAd3b/XFNWpYTw6yMfWkqZYQn
         gQvBIRGziLamNNlQi/Xsuj09X2pewWj2ENall/NsgLKXk45CAjPe/CEvQqLgGR9w2hvj
         5XM6FnZyB2KA29u38rMRVhpg4iYxACM2kgqWp1qXWpGEoxehk+3j7ELHToa79P/tbQcS
         vJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hjCHn+WZGHrnqeik6SWaiNFyoSed2pxZXBOAd992oik=;
        b=WnNTVaiH4M2qIm3+Ow8Au1XZUj+1BN4y0NzDv6QXbOCLcI7Hju91j4lIDzKhQEDkEL
         OqgKX5bfMsT+OLiVWihdaHoEUXiWjgI0ri6f8KMsU2lBP/adJUEQS+QxBA0dxZNHJfs0
         5SbRUab3tJvV9mohOYNAcg3gXEOGP84CkFEL2QRQyXLT5mCs8oC9d7rUyryd1EA/uIoc
         kvjqYAUioLWccuuI0m5gJkDV3AUKSAIklWxnGovrf/c1vm+CPDDX/32sQ68zVUKaGjvL
         cGoGdezlZ35dkoDKQraLLuq3eAr6LdmsvJm7JKxeRSdnKfCI+39gk6BwOq6XECOrhlbw
         seIQ==
X-Gm-Message-State: AOAM533gbdlbA0X2Jq3GMZZydqLRWupXFm9A6ErSNqQM8A/9UZEMxXNk
        s1Dv8PcA+YXxe4f7qyNIqQV5Fg==
X-Google-Smtp-Source: ABdhPJyW4XTEpRp0lqLX+AV/QXMAhxINlMiaW0ZDjtsKq8XbZGm82ovCeTO/wmqcf0nUOdfgdcBvhg==
X-Received: by 2002:a05:6402:2204:b0:426:34f1:1d2d with SMTP id cq4-20020a056402220400b0042634f11d2dmr16966407edb.335.1651569440409;
        Tue, 03 May 2022 02:17:20 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p11-20020aa7c4cb000000b0042617ba639fsm7639236edr.41.2022.05.03.02.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:17:19 -0700 (PDT)
Message-ID: <77476cb4-2bc1-531f-bc52-a0fe50166363@linaro.org>
Date:   Tue, 3 May 2022 11:17:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 08/12] clk: samsung: exynosautov9: add cmu_peric0 clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220502090230.12853-1-chanho61.park@samsung.com>
 <CGME20220502090101epcas2p4e3cbe1b3dc2c6c9c56c2c570a3825b69@epcas2p4.samsung.com>
 <20220502090230.12853-9-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-9-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:
> CMU_PERIC0 provides clocks for USI0 ~ USI5 and USIx_I2C. USI0/1/2/3/4/5
> have its own divider but USI_I2Cs share "dout_peric0_usi_i2c" divider.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
