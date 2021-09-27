Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936EFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A54E61166
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Sep 2021 09:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbhI0J5l (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Sep 2021 05:57:41 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39788
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233773AbhI0J5k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 05:57:40 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 72579402DE
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2021 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632736559;
        bh=nIU5tLYb8kiPoNkLCvMx2HqJO/MUaTxKgEujQiXGrPI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=JSy+4eYnCTplSl+dSVzoeHu5juCEE7J6rLBOPRIxYenATLauGNMlxxpuQfEE/+aVP
         EB4BFKceHi793dN/Z7d/XUjgW6bXcXUCxHZ8ICSt7NF9s8ZcvMY1T8oQUI212Rr12f
         3LxBHNuBSsp3t6jVWu8+t65nuZOUWHWRmuWFptamtvXEDZ/6d1KiwcOR9DyVf64jsV
         uw2kSybRBUQPLLbtTDIhgxXeXjggk5fGcao2ZTmXLQ7UJYlA1EzPVeXIk1hso3z72o
         NnauAfr94+CSqNK4Psk/UZm35uuwwUmNFddEd4YcOXXonRNPSjY0AyGDVKzo5KbZ9E
         UawS+6gtvgxLA==
Received: by mail-lf1-f70.google.com with SMTP id z9-20020a0565120c0900b003fce36c1f74so3279335lfu.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Sep 2021 02:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nIU5tLYb8kiPoNkLCvMx2HqJO/MUaTxKgEujQiXGrPI=;
        b=3D87xE3VC5l/SVi2tPK8LJ9HIRJGTarNSpCDcwgyQ3q1VCWJKrAZk6ZHjYYu1HhgeA
         BgQDDXw5pRCdEtxAPlZIrfb02oaN81vSq6ib73eNBBV1TzaxlDjWWuJrLBA+sF4GAgLI
         csRwpJJPFJFGoR9Vj+cLMlEz7IBc4Fvmshu9H+oG07ItssZPQVvoNkGg9d+ZiN3CSW/0
         ScoyrHOMX0mUpSMorQetF8Xeg+EBfKZXCG5VfpPSrSISJAtJoW7IWcmnm5WFIxxddEZJ
         UuIx2vgwPT2+5dBJgekboz3GSury16VZO/qMv3eHVW5DzKyvLiotDAlebxGqIXw/5sQl
         vYlg==
X-Gm-Message-State: AOAM530UZ08P10DlZKaOrZitvu4WuwB9Q6eF+Tt2S+5rsNMp8OtFqnGD
        KuFugDhNJWwvovGW1TWyg+6ouy30tyznnoiX8dE0C7031qaht54p0wCPErGAOEk5g9zweuK/GNc
        7VZctMhExDmfjGCDs8zvGqrSFLY5Ojxx+nb7KrtcBqDwD+owA
X-Received: by 2002:a05:6512:234b:: with SMTP id p11mr22993038lfu.81.1632736558905;
        Mon, 27 Sep 2021 02:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsQ6KVBbhaTPACnyZPmIXhjr9se2x7ZwWQTaBMxZMqHiZxJFGWKh3hO/D3QI+51qPHcHs7eQ==
X-Received: by 2002:a05:6512:234b:: with SMTP id p11mr22993025lfu.81.1632736558751;
        Mon, 27 Sep 2021 02:55:58 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br38sm1537149lfb.305.2021.09.27.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 02:55:58 -0700 (PDT)
Subject: Re: [PATCH] cpufreq: s3c244x: add fallthrough comments for switch
To:     Arnd Bergmann <arnd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210927095150.944127-1-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6695844c-e79d-d62e-87da-f96f8d5ca3bf@canonical.com>
Date:   Mon, 27 Sep 2021 11:55:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927095150.944127-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/09/2021 11:51, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Apparently nobody has so far caught this warning, I hit it in randconfig
> build testing:
> 
> drivers/cpufreq/s3c2440-cpufreq.c: In function 's3c2440_cpufreq_setdivs':
> drivers/cpufreq/s3c2440-cpufreq.c:175:10: error: this statement may fall through [-Werror=implicit-fallthrough=]
>    camdiv |= S3C2440_CAMDIVN_HCLK3_HALF;
>           ^
> drivers/cpufreq/s3c2440-cpufreq.c:176:2: note: here
>   case 3:
>   ^~~~
> drivers/cpufreq/s3c2440-cpufreq.c:181:10: error: this statement may fall through [-Werror=implicit-fallthrough=]
>    camdiv |= S3C2440_CAMDIVN_HCLK4_HALF;
>           ^
> drivers/cpufreq/s3c2440-cpufreq.c:182:2: note: here
>   case 4:
>   ^~~~
> 
> Both look like the fallthrough is intentional, so add the new
> "fallthrough;" keyword.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/cpufreq/s3c2440-cpufreq.c | 2 ++
>  1 file changed, 2 insertions(+)

I think I saw it but back then implicit-fallthrough was not an error :)

LGTM:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
