Return-Path: <SRS0=sDIw=CC=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6616BC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Aug 2020 09:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FCBD207D3
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Aug 2020 09:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwJb+ndX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgHXJPJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Aug 2020 05:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730345AbgHXJPA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 05:15:00 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04DCC061755
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2020 02:14:59 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r15so7860967wrp.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2020 02:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+Zd1haIacxpZpxC6FnWr/X8kgsh94Jc2l8GhzRh1ANQ=;
        b=xwJb+ndXPcngZxHkQSRR0jcsOEchH6UAeCLd1fwU4jwgnGMsmKdEmbuqeqVQ3odefH
         /kOkzzVoZwI/DonoCexcLaDC76UUkgdOVR6A0EZT27CH9+bCgTxdflOb2VSydk3pFZSl
         bK20s4RD8GkrWSN6j9Z+Vbvv6lc9LpRu3alxFLX1ccsSwnsmdVnMg4XSXrS5MAa2ri3+
         MKSXrXyG1QvPTpa2Oxp7r0lqLJyanyGQqu7yvLI4daPI1ilqSpbO786dbIhtq3pW1ze+
         Is8UsG0nK+sgU89r6thBi44YEKA0IoxNxdrHcUulFKw0vq+yQJmOueFupZMMxZbitOc0
         S/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Zd1haIacxpZpxC6FnWr/X8kgsh94Jc2l8GhzRh1ANQ=;
        b=oYUvf3H1uc74Z1qEenUbhqTKcwaMqs0Mc6MAZD495sm2ezTm726RRdCIPc0VotPjRE
         jabrHVFK6VbMfpIwaTUkhgJMiQstT/Z3oYJ5aWjBSTHA0yZWmC4xy0J1NVlRMXRNghtk
         +45rzw08PBIzBxop7oSMDol+B2sRk9I9hBJ8QcTBmWSxuOwbS0DXDqiQ7oor0m5NFbUh
         Cyiq5Ep4j0QLGYDfgxLzsGJusMVcaGrbMnLI6vcQzyYfDul2w6n8rcxRBB1HKpvBMLsr
         gryZUKLZv6fVeFuMDqhHCbDwyQGH40TXUwqnTPZZPHRT2/yuUvRmXPYL86awsnmd3mXq
         RGtQ==
X-Gm-Message-State: AOAM530S1sFXqqCr2trdtIq/OyxHs+MTR+89OoFn78yOv/UuhfaWbD9B
        +TEq/ywIb9ReAIl7f0WO4wrT6Q==
X-Google-Smtp-Source: ABdhPJySkkH1G//5qwCQKk2dpQ26qirmuaskeGdzukdAU8i8ZCwkQFR7XF9mLydaot8xNHq3hiUleA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr4789686wrv.318.1598260498498;
        Mon, 24 Aug 2020 02:14:58 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0? ([2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0])
        by smtp.googlemail.com with ESMTPSA id z8sm21782389wmf.10.2020.08.24.02.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 02:14:58 -0700 (PDT)
Subject: Re: [PATCH 2/4] cpuidle: big.LITTLE: enable driver only on
 Peach-Pit/Pi Chromebooks
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20200616081230.31198-1-m.szyprowski@samsung.com>
 <CGME20200616081249eucas1p2ad165b545f265bec88a06270d55fce76@eucas1p2.samsung.com>
 <20200616081230.31198-3-m.szyprowski@samsung.com>
 <db3315ef-1ca8-14b5-486a-9cc5a02150a8@samsung.com>
 <20200817153908.GA13144@kozik-lap>
 <f46e7041-f75e-8d97-e967-2ac458aaaf2e@linaro.org>
 <20200824082635.GA15030@kozik-lap>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6ec5895f-2548-c059-ea9d-d34536eb0f66@linaro.org>
Date:   Mon, 24 Aug 2020 11:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824082635.GA15030@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 24/08/2020 10:26, Krzysztof Kozlowski wrote:
> On Mon, Aug 24, 2020 at 10:15:42AM +0200, Daniel Lezcano wrote:
>> On 17/08/2020 17:39, Krzysztof Kozlowski wrote:
>>> On Wed, Jun 24, 2020 at 12:05:46PM +0200, Bartlomiej Zolnierkiewicz wrote:
>>>>
>>>> On 6/16/20 10:12 AM, Marek Szyprowski wrote:
>>>>> This driver always worked properly only on the Exynos 5420/5800 based
>>>>> Chromebooks (Peach-Pit/Pi), so change the required compatible string to
>>>>> the 'google,peach', to avoid enabling it on the other Exynos 542x/5800
>>>>> boards, which hangs in such case. The main difference between Peach-Pit/Pi
>>>>> and other Exynos 542x/5800 boards is the firmware - Peach platform doesn't
>>>>> use secure firmware at all.
>>>>>
>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>>
>>> This patch waited on list for almost two months and was not picked up.
>>> Therefore I'll take it for v5.10.
>>
>> It happens some patches can fall into the cracks, especially when we are
>> fully busy with a peak of work. Also, we have filters in our mailers
>> which are not perfect. A gentle ping is enough to ask to pay attention
>> to the series.
>>
>> I can understand that is annoying, but preemptively pick the patch is
>> not adequate.
> 
> I apologize if my message was harsh or sounded rude. That was not my
> intention.

No worries.

> I understand that patches soometimes got missed. That's life. This patch
> here is quite simple, non-intrusive, got independent ack. Also in the
> past SoC-specific drivers were sometimes going through SoC tree (so in
> this case - mine for Samsung).  Patch also blocks the dependant DT
> change (for entire cycle). Therefore I guessed that it won't be a
> problem and it is just simpler to apply it.
> 
> If it is an issue, I can drop it and rebase my branch.

It is fine if you can add my ack.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Thanks

  -- Daniel


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
