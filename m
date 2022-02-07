Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB470C43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Feb 2022 10:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239114AbiBGKAJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Feb 2022 05:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245329AbiBGJrE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 04:47:04 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3FDC043181
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 01:47:03 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0F3FE3F1A1
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 09:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644227222;
        bh=RpKisFMVOYgXhr4OBFF0I13PIr7NXdi+wKM2xMCNQ4M=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Gn7MshsG9J1Ke5+3eCcwYpe5i0jScbu/mOcDCL99CFtmDJW5F7VjB3Z4OhybMxt55
         LBbvP3QIlqGYuHolUrorzj+1xQHrIfG9A+cV82DAnW5YresuS9FOPa17xEHNfpxyAi
         Yqw+Ac2081joSDl9Gdx9ktZDmLibh6CPYFnzxBLLK6AoRp/sqQi6H30k6HjJ/P2mGg
         hp1gjJoV+O6Xxdvb5K8pe5Z9O8gK6gURhmTYNqiDECPhCwONKzELK2SuKRiZBWgTqE
         Bxax7DtsvHf4Tk5QsYO+ZtRlFEpfhOf0/XzVizRFaPWNg1GGC6y4g3Ihbl9Gi6vH5P
         Qo+npaKNuKHXA==
Received: by mail-ed1-f72.google.com with SMTP id u24-20020a50d518000000b0040f8cef2463so41491edi.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 01:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RpKisFMVOYgXhr4OBFF0I13PIr7NXdi+wKM2xMCNQ4M=;
        b=t45vWRITbRUTOvFeZSP3549diByf8BSiVhWt8+VdJnUo99XbooipWPkiIeBwxwD+1M
         gDvHQldzwW0BCkhigI4xAUyJ3jA1XbHRphEOScTwg/twO2KOFU0nllNCCPVppyhmVJMj
         tIiX+u33P5RiAFu67QyzrGecQMdu2uq5/85T1Q4eV0cjgcTZHgwY1o0qAVgokn5OYfgq
         DxUSdjaDN92Kyz9f17H8hK4Vd/R/GffyEbOqo9egG0IC0Rr92r572lIKT6oAKL106dJn
         xG1GXXEPtJYO3hHMdQ2LQ49Kd4k9VQC+n5lHr2tG8CkuLMzc9+dBOybD7W25Xfox1nJo
         5A4A==
X-Gm-Message-State: AOAM5304cOLhjv5Qpy31R/RQ+NBP3QyFh4QxJLd0U3E+nQ+3xftt29YV
        IeKUWfiLHRYMcrW4EoZdAKTpn7mR5XgXJ9EOQ+i2OPZATyYC0Igai6dHQxBqTD7RYu55gvbS/yd
        +E52/9uAgzLUaz4DDlKyFeX6ybcxz42QzTNWqWJunlu96wZ43
X-Received: by 2002:a17:907:3da1:: with SMTP id he33mr9059616ejc.603.1644227221799;
        Mon, 07 Feb 2022 01:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1BoRtqvleLXKJ94x9jr4A9T/K/xfXE9FqqRN0ilJdw6S1IME3NnflwItPXK1N2kfs64wGqQ==
X-Received: by 2002:a17:907:3da1:: with SMTP id he33mr9059600ejc.603.1644227221642;
        Mon, 07 Feb 2022 01:47:01 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o3sm108814edt.67.2022.02.07.01.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 01:47:01 -0800 (PST)
Message-ID: <88fcdbe6-5fef-d9cc-a645-69e35230cdeb@canonical.com>
Date:   Mon, 7 Feb 2022 10:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/5] mfd/extcon/regulators: max77843: add
 dtschema/bindings
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
 <1bebedb9-644f-783d-492c-84a5de91720d@canonical.com>
 <YgDnUNCNCO+JLyHU@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YgDnUNCNCO+JLyHU@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/02/2022 10:33, Lee Jones wrote:
> On Sun, 06 Feb 2022, Krzysztof Kozlowski wrote:
> 
>> On 11/01/2022 18:48, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> The max77843 shares some parts with max77693 but it lacked bindings.  All
>>> its compatibles were undocumented.  Add basic bindings for max77843,
>>> matching existing devicetree.  These are not complete bindings, but
>>> rather reverse-engineered to match current state.
>>>
>>> I do not have access to device with MAX77843, so if anyone else
>>> volunteers to be the bindings maintainer, please join.
>>>
>>> Changes since v1
>>> ================
>>> 1. MFD: Use absolute path to schemas.
>>> 2. Regulator: mention all allowed properties,
>>>    additionalProperties=false, add min/max values for voltages and
>>>    current, don't use patternProperties when not needed.
>>> 3. extcon: Use absolute path to schemas.
>>>
>>> Dependencies
>>> ============
>>> 1. Patch 1/5 (dts): nothing depends on it, sending here so Rob's automatic
>>>    checker won't complain about DTS.
>>>    I will take it via Samsung SoC tree.
>>>
>>> 2. The patch 4/5 (mfd bindings) depends on regulator and extcon, so they
>>>    should come together (2+3+4+5).
>>>
>> Dear Lee,
>>
>> This patchset was reviewed and there are no outstanding issues. Could
>> you pick up patches 2-5 (skipping DTS patch) via MFD tree?
> 
> Are the subsystem maintainers not going to review/ack?
> 

Would be nice to have them, but maybe since these are dt-bindings maybe
they were skipped? Or maybe it was the end-of-year holidays?

I can resend hoping it will trigger more acks. Do you wish me to resend?

Best regards,
Krzysztof
