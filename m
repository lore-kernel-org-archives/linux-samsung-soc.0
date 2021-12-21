Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE479C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 08:19:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbhLUITu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 03:19:50 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53782
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233687AbhLUITt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 03:19:49 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9B49F3FFDA
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640074788;
        bh=AmwBkgsCQBlvy6a8IJhNBe3rHFIw/oazUsEvZEPNdNw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=p0gp1Ub/qBL4Lo0HnHH0ySOaLrz2zHVSV+jPW6Nlzta9gdEaA0qt7fumUtBmKfRlL
         gAhkExfiWqLj5PTHrZzK4gQlBtwyNldRXIBzT9EQTwWI7dMfYBcXb+apTs2RmOFW3y
         XJQ6ujOMPbTi0SOFjwd9DIl1nal4zEr2NHgAlr1s3RTMt1gHDKOaHI4FmapOarKb/O
         rWX/HxroBATh69wF58tn3VYjyKSKt4uk9xdTzhbRvTyoVX5H98u2NC2+GlmdQcMDYK
         PICxzYkZmjCg/b8Dp7ok6kW9e1ZZwEkruh9VpkuVCg4F/iACBKIneR8lFjmcf1/sTH
         6lRtxU9REfh/A==
Received: by mail-lf1-f69.google.com with SMTP id m5-20020a05651202e500b00425baf04eacso3186636lfq.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 00:19:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AmwBkgsCQBlvy6a8IJhNBe3rHFIw/oazUsEvZEPNdNw=;
        b=kquC1Yxr3inh/gv2mSw4w2Pqc7bUE+rQNaUOgNJ2jNSCt0KZaWisawzIP7nvaJ1DsB
         6epkQt+vc1MjDlxvdKNNH5UtDTnUv+JOUx711bvMjpRB0L+6H+j/O+/UuoDBW66wNak8
         k19kZjGyBLKQacb4g5cNBY/FkmmaZJ34HEVwcRmoBrnV9HpzmNmgpC2x1tmiR3i+mkbS
         PiR7F/jv2OB+taRpjwZNfG4Gu9UhAY7R/Wqo4oJNEWoBxADGxPt7tTlRB4v7soFVR/s4
         ODiH+CTPIrIgwlJq+aQXR0KTHj5DeftGdC+sWSO8+fiyhKyXs2eGJ54FytDJH/l7QpPY
         3UkQ==
X-Gm-Message-State: AOAM533sNWBiwJEhwmonJE9YAPGYUn3PxYuTCV07z7R87k0uPnAiADKh
        lNIFYvxhu6qaKk3VT6Qb3KevCedEcs06kxcP+o4XajJ9ijzx9GArz6KN37UTj3pB2xkO6BLcCa2
        wCECFOLDREawpHB6G9eZVlZZlOim8Mw1QOjS/uqek7R8ePxPl
X-Received: by 2002:a2e:b177:: with SMTP id a23mr1708974ljm.168.1640074787954;
        Tue, 21 Dec 2021 00:19:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy/XhlYssCNLAWRYkWoIWMzAeGZqkYE+7VzTrmhujnAacn27xoPqnMQ2uSgBrGs8xv+IeKow==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr1708948ljm.168.1640074787666;
        Tue, 21 Dec 2021 00:19:47 -0800 (PST)
Received: from [192.168.0.27] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z26sm2654830lja.48.2021.12.21.00.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 00:19:47 -0800 (PST)
Message-ID: <edd828b4-66ad-1c1e-4332-e1b05931e92a@canonical.com>
Date:   Tue, 21 Dec 2021 09:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211217161549.24836-1-semen.protsenko@linaro.org>
 <20211217161549.24836-2-semen.protsenko@linaro.org>
 <2fdc5c97-6c19-8e70-d717-28b29d86160c@kernel.org>
 <5bd5c0bf-4390-22c2-e4e0-cb02b80dfb9c@canonical.com>
 <CAPLW+4msw_yeG4uDbS9mMULOuc43MK9O6Paya_Z2jBj2t6ZTiA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4msw_yeG4uDbS9mMULOuc43MK9O6Paya_Z2jBj2t6ZTiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/12/2021 15:55, Sam Protsenko wrote:
> On Mon, 20 Dec 2021 at 11:31, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 19/12/2021 23:29, Sylwester Nawrocki wrote:
>>> On 17.12.2021 17:15, Sam Protsenko wrote:
>>>> System Register is used to configure system behavior, like USI protocol,
>>>> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
>>>> make it possible to modify SYSREG registers.
>>>>
>>>> While at it, add also missing PMU and GPIO clocks, which looks necessary
>>>> and might be needed for corresponding Exynos850 features soon.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>
>>>> Acked-by: Rob Herring<robh@kernel.org>
>>>> Acked-by: Chanwoo Choi<cw00.choi@samsung.com>
>>>> Signed-off-by: Sam Protsenko<semen.protsenko@linaro.org>
>>>
>>> Apologies for late reply, this patch is applied now.
>>>
>>
>> Sam,
>>
>> The clock is used in the DTSI, so since this was applied, there are only
>> two choices now:
>> 1. wait for next cycle with DTSI and DTS,
>> 2. Resubmit with replacing the newly added clocks in DTSI/DTS with
>> numbers and a TODO note.
>>
> 
> But why? I thought because Sylwester applied my clock patches, those
> will get into v5.17, and so DTSI/DTS might rely on those clocks? If I
> get it wrong, please let me know why, and I'll go with item (2) you
> suggested.

If I apply the DTSI+DTS, all my builds will start failing. The
linux-next (since Sylwester's tree is included) should build fine, but
my tree won't be buildable anymore. Then arm-soc pulls my tree and gets
said because it does not build. Later, Linus will be unhappy if he pulls
arm-soc (thus mine) before clock tree.

Other solution, instead of using raw numbers, is to copy-paste the clock
macros you use directly in DTSI and do not include the clock header.
This actually might be cleaner choice - changes will be limited to one
place in DTSI.

Best regards,
Krzysztof
