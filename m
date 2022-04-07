Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A38C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 15:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344929AbiDGPfN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 11:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345279AbiDGPe7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 11:34:59 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A231275B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 08:32:47 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l7so6231911ejn.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DFgO9JddDHmoRuVn2ZPzU+MXFPn5DQlDECjTYk/+IjM=;
        b=etnNwUNrZy+kn1KBn4YIpJwNbeshptJH4Fm6WZ+D4OqvvMVOUq0rLC0veEqzlPjQmB
         6jcYLMPVZ5rrNmVHisvWszE0xv0oteiK+4lHaPAuOktcV35kdr08ILA52HkCCCAFyEm3
         BGRrvucNz7UduF8B3mSY97tls+29nup8xDi3h+0XvvxUdncbBpUm65jRbM/KrU6En3q6
         qvkiGNHmtiNYbsH4Nkr8aI8UsKvI8DX46Xr0odQBjHxtz3893zyk9V6V+rWUzvBonVav
         AobD41RDLEWiY5+K0G49Q5CvjzqK7MV6ZFR75Rp+WMN2gQhiNBHIQag/sqzZsenvJ/p8
         Mcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DFgO9JddDHmoRuVn2ZPzU+MXFPn5DQlDECjTYk/+IjM=;
        b=FP2KAORrNINLRQ4Rsuge7wkMhoZG9FZYcT9H1IqVgxw1MXs/Wkih/ghE2RasIsDkaX
         ty2RQi7dHYgVca1eN3yY8SURvvskmar/M5d4/0rMDwBxUEya8/1+SQEO01fu3g0kCVoS
         EzLp3CzwSo3HD/BiJA8QUjn8xfYgIFyzijMq9LyzJ4HN1UNpLta7MeSsd1z3xpi9UPmi
         aNJTOvK72aZDoVX68DG96ObBWTq0xKJMz09pb1Kjs5vulqSmfp5BiXIwfPsnTrfXixMS
         gepo+H7MLgPHmVrIB5Op39kyFMrtTjS7CKqxK2v8n8QHevg4y+Kx7T8FBQFVgfMLQd1U
         3Hkw==
X-Gm-Message-State: AOAM5309SB0uQmmNnC9bagzV5uXq1PuV2Pl9GVNe4cmDCqFg3o4D2nw3
        xhkPSL15FRJCn1LEoImD9zSwiR9OLyVTYnLT
X-Google-Smtp-Source: ABdhPJyCd/4Er+epPFAKRZT1fWjWQhW/F7nuejDSiXLEHH7ibZ0yXXXeFBsJf3FdnumCHcknC+egKw==
X-Received: by 2002:a17:906:bb01:b0:6a7:df9:d67c with SMTP id jz1-20020a170906bb0100b006a70df9d67cmr13784767ejb.733.1649345565891;
        Thu, 07 Apr 2022 08:32:45 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402004300b004162aa024c0sm9283672edu.76.2022.04.07.08.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 08:32:45 -0700 (PDT)
Message-ID: <4c9161b2-0146-56c0-5c86-7df31f43b0ac@linaro.org>
Date:   Thu, 7 Apr 2022 17:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [GIT PULL] ARM: samsung: Fixes for v5.18 (current cycle)
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>, arm@kernel.org,
        Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
 <164933532417.2189563.2554142563906098629.b4-ty@arndb.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <164933532417.2189563.2554142563906098629.b4-ty@arndb.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 14:42, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> On Thu, 7 Apr 2022 10:05:45 +0200, Krzysztof Kozlowski wrote:
>> For the v5.18, please.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
>>
>> [...]
> 
> Merged into arm/fixes, thanks!

Thanks!

Let me just remind about possible conflict (but you were on CC):

-------

Documentation/devicetree/bindings/memory-controllers/renesas,h8300-bsc.yaml

between commit:

  8a1e6bb3f78f ("dt-bindings: update Krzysztof Kozlowski's email")

from the samsung-krzk-fixes tree and commit:

  1c4b5ecb7ea1 ("remove the h8300 architecture")
-------

Best regards,
Krzysztof
