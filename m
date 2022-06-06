Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B70DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jun 2022 09:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbiFFJW6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jun 2022 05:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiFFJWw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:22:52 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0FA95BB
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:22:47 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id o10so17942955edi.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 02:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Lvxt3CeLbwjKXq4eA+1C9knCeSlV2LBjt2r6eE0mGP8=;
        b=xc1GlpZB1Dc3R5wAersdmWqfqehTEzQ6LgjQjefxqsiPYyp5uYV/NuHIT+PJKkRtTV
         sTbhtELUczK8DCmncPlMgXPo8wCf5CzG8aokPKOB8QlZk6rVo3pqcYNAxqZ2CcYJSeho
         KaYnqR4oof3zkKYFizSnSpaQi163NrYVsFPXbXBwsEzE4AzSI8vKsUEUT1gj5ZE/PFba
         rU+z3uTMeCThvCiR/6PBQ1EAr+Dd5M9ZsOKdEqL9FRTpua9aWRPMvDOobJUEOY9aZB+S
         D7C/bN7/Z9bGkfmBGQVnGoB5W/oolFo/juvUI6zymuuWEEiu2F7DxOw5JvBKPG5ILBGc
         WxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lvxt3CeLbwjKXq4eA+1C9knCeSlV2LBjt2r6eE0mGP8=;
        b=YwA0J3klorVnxlpkUlVN5j6QgG2X58oVc8mD03PdFosSPhPAd6CFyEcXnXzHPU0ddR
         6V9Q//yc1X6daKMJjDfDSVnje5rvGsKxgLFMv+4rAJjoSasF3h0v5iRz9zAeQlIju9Oq
         S+aWgtEh9t6SPHd8sawS7DejTO6usRz1rB7z0Y7YAKLucdxzDF+dDocvRtEGlkj/zw3z
         moKJ3ykvIIOyhoJOJOTHVykqyoxNFK9B85si6G3n/v0fd4SP8HRZNwqsWKSCr2H3qUZi
         LnIMekje9CHPax/Dbvbpxd/REE3fsPPDpwV0erW1Fys3NIbey1I7eYWJL0NF/QoEEYwP
         HCJA==
X-Gm-Message-State: AOAM533o5aG5HbQCsG9FX2TSzctaEm/Vf+evlQVghAP5cVEI9S2G5HRz
        ZEnBHbGrKOGiYa6pX41A7orp+A==
X-Google-Smtp-Source: ABdhPJyZUTzWvyPC/I8lpqer8nndNB9z7nWaxlzgO7IQeEBsfo2ITzKEz5SnseCK3NQq7UX0JQrYkw==
X-Received: by 2002:a05:6402:27cc:b0:42d:de37:7e42 with SMTP id c12-20020a05640227cc00b0042dde377e42mr25773491ede.200.1654507365897;
        Mon, 06 Jun 2022 02:22:45 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s23-20020aa7d797000000b0042bc54296a1sm8141292edq.91.2022.06.06.02.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 02:22:45 -0700 (PDT)
Message-ID: <c86cb9c3-5fac-a990-f4cf-5aa8e4fe8a75@linaro.org>
Date:   Mon, 6 Jun 2022 11:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 4/6] arm64: dts: exynosautov9: adjust DT style of ufs
 nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220602053250.62593-1-chanho61.park@samsung.com>
 <CGME20220602053329epcas2p407039a6087b6c460d6687b1cc1f3872a@epcas2p4.samsung.com>
 <20220602053250.62593-5-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602053250.62593-5-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 07:32, Chanho Park wrote:
> Drop "ufs0-" label name usage of ufs phy and hci nodes.
> Regarding the comments of reg properties, we don't need to illustrate here
> because we can find the description from the dt-binding doc.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

This does not apply. Can you rebase and send the DTS patches as separate
patchset?


Best regards,
Krzysztof
