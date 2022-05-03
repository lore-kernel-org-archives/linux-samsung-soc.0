Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B046C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  3 May 2022 09:16:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbiECJU3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 3 May 2022 05:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233268AbiECJU2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:20:28 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C4A1F616
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 May 2022 02:16:53 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id i19so32195934eja.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 May 2022 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BsvaUnofBri4P1z7I41TveuHEhm/KwaQKOv/FA2SAmc=;
        b=sBph3mqUoXZCAeoS4ktOxHHvz0utbrkPhF1THWGN+z5z8ktOKnOf+bb/F6sECeiOk6
         pN4Uc3dZkvnhPGWj+DQ6cDnMMF0fqvKKHvYUKU1xGwetVB3FMBXSHoxuUqoz99NRKdjP
         i/jBmtOm5r4E8IqdzsZpkm7ELsqVcHSobbHQaaWz4un9G+f2i2xv31Y7KXJablMsZ17H
         6av1rwBQQ0S91N+NbzjrkfVk0q2i/FqP19QoDXYB920Slrk5nkROjrMM6fe1pYBFO7CF
         wY7xlwm8/y/adBGz8fldhER/oAyv+5gAt0CVv81vA8MAx2kLPWB+w+LWcwwFlvtBHCDQ
         a2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BsvaUnofBri4P1z7I41TveuHEhm/KwaQKOv/FA2SAmc=;
        b=gfet26qrW0j2SdWdzkQQytXUEwuMO0zqwTfOJCg/oIPpOh1NB941e86xxmJvfz2lrI
         OUX+CZ+XJXAvwrAiMYwCyYbIAWfuBRAzQSV+syM0uIcnhU0cHq98hywfwiYRF2wuMxqT
         oYC69IpEIBf/57ZKt7il1sTGe/TNytTJvGrU0ZV0piNywIKjG0nuDzncVUQzVFomk61F
         PXYQ1sH0jr4jmK1CvpTh5Gvsc97V7RH6dtxYNyt3G1fX9YtlM4ZilanU8bz69IfJSaDS
         knqM6oG+jKOkvTbnZb0gXQjSPU3LmidR/9wHVg7NSj+3CSLjuoqnT7aXcBn/VHtFNW1f
         hA9w==
X-Gm-Message-State: AOAM531whNPC5OlfJMACHGkCFBCVBsZ2/YYa+x90A29lC20SuBcLBxa4
        Gc48wsQwzetsv/ogQHGoTMR9+g==
X-Google-Smtp-Source: ABdhPJybz8YV8La8W3rsUYjKDHXdxPptbFIiKIMx1xOO40zTIHCUi/l+jX/pzmHJRO3OQNDYRUD33w==
X-Received: by 2002:a17:907:7811:b0:6ef:a896:b407 with SMTP id la17-20020a170907781100b006efa896b407mr14242662ejc.645.1651569412167;
        Tue, 03 May 2022 02:16:52 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id n9-20020aa7c689000000b0042617ba639csm7618302edq.38.2022.05.03.02.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 02:16:51 -0700 (PDT)
Message-ID: <8de2c84b-0140-6435-d79c-7d6e3416fe18@linaro.org>
Date:   Tue, 3 May 2022 11:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 07/12] clk: samsung: exynosautov9: add cmu_fsys2 clock
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
 <CGME20220502090101epcas2p259f09e3ca3ba6361c47d39a66d9fd172@epcas2p2.samsung.com>
 <20220502090230.12853-8-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502090230.12853-8-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/05/2022 11:02, Chanho Park wrote:
> CMU_FSYS2 is responsible to control clocks of BLK_FSYS2 which includes
> ufs and ethernet IPs. This patch adds some essential clocks to be
> controlled by ethernet/ufs drivers instead of listing full clocks.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
