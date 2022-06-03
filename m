Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238EDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Jun 2022 07:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242345AbiFCHZ7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Jun 2022 03:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242195AbiFCHZt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 03:25:49 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8861377F7
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Jun 2022 00:25:40 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 25so8767616edw.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jun 2022 00:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zG5AY7gRdR9REFolbYOoL6mkBmPRBxthFvw+JcZiEBI=;
        b=OokJ/+xIcnmapqXFSxrsQuJTABgsm0t0PF1D2E91yuSX2c6qoKpBTTMJi1+4qSRlUg
         wxX/dkg5rWq39IJqBxvZw76CSAGLpoXzly4PkOCzsZtRe4LOtaRkaP3t8dR0a8LdpNMl
         KsOORwvhI6cLQY+5nzcsMm2SVVRYIqI6lUPct275MyFDBXL9zahYpHzt/1hBbBoT9Aep
         TnSTseg2L0D+cS9Bf8O03NXFXvLoLx6wot0Xv0Qi7Z2qGtmM/iAz7g0PG3g3ONWvFdiZ
         cTnl4OxBbqG+mG1q9NVgNj6rs+HJ56F6i+K1ozjC+x+Gton2dPeE1YYGX4jhL4PGAQYC
         BBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zG5AY7gRdR9REFolbYOoL6mkBmPRBxthFvw+JcZiEBI=;
        b=Z4dkPF7mWYYMsqkzbRnKAUMqg0U6gses/tqlNOJ3G0d9reBQnjMxW/bg2Cx7EWvuYF
         K9SmKaMmIHUO/hqx4gQz54PSdbhdmNHFnM5EJLKQCuBVO9UVKjxBahvfrK4rWFeWSUYY
         tiVSuo1Eny1SYzMc3N/pTmkkR/m1s0ZnX2BFXfTUvtppOPX5lFX18ppI7fZHYSgzV53t
         laV61ozNMKmiXtuXqb1fIVW4TDrXVQSDZI4cnwGyfoLv6kzpxBuf7v4z93tLzkNPlUdH
         E1Y9mHz2GwIv1/FcoBXZ7mSL0tsse6H0QElxYejAsoNZ7QVgqNj7hER/m6osw/Q85bfu
         s2dQ==
X-Gm-Message-State: AOAM530A53fpLk3vEeozwZO4maVmh3jtENxU9GU4EvOxbPrOGw3wJQnY
        DapjZFCBmLelPZBqlSL6zdMc1w==
X-Google-Smtp-Source: ABdhPJzOolN1W6YFoKkVEOMoe+Drf+5VNDcIUTEWcWXTOzwVU81e3daQrXlTynC8ImczDTyd9p00EA==
X-Received: by 2002:a05:6402:528c:b0:42d:cf7e:bc87 with SMTP id en12-20020a056402528c00b0042dcf7ebc87mr9419571edb.70.1654241139408;
        Fri, 03 Jun 2022 00:25:39 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o19-20020a1709061b1300b006fed85c1a8fsm2568465ejg.202.2022.06.03.00.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 00:25:39 -0700 (PDT)
Message-ID: <a26ff8ce-8d4a-ff41-13cb-0ac0cb9a74d6@linaro.org>
Date:   Fri, 3 Jun 2022 09:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/6] phy: samsung: ufs: constify samsung_ufs_phy_cfg
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Kishon Vijay Abraham I' <kishon@ti.com>,
        'Vinod Koul' <vkoul@kernel.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220602053250.62593-1-chanho61.park@samsung.com>
 <CGME20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9@epcas2p2.samsung.com>
 <20220602053250.62593-3-chanho61.park@samsung.com>
 <58e06727-a9ae-7466-6bc3-feee92bd9bf1@linaro.org>
 <050401d87681$42e6cb70$c8b46250$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <050401d87681$42e6cb70$c8b46250$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 15:04, Chanho Park wrote:
>>> @@ -75,7 +75,7 @@ static int samsung_ufs_phy_wait_for_lock_acq(struct
>>> phy *phy)  static int samsung_ufs_phy_calibrate(struct phy *phy)  {
>>>  	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
>>> -	struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfg;
>>> +	const struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfg;
>>
>> This should be rather array of const pointers to const data.
> 
> The prototype of ufs_phy->cfg is 'const struct samsung_ufs_phy_cfg **' by this patch.
> So, it should be,
> 
> const struct samsung_ufs_phy_cfg ** const cfgs = ufs_phy->cfg;

Not entirely, that would be const pointer (array) of pointers to const
data. What you want is:
	const struct samsung_ufs_phy_cfg * const * cfgs = ufs_phy->cfg;



Best regards,
Krzysztof
