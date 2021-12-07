Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6354BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Dec 2021 09:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234210AbhLGJpN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Dec 2021 04:45:13 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37010
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229510AbhLGJpG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 04:45:06 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EDE193F1F7
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Dec 2021 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638870095;
        bh=qLCDTAsKhjfBLk9Ve3yIdzH9fR1aqVaxiH+88h3GaWI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Irx9o6VQpcEcNGsRfw34l9OMCN2X9fvfJQcMPFaXvndcKQCNFO+qO2Iu4pKpVy52W
         gFA4z+CS+r6kctf9M7Usw4LfCRVFtjb9AljREAfSjWmmaCE3Ja97yTa+0NhwssADrU
         YDAjqBA85ZScBLQ7GivNPZpwNxvRiyISXKYjrlGmOfwI6Bx279Xs5LS5xmd6tsnTTk
         8NO1CyljoWoRe4RO9cEG/fyNVaPCgtZvpQnAh5TwxSM4sZH67l5xs0+7wWIj6CC/7h
         kOzYXZPGs821FtpxGTSMtPIAUCXMmla8oCWU8daE42h/vx0g+5x45QA4xVLG2OyB66
         Qmy4exgGgWMpg==
Received: by mail-lf1-f72.google.com with SMTP id n18-20020a0565120ad200b004036c43a0ddso5087222lfu.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Dec 2021 01:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qLCDTAsKhjfBLk9Ve3yIdzH9fR1aqVaxiH+88h3GaWI=;
        b=r/B+aE25S0wIeiBlPdw/QfU9nAkz5GqHWm1DVHCdRYcTyAE/u8MaS2eGsjEcYWzsVq
         M9ViXY2XwBrnGeHqr3IkRHCbiSCFft/9rW8+dQzDLIlebanxPbP07VkIxv7x7kv1nmAC
         vry+CmpQe91IPWWl20Ja187Js5sl4uZY/l6NJfWyHxLy0KseTWFbJuR9mfq+Fx4vAFI0
         V6yWpbbmS2QZQLkeS91PjLA9lt7YbblyPalLPcF7UiUYass1qLtu5jHleeCIj67nIVja
         YpIawj9W8oDbx1l8pmrmuShXZrZwDaz8glT6RMjKAe5XSJDB1qVvWAs8FOf6TDzcSB4y
         +vqQ==
X-Gm-Message-State: AOAM530fV82Qq53u9WCVuZK8Y1XoIPANpnLYp7mtY9z88uv/bpZPy7QF
        jhx+wv5hkSpbJkQSgw92i4qsf+Aw8g4c4X/Cteh8AkTv7aUFeNPVVExoUPpsYMmPN3REjxUcbsp
        FEFo41WQFKktca70FYajJqeVTF9/zJrRr5X73nW7eF9N22qAi
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr41747248ljp.280.1638870095359;
        Tue, 07 Dec 2021 01:41:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTIIHv+OTH72uTn3pxiMOlzQZ3JgtLIY2GTKOhXzdm0Y5VXk7QWDAiHXPLov1dDK7gUn1uEA==
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr41747234ljp.280.1638870095183;
        Tue, 07 Dec 2021 01:41:35 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f14sm1790586lfv.180.2021.12.07.01.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 01:41:34 -0800 (PST)
Message-ID: <59812744-9335-62de-11a3-8d321d66f335@canonical.com>
Date:   Tue, 7 Dec 2021 10:41:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 3/4] mmc: dw_mmc: Add quirk for extended data read
 timeout
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     Doug Anderson <dianders@google.com>, kernel@axis.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211206142929.26729-1-marten.lindahl@axis.com>
 <20211206142929.26729-4-marten.lindahl@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211206142929.26729-4-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/12/2021 15:29, Mårten Lindahl wrote:
> Current dw_mci driver supports a TMOUT register which consists of a 24
> bit field (TMOUT[31:8]) for the DATA_TIMEOUT. The maximum value of this
> field is 0xFFFFFF, which with a 200MHz clock will give a full DRTO of:
> 
> 0xFFFFFF / 200000000 => ~84 ms
> 
> However, the ARTPEC-8 SoC DWMMC IP version has a TMOUT register with an
> extended DATA_TIMEOUT field, which supports longer timers for the DRTO.
> In this version the DATA_TIMEOUT field is split into two, which with the
> same 200MHz clock as above will allow a maximum timeout of:
> 
> ((TMOUT[10:8] -1) * 0xFFFFFF + TMOUT[31:11] * 8) / 200000000 => ~587 ms
> 
> Add a quirk to support this. The quirk is enabled for ARTPEC-8 SoCs.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
> 
> v2:
>  - Removed unnecessary comment
>  - Change 1<<0 to BIT(0)
> 
>  drivers/mmc/host/dw_mmc-exynos.c |  5 +++++
>  drivers/mmc/host/dw_mmc.c        | 33 ++++++++++++++++++++++++++++----
>  drivers/mmc/host/dw_mmc.h        |  6 ++++++
>  3 files changed, 40 insertions(+), 4 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
