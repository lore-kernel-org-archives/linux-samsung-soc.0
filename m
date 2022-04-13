Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF466C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Apr 2022 09:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiDMJ7j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Apr 2022 05:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234786AbiDMJ7g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 05:59:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBCE55BE9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Apr 2022 02:57:15 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id t11so2773529eju.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Apr 2022 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BoRyXJyiezioU86Sm/aljGreuf33ZfT6BJLzBNsYxXg=;
        b=omhuFPP17o7WmTkQEZ/ey1v3Go+8BL8tjJxT4U351QG/ra9Bryv3m3VIz9SPeHTJ17
         jCw/SE//G3phX7o7tXLoRgKcoX4BSJ9PABjI9xQCFfe6W3G4swybnV3G/h9LsnOdLbwT
         5fagV3p66C2I+jC4xwGmJolqwcFge+Ye4XnAndQ37sv6VLhVJSNCl9h8uNrA5FsAHPPa
         FHzmSsT6IsXqjyoO/7HBo4+CLfRCzPbqWXRse5r+JNQlmAGCgbB2E35s3laF1+fuCL82
         tkCC1kZSg/JtVprV+SxonH1pDFjrmnVdxcygBf88gFWybmaonjF9JtnH6Rq8hQS9fQ6F
         v/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BoRyXJyiezioU86Sm/aljGreuf33ZfT6BJLzBNsYxXg=;
        b=VfIoDqjCr4RCf7GR62HP7D16WTpy0tnDRJInHfirT0XjJ39tJQ8r71M+uEjzsdfzIm
         rOpP0MfUS6ckM7TuDfRv7xLqNQl8uPVsAtnV4HoLTv11eJiwG2YTepqMPHZcrm1AJ658
         AhICpWJQVvqbrn1p8InKMuE8rv7zc6KWkwK/4xbtM2/D+rKZme+EbD0Rt0L0gfG8ptTr
         g7g8J0FOLrvuxgOTN7RmpEeZc/qQPjRdIWHXMRY8WYuh6NzqolNWzzOsekyINcZXKJ4o
         7DwaqdD8vJGj+Q98OPsb0pN9mMOo13oW6vaXZVA6/qWMTDec2Wj/FnOYOVoxAN+EJgXH
         T/jQ==
X-Gm-Message-State: AOAM531hfY5dYaBnYy18KWTTOSuC2RfRt/SNbZ8pci06MaYXn8gdBL0w
        DV7GTICEowl6XC+C8L3oga5JVg==
X-Google-Smtp-Source: ABdhPJy2fHjgfklx0Z5VlYqV/vz9vbavseCTQTpvw3q5LckX8zitbG3juuiHqZrfjR9BZ7vSaecpgw==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id h6-20020a17090619c600b006ce98a45ee6mr37493225ejd.567.1649843834448;
        Wed, 13 Apr 2022 02:57:14 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id w6-20020a170906d20600b006ca00cb99e0sm13883293ejz.34.2022.04.13.02.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 02:57:14 -0700 (PDT)
Message-ID: <1a12abfa-3459-18d8-5214-221f5184a9cd@linaro.org>
Date:   Wed, 13 Apr 2022 11:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] phy: samsung: exynos5250-sata: fix missing device put in
 probe error paths
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220309170028.51913-1-krzysztof.kozlowski@canonical.com>
 <YladK4z//z1hmTRX@matsya>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YladK4z//z1hmTRX@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/04/2022 11:51, Vinod Koul wrote:
> On 09-03-22, 18:00, Krzysztof Kozlowski wrote:
>> The actions of of_find_i2c_device_by_node() in probe function should be
>> reversed in error paths by putting the reference to obtained device.
> 
> This fails to apply on phy-fixes, pls rebase

You applied resent version, so you can ignore this one.

https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=fixes&id=5c8402c4db45dd55c2c93c8d730f5dfa7c78a702


Best regards,
Krzysztof
