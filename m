Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F1FC4320A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:44:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A059860F35
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 11:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237805AbhHDLoL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Aug 2021 07:44:11 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47276
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237801AbhHDLoL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 07:44:11 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 8E2333F234
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 11:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628077432;
        bh=IJJ9u6xsB7o4yD+uaxt5D1D9VxpMca4V2zhEM+FKQ2Y=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=GG6H3dfABm3dQPtLrCf6ZkXcSHyc+juNiCrHoctFxmbzM0TRZwpEnMeX6mqITizx+
         lykirw934dvf+jjOU8EBOSFOwNaw0L9Occ3jsctGN+o9nn/22nh+lwIQaTjPlPEe0Z
         piZ5AHJZ5efKotKDXEZ1o6wNh5XA9j8pCI7Z7LpcDDn7AN6tXZ5AI2XLlRNq+8duua
         l2UzR2v5jjYMbZWMRwX+nqcREcrfHVpMG8FSf1g6Kepdxjoi1UJhzEuaJR+YgTqNUf
         SXLEODOpqiD9G0WJUeolPn7Uj09MwIQSJWeug/X/GvN8ZxGAwlEgMtqsXqBwIimLZC
         fRSFPeTUA4Piw==
Received: by mail-ej1-f69.google.com with SMTP id k21-20020a1709062a55b0290590e181cc34so740499eje.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Aug 2021 04:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IJJ9u6xsB7o4yD+uaxt5D1D9VxpMca4V2zhEM+FKQ2Y=;
        b=EotCgBve3hJKcigh+IG68dzRBn+LT5wGQI8b1LxtyXmk6LqcaRUNK4ZhNzs2XEFaal
         HXFs7Kt0aK//PTsZ5u9hrEv4HDA0qSwHPg7LeRVSuy3MXn4M17h7naWXQoEaUBJznXE7
         gkb099NhviP7SL9DBXM6u0ImmgA9trVlcSSRgOV5jpW4W/Zc27L7zlfp5+0qrzvYdFcu
         nLBJYu0fGlv7v02Kbmnqiu7YsNv58Q9dLDyGNU+hLrThwH+PcnMRgt3JJVeR+XveEzki
         L97ZVtHpDZiE8ySOtue4fxfBGMTvab8mLi0kd0TTo6sTnBr7yGytNus78VhUqsLgtkKz
         lb0w==
X-Gm-Message-State: AOAM533PYk50mUdSbZIeWq8Ur/Ln2PbW2eXp1V7MjvUOcufvdcvM1yXQ
        +qyADpAGhR2gw6/WG/SVGP/uXte4kZ8G32mpJqzWy4yqJEsw6BC3UoFAdS4T34+2tjZtHthl84p
        GJ5c3qd1fgBz2+C7MwlzsXkqCBLJxpUFYKX1/+/Au3cWSyuvI
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr25810878ejb.166.1628077431934;
        Wed, 04 Aug 2021 04:43:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVZOjbXn9WfuE7/WcRirprZx76g0Ffuu/eG4T05Y2gR98mddFwJpsASAbyPCUipBmseRl3eQ==
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr25810872ejb.166.1628077431843;
        Wed, 04 Aug 2021 04:43:51 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id m20sm841016edv.67.2021.08.04.04.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 04:43:51 -0700 (PDT)
Subject: Re: [PATCH 1/4] rtc: s5m: switch to devm_rtc_allocate_device
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <444fbb25-c926-a685-08e7-f7f8e54f7cc7@canonical.com>
Date:   Wed, 4 Aug 2021 13:43:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/08/2021 12:41, Alexandre Belloni wrote:
> Switch to devm_rtc_allocate_device/devm_rtc_register_device, this allows
> for further improvement of the driver.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-s5m.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
