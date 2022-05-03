Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D68C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbiECJS3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbiECJS2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:18:28 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8CA22527
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:14:56 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id kq17so32255269ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 02:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TBIu7YQaxJd3lmQykUpef9y6fm6NNLcjID5L+l52wws=;
        b=BSlxYPbbwOUBTmfuDGcY2zSSYJGCJm+LZmQ82qT9TzBjE3cUzSh31qkFbQLkzkrRSe
         zKX7X/xJHYz4XtLqIaU9A/LJj+yCSvWWZJEAU5UmBZh7LLVh0FqdPNPvQ0oocFg8DuHb
         zcXz/vIM6j6h96vzAD5df5FuQKa9vnuRasCc+M8gX2IvcOQSmFr86SY2Rb11Beyg05Ix
         6H6zCNThxwxvDBUWj0Q6ZdnN/bGj+aq3DI60/iCzh59qWLWA5N2P9tS4dIf2/HOL0sZG
         EGSNzIr8YEgRr3zbVBPnB7agQTL+LDJ3TELySfZxjpf1rthUTlxksQPwlRJBzgxLnceL
         uZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TBIu7YQaxJd3lmQykUpef9y6fm6NNLcjID5L+l52wws=;
        b=ZzeFq8S8i5wtpkBBqbYpDRuerlqLNtdKnJw8mtaRdM6uxFKMlFy+noVLfcAq8G7C93
         sq32Ua8oj1wi01qd2MMNeS9uDjGdjNPNik7t8lnKEAiDUkSSYlx9041l/5Phhjolm7fo
         clVKpvt6yUqfjGekXCD6nKdOo+FLqhN9neriOQD3USVJwgmrkBTgQKswy37SoahExC0V
         GJtCF6pjfbOpUCruVxE6IY49CLUMBKI1fYyBPMEwxgGQi/ekCoeWcY1/zhAqxBJWS1gr
         TacPzFcq93FYxIkKCudREmorLo62zcuhRFqrZC1uM1zhoRbE7D2EbqCAKxPBZuBVs9lE
         V6iA==
X-Gm-Message-State: AOAM530R2Unh8t2Cc62OONebVyMF4ToyYvdCXgVFH5hMBPX8ZrIsVNFv
        iM5OBObTkCwjBLgXsiGCyRzNNQ==
X-Google-Smtp-Source: ABdhPJw8m+WpyAu5a2ereX1ohQ4lp7/1q8PVh5XKud8UciFRnTsGl7tc4KPxLTzOu/FWFxnSGoVqVA==
X-Received: by 2002:a17:907:9614:b0:6f4:9d1b:3276 with SMTP id gb20-20020a170907961400b006f49d1b3276mr914504ejc.591.1651569294919;
        Tue, 03 May 2022 02:14:54 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402159a00b0042617ba63d1sm7617391edv.91.2022.05.03.02.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:14:54 -0700 (PDT)
Message-ID: <22d7a1fe-9b16-c867-c5fa-943909063002@linaro.org>
Date:   Tue, 3 May 2022 11:14:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/12] clk: samsung: exynosautov9: add cmu_core clock
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
 <CGME20220502090100epcas2p38ab4e80279915cc14167d4f1c105bb49@epcas2p3.samsung.com>
 <20220502090230.12853-5-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-5-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:
> Add CMU_CORE clock which represents Core BUS clocks. The source clocks
> of this CMU block are oscclk or dout_clkcmu_core_bus. Thus, two source
> clocks should be provided via device tree. All the gate clocks are
> defined as CLK_IS_CRITICAL because they control(gate/ungate) core bus
> clocks but not been assigned to any drivers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
