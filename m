Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC59C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 18 Oct 2022 13:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbiJRN0W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 18 Oct 2022 09:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiJRNZx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2022 09:25:53 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFD31D0C8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Oct 2022 06:25:11 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id b25so8563436qkk.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Oct 2022 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLekKpBYGH8ndeJEM8TUXAibtMNpseYq89qr23kvcRg=;
        b=nvlt78pAFMY6sl9vdsBMkAaOROLjx8h2KNVZgLalVtUam0JVzz6yVruzLOdDb88KjA
         bxTlhpSl08Nyl2i2cSXTTRN4VeLZQ4AvVKBQ9ZlT3GK9J7a+zrJtd/DdZClAESfub3x0
         36cglufyWktnD761LvSVyVWhRVyFCa3JhW0Tqkz8wvQ8sU9AT/w/ycUBzQgcT+w7lJ+e
         Rkmbrln9N8Tvzs8NLkIA/LYk2VuzxAvLnXfz+FsiNlnALFS5xCR7LVVie9wUxtoSm8KF
         5x7WYXAC7Zx9VfTUzUTuSBmLrPtbHZeMJznUScgRaU8V0Wiwqxu7Ya6ZAJnolEp0U8eI
         Y90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLekKpBYGH8ndeJEM8TUXAibtMNpseYq89qr23kvcRg=;
        b=ZsdvPyUZKty7Z5UW6IWPYOefOwOZjKJjU1PcFAeZlZGN7HjR5A2mh8KdWL6iv3puwq
         f4lm0voe1tJXOjqPEkWBWLvz+YAMrW5VYo47WyzUayh2rKNZGpNpzVj0hZ/SEtVzywzt
         YYofZL5lOUZklAatUS1Hys+YCBULKNTnMAW/2hthdKsFn4YoLSHEybtUhg1vJWPWJ5Fh
         3VPgWsgD5hlF1L5tsdosmyUhy3ET2SImB96hTDQu4+gLST8MZ5OIrxMGdVqjhk9SQXL1
         849tNQ02EtMvyfFWWyZ9ykJuRXRCFe+N+vMMJjRviU/L/m4vaoy+2tlOf5NgbPaW0DKd
         PXlg==
X-Gm-Message-State: ACrzQf0063YftF31SGJ0018/dk+4nbeKhE+RJIV+FT6jrjohP63/5LH1
        Q//wUCrS8CyrU5SyLy4Cy4ZPSQ==
X-Google-Smtp-Source: AMsMyM7/FLeJ8jSuI5g0egAb58PR1xxeRZOb17GOpDIpA8y1m1u9lLMJRq80gc01kGOTu/6UmMKxxw==
X-Received: by 2002:a05:620a:d8c:b0:6a7:91a2:c827 with SMTP id q12-20020a05620a0d8c00b006a791a2c827mr1714546qkl.407.1666099509047;
        Tue, 18 Oct 2022 06:25:09 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id dt5-20020a05620a478500b006ee94c5bf26sm2430593qkb.91.2022.10.18.06.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 06:25:08 -0700 (PDT)
Message-ID: <81220c13-56e3-eda5-8b60-68b0f7a1feee@linaro.org>
Date:   Tue, 18 Oct 2022 09:25:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 0/4] arm64: dts: fix drive strength macros and values
 for FSD Platform
Content-Language: en-US
To:     chanho61.park@samsung.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, linus.walleij@linaro.org,
        robh+dt@kernel.org,
        Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CGME20221013110708epcas5p3c54c22bbc77175eb2a26dc9fd43814d5@epcas5p3.samsung.com>
 <20221013104024.50179-1-p.rajanbabu@samsung.com>
 <166609930553.9199.13331632528050957780.b4-ty@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166609930553.9199.13331632528050957780.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/10/2022 09:21, Krzysztof Kozlowski wrote:
> On Thu, 13 Oct 2022 16:10:20 +0530, Padmanabhan Rajanbabu wrote:
>> With reference to FSD SoC HW UM, there are some deviations in the
>> drive strength macros names and macro values. Also the IPs are not
>> using the default drive strength values as recommended by HW UM.
>>
>> FSD SoC pinctrl has following four levels of drive-strength and their
>> corresponding values:
>> Level-1 <-> 0
>> Level-2 <-> 1
>> Level-4 <-> 2
>> Level-6 <-> 3
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] arm64: dts: fix drive strength macros as per FSD HW UM
>       https://git.kernel.org/krzk/linux/c/3a27bce7e13e3b5368377c9a518927e197a4afb1
> [2/4] arm64: dts: fix HSI2C drive strength values as per FSD HW UM
>       https://git.kernel.org/krzk/linux/c/bb997d949e5a835f626facfd67b1768fd4492398

Fixed subject and squashed last two commits into this one.

Best regards,
Krzysztof

