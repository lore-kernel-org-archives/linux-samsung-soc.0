Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003A2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Nov 2021 18:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D119660F4A
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  6 Nov 2021 18:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhKFSWv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 6 Nov 2021 14:22:51 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39482
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231911AbhKFSWv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 6 Nov 2021 14:22:51 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ADD323F1BD
        for <linux-samsung-soc@vger.kernel.org>; Sat,  6 Nov 2021 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636222807;
        bh=WIA6znI9FNppQXsU/4zd04Ze8Ju7uBicMpX5Dbq2EEw=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=g0eWGUajXa98/eUvRyLkP9j0azEOioraiTZi1CZ6DQsnMIiSgP6DJAX9Ja24zytl2
         3pqU48ZgCyzvec9QwfmyXpFqUs/ga6XUSOmMzvCeztRt4XpbwHEOZ0Wa9tHfbMIgKT
         pjS/IvKIsMZc8ERDLIcU2Um+YKU2Ww+CMEUIbdvSQjtuhTbRBmyx7L1WcU2dx7sAXE
         OcJg/yrMIknJXios2Ibpj3rB1fijyu+4m/SNwjJ5ogqKbfe/zrCOExjtZEuqV7ypDc
         7A+WhLpvxVEk4x2nLi36E4+0G1IoIS6Pp1w3gfAlrOp+q45P+fuGqVTFB2uEqBeJxr
         VQSvD5C6pQQuw==
Received: by mail-lj1-f200.google.com with SMTP id h14-20020a2ea48e000000b0021789353d84so4043131lji.15
        for <linux-samsung-soc@vger.kernel.org>; Sat, 06 Nov 2021 11:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WIA6znI9FNppQXsU/4zd04Ze8Ju7uBicMpX5Dbq2EEw=;
        b=nmXtoLiHX4hIF8WuPihSTiIAcRBQzdvBCCETYBU8o356Z6MStNCpY4cP9U1XSS4tsg
         T5uaf/iyQxqz7VVX+aD+ZIs3KitYQBuV2FWxPfsu7Y++hlMgP1I/8ipKlg2r5viX99io
         kSq/4CWx8vanGEgO6xROycLjasWlM5VCDaxcM0fifotvOpMSn06AO4BoUNfWyCOlN2Lz
         uffMIfMeC5sTNFmysn1bDneNgFPyZ0E/ZRlyyyvnaVOOz7YaYFBIbIW5WG7gbXt0B1QZ
         0gOq8/aY5VtKW2yci7SvdgrnY0VqnqNbexo3Iknt1uyh+P7Gcl618BHlIGR5PhHbeGk5
         +asQ==
X-Gm-Message-State: AOAM531ubWKsFeZe5tgwqyqFbfF3Qad+N1LFy8qhPVtzWMIhpUBAaJbe
        JgceF0Ti9X2p1zLeKiwJcwIdPwMh3rD9lHiC0BciplhefamV5OmnvyWnFDYsMXZXX2z4O7sDWiy
        MpOwGJwEo7AbLRmCCXnqTBR0ldfx3ClThU2RDGux915of/53J
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr59416679lfv.560.1636222807031;
        Sat, 06 Nov 2021 11:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcDjE7RoN0197mKZwHR2ILmAx9+DqEU9uM8skfKRIDRSOumC4sRX2YZjCDqODuVamG66SNQQ==
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr59416661lfv.560.1636222806822;
        Sat, 06 Nov 2021 11:20:06 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j20sm1226050lfu.199.2021.11.06.11.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 11:20:06 -0700 (PDT)
Message-ID: <08c8f447-dcae-83b4-e5b3-a13704a5b158@canonical.com>
Date:   Sat, 6 Nov 2021 19:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RFC PATCH] ARM: s3c: mark as deprecated and schedule removal
 after 2022
Content-Language: en-US
To:     Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kukjin Kim <kgene@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Sam Van Den Berge <sam.van.den.berge@telenet.be>,
        Lihua Yao <ylhuajnu@outlook.com>,
        Heiko Stuebner <heiko@sntech.de>
References: <20211102110519.142434-1-krzysztof.kozlowski@canonical.com>
 <c4bcafd0-f614-78c8-4d72-5d2b672f7e32@free.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <c4bcafd0-f614-78c8-4d72-5d2b672f7e32@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/11/2021 18:49, Cedric Roux wrote:
> On 11/2/21 12:05 PM, Krzysztof Kozlowski wrote:
>> If there are any users, they might respond and postpone the removal.
> 
> Hi Krzysztof,
> 
> I use a mini2440 (which is s3c2440) as an http server at home.
> I don't have much time but I can do some testing from time to
> time, but my setup is very custom so I don't know how helpful
> that would be for the community (if there is one).

We just need to know whether the kernel behaves properly on the
hardware. The setup itself should not matter, but what matters more is
that you do not run a new kernel at all. There is a lot of untested code
there.

> 
> I would be sad to see official support disappear, but I know
> how hard it is to maintain stuff, and I think I can keep going
> with the current kernel I use (which is not even 5.xx I think),
> so that would not be a big damage for me. And if I have special
> needs in the future (very doubtful) I guess I could hack something
> on my own.
> 
> Anyway, there is at least one s3c2440 server on Earth powered
> by the linux kernel. Now you know! :)

Thanks for coming back! We will see how much of feedback we gather.


Best regards,
Krzysztof
