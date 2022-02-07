Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F49C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbiBGJG3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 04:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243647AbiBGI4o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 03:56:44 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E967CC043186
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 00:56:42 -0800 (PST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8F0E53F22B
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 08:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644224201;
        bh=btDpU5FmsTkCm5Mc+WyqRMkXXG3Fg8Z86T3tz0oN0CM=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=HepHLUJh7x3PakI0ZWJV0Iy7bSoGdHu68AE9wjL1bUgbOacsNEc5ZVSrOoXzIbjPP
         a2Qxm9VLBNzFNIkPVJkF+Lbckf7nhUN9rbwd0uBTKK7qu+bpmYt8QblGX9f8lvBLWw
         Py6vDiaJkyNirKJK72AyzQloEdSdt/7Wo4RlKQvIY8IGpuo+epS2wKfwtSKYPdNRM/
         cpNYofpHIkOAGiD+v80C3L6PYsT4zNcXtyY5X8yVklFD7WrzybSLq5flIp+60DfxD2
         qDrD18XitNL3p3LmdhA6LB2i/4ktTlRpe2OrY4zh7T2fj3owW7+e9MjQEzItDE+VMp
         R+vxYns3BDtYQ==
Received: by mail-wm1-f70.google.com with SMTP id 130-20020a1c0288000000b0037bc5cbd027so1733031wmc.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 00:56:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=btDpU5FmsTkCm5Mc+WyqRMkXXG3Fg8Z86T3tz0oN0CM=;
        b=g3KzQClVPggt1yln+EY6WFDb3XAosQDADXldw6n0Vk2s9MYko7qdp25w/g8ZIvHdcl
         2B2xPCDRqEofsKEo1pPNSjgffh90H+q4WEL23PVuA3bKeqGzDiWYY8IfOvicA77umQFl
         5ARDvxMfje1/s5QJpAKh+h1wvNwYaQWNLaUabUpOHV9R39+jedjwwGz9YwctVQ3CTZM7
         X6mSS36+p6E3vJoWsfLI0Cb8r1VPJ9n8PfYzOOkpKW8MLcUZA7qNAL/wpOIb6OYP8t1R
         miioWwM5/aBtnALvu1mQi+AxPD6scY/zokIH9i0xRbQx89nUQ6RW5hb3DUSC6CVDoPhE
         Fmow==
X-Gm-Message-State: AOAM530HGzdlfwyGLGOBktfXzOru5PV/SuGUT240b/UR7e7T0n23cFeA
        BlxdxeyWqVy/GvmsYHJhiZHETBzxhjRFImx0jdal/f89akjOscxS3nra7uDbxAFwj3gkXv4DJ/x
        IObTnnR5IXzbP+FzDzZG2p8ADtpvCJjvZjxxl6NOw8r1bsvwX
X-Received: by 2002:a05:6000:16c5:: with SMTP id h5mr9011096wrf.364.1644224201260;
        Mon, 07 Feb 2022 00:56:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUWIz/kuedsRBnrB7RSMh9Ojazqtas2KPEtQ5IG7MGExl8fZ8JQjN+4o3EFV9rqV86qk4Cxw==
X-Received: by 2002:a05:6000:16c5:: with SMTP id h5mr9011087wrf.364.1644224201104;
        Mon, 07 Feb 2022 00:56:41 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t14sm17259601wmq.43.2022.02.07.00.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 00:56:40 -0800 (PST)
Message-ID: <4b18991e-1c93-077d-368f-a861e8c2b845@canonical.com>
Date:   Mon, 7 Feb 2022 09:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 5/8] dt-bindings: memory: lpddr3: deprecate
 manufacturer ID
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Lukasz Luba' <lukasz.luba@arm.com>,
        'Dmitry Osipenko' <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
 <CGME20220206135825epcas5p4c07136cf0a54eb4d6c8441cd6dbf14bc@epcas5p4.samsung.com>
 <20220206135807.211767-6-krzysztof.kozlowski@canonical.com>
 <0a7101d81bd9$33088840$991998c0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <0a7101d81bd9$33088840$991998c0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/02/2022 05:14, Alim Akhtar wrote:
> Hi Krzysztof
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Sunday, February 6, 2022 7:28 PM
>> To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>; Rob Herring
>> <robh+dt@kernel.org>; Lukasz Luba <lukasz.luba@arm.com>; Alim Akhtar
>> <alim.akhtar@samsung.com>; Dmitry Osipenko <digetx@gmail.com>; linux-
>> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org
>> Subject: [PATCH v3 5/8] dt-bindings: memory: lpddr3: deprecate
>> manufacturer ID
>>
>> The memory manufacturer should be described in vendor part of compatible,
>> so there is no need to duplicate it in a separate property.
>> Similarly is done in LPDDR2 bindings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>> .../bindings/memory-controllers/ddr/jedec,lpddr3.yaml         | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-
>> controllers/ddr/jedec,lpddr3.yaml
>> b/Documentation/devicetree/bindings/memory-
>> controllers/ddr/jedec,lpddr3.yaml
>> index d6787b5190ee..3bcba15098ea 100644
>> --- a/Documentation/devicetree/bindings/memory-
>> controllers/ddr/jedec,lpddr3.yaml
>> +++ b/Documentation/devicetree/bindings/memory-
>> controllers/ddr/jedec,lpd
>> +++ dr3.yaml
>> @@ -40,7 +40,9 @@ properties:
>>   manufacturer-id:
>>     $ref: /schemas/types.yaml#/definitions/uint32
>>     description: |
>> -      Manufacturer ID value read from Mode Register 5.
>> +      Manufacturer ID value read from Mode Register 5.  The property is
>> +      deprecated, manufacturer should be derived from the compatible.
>> +    deprecated: true
>>
> 
> Shouldn't it be the other way? As DT describes hardware and MR5 does contain
> the Manufacturer ID, 
> so getting Manufacturer ID from MR5 makes aligned to hardware description.

The code/driver can read MR5 and report it to user-space in case for
example we have a device compatible with different vendor and same
compatible is used. So compatible is re-used but we want real
manufacturer ID from the hardware.

But storing a fixed MR5 value in DT does not fit here. If someone takes
effort to encode manufacturer ID in the DTS, then he/she should take
effort to actually document the compatible.

Basically having MR5 in DT is equal to having a compatible in DTS. I
prefer the latter - simpler, less properties, using existing property
from DT spec instead of custom one.

Best regards,
Krzysztof
