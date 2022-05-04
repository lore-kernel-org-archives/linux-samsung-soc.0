Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70ACDC4167D
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 09:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347729AbiEDJtW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 05:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347838AbiEDJtO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:49:14 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61811B88;
        Wed,  4 May 2022 02:45:39 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id k1so955987pll.4;
        Wed, 04 May 2022 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+DblCoLGv0RuBFaa0iOC2ADNdHJ6+dGEVlz0LNNvMGs=;
        b=WFN9T3r5d+spv8UkSPJTxNkhA3ExXKVIq2tZyFSYWzoviZdNFm/70HpaggWRcg2Zjz
         nsvfY2EfWXrDxcPK9kBCNZ4xRyE4d3vEHvhIWCj8ekZIBpKb1wqFQs69S4vqk6eZOwCC
         u4NViqyfFy7hrhnqMhlRimsO+HpA2sACKuPTTMODH0WNREaY57IpNkjJ81oaOVL3+Xwq
         j8jaQklRdUcbi7M6vr8SjkU1zq+zN8rAAl/N9kFrGM4vCY9QuQ8/RmyagssMHv5I5j25
         3r3LQ6RcQCmqmjkzQ5yoSgMjCqOHXWms7hwSoJxYBZtfYtRjM7TZVU4tFXRonJuIlTkG
         Eeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+DblCoLGv0RuBFaa0iOC2ADNdHJ6+dGEVlz0LNNvMGs=;
        b=nv83PCF+/mVIowR0Ji0uo5RLxW3blNrnJqlB6LU+DsWDHeDhxf50QqWfF1ZygtdPdh
         GIu5GR1/w7AgWBnXI74Crdw2nbaZl814DdznIztVxTUvXS9vtkStzPwlAFc0kk1Riq3b
         xRn+QW/dZMjnoWxBInEIxHmLzyjMIMPl47BdLZb3dJomJJOPMCDEpCsyDlSOMAtD0iqz
         5ktrpXX0HPJj1P6Q6JzwzA+lb21qNQTwPvVAWZlLylWZVfY2uFXh7cEkx4wP+aIkJgD+
         rMWiZV4EN55NECdd2Xyzhvsa8jYPvWzb1kouvFFgJGVRL9qNxjf+xjE2ihJw05DQPFcB
         RGJw==
X-Gm-Message-State: AOAM531X5VQJ9HBK4beb7RYNSohvUh2S+plksL8oELdJGr6rb65mb/BH
        5CnEeozlZkSom9YbG4QGmOY=
X-Google-Smtp-Source: ABdhPJye/L+qK7efF7sAEPXhzm2n0dHPerQUfQw5ZLctVDY6cgsxQOsp/YJJZDlqna/ZBBQjAWisBQ==
X-Received: by 2002:a17:90b:3b8e:b0:1dc:94f2:1bc3 with SMTP id pc14-20020a17090b3b8e00b001dc94f21bc3mr4211137pjb.193.1651657538889;
        Wed, 04 May 2022 02:45:38 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id u21-20020aa78495000000b0050dc7628147sm7770657pfn.33.2022.05.04.02.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 02:45:38 -0700 (PDT)
Message-ID: <503b851a-64a2-2d6c-5864-9535cf6f3ff6@gmail.com>
Date:   Wed, 4 May 2022 18:45:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 06/12] clk: samsung: exynosautov9: add cmu_busmc clock
 support
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220504075154.58819-1-chanho61.park@samsung.com>
 <CGME20220504075004epcas2p3f08dab53b53f4dfb05e53dd4b7a8d242@epcas2p3.samsung.com>
 <20220504075154.58819-7-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-7-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chanho,

On 22. 5. 4. 16:51, Chanho Park wrote:
> CMU_BUSMC is responsible to control clocks of BLK_BUSMC which represents
> Data/Peri buses. Most clocks except PDMA/SPDMA are not necessary to
> be controlled by HLOS. So, this adds PDMA/SPDMA gate clocks.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynosautov9.c | 55 ++++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 

(snip)


Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
