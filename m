Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2A7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B9BD611C7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 15:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbhJUPJR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 11:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhJUPJR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 11:09:17 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEDBC061348
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 08:07:01 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id g184so580689pgc.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=8J+7f2f4xuhNe3jNVdWk7a86I7pUDjUPQRras1jT8jA=;
        b=j2xqGy2XNECrbul6qEKx9SST/rdB96W/R24/Vvcb8OqiQ/EHcxnhHYfq5uycgpIPfE
         RcoveVySySpwpVV4tBCzFXMBjD2Nbo+r7Vouu3zvunyfI91UcGulu7Nf/Efg6vE0BHHv
         /LkDq7xiH7ZfRV3m5sF462W0KJ3z1wKCyuvxatQAiZ0IhNp9AB4OJO5f48RqdrwxWEXV
         mKN4COsAen3/I4rFmP2EK85hFYa8xqnSauu6h/p0/SzhsTzXY2mralghgKwja2Of6/fO
         GfDWT4tqD+WyHwETcfuO7Mci1xa1bCHrSgDFMYZySCx/rxAhmzRhX68rxf6QbT/UQcIq
         UsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=8J+7f2f4xuhNe3jNVdWk7a86I7pUDjUPQRras1jT8jA=;
        b=n6e9G0Ef9XivNBhGV1lz9vh00gFvXhmI3+3AaHHN3H6CCJmj4O/+rm78lPj9PFqOAF
         lD0jCMX/oodNnlW3pT/QUmjqp0fmN6GgQe1nD8Zgl17cqi+0gN2whh6SjM6kyaljb8bd
         z8MFn3n6iEFJO+2fr7935ZrHriEfrBEWOJxqpbuOQ2gGiwkCi4l3EY1FVYY+GD7xvvu6
         HGW1tTvsnwxRPI3KmWazaBOVagE0g1nKYNNzhhWsRdc0TSZC0Ae10O0r7hSLeQ4qewko
         3RGQOe/v8FErwQ36m2wMwOj/kjLr6ymQRmVnZZCu2D+uWcQEGeo7MX+A5PvQ/BQm1WVJ
         oqEg==
X-Gm-Message-State: AOAM532pouaLFdmP24nERPrMPu/uv9ZAWm3nK6UW7U4vjUqV9/dpR6nU
        fsTD0g36dJMpaVxlrUGJzE+LFA==
X-Google-Smtp-Source: ABdhPJyz7GFpoPYi0O9X5+kNyiRMV3FyOoAIfXtYBZpu6m8G0bDaRlzBGocZrUEoxY+npHCfOUgOYA==
X-Received: by 2002:a05:6a00:b48:b0:444:f9d4:d800 with SMTP id p8-20020a056a000b4800b00444f9d4d800mr6713446pfo.38.1634828820211;
        Thu, 21 Oct 2021 08:07:00 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:459d:a8c7:78e4:f487])
        by smtp.gmail.com with ESMTPSA id 60sm9545333pjz.11.2021.10.21.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 08:06:58 -0700 (PDT)
Date:   Thu, 21 Oct 2021 08:06:58 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 08:06:53 PDT (-0700)
Subject:     Re: [GIT PULL] riscv: dts: few cleanups for v5.16
In-Reply-To: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com>
List-Id: <soc.lore.kernel.org>
CC:     Conor.Dooley@microchip.com, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, arm@kernel.org,
        soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmerdabbelt@google.com>
To:     krzysztof.kozlowski@canonical.com
Message-ID: <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
> On 21/10/2021 15:06, Conor.Dooley@microchip.com wrote:
>> On 21/10/2021 13:23, Arnd Bergmann wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>> Hi Arnd and Olof,
>>>>
>>>> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
>>>> August 2021 (v1, v2), resent in September and pinged two times.  They got some
>>>> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
>>>> unfortunately Palmer (RISC-V maintainer) did not respond here.
>>
>> Out of curiosity which series is this one? Is it the one with the
>> plic/clint changes?
>> Pretty sure that I have taken them in internally, but I am going to
>> submit a bunch
>> of changes to our device tree soon (tm) and want to make sure I have the
>> right
>> dependent series listed.
>>
>
> There is only one Microchip patch here (plic/clint). Others are for
> SiFive. All the patches are described in the pull reqeust:
> https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
>
> I had also second set of RISC-V patches for Microchip. These were picked
> up by Palmer:
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next

Sorry I missed this.  If you guys took this through the SOC tree that's 
fine, otherwise LMK and I'll put it in the RISC-V tree.
