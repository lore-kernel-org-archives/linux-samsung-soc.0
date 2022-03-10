Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1009C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Mar 2022 07:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbiCJH2S (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Mar 2022 02:28:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239658AbiCJH2S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 02:28:18 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6F3131F5F
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Mar 2022 23:27:17 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 846C93F60D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Mar 2022 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646897235;
        bh=+acyt1BEYt28lv14s1mevIXPMuYm70g76NXbcp8FI4Q=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=nlf4TD4QXdV9WX9zC6a3syofvh6UKsZ8oCTq0Y0FnbC5ymRIoSzYQrvyGuoXIZ36B
         /yB06Q2tvWk6xNCX0GlMhqAFqUp9s5kuzqXeyyI595ZFnGx4aFn8ajOg1bCRp7fBII
         Ot+6MSa2+4ruP3oD5p95RoEEmVazxWTBZspKe2UMA8YG2N0vYjVoFQdGaI9bghBIIV
         1GakoGQd5GfyDYuncTPELr1xtUhS5D2TDTEcsIG+OkduKdOOZnIDgdRZ89TKrKsseo
         ygiDtDTJz6HgcapWG1x4rP97Hq63BwoIP2OqJPVOSud1bQDWjsmWo19q45BUkmYDVC
         rN5UvlTxHc/1g==
Received: by mail-ed1-f72.google.com with SMTP id r9-20020a05640251c900b00412d54ea618so2606678edd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Mar 2022 23:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+acyt1BEYt28lv14s1mevIXPMuYm70g76NXbcp8FI4Q=;
        b=2e1xztoMFu8S5TMOkwgJSj1ZsWkbpSw0iRSFBLHdChNmbfNutI/DHygcyCccGRiQrS
         40G1osTh+uwnPmlupfT9DijughsYHQKNGLU5Ypcb6uRWa/FIJ8fdyRTf47M7JVBtX3zr
         CiO7puYLFnymr6AcW/P6mkB0kCpY+chKTrqpKj3xL0siZ7fg4mRjXyMLuaZia9KkXb0U
         09MMY5Z87Z5U062DSo2wU/RtStbfZHQgjcX6SwQcRi4Xecxm/MV27BHSMBX4zMTC9lYf
         Li8F+vlIV0BfppGFDnLZVRfqpDBUMa2BD0vi+DHenTQ6CXbKk7l/b1ts/wdb8PboDf3W
         9WpQ==
X-Gm-Message-State: AOAM531TITSSam0i8fMBD91e2LFGjlLW/ZFPAqc6bv0+LF2Q6TutgXOK
        5RBZ/L28h26yJQRHgDYZaGasTu8Drkl1PPbb5InqLe5QlYrRmje2HdEgKsjn1QX24uDKQvYhiuK
        7QbibYwWFL18n7x2sUX00eKfmCcUpyjuINJymK995do4Vm1lm
X-Received: by 2002:a05:6402:138c:b0:413:3d99:f2d6 with SMTP id b12-20020a056402138c00b004133d99f2d6mr2952789edv.189.1646897234319;
        Wed, 09 Mar 2022 23:27:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzQuVV4dB21GEZgLzk4Y0WlFO6imhKw5gqs41AlbOenE756SkJgsXrLljtdN3cWc0hbCtd/Q==
X-Received: by 2002:a05:6402:138c:b0:413:3d99:f2d6 with SMTP id b12-20020a056402138c00b004133d99f2d6mr2952776edv.189.1646897234145;
        Wed, 09 Mar 2022 23:27:14 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id kq26-20020a170906abda00b006da87077172sm1528795ejb.29.2022.03.09.23.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 23:27:13 -0800 (PST)
Message-ID: <947f3f39-7f49-d411-8aa6-094ada825c34@canonical.com>
Date:   Thu, 10 Mar 2022 08:27:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/5] dt-bindings: extcon: maxim,max77843: add MAX77843
 bindings
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
 <20220111174805.223732-3-krzysztof.kozlowski@canonical.com>
 <CAL_Jsq+cNrh=o7RL=2SH5888=YU9m1QhA5q+eCTFXVbbw57oJA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAL_Jsq+cNrh=o7RL=2SH5888=YU9m1QhA5q+eCTFXVbbw57oJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/03/2022 22:03, Rob Herring wrote:
> On Tue, Jan 11, 2022 at 11:48 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Document the bindings for MAX77843 MUIC/extcon driver, based on
>> Exynos5433 TM2 devicetree.  These are neither accurate nor finished
>> bindings but at least allow parsing existing DTS files.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/extcon/maxim,max77843.yaml       | 40 +++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml b/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
>> new file mode 100644
>> index 000000000000..f9ffe3d6f957
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
>> @@ -0,0 +1,40 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/extcon/maxim,max77843.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Maxim MAX77843 MicroUSB and Companion Power Management IC Extcon
>> +
>> +maintainers:
>> +  - Chanwoo Choi <cw00.choi@samsung.com>
>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> +
>> +description: |
>> +  This is a part of device tree bindings for Maxim MAX77843 MicroUSB
>> +  Integrated Circuit (MUIC).
>> +
>> +  See also Documentation/devicetree/bindings/mfd/maxim,max77843.yaml for
>> +  additional information and example.
>> +
>> +properties:
>> +  compatible:
>> +    const: maxim,max77843-muic
>> +
>> +  connector:
>> +    $ref: /schemas/connector/usb-connector.yaml#
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/port
> 
> Now failing in -next:
> 
> Documentation/devicetree/bindings/mfd/maxim,max77843.example.dt.yaml:
> pmic@66: extcon:ports: Unevaluated properties are not allowed ('port'
> was unexpected)
>   From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/maxim,max77843.yaml
> 
> s/port/ports/

I'll fix it up. I wonder why I did not see warning before...

Best regards,
Krzysztof
