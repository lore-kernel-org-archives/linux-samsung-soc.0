Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5685BC28D13
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 25 Aug 2022 06:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbiHYG0C (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 25 Aug 2022 02:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235388AbiHYG0B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 02:26:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396049E694
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:26:00 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id l8so9397972lfc.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z1nM8n9D4cKIWi39fJN2NwqcjbnvD6EFp1Fh0bxjzc4=;
        b=hNvYAqJ2fMgVfTRnyfDWcky5oQJfdfYi+EdOJEgIcIKlbFGnhD+xji0eDdp3G4FiBV
         li/WRRGtpXvSBfIY9h+kEDodO0Nuvnsjqolc9rmpHT2pT5w7CV9jO4mANXyYd0sYkCMQ
         AGax0m2WPRn9KJ4tHlBY3rtMYpNYPldGdFTzojUDma+OXFM3bpp2NbA68S8BEAS+F/kT
         ASp1W/5Zgtuwd4GTAfSf3p/ectWSNTqB40+jWtcZCdXqIryvnbDUl6KMNxc/CAzpWtKm
         39qMJo5w6+kedsFKna1EV8Dwoa9fnBx8gkQljEdnVZpYy4fkw4qH5vur4bjXS26Uasr5
         qGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z1nM8n9D4cKIWi39fJN2NwqcjbnvD6EFp1Fh0bxjzc4=;
        b=sEKG++gxQtJFvyNj+Ffiu78/Lri0OCrvL7BeBcC0Q5trSAuhS6eX25vgRaOBLyx+mE
         FNDbZJooKiuay6VhMnyeU4AxFwla/SmNT19hcr5YdNfyMEVzJkPelzIjRjaml4BMK+n/
         3FDKCJoXnzYEcbN9LimVMsTTam9H2ipKQb4O/gaO3Awv9VG2U7cuW+rLQfiQywnMJ7BK
         PkbyXGK6n0Wqf/1XiKKlJAWvzX/hMSfdgMbHLNVlecx8U2bg0j6AQsJqCDjKtLe+El47
         GdMk/KssLEyNPvZ+3vcCPH9ROaxPozEGmgfmuBEjlbyJwB94j3ZYhr2qrc060w8QUAin
         9eaw==
X-Gm-Message-State: ACgBeo37dfAcIPJVfwJwSZ5TMXe46Q0NYfkqW3U1aeGEPPMvCSw2aZ8a
        Da9ewI8/9JveypcPHSEu9+Epdw==
X-Google-Smtp-Source: AA6agR7dN0Oeo86So9OoOfr2zzWDWG3FwxukDfc3LUcA3VWZLlGdSlmuXbMu+QCVHLh7M7V+OcogvQ==
X-Received: by 2002:a05:6512:a8e:b0:492:b3e5:adcd with SMTP id m14-20020a0565120a8e00b00492b3e5adcdmr674979lfu.374.1661408758612;
        Wed, 24 Aug 2022 23:25:58 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id s28-20020a056512203c00b0048a91266268sm311509lfs.232.2022.08.24.23.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:25:58 -0700 (PDT)
Message-ID: <84caccd4-1e28-b344-8e7d-67a6d5c974f2@linaro.org>
Date:   Thu, 25 Aug 2022 09:25:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] dt-bindings: display: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220823145649.3118479-11-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-11-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
