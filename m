Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C94C54EBE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Jan 2023 08:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjAIIhn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Jan 2023 03:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236665AbjAIIhL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 03:37:11 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C50513F3F
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Jan 2023 00:37:09 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id l26so5688268wme.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Jan 2023 00:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VeKLpPbr+0opZSsyaNdS4GmUMbw67mVC1MhWp/RMXc8=;
        b=j2DjT+bRzJvVjlkLjqfEEWT4jY+ZoP+BoB4sAMBIO8cn6gtDboHm/Ows1bCAQ9adgi
         jZopYzGek5pMHwrtI3kPPh/XubnGujItQpxANrzd1vsKSEqrB/3f2KCYbslJgqxU4F04
         jcTQsAvnTmoroqicVgZCnnagXid9Cl4M+cGU9Wc7zRCB1C8muo8V83NCv3EI+0Mq5BID
         vEFfTJglWJiF8hrXUzAPoKnEVbfkpw8wMMSSW9luI2MwCqs0ZcuMxltYcRJ04xpzXGNk
         WxXnHbviX9Q19lbTysK/QbFKI/7P4l3/Afm+xh9OatEhNf6LKhlplQtNkkUazIEE4td7
         /DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeKLpPbr+0opZSsyaNdS4GmUMbw67mVC1MhWp/RMXc8=;
        b=NsynDnHaNxviLQ2+r88EGI3xDCbI839a3O9J9U1CpJ6slP7LLwZxbaPoxt4h1aTKBh
         LQJ91MZA2ZCTzPHBuH/ZdEjBeWSE0hubLduksrWRBu7R5BBfrYehilHJ7FRLUXmDchtp
         VZeeQd/QsSki8xtpL0T/LKsdo8n751QdbGITU7mVT5pKVbZ3oVQge12Zqxee5usma/0X
         zGf4l9tkkDtm1R9HgTms+CJdSbWewe8S2U0bkF+Ss5UAygX/YX52Xh47nzOO8GMB0LQS
         enz+PnCfiXWy+B/eU000MdHff71g6KvLgKiH2h7tMyvHmIePR4anAxSnb2lopBeq+MsM
         1O8g==
X-Gm-Message-State: AFqh2kqgVf2A6DOfx4mZpiLPPLLk6N1XqGXegm9Q8td5UNjj/eKjguwX
        lduW/F85cYovJ7JG+bccx8LjSw==
X-Google-Smtp-Source: AMrXdXvGZLtPPaGN5nHVCLSVwjBxlwNzC4/VdLmgdwDyBjlcW7SIj67hiUhm6HTg1UV9Bvxw3EagYw==
X-Received: by 2002:a05:600c:4f96:b0:3d9:ed3b:5b3e with SMTP id n22-20020a05600c4f9600b003d9ed3b5b3emr2846989wmq.19.1673253428081;
        Mon, 09 Jan 2023 00:37:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e35-20020a5d5963000000b00276d8c2332fsm8834593wri.108.2023.01.09.00.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:37:07 -0800 (PST)
Message-ID: <c3c35b5e-ec85-1226-c7a7-53bf4bd83713@linaro.org>
Date:   Mon, 9 Jan 2023 09:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos850
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Sriranjani P <sriranjani.p@samsung.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com, sathya@samsung.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <CGME20221214044423epcas5p2920e87930665345169745002ec6993c3@epcas5p2.samsung.com>
 <20221214044342.49766-1-sriranjani.p@samsung.com>
 <20221214044342.49766-2-sriranjani.p@samsung.com>
 <CAL_JsqLAqSoVdExrHXZ4xVaY4Ut5R54izoumOY8zsXWN2e8++w@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqLAqSoVdExrHXZ4xVaY4Ut5R54izoumOY8zsXWN2e8++w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/01/2023 02:15, Rob Herring wrote:
> On Tue, Dec 13, 2022 at 10:47 PM Sriranjani P <sriranjani.p@samsung.com> wrote:
>>
>> Exynos850 has two different SYSREGs, hence add dedicated compatibles for
>> them and deprecate usage of generic Exynos850 compatible alone.
>>
>> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
>> ---
>>  .../soc/samsung/samsung,exynos-sysreg.yaml        | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> index 4954790eda6c..427df05224e5 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
>> @@ -17,7 +17,6 @@ properties:
>>                - samsung,exynos3-sysreg
>>                - samsung,exynos4-sysreg
>>                - samsung,exynos5-sysreg
>> -              - samsung,exynos850-sysreg
>>                - samsung,exynosautov9-sysreg
>>                - tesla,fsd-cam-sysreg
>>                - tesla,fsd-fsys0-sysreg
>> @@ -33,9 +32,17 @@ properties:
>>            - const: samsung,exynos5433-sysreg
>>            - const: syscon
>>        - items:
>> -          - const: samsung,exynos5433-sysreg
>> +          - enum:
>> +              - samsung,exynos5433-sysreg
>> +              - samsung,exynos850-sysreg
>> +          - const: syscon
>> +            deprecated: true
> 
> This is throwing an error in linux-next now.
> 
> How can 1 item in a list be deprecated? What's the not deprecated
> value for the entry? Probably this needs to move up to 'items' as the
> whole entry is deprecated.

I missed this. I'll fix it. I'll updated my dtschema and see the error now.

Best regards,
Krzysztof

