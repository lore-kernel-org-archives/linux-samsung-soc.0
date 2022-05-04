Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B2EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 14:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351367AbiEDOkI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 10:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351374AbiEDOkG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 10:40:06 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF73941302
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:36:28 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id l18so3273991ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 07:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r4kTs37qzDv5vVl2H9hpUpYJnsnC2MUKlbtIkN5Yesg=;
        b=jJVdw2tiE0ASvn7JEJlrJBqUsjY0HIacMO3hM/PBIo2S4FGZS/KLlQJxt5q2bm5WoY
         PSRP5ApMeVwLZuSDCq2GF35V4qknJ0pf7tDsdJM3wzmW0qs1KxzRngMK4jM4Y/WU/v0a
         w23ID0GIoj4I3Mld48y8WySbnyG3Ry0nKFxQCvVJKY5NjzmQtM5TPfN3uIiSz2OU/JTx
         Ij2d88msyLkqRkbVp43872ciE8IRkhV34ANJaFdE7qDYWKSiDEOKQuY2XWRyxhbwFhml
         1KQv6JEfDocZSBQojYGeOpR+YVrHibvB2OPnuQU3sJuAead94reLIBG1CJnppJxjGnR+
         /F7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r4kTs37qzDv5vVl2H9hpUpYJnsnC2MUKlbtIkN5Yesg=;
        b=zpLx2qj7J02fehuy1+Q6lQ83wOOGHfiuXG0p70Rga8QONYmF2pf8yyOjdd8ht1Ru8+
         /AXHxvxDp77prPhe1rRq44BKfojCVgTPH6XjXdxq3E3ade3RZGk73xY3JY2fFXyovm90
         d/am5owuSgShsLkf+VSdBISGYpyporqZy/yoeKa3laAP+LK4f/v8vU4ndfLK3vIROlKE
         cAaFblb5OdbToUM1aYuTWMVw0PE46YftUmMbxMD9uuduowg7DhyCU8dT1SnP/yxVoo2o
         TJec7ArptpjWMy4sqOA1mDMykqsTSxg8QIt8WGuPj5powapRSZ32ZDP5fPhMG1IwDwbw
         5jCw==
X-Gm-Message-State: AOAM531t5nnwL0EQ+id7OiQ7ujO03Z9HjPv6vYhdSFquXmD522mc7xbj
        70pZhJbttmwxwKEUOW/AIkws0w==
X-Google-Smtp-Source: ABdhPJzoPAn+s2lg6saQY/gm3ODR4SztB5D5DPs1ZOnGzuvjjMzKYaKOKSID27nZIDLVmW+9kqJKdw==
X-Received: by 2002:a17:907:70c4:b0:6f3:d23f:d711 with SMTP id yk4-20020a17090770c400b006f3d23fd711mr20047023ejb.205.1651674987486;
        Wed, 04 May 2022 07:36:27 -0700 (PDT)
Received: from [192.168.0.215] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214defsm5727577ejb.85.2022.05.04.07.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 07:36:27 -0700 (PDT)
Message-ID: <811c2d85-b615-0f7a-6a35-832d091d62c2@linaro.org>
Date:   Wed, 4 May 2022 16:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 03/12] clk: samsung: add top clock support for Exynos
 Auto v9 SoC
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
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075003epcas2p1247f3e4d42e48f9459f80ad7d3e357ca@epcas2p1.samsung.com>
 <20220504075154.58819-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504075154.58819-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/05/2022 09:51, Chanho Park wrote:
> This adds support for CMU_TOP which generates clocks for all the
> function blocks such as CORE, FSYS0/1/2, PERIC0/1 and so on. For
> CMU_TOP, PLL_SHARED0,1,2,3 and 4 will be the sources of this block
> and they will generate bus clocks.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
