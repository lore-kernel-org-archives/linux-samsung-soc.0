Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8ABC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Jan 2022 12:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238978AbiARMD1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Jan 2022 07:03:27 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47528
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238285AbiARMD1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 07:03:27 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3E5413F1C6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642507406;
        bh=7bubzIAb+ydO4SnlvnBFht1TGTz6uczOUuKDIRB3YAY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=stt80QqWs1o9rckHcickveDZDPRJyFhZC0ELkNON2tijsA7DIsoGSCYdZvcybKJcJ
         NfpJ/D3Y8J2bpCLFTFpp0n/s+5il0D+7QZsImTA+Lhr36nEvJnd5jNw6kSTvyzyQsG
         RnHESYofgdRtytVgz6h0X7W5319k7DUx/Mg/NbPSD/u7YvEtecaGV1jdvf2wF6RCIL
         KNwW342mUD/Nv6S/knxuHAq565KegPwn/eBm66iKBLQj9knFqI1fn1qse6yBPJ2512
         9TytLFRarEd5IXxSeYCjDvTxfBy7H7wh5tq8fLupg4vLljV8dWlHd/ZB/GSNxRhqsO
         kiZvpXcb4HN6g==
Received: by mail-ed1-f72.google.com with SMTP id z6-20020a50eb46000000b00403a7687b5bso972544edp.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 04:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7bubzIAb+ydO4SnlvnBFht1TGTz6uczOUuKDIRB3YAY=;
        b=ekUtDO2wpspNoCAxjbicjbelrQ52brdaFmpO5P2N2hfzCpkDw9cAp+SPGrLLwm/QFx
         G6N/C+Q/9xfVqD7wS4+EVZIlP4S1IXxPeRV+Rd39taay+r41frAAKC2satg6xuVOaZe5
         exJ8iOXENTy5Uz/s2X3tXeMaVTagXfyTPJo5maHzPmQeJU2vwtOPvy87fSdyZhaaX+mV
         8Hn8s6mjzkNsxnlBnn/v98VRInu6BtF2X6r8wijCx/coykKwao892/eTB7L7eEPwxJ3L
         AmJ74MqeNg2X3VFq8vg7VHZZfcdmSMLGJ41jjXZvuUv07AHN/T450bGq6f5bHXwPs8H9
         qtEA==
X-Gm-Message-State: AOAM532rOoZj+ou0MzRXg7uhJkFLSOkxaNc6XvAiao1E4ttm18jT+V/R
        ho553oo99hGJAGONzWW3bFQ33UZSVu+RpDkqiJ0n+I0lMZ/w5oKl1fjjFCvcUuyr7n6yoJ9pey6
        lo+ssvEk1288zLSd1wTr919t4Q+Rt5rfjC4a9v6g0mEYgrBMH
X-Received: by 2002:a17:907:3f83:: with SMTP id hr3mr21225590ejc.604.1642507405969;
        Tue, 18 Jan 2022 04:03:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLDQVu0Qzl4lsokyh/LNUA9+7/5AuxEAtB1FxML9RoI1adjL785IqrAjsUUFixIL9NnEpxFA==
X-Received: by 2002:a17:907:3f83:: with SMTP id hr3mr21225578ejc.604.1642507405861;
        Tue, 18 Jan 2022 04:03:25 -0800 (PST)
Received: from [192.168.0.41] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id gb17sm5302273ejc.25.2022.01.18.04.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 04:03:25 -0800 (PST)
Message-ID: <f2ccfaee-5854-89fc-8c83-5275f7fd66d7@canonical.com>
Date:   Tue, 18 Jan 2022 13:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/3 v2] spi: s3c64xx: Convert to use GPIO descriptors
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20220118110928.120640-1-linus.walleij@linaro.org>
 <20220118110928.120640-3-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118110928.120640-3-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 12:09, Linus Walleij wrote:
> Convert the S3C64xx SPI host to use GPIO descriptors.
> 
> Provide GPIO descriptor tables for the one user with CS
> 0 and 1.
> 
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1-v2:
> - Split off code cleaning to separate patches
> ---

Much easier to read, thanks!


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
