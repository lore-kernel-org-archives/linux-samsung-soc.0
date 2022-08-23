Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98314C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Aug 2022 05:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240258AbiHWFsk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Aug 2022 01:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237982AbiHWFsi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 01:48:38 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420121402B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2022 22:48:32 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u24so6950373lji.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Aug 2022 22:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xjJQnSc1m/LkDSZsyd2cnnvHiVUTCt/MvJKy6Mk/Nng=;
        b=V3twXRjftTua7vpFsPqNwd6umjrMhUKLmn/8JxwP6B8oksF50FXm77J7QKg/pfUr9/
         Xkb5lrU6gEV+6vIy/BcaJMkGfZ6CZxXd7JVzLJXovDnoog0vhiVQpo/8giXlUPT7QcvD
         nLlN8hiRP7BFw1yauIdoxlpXCHexbrJ+E9PW1MkanX0k0RE+amvWHeghciajRmvjnJlr
         iLs9mc/SnldYB2Li7pqfMBglM6ViOBq6sDtdnKq7yob2h6j93CYuKpB1DZGBeTMcMX7A
         hViX1ZBH5YK+RbH/6ZgPWNVOi+57qAH9dnEYrLAAaCI69h2XQADaDn1DFfXrsUI6vN6h
         AObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xjJQnSc1m/LkDSZsyd2cnnvHiVUTCt/MvJKy6Mk/Nng=;
        b=bOTUtqQkCfu3fzl7bdvLLlXS4OY6vqiiUjGyw2VlwsgIKXqj5FekmBTIzUdERI0OCK
         UOxXLXJwdvhf3XeP5QRISQwU1SobB2N1YYG94/oAdUdzcl9jm155HHrQEpVsxUVo4GPI
         robyacGh0zChrmM3ClgL8o/9wKMhMwXFQYb71lKL1jeCwQNQZN6oliYxbzItK/KrBRjp
         0vclTxMLJ1zYjtAKkWVFZ4iZbLkk/DEcs+VzAnseLlegzXH2rVl+rR+/2MAatP8xIxyx
         +J9VZe349bGuNct/iuNHY4AXqlilZYq1djGdeTp922SDuvq/UQAGCGn7Mb0/MfS7HCtu
         7lgw==
X-Gm-Message-State: ACgBeo2uMcqUegpl4RsMxP15NM/QWYYN9KSiyXg9cbf0TwAsu85bcBcz
        DTaIr4Gd4UnzbKFKUXQAPX437A==
X-Google-Smtp-Source: AA6agR4jma5MoJbeJO4WlmWXCFQ9yBES3F/wDdDwsAKT6M8Kkd+YbTCYKHlLgPgOGES1DIccYFUJ4A==
X-Received: by 2002:a2e:b88f:0:b0:25f:efa1:a966 with SMTP id r15-20020a2eb88f000000b0025fefa1a966mr6183003ljp.67.1661233710517;
        Mon, 22 Aug 2022 22:48:30 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id b6-20020a056512070600b0047255d211b2sm895825lfs.225.2022.08.22.22.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 22:48:29 -0700 (PDT)
Message-ID: <c9678e5b-2f8e-6672-a092-6848fb1637e9@linaro.org>
Date:   Tue, 23 Aug 2022 08:48:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/6] fsys0/1 clock support for Exynos Auto v9 SoC
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <CGME20220729003611epcas2p1fe80f3eb06160c48c41f10b35d7c03eb@epcas2p1.samsung.com>
 <cover.1659054220.git.chanho61.park@samsung.com>
 <20220823022031.6FBEFC433C1@smtp.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823022031.6FBEFC433C1@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/08/2022 05:20, Stephen Boyd wrote:
> Quoting Chanho Park (2022-07-28 17:30:18)
>> CMU_FSYS0 block provides clocks for PCIe Gen3 1 x 4Lanes and 2 x 2
>> Lanes. Similarly, CMU_FSYS1 provides clocks for USB(2 x USB3.1 Gen-1,
>> 2 x USB 2.0) and mmc. For MMC clocks, PLL_MMC(PLL0831X type) is also
>> supported as a PLL source clock provider.
> 
> Is someone at Samsung going to pick up the Samsung clk driver patches
> and send them as a PR? I didn't see anything last cycle.

I found few other patches which were not applied:
https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=666278
https://patchwork.kernel.org/project/linux-samsung-soc/patch/20220307033546.2075097-1-chi.minghao@zte.com.cn/
https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=646690
https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=654542

I'll take all these to Samsung SoC and send to you Stephen. If anyone
has objections or other ideas, feel free to propose other way.

Best regards,
Krzysztof
