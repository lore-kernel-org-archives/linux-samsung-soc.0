Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F30C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 18:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376717AbiEDSPh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 14:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376734AbiEDSPV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 14:15:21 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E94A83027;
        Wed,  4 May 2022 10:34:18 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id p6so1507543plr.12;
        Wed, 04 May 2022 10:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jblhqxfOFV75AAp+jd6eRYN+nZlv4aqjxAkvxCMkgjQ=;
        b=iSJWn4TJlqx4ILaMA49xxBLKbypl+0GJ5wPpgy1cJ8uV9JlPaBfw7Aoide3neWN9Jl
         0F1zbm05VIGnyL+8IF1s0YMI+0eljfwMu5oez7835+bzV2UO63jdPj5PhIuJC566nhRv
         8WBsI6IpcIKHazMCdLQDUamupeCaQns/moeQwnQdwtqOsvfIcGy72AqOtpLh+Q5IpfDU
         5af/ubXLCTW9dFSWuP6nm8G0sC4uuZiSsVvgAZilEEQ7Xt1zB1endlwwThSfh0p4k1G5
         eN7ByfAoVq79Rmc5Rl7y+lTkByHtwjZibisUV/MwEyTuZuzKFxT4wniuTcy4O/MRq1uk
         47aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jblhqxfOFV75AAp+jd6eRYN+nZlv4aqjxAkvxCMkgjQ=;
        b=GPEmZoDCHlTrMUvAnyMmIdgRyCJai33gEGcYZdpsaPuycEWThGrCMqpVyql3SUryjR
         ifWzN+/LqnlbO7ROGanQgKmFMc9GPPS4WkTt4PF4AhwTekFSfhUTBTVJe/INWxkYEN/D
         7Nv37mHHBEl6MoznAgDARAuqIj8+hwxVtPR5jAgSjOZJ84nqZTYAgOQU9IL4Vn1a0eDO
         2BxUVyXo3MOZq7y6jMMVDbMCdmpUv5Z0HcYWf6emvCJGUKIec28IW+uWnBCXemtMzJFy
         3m1rQ9mTvcANZAWSFGw6XkM/qknWZSpl4v2/jB2DlpBWVqPKg2OLZEv2ycvUZ7ryBZTz
         8sdA==
X-Gm-Message-State: AOAM531Lg+NER8lOlhNs5dH7fCnyh74TOq+tX0rCEyvoEhG6Oauf0baI
        M7aOM6z7MhyQBEqya8aDm+0=
X-Google-Smtp-Source: ABdhPJx2AuQy0XdBufEzogX2iHlKW5zHFufBrHdbBQ/7zXRxAHbXM8GtO3LWglG9ct+nzkp5oj5tyg==
X-Received: by 2002:a17:90b:4a08:b0:1dc:6cc1:3d24 with SMTP id kk8-20020a17090b4a0800b001dc6cc13d24mr620454pjb.131.1651685657526;
        Wed, 04 May 2022 10:34:17 -0700 (PDT)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id p8-20020a17090ab90800b001d9780b7779sm3547060pjr.15.2022.05.04.10.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 10:34:17 -0700 (PDT)
Message-ID: <c0997b2d-59cf-38f0-414d-774756ff36d0@gmail.com>
Date:   Thu, 5 May 2022 02:34:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 04/12] clk: samsung: exynosautov9: add cmu_core clock
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
 <CGME20220504075004epcas2p45eda7f97897fde225da2dee2611c290f@epcas2p4.samsung.com>
 <20220504075154.58819-5-chanho61.park@samsung.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220504075154.58819-5-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22. 5. 4. 16:51, Chanho Park wrote:
> Add CMU_CORE clock which represents Core BUS clocks. The source clocks
> of this CMU block are oscclk or dout_clkcmu_core_bus. Thus, two source
> clocks should be provided via device tree. All the gate clocks are
> defined as CLK_IS_CRITICAL because they control(gate/ungate) core bus
> clocks but not been assigned to any drivers.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynosautov9.c | 92 ++++++++++++++++++++++++++
>   1 file changed, 92 insertions(+)



(snip)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
