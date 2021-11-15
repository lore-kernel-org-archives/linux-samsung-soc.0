Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB9FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7580863222
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:36:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhKONjQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:39:16 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48278
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231669AbhKONfA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:35:00 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1FB7D3F1A9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636983123;
        bh=4YeUT5jAqk0hL94x45nFoxH/ZKvBxBqGJy25for+rc8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=W/ZVY+hYY9S9jtgKPTB/DY3bEm338SQJBIkjffsn7zURWxlYi3kYIb2vD5v1UF6Ym
         VbmAwUc+WnB2CpkXYXx/34n5B/1UZUEQqwCA7YOMRptdFjEWq8n9vizo+inZ0CU34K
         kUIGjOh/knttN7O1h+osw4RjQ6PgKnGC/n4Yj8ARnMdGM9tOL4urXwJRHuID4i9ZpR
         l5PkhDeiR+XGcTgksLi3OyKLeL+x7jZ7QsREf+UsgvvkIktkYDLlMiSjqm68jOhAEz
         3Erv9zSLkvzfDk9ORKfUYaaRqyej5ccio4i0h3YSIQwcNjJILCGbTj8ofF+AJdOG0r
         wZZItszMpdlkg==
Received: by mail-lf1-f72.google.com with SMTP id k5-20020a05651210c500b0040934a07fbdso1055074lfg.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4YeUT5jAqk0hL94x45nFoxH/ZKvBxBqGJy25for+rc8=;
        b=n4vtMG6tLKanMfOKNxBrVSYI3OpDPDIzvmdI9eOZ8Mht0Q3fvQvCgwLJdewXxLqd06
         4ERbbf/q3tgZRRInjV+QVm/WfMO3RYZGLsdJX2DRKvaotuJav3Vy3Kzyu0jvalm/wPh6
         IwNHXH8P+gwuyltYd27ZjXl5ZSbILbo/7q63NNAk7W+aeLWsBSYpMu4HRkK+4e/MwIN2
         0RADsRfJ34grn+/frBByPxhnQA6HkWvtgPu9QjPwHA88bkF1OCGGY/Z4Wgqzs3jvi3XA
         ZKNLDVL+knwBO0wR4xkQG8Gfp0CGtPGk0fTQ/3zDUW/1UqbiEI40nk6UPxmlK5K9i0ko
         AJrw==
X-Gm-Message-State: AOAM532UDaSEoSzY6bc9sjm1gRxfMc0adNn4KVVMMIdo6GxYHTsJvpt9
        E3tl7G2wA3KvR0/HarKj8oBvkYODqK2Xg9u4th3mKADW1MJtTzUQmTr7IqgE1dLWlmFAJGZdiHe
        q9OxuTLljQklPkeMtKtFktwhATN+nPBDoSuBXMCsJSiM79hff
X-Received: by 2002:a05:651c:1a4:: with SMTP id c4mr38482902ljn.3.1636983122607;
        Mon, 15 Nov 2021 05:32:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZCMMOgRGTQGkon/VvgYoRe+dStOqy2AcMVVYD3PoKiLA0qrR2Le5MsQbPrj9XNSeu4+Sq0g==
X-Received: by 2002:a05:651c:1a4:: with SMTP id c4mr38482881ljn.3.1636983122466;
        Mon, 15 Nov 2021 05:32:02 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w15sm1418911lfe.184.2021.11.15.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 05:32:02 -0800 (PST)
Message-ID: <b565d1fa-3635-c0fb-1bd6-ce76874b4991@canonical.com>
Date:   Mon, 15 Nov 2021 14:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] arm64: dts: exynosautov9: drop
 samsung,ufs-shareability-reg-offset
Content-Language: en-US
To:     Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <CGME20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c@epcas2p2.samsung.com>
 <20211102064826.15796-1-chanho61.park@samsung.com>
 <163698188786.128367.112304195355876732.b4-ty@canonical.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <163698188786.128367.112304195355876732.b4-ty@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/11/2021 14:11, Krzysztof Kozlowski wrote:
> On Tue, 2 Nov 2021 15:48:26 +0900, Chanho Park wrote:
>> samsung,ufs-shareability-reg-offset is not necessary anymore since it
>> was integrated into the second argument of samsung,sysreg.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: exynosautov9: drop samsung,ufs-shareability-reg-offset
>       commit: 4f5d06d381badc6e16f6d54eac7ab0125e9a7168
> 
> Best regards,
> 

Applied with fixed title. Please use prefix matching history (git log
--oneline).

Best regards,
Krzysztof
