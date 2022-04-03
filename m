Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB3FC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Apr 2022 15:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237423AbiDCPsa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Apr 2022 11:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359298AbiDCPsE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Apr 2022 11:48:04 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE365326FD
        for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Apr 2022 08:46:07 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bq8so15194528ejb.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Apr 2022 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LYx9vbaJPUNdfXIS3EFqUowucY1MMBbJcAD7xxWwqJE=;
        b=GuOF2PiN5v6qm6pExziHFvW4NdmAjiny9z/M6GcZpXDZKd0K/Sheld7Y/npC8kwQzn
         WTOhn0orR6bhXrTXHHvrOFtFBKOa7ayOBrjz9wO+twHhfLGQOgUPH3jOw9A/rNCmEd7g
         qfHF2iCJuXZiBTohCS2oxZ0wlBDUC4x67B7v4U77st5XXJ6/g1AUTOJ7+Pp52Bxi1yo8
         VB6gCnpDBYIHonW7N1RoAv4ycf31c1orsDEs8VcmuouO8oUheOr7ewScqKfvQWavpWYP
         wy/bZ7kF9Mf4qLrKk7V4+ZY3zYh4vmKOCFduwJbWfF7ZOiXAuTaFfxymZbCCgfpUhtrE
         eeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LYx9vbaJPUNdfXIS3EFqUowucY1MMBbJcAD7xxWwqJE=;
        b=XgvH0+OStHKbrc0HEWJdViYFPTMgG9lx+6Bk9ji/K7Vu3P60s2cnFLdmNI0jMdfSkI
         ju143UE5unwiJcxy377jU3J52NPgsgAp2kLx/JSSIHwk/tNPFu1/ZcYQE5y6kXjLrO3G
         YF7QskQce2ZZa5aRjgKQYz2XopE7H2dk+/AxyoWfjHmOyIGB4BBIrwHwZmQF/l5e+S2O
         9Y0Y6nx71qtu8v6ZCEzKgvwdMW7igNDZAdPiOKbugl0+pEECmDz9lhLX4xQUInccItBT
         twYBRpDIrKnJk3az1AUkkmRvTM3HG37tuh3kSHHWfUr1ntqvMxLSkBcUVGTqLHKL7uZF
         g0uA==
X-Gm-Message-State: AOAM533FsZe3h2uF2jBFoyIGJ9xvt0Kxv8zAV4ddjTTQ5xahzu3oqzgo
        dwUqCooeRxRvIG1jUOC0ON8/Cw==
X-Google-Smtp-Source: ABdhPJzSrJadXrXyXG9O97k4Y19sD2+YhsQWeyluUAWQqPHBO7iuX4dgBHMyyAkRWvy9+4Ox+RRtEA==
X-Received: by 2002:a17:907:3f07:b0:6e0:2fa0:2482 with SMTP id hq7-20020a1709073f0700b006e02fa02482mr7423607ejc.766.1649000766507;
        Sun, 03 Apr 2022 08:46:06 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id cr19-20020a170906d55300b006df6b316e29sm3325521ejc.208.2022.04.03.08.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 08:46:06 -0700 (PDT)
Message-ID: <50934ae0-0863-ee8a-0e7b-295be2286445@linaro.org>
Date:   Sun, 3 Apr 2022 17:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] regulator: dt-bindings: maxim,max8997: correct array
 of voltages
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220331211653.175200-1-krzysztof.kozlowski@linaro.org>
 <Ykm5IG2EUUSSotUF@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ykm5IG2EUUSSotUF@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/04/2022 17:11, Rob Herring wrote:
> On Thu, Mar 31, 2022 at 11:16:52PM +0200, Krzysztof Kozlowski wrote:
>> uint32-array with voltages should be within one bracket pair <>, not
>> each number in its own <>.  Also the number of elements in the array
>> should be defined within "items:".
> 
> Which encoding an array uses has been a source of pain.
> 
>>
>> This fixes DT schema warnings like:
>>
>>   maxim,max8997.example.dtb: pmic@66: max8997,pmic-buck1-dvs-voltage:
>>     [[1350000, 1300000, 1250000, 1200000, 1150000, 1100000, 1000000, 950000]] is too short
> 
> These exist due to the move from validating yaml files to DTBs and I 
> haven't come up with how to fix the warning. The schema was correct as 
> it was. The change leaks the encoding (everything is a matrix) into the 
> schema which we don't want to do.
> 
> The issue is in the if/then schema, the tools don't know if the type is 
> an array or matrix. It gets it wrong (or different from the top-level) 
> and thus the warning. I think the fix will be using the extracted type 
> information to do the right transformation. The code for all this is 
> pretty horrible and I've lost count of how many times I've re-written 
> it. I think a lot of it can be removed when/if support for yaml encoded 
> DT is removed which I think can happen in a kernel cycle or 2.
> 
> Perhaps in the short term the example can just be removed or commented 
> out though that doesn't help on dts files.

I think I already might be adding the same pattern to other bindings I
convert, so maybe I should add at least comments to such cases so we can
fix it later.


Best regards,
Krzysztof
