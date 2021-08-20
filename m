Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663B3C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 15:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49B2E610FF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Aug 2021 15:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240964AbhHTPFq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Aug 2021 11:05:46 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38504
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240997AbhHTPFo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Aug 2021 11:05:44 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 10D3D406E1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629471905;
        bh=j0dYi0KupqdKnWz5W7Du03JuCWQtXHT/rpVxperl5M4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=OVQAXF5ToM/xkt0HfwjC5AonObTs5AdoSuRjLGZ1Dhork3A0fYwaQCJbbwxwl6lYe
         u5Xgm5Jsj6/auyLT8JrO2O9dANuCQ0v2UqSgf2Y9+qdYIUG+Q01qdqyzwVpZYAdL0O
         aNyneP3fVB61ZDrXcBA8RdHuBJmZAHBME0N3uTZrie+P8w7Bf5U37flteP1PH2VJ6y
         Nv3jxzAAEC/TQ4tLCUDJlUh6XyT5LL+JxkuMo0zdc3H2gCQmbvFRlOsXsLSC1PsWu2
         mQl06hN77TLNr5EdExnyMRRgF0/bj/MyT37+mDyRpMSJdnfa54gcBOVveTf5RKq4d7
         25NqBye/5/tAw==
Received: by mail-ed1-f70.google.com with SMTP id b16-20020a0564022790b02903be6352006cso4669615ede.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Aug 2021 08:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j0dYi0KupqdKnWz5W7Du03JuCWQtXHT/rpVxperl5M4=;
        b=lncA0F+AyQQ+McJcIy0jPnw7NfShzaxccHpxFz9EYsXhoKb9WP+X52/mlw/L82i2Zj
         /atTBo5Iywaw3Ya1hjSgSOBnUz/OO7c/eZoM9t8Lioiuq6YrU6TEU0PvWi82sl+YzNjb
         fK8aXXL1qvzdlmuWjodw+0SSlxp/SWx+wZ0pLdtYpFwYbTp1K0ipWovmpkPcnolAk8Hr
         Qa0QVe2gXUtCA05IqR+5Mbp5v86AAA92PCO0mE/2Kb+4GZWQMTj19i0lROXkTv38zndo
         e+uC0LFVJznifDaNRELUno+ICV1FtLquD51g2+qMgXia4k+Ym+VkOQd2vkEDa6HSDUNh
         OLQg==
X-Gm-Message-State: AOAM532RlcziUlwIP41tH9IGlmwYLv4sGo0EW4aQElGhD4TRDMKgcTzV
        SaOMfOk0CjqOL5D7BIs7eRyBDrsrj+o+wid7Gcv/yyqpPP0Nj0EJBhYaJmk0i8TzRD4xyp2prCe
        OxtlC3iKn8M8cRStOWs0VwSi/I1ScNn3BeLbhgtnHhu+OA7k7
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr14531795edb.3.1629471904771;
        Fri, 20 Aug 2021 08:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKW9WSIpRJLoykrE+AkG4eBlKpM8Vni9qzYCXxPUlR6EMgj8hG6t6dywWH/oxBp6h55QhRdg==
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr14531779edb.3.1629471904650;
        Fri, 20 Aug 2021 08:05:04 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id cx18sm2986223ejb.33.2021.08.20.08.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 08:05:04 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: exynos: add proper comaptible FSYS syscon
 in Exynos5433
To:     Alim Akhtar <alim.akhtar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
References: <20210820081458.83406-1-krzysztof.kozlowski@canonical.com>
 <20210820082149.84613-1-krzysztof.kozlowski@canonical.com>
 <CAGOxZ53CeRYafwjP45CsDRgBQtuvyVxJQR4CX4qChWyHzO4_fA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b21ceda4-c960-791b-6d09-a7579a35c3a4@canonical.com>
Date:   Fri, 20 Aug 2021 17:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGOxZ53CeRYafwjP45CsDRgBQtuvyVxJQR4CX4qChWyHzO4_fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/08/2021 16:47, Alim Akhtar wrote:
> On Fri, Aug 20, 2021 at 1:52 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> The syscon nodes should come with specific compatible.  Correct theh
> s/theh/the?

Indeed, thanks!

> 
>> FSYS syscon to fix dtbs_check warnings:
>>
>>   syscon@156f0000: compatible: 'anyOf' conditional failed, one must be fixed:
>>   ['syscon'] is too short
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
> With typo fixed above,
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



Best regards,
Krzysztof
