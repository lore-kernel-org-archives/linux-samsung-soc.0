Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CB7C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 08:44:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B36961166
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Apr 2021 08:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240667AbhDPIoo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Apr 2021 04:44:44 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58664 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239264AbhDPIol (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Apr 2021 04:44:41 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lXK5I-0005F2-PI
        for linux-samsung-soc@vger.kernel.org; Fri, 16 Apr 2021 08:44:16 +0000
Received: by mail-ej1-f70.google.com with SMTP id n10-20020a1709061d0ab029037caa96b8c5so1807624ejh.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Apr 2021 01:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=18JK8yDx0NtD/4aG8Ry1RsSt82JPj7kXl6NfpXnnE+w=;
        b=W6OQGU2yNz/Enaxu082lJ1a4Wb3txI/Cj/f1vEoJoDLQcgerlf38R5UOTVvBo3Sdca
         rjjfH2NQZhNNZCQ5poiUBG5OYWSIMsYlOILZN4dcniArPvUgMy9BrgVz9uvIY18/HLGE
         CxX9tVKnLHt7ow6kma4el2Nlq0BwvXmQ6NQzEIjSSCU9Dml3oekxuVASnm9YGdDQ4kKx
         8G7yMPqc/cJL1rTauSFkLEzFxr6lguZruOhAWlJLYWPvVWBuY59jYy3HO7HunTpNcgD5
         KkuSTbXRGcYKSX0qGZkliKLDqoDv7epJvy6QXkaI/BwQDcYaTR4CMsJqBktty5akcDXR
         vg3w==
X-Gm-Message-State: AOAM5332eKHjhcBeqTti6eabI9/B6V8MvmY2NvUQC0/gIpRDYJX8sR9c
        53pBUP4BYh1KyElEj5uPIfzbE1/ECiW5aB+OAV6EKxvgXAdyknKYWrDxHnztvLYOna1XkhwB2fV
        usUN0HkyAwtGxDj0QtBhWkMJxEaUelifkd+Lg0jwbGlVi+LDy
X-Received: by 2002:a05:6402:1393:: with SMTP id b19mr8644387edv.333.1618562656306;
        Fri, 16 Apr 2021 01:44:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWlZwkE7N5B0Dp/1iadZ9AeAo0s6MU3gYpUBAwDZeypnM8XTtbr/fqA3I+xsF7L+M1syvUFQ==
X-Received: by 2002:a05:6402:1393:: with SMTP id b19mr8644380edv.333.1618562656146;
        Fri, 16 Apr 2021 01:44:16 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id r10sm3799693ejd.112.2021.04.16.01.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 01:44:15 -0700 (PDT)
Subject: Re: [PATCH] rtc: Fix missing IRQF_ONESHOT as only threaded handler
To:     zhuguangqing83@gmail.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210416021949.1569-1-zhuguangqing83@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <66e46265-f2b5-2133-4cd4-5dc0421e9a37@canonical.com>
Date:   Fri, 16 Apr 2021 10:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416021949.1569-1-zhuguangqing83@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/04/2021 04:19, zhuguangqing83@gmail.com wrote:
> From: Guangqing Zhu <zhuguangqing83@gmail.com>
> 
> Coccinelle noticed:
> 1. drivers/rtc/rtc-s5m.c:810:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 2. drivers/rtc/rtc-rk808.c:441:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 3. drivers/rtc/rtc-max77686.c:779:7-27: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 4. drivers/rtc/rtc-tps65910.c:415:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 5. drivers/rtc/rtc-lp8788.c:277:8-33: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 6. drivers/rtc/rtc-max8998.c:283:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 7. drivers/rtc/rtc-rc5t583.c:241:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 8. drivers/rtc/rtc-max8997.c:495:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 
> Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
> ---
>  drivers/rtc/rtc-lp8788.c   | 2 +-
>  drivers/rtc/rtc-max77686.c | 4 ++--
>  drivers/rtc/rtc-max8997.c  | 2 +-
>  drivers/rtc/rtc-max8998.c  | 3 ++-
>  drivers/rtc/rtc-rc5t583.c  | 2 +-
>  drivers/rtc/rtc-rk808.c    | 2 +-
>  drivers/rtc/rtc-s5m.c      | 4 ++--
>  drivers/rtc/rtc-tps65910.c | 2 +-
>  8 files changed, 11 insertions(+), 10 deletions(-)
>

The same with all other patches for IRQF_ONESHOT which are send recently:
1. On what board did you test it?
2. Is this just blind patch from Coccinelle without investigation
whether it is needed (hint: it might not be needed in all of these
places, because at least some of them do not use default primary handler).
3. If you think otherwise, please explain.

Best regards,
Krzysztof
