Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F14DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 09:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347666AbiEDJqx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 05:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238227AbiEDJqw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 05:46:52 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083E127B0A;
        Wed,  4 May 2022 02:43:18 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id v11so718937pff.6;
        Wed, 04 May 2022 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=t0Vge1DrY6BF9/8b8O1Z41uF1+unK2gO+1o6Ghfw/bQ=;
        b=KNRaZQU2OV0CbVT5EBeXGwZ2xoH6HF6hD0XqfMHFiI6CaIWpt0T7SePd8vESZ94Q24
         3aRIB+bd48pYD+as2gtsIEXLhn0pafaJYDPz5lyipy74WmTI7Zml3QpbH5dQjzLSb7cB
         Wbs50yzWqtv1ASRXX0vCTGSWYzjh08N5nDMUaLqE+4ktAzhzlVTmvFRNEDTGCs7Zti0g
         SeG1kGKhq4vqalij+JCtYEXa/Mpvghf55M1ohhEA8pXYe5y576JcDAduY5fleoURK8yP
         zWs2iRQo/I+IfN/2YIh0K/fv3FcOBRL263jTz/iS74MK4WS0FYH80QNG9QenUT/Wxqp9
         3rJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t0Vge1DrY6BF9/8b8O1Z41uF1+unK2gO+1o6Ghfw/bQ=;
        b=zvEvro0LrvD9kH8QxbySTXswmcR/ZFRd6DIpx165dT6cmu75OcbIBls1SOTErH4X65
         fC/xpD6W3aj5qZw0BOOm6YU4k+SsytUuJ7MnKglOsXbJDvxn0F6Xmh6gErqPsLb3FoSL
         lr4z8PfxLJWer2ERLLFKbPlFE7mj+Pm9rpDCGszhMCUmd2x0BT6cEh1DohaafD6+jkoe
         QIccCXFJo2RY/TeZe7NCAzw1wg4d4klXLG4gGLdcNKJ34xBHqTVp1d0vMBtSYbo6OZ2x
         1WNHfsQIoT8LELngT5KPY66bLHeKL9raofSO+lzdlNrkYWlTsscQ4WYklOYBzP27vtDj
         XyaQ==
X-Gm-Message-State: AOAM531CsfRBCUYg8MTs9XCjtmAWls2b+cvH5K8D4r+rESJRsMLkxjdR
        XSysBSRqZiaZeB7RFEpD3MM=
X-Google-Smtp-Source: ABdhPJzOJkUqXet1D2SSx84hKWV9giEUkv3YpXuvdddpMNmqN7srzVYCzUFtggEeEZ34yt65brcOQA==
X-Received: by 2002:a63:90c3:0:b0:3ab:24df:fa19 with SMTP id a186-20020a6390c3000000b003ab24dffa19mr16999279pge.608.1651657397488;
        Wed, 04 May 2022 02:43:17 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090a734200b001d0ec9c93fesm2860994pjs.12.2022.05.04.02.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 02:43:17 -0700 (PDT)
Message-ID: <9a84f78e-f54f-dd8e-a3b8-5a43001dd1df@gmail.com>
Date:   Wed, 4 May 2022 18:43:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 05/12] clk: samsung: exynosautov9: add cmu_peris clock
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
 <CGME20220504075004epcas2p218759eec1e29313c879eda085e37f0b7@epcas2p2.samsung.com>
 <20220504075154.58819-6-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-6-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chanho Park,

On 22. 5. 4. 16:51, Chanho Park wrote:
> CMU_PERIS is responsible to control clocks of BLK_PERIS which has
> OPT/MCT/WDT and TMU. This patch only supports WDT gate clocks and all
> other clocks except WDT will be supported later.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynosautov9.c | 51 ++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 

(snip)

Look good to me for all patches. But, some v3 patches has
not yet arrived into my mail box. So that I checked
the patches on lore.kernel.org[1].

[1] 
https://lore.kernel.org/linux-clk/20220504075154.58819-1-chanho61.park@samsung.com/

Thanks for your work for latest Exynos SoC.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
