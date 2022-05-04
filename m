Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D424DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 14:34:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351348AbiEDOhf (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 10:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348928AbiEDOha (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 10:37:30 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72E21FA73
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 07:33:53 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id gh6so3315215ejb.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4Xap5M7upS3RpBa/kTOo82PyjIvu/DHybTlg1OzmT8M=;
        b=pXPtPQgENRLs8rA9+rej4MRGpiu2tOu+PSw2+ouMVv+uLs7aTC/Ra5V3T+uQZwScNN
         hv3pBPx848SZ/iXTtfvpuedQ3M9gA/dV8e9k5qAcYp+NXCdQ6V4Nz4ilKimq+iuPytIM
         hdnVBakxJ9GD9JzCj4Av9CIQS0x7wXg4q9OslBq4D9gzeWGDvbh84utvarbMS4BXIGYL
         RlXBqn87U0q5vgh3ejzPjDsZbwztGDCfx4MC6BI/oQIA+Rxp32zGVy3hNOzQgRBRgP/j
         sQLfGXa4FYbSi2e+lI2jA7YZr4qh3MeFpzXIToeOXvJaEIRplvdq9Kp0OUOigYaX/ZU4
         YXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Xap5M7upS3RpBa/kTOo82PyjIvu/DHybTlg1OzmT8M=;
        b=AFYNvbVEXFbGeSv4z76VHedpE79S2h2GBeI+aW2W+j5D2p8SEF+XF1ZZenX3p5vLLk
         II3COtELSp0Vm9E8t48m7xc6Zd4qDKynEuCaKbqt6jTXtK9wmejMCzlu0CoY/d8e+Ez0
         dJnADMWEbDy9y0rVBdOltZI/2XnDVJ1Hy4DRXwz5qYrT1vbsn66A/pBM/1mZyrgqhw1D
         gKtGnM/kSMGo2I6nWJK0xCvlxz0ZewJZk3LsHsck3U2qr/C4vfjG+3/KJh9xDC3baOZ8
         flbInHbfBJV6QJjtT1Q7AF+ICQ7fjufOCNpU6q2PsLsE7n9GWzc16+G8bL5HFZ5igmUD
         Lx7Q==
X-Gm-Message-State: AOAM533yuo+2SmQ9+t/9UivEnWiNhjv4qAoeSrRU/SJ+wrLfFc2tHfg6
        hyuYQMjMEL46bexpmSXf0mf/+A==
X-Google-Smtp-Source: ABdhPJzDEEeLJV7nHKNzGAwv3BhGGM9lvlERA0IP50CY/x3+ppChmuFspf/Wh+0iuioON9EIRl3baQ==
X-Received: by 2002:a17:907:ea1:b0:6f4:a356:eb54 with SMTP id ho33-20020a1709070ea100b006f4a356eb54mr6427016ejc.294.1651674832360;
        Wed, 04 May 2022 07:33:52 -0700 (PDT)
Received: from [192.168.0.215] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hw7-20020a170907a0c700b006f3ef214e16sm5809259ejc.124.2022.05.04.07.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 07:33:51 -0700 (PDT)
Message-ID: <169c338d-2986-24e2-ed1c-b41a96019304@linaro.org>
Date:   Wed, 4 May 2022 16:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 02/12] dt-bindings: clock: add Exynos Auto v9 SoC CMU
 bindings
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
 <CGME20220504075003epcas2p17f37265b522bb0c26dbdd4ebeec92ab9@epcas2p1.samsung.com>
 <20220504075154.58819-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504075154.58819-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/05/2022 09:51, Chanho Park wrote:
> Add dt-schema for Exynos Auto v9 SoC clock controller.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
