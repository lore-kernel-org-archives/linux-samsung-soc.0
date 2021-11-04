Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5C3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Nov 2021 10:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85E7761213
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  4 Nov 2021 10:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhKDKo3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 4 Nov 2021 06:44:29 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51068
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229809AbhKDKo3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 4 Nov 2021 06:44:29 -0400
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9D48E3F1FC
        for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Nov 2021 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636022510;
        bh=XjP2fjC2CP79thMtnxT/89+k8c9p5tf/Yx8zYwVAgZc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=YZNnDs+C+n0Wmpc+ymUKUzMejyfWzHnedokl1kbSEoOqVN34r+gMcXsfDJXcEZrQg
         SHpQ5I4J3HshOwMR4NlYwxoI0UlRakAmi5+4pYLR+VPdodTDK8G/Up+U+NErB2GokM
         daSh5iPeEqIqaAKcAKu1yQhCQJY6v0dkM19br6CkgdyQLs6iwsvXntnJZeQDTmQk+Y
         PB6PxTR1ILZZxqIqPDlGEGTMtKU/jB930P8nB+2hh6PcocojfxhtdwNbp4OH99NwSn
         Qa7Rkn0P9v0BVAB/7yfkBVDIi6OfKMC4SQVtunwzAYnapYM3290wik/NgaIldeSWgB
         NUFB8Z6HUHh7Q==
Received: by mail-lj1-f197.google.com with SMTP id c27-20020a2ebf1b000000b00218a2c57df8so1263317ljr.20
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Nov 2021 03:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XjP2fjC2CP79thMtnxT/89+k8c9p5tf/Yx8zYwVAgZc=;
        b=gJsZjCd+q2T62ijhGqP5Eo3LpicVCn7SntugeQHCHFQ5cVvi0cVRfc80l7UzakDd/m
         pFqwTb2xwRKzPHWutKqb5EBvz1TobS/W1lCLskWxIjShFErqDczG7Y29oZSrfKU15MmP
         v72N2+N3fnn1P+/3H6H36/tZG6WPevmFgDa7wuyOYQDjbreZ1D0SyBvGfMeLUfmlAnOM
         0p8TjIv78SZFJAXM+JT29/xXjZ93D1zv8FxJR0FaAnB44tCiE1/qZ81PHhB24Cer86x7
         938TxDdMpih9cJ0D/GGjV0J6ekU3jrAsbrXPoVG5frjNmukZuYPzSPM1HWhjaxA9dxRi
         DbEg==
X-Gm-Message-State: AOAM53178+ciEodrEIavIfT1/DXYw/VTBkiw1J1hODcYbdpf1jrwR/bu
        rCmpLuj92X1xQ6E6NojlOSZJFxefHbzhU1HvgUt4Tz6T74ORaVPjFdFLfvxJ6Q0cyFOWX0Id/I8
        J8TRcmpsc42hWVIIGoWI++/CRLI7gDerqX0ovRtkRuTwFJ7JK
X-Received: by 2002:a05:6512:ba8:: with SMTP id b40mr31165427lfv.99.1636022509983;
        Thu, 04 Nov 2021 03:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcVWZxpRCqlVKEY8+Aih2rcHGC1hTIGNYIka2Po6zcVgWIe7d32Gc0CzoCU1OvDBCt80C9hw==
X-Received: by 2002:a05:6512:ba8:: with SMTP id b40mr31165404lfv.99.1636022509686;
        Thu, 04 Nov 2021 03:41:49 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z3sm431731lfh.17.2021.11.04.03.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 03:41:48 -0700 (PDT)
Message-ID: <5b05ff2e-953c-d1a3-8347-4d3f9911cc49@canonical.com>
Date:   Thu, 4 Nov 2021 11:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] i2c: exynos5: support USI(Universal Serial Interface)
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        'Wolfram Sang' <wsa@kernel.org>,
        'Rob Herring' <robh+dt@kernel.org>
Cc:     'Chanho Park' <chanho61.park@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CGME20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5@epcas2p1.samsung.com>
 <20211101113819.50651-1-jaewon02.kim@samsung.com>
 <a571af00-8ac1-f1a5-3240-2c93f823c995@canonical.com>
 <001001d7d153$5fb18840$1f1498c0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <001001d7d153$5fb18840$1f1498c0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/11/2021 09:10, Jaewon Kim wrote:
> 
>>> +	if (ret) {
>>> +		dev_err(dev, "usi-sysreg offset is not specified\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	regmap_update_bits(i2c->usi_sysreg, i2c->usi_offset,
>>> +			SYSREG_USI_SW_CONF_MASK, SYSREG_I2C_SW_CONF);
>>> +
>>> +	exynos_usi_reset(i2c);
>>
>> You are clearing the reset flag, but not setting it back on probe failure. What happens if the probe
>> fails after this clear()? E.g.
>> because of deferred probe? The next probe try will start on a not-reset controller. Will it work?
>>
> 
> The user manual guides USI_RESET to be done after changing the system register.
> For clarity, we will change not only to clear reset, but to clear after reset.
> 

What I meant, is do you handle probe failure correctly (e.g. probe
deferral)? It's fine to leave the reset cleared after deferred probe?

Best regards,
Krzysztof
