Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A622C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 09:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiFBJmm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 05:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbiFBJml (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 05:42:41 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B7B237DE
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 02:42:40 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id f21so8832769ejh.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B4D6MxMYl+3ZuwgsJ47jzKSrYMEG5KJifOF4pk7vzzs=;
        b=Kn/WQxYdGpIBHBwnnATdh8w0WJZOlGgDTe31LevQPiMQ0mGdIRbJwgF1WH7vCrQker
         PhRyNhKOwevgGUcNyUTSn3ld/1+xInxEigeafe4i1aWSKOe6qQpiC4T70d1s9bLzetWF
         z8VUFlGkLLqAOu1psxUYbJRZItSM9uxeVP+tG8I7y7/icCUgRiC89GkaRaijskd40Hz3
         z/t9myg20lnoFRQGu8i6nficnlFwlRGzOA9meCCwNe2b0oDMwJLpNC+xNeH7ak0vc+cl
         KW789jHd+9AwVenrsPUojg6K2pKgor9yQe3lfIwNxevpurNc+/UuhOlesD5E4nbDSRBr
         ty8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B4D6MxMYl+3ZuwgsJ47jzKSrYMEG5KJifOF4pk7vzzs=;
        b=ytX8zTvZpYKzRujLq46XNwyOvrRiw9IGzqbOFCDPYwhE1ts7Z90TNR4NDK8/EuPfiR
         1aKGnYpmvLhi44b67S04d6Iz3hqjSpwkk8PphaKAGZmCGRJiAnP2zrt1nc2bWIAErE2H
         uwjG6qoUQiNfj1B9K3p677yWc3v5J68MVqUzaiDRpSBgsHbNlhRoUn5hcXQGkaojqTFZ
         IyVbjMaB3lXwywCLLBZd99MA3qouBaZXsQXpFmUGjpHm+l9EmJH765/p1FWl+aWCzpjw
         Glu3v6Q74/nOFYBrpAILOlnvJdip7P8K7EpkJjTbl5dXZraDvY54ZWDYapdcHi6mhlK5
         47jA==
X-Gm-Message-State: AOAM532jcNpkPHzPkd4ZsbWMabNPpN5Gdg7FwhWl+h52P6RtL58otqTH
        WEAncHC8ZIcQEVPascfKX98Tbw==
X-Google-Smtp-Source: ABdhPJy7dT8Qq2QIyw/y3OMrkj4C4MmBmxL2I2IIZGdOhk/uv9/5ZFg6bo829RedD1Cxim2PYPfZIw==
X-Received: by 2002:a17:906:478b:b0:6f8:5850:4da9 with SMTP id cw11-20020a170906478b00b006f858504da9mr3383156ejc.619.1654162959186;
        Thu, 02 Jun 2022 02:42:39 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id re16-20020a170906d8d000b007081282cbd8sm1331183ejb.76.2022.06.02.02.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 02:42:38 -0700 (PDT)
Message-ID: <58e06727-a9ae-7466-6bc3-feee92bd9bf1@linaro.org>
Date:   Thu, 2 Jun 2022 11:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/6] phy: samsung: ufs: constify samsung_ufs_phy_cfg
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
 <CGME20220602053329epcas2p238f5019ff98e4d9fcf5fea0001a773a9@epcas2p2.samsung.com>
 <20220602053250.62593-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602053250.62593-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 07:32, Chanho Park wrote:
> Put const qualifier of samsung_ufs_phy_cfg pointer because they will
> not be changed from drvdata.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/phy/samsung/phy-samsung-ufs.c | 4 ++--
>  drivers/phy/samsung/phy-samsung-ufs.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
> index 602ddef259eb..b7ddb91a02be 100644
> --- a/drivers/phy/samsung/phy-samsung-ufs.c
> +++ b/drivers/phy/samsung/phy-samsung-ufs.c
> @@ -75,7 +75,7 @@ static int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy)
>  static int samsung_ufs_phy_calibrate(struct phy *phy)
>  {
>  	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
> -	struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfg;
> +	const struct samsung_ufs_phy_cfg **cfgs = ufs_phy->cfg;

This should be rather array of const pointers to const data.


Best regards,
Krzysztof
