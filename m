Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26CAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 09:56:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbiGFJ4D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232347AbiGFJzk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 05:55:40 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09B425C58
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 02:55:02 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s14so17815262ljs.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=MLKzrM+9AqNqUlJzLdYBL/Maeq7E5O1+AfToNrQTETE=;
        b=myt12LFHr8reOh3SXvfUdIz816T2RINdKwtOgx/SI/lnIY0zsEfUmPKqDEamHYXBrf
         Buq0ojkUkWpfHo+2CuFxK3DNnVoAA7czlTOZ7WHpDJM72Nz/fkvS9sXHqWZrIIchlIqH
         /GPH6gAROvAlWu4GXYuzI8rBuFNmh9Uja6ttBPaDczSiKWTOEXTrRzOPhpj5JUXD+IIM
         ugJQTAUK+ICHcx8Z1hYXNRC/30/c21K9zCF5Wb0/KUMNVWgadIvIf+AtACMWIRwODpaU
         /wKXTTegWof/OuvFoMzjaJaw9u6dZY3GV2eDqM3OXwJZtzMlY6cf6bq5Ewev7327D1Aj
         37lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=MLKzrM+9AqNqUlJzLdYBL/Maeq7E5O1+AfToNrQTETE=;
        b=bdL3fZHpL1hWxUkbezaF0zVdcRikziIo/w/FPUih0stQOt3X1VykwvgMyQZVUrhjlW
         osUos0Aiej+wU/po7/mXv0SREeQgTWN6iGwrSSBEB5dt9FVilahTwOP7+yxf4vBwA9fg
         K/PRSmtqu3y0ITOZXEGmZUcgM78IFhxQCPBgXmfS6NA/YqB/9dmK7urRNWgKlM/FIx96
         rqn34e06v3vm6+9zU2j7BKseVq7elRa1s3wjv44ytrMGnypeSVlN1xu4vKkKpdiALQca
         ZrmxtvmLttTwh5Hqu95rxf1e4q/Tk2c0Xvc/xm9PmJEvx78goFZdgikBiDBSvhu/FN3t
         7eWQ==
X-Gm-Message-State: AJIora8rT8jfOxyMm0tPHB+kXI1WwhEZWY+cm7RBlZlPKiabgvfPEM3d
        UjBZl2C/4I/wt2SWYFerbNK/Zg==
X-Google-Smtp-Source: AGRyM1ssHMMNbJwUMIIj/KkwH7iJhu5+/uN7GYosbxJwWb7UnbAiR56nimnepjqrTpPpc46ePBmhUQ==
X-Received: by 2002:a05:651c:881:b0:25d:4865:f6b0 with SMTP id d1-20020a05651c088100b0025d4865f6b0mr588712ljq.418.1657101300832;
        Wed, 06 Jul 2022 02:55:00 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id s14-20020a19770e000000b0047faab456cesm6186060lfc.237.2022.07.06.02.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:55:00 -0700 (PDT)
Message-ID: <f1e03b78-f844-6eec-2ace-d177af59f0c9@linaro.org>
Date:   Wed, 6 Jul 2022 11:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: ExynosAutov9 SDAK UFS phy dtbs check error
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
References: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
In-Reply-To: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/07/2022 11:53, Krzysztof Kozlowski wrote:
> Hi Chanho,
> 
> When running dtbs_check I found:
> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy@17e04000: clocks:
> [[10]] is too short
> 
> 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> 
> arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy@17e04000:
> clock-names: ['ref_clk'] is too short
> 
> 	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> 
> 
> and so on. It seems you miss there clocks.

+Cc Alim.

Tesla FSD has the same problem:
tesla/fsd-evb.dtb: ufs-phy@15124000: clocks: [[35, 2]] is too short


Best regards,
Krzysztof
