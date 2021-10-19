Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C20DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:35:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 458F761372
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 19 Oct 2021 16:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbhJSQhw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 19 Oct 2021 12:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234333AbhJSQhv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:37:51 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3674C061749
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:35:38 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id m199so10655508vka.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hcpunpJfD02BVk7gvPKYSvVCpndtXyJiwVOsvlKcqZI=;
        b=BdQ2OzL6SWeWZ9lnMcxZWN5DaQ/d8jf2h45OJs9cH+GlYlrjJIzPQv/DepQEx0AVuv
         GWiTPlZoXqr7Cy5NtlV+3wWBgyR+jVTfzAaFvSmKS8dWGevDt7UhY+6L0iEorvlsoL5J
         1P+ObMZy40jiLfXR1cMZS5RKUUsOUcevGJNt1CczAFeX2ABB7TVvmfrByhRVJQYdP4ww
         po/itndSylNqIpsco0VtIYqycpaCG0ykS21mfQb1sIzwGhUMUin7+QPSc4XvP2qjOvuF
         drZXawwJ2H2xmZBU7yxOYB+Z1GROv1vQOl0WCCjGw20ACo8d0nKaUqK1TGVhF0EKUnXu
         Mfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hcpunpJfD02BVk7gvPKYSvVCpndtXyJiwVOsvlKcqZI=;
        b=3L0pyOapbv16EIi4wE9nHaxLPasg3F10yFIu5nW6Gb76OkvMFUHx4IrB5LEutu4H1x
         I18HVBbqQ4U2ErinKr99zfHLBnRQkU9kkIKw6+odK05INPO4LzhAzse4MXdJ1bjgMLVz
         CDnEgcaI+oTwtcEiAHuWMv4U8HlbVkrrnWhuzpAW9HCwMXP5sp9fu6c9jEl2mdUp9mE8
         0gBJlGYVoCYanvvuGxXD3VasAjMg+VwafeC5ILqTTZRrQGSr3wbDSOc7ImTIxNpafL+y
         9RbfjK0K+H4sRFvgGkuvnE7ZaypzjxjW1BfeT2MOCq4CRbXD9D5A4TqqWaTAARmckY9N
         jgUg==
X-Gm-Message-State: AOAM530lCMkPVS9Gg26RicvFOCOW/DQJYEVUUnIbm/QLQHSsNszIr0zQ
        rHRBbo+vL8/KA4SMTzl/th04cwkdb7p8nzU5QaI/IQ==
X-Google-Smtp-Source: ABdhPJxiZkNnPp8L2tDYceQO0IZ4U2Vv1yzsBlHqRJNbQZbT3vX8Ww0HOFEE3jsk6TcubludTT/ovXMLWY9QcgDhjJM=
X-Received: by 2002:a1f:f241:: with SMTP id q62mr13676041vkh.12.1634661338139;
 Tue, 19 Oct 2021 09:35:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org> <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
In-Reply-To: <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 19 Oct 2021 19:35:26 +0300
Message-ID: <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 19 Oct 2021 at 19:22, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 19/10/2021 18:17, Krzysztof Kozlowski wrote:
> > On 19/10/2021 15:17, Sam Protsenko wrote:
> >> This RTC driver only accepts dates from 2000 to 2099 year. It starts
> >> counting from 2000 to avoid Y2K problem,
> >
> > 1. Where is the minimum (2000) year set in the RTC driver?
>
> Ah, indeed. I found it now in the driver.
>
> >
> >> and S3C RTC only supports 100
> >
> > On some of the devices 100, on some 1000, therefore, no. This does not
> > look correct.
>
> That part of sentence is still incorrect, but change itself makes sense.
> Driver does not support <2000.
>

Driver itself does not allow setting year >= 2100:

<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>
    if (year < 0 || year >= 100) {
        dev_err(dev, "rtc only supports 100 years\n");
        return -EINVAL;
    }
<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>

Devices might allow it, so the commit message phrasing is incorrect
and should be replaced, yes. But the code should be correct. Should I
send v2 with fixed commit message?

> Best regards,
> Krzysztof
