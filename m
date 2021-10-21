Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F913C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 13:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 051F7611C7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 13:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhJUNMK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 09:12:10 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54444
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231206AbhJUNMK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 09:12:10 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 373B13FFF3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634821793;
        bh=LsLSwWX/aooK7LR05wvQfGIlyo9Xtj71zHzTzlar0ms=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=SSmN+NWiNYuG2kc1Jao0NyNo6upiQtdJEHbxgKlpXiGbcA2n+bqiWeTU7PyYlXywx
         iUwYCgnTcNgpvVKMWP+vS1Zq23Ue5p5W8QbHd6r7uKzxfwvY5kZ2KyuGd7kFMn4Lqi
         ATK0jodQy9pQ+bYtiMUzVQxwbUDodpB1gCfWR1lIx79GOcMd9fTANecmLQt3Vp7upP
         SYXMYDaOLeDD7HuI20aDoD93YTgHyi2QkWUsSOKZWy2M7MP8gU8+f/FsrqjFkvgkoR
         +gAz/tnuXhVTr71AyFAEvUTuXdjUNoH8JaLZkDSx0VYJO8VNC0ju1M3pbwWFLN7omD
         qXShNTvgFcxog==
Received: by mail-lf1-f69.google.com with SMTP id d12-20020a0565123d0c00b003fdb52f1cdcso337584lfv.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 06:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LsLSwWX/aooK7LR05wvQfGIlyo9Xtj71zHzTzlar0ms=;
        b=enNr44F5byeR5nCoXFEOLDEcV08I9P5UBQ6wzLrY/mCWhZhlxGMO8NZE9wBKZgr8LK
         LPoo1IfqUoKx4JEG8FZdTQ5/hpREMvBv/2XyhTC+MszkonAkXG86Qs0L/5h1s2C/bEor
         KWooXg/1qxkxyTZwAX06BgDON6fJfvnTGZCAYH/T1rTfiffFXZp+UJb5AoAERixss8Gf
         0iB2NAeTVam0fnoXUiZ/60Gyuz2uNWKdi9wIgy/ah1EpGmIu66x3MLbVUDt6hvui35IN
         lnWDtlXYtH5AB860tfQjhjzjrvHMhPwlHOCPeYanO5PVuG223AN+a2R+JxDrbmbYQFG2
         wq9w==
X-Gm-Message-State: AOAM531i1RBB1MxKOIC2qLJd73M+67+tGundhn4n/0SrlBveAyalNE1O
        b3iZ4m1/W8k6ZfcYI+gVZwK9XZbKiqRkIjG7PG7djJuUebr4dOMMvWP4bIMmx8Rg+rdnQb+PqQz
        N/tzkLAMuXiL78wGkitbk771M9YEuxgBpZ65khMpRkdzrD6n7
X-Received: by 2002:a05:6512:20ce:: with SMTP id u14mr5618478lfr.548.1634821791885;
        Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Q8yU5QzJPLw3kvAdO+Jn8XVXoKvjIRiitatn+3XEGA9u7UY2LAfxyxt0u2Zf+taROiCpGQ==
X-Received: by 2002:a05:6512:20ce:: with SMTP id u14mr5618453lfr.548.1634821791675;
        Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r10sm539546ljp.56.2021.10.21.06.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 06:09:51 -0700 (PDT)
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To:     Conor.Dooley@microchip.com, arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc:     olof@lixom.net, arm@kernel.org, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk@kernel.org, palmerdabbelt@google.com,
        paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
        linux-riscv@lists.infradead.org
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
 <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
 <10f5244d-ba2a-33eb-72dc-77b2a7a0d101@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com>
Date:   Thu, 21 Oct 2021 15:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <10f5244d-ba2a-33eb-72dc-77b2a7a0d101@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2021 15:06, Conor.Dooley@microchip.com wrote:
> On 21/10/2021 13:23, Arnd Bergmann wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> Hi Arnd and Olof,
>>>
>>> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
>>> August 2021 (v1, v2), resent in September and pinged two times.  They got some
>>> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
>>> unfortunately Palmer (RISC-V maintainer) did not respond here.
> 
> Out of curiosity which series is this one? Is it the one with the 
> plic/clint changes?
> Pretty sure that I have taken them in internally, but I am going to 
> submit a bunch
> of changes to our device tree soon (tm) and want to make sure I have the 
> right
> dependent series listed.
> 

There is only one Microchip patch here (plic/clint). Others are for
SiFive. All the patches are described in the pull reqeust:
https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/

I had also second set of RISC-V patches for Microchip. These were picked
up by Palmer:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next


Best regards,
Krzysztof
