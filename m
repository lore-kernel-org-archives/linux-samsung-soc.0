Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FAB9C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 16:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28F7261214
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Sep 2021 16:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242115AbhIWQbp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 12:31:45 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:33378 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240007AbhIWQbo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 12:31:44 -0400
Received: by mail-wr1-f54.google.com with SMTP id t18so18970787wrb.0;
        Thu, 23 Sep 2021 09:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ooIqFmLseHis1kl2wdY4vOc4lcEPXfe5OM/L1YJQQ+k=;
        b=EjIYIl6X/5Ht9BfBzbAylMPfxvOfekjSuICYXrGb/ki7pvorBarlOFeBxNBv9OjBPH
         FkCsirxhQjfxIgCOcnWmOBxQeHNpCnioCncp+bt9m+2Po708EVs3ztzBoO8bkElPGmjA
         ee/CjZs4c2rG3+jayG6/EII8gbHKT1vDRIx7I34/Iqh8Vt/asHod3E/YrGrI5ZzxOgkJ
         eXpCWpapPV3wzGdXC+wrN3KrcklmTqeMuSNhylj94Olh7dpk1aTa97BwzCNJ5UT5bkOL
         XbnwMVOMksNQCNEYQpXqhAYE6jqUUXV05QlAIK1IDENMywEyYTaue75nSrpeMbNIEhjU
         4Chw==
X-Gm-Message-State: AOAM5315uya6NQ7XDkftrJJDKhq+rfeReqbl+ms+quPi8RVkJAtY+QX3
        i3bgeSw7UAwYPxiQABSxmX5xiXuMuxNkqg==
X-Google-Smtp-Source: ABdhPJyC2P1MmfBb8o4O/rdNCDw6D5Ef4r/2fuBtw/P73Ogj0pfjMSkeZV3uWdMJMaVBOJziCAaIBw==
X-Received: by 2002:adf:f312:: with SMTP id i18mr3089673wro.421.1632414610445;
        Thu, 23 Sep 2021 09:30:10 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.googlemail.com with ESMTPSA id d8sm6293376wrv.80.2021.09.23.09.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 09:30:09 -0700 (PDT)
Subject: Re: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default
 config logic
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com>
 <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
 <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
 <2c8a79f7-711a-b075-745f-ea77b82a1117@canonical.com>
 <CABYd82bzKh=QQHyk-kPXekzCKx+Uy-z2TY5qAQQNfuew=h=O-w@mail.gmail.com>
 <001cd621-53d1-fe22-0eaa-d13137827297@canonical.com>
 <YUx5uhKW/Jy2r3lv@google.com>
 <30a1d0f3-a17c-bf87-2519-542063a7a663@kernel.org>
 <YUyMyVezyjfv1Hs7@google.com>
 <6ea9e6fc-1b38-7a45-3aed-c092da5fc044@kernel.org>
Message-ID: <22a7304d-9813-2f9f-4a9b-8bda9fe283d2@kernel.org>
Date:   Thu, 23 Sep 2021 18:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6ea9e6fc-1b38-7a45-3aed-c092da5fc044@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/09/2021 18:27, Krzysztof Kozlowski wrote:
> On 23/09/2021 16:18, Lee Jones wrote:
>>> Thanks Lee, you described the use case. In general I like it and support
>>> it, except for what I wrote in the other mail.
>>>
>>> Vendor does not contribute much therefore there is no balance in
>>> upstreaming. Since none of other vendor's platforms are supported, I am
>>> looking only at what is supported. From that perspective - the change
>>> proposed by Will and previous guys, does not have much sense.
>>>
>>> My perspective probably would change a lot if vendor did contribute some
>>> of its non-edge platforms (3-5 years old)... especially that unlike few
>>> community guys (e.g. PostmarketOS), vendor has shit-tons of money and
>>> the hardware manuals. :)
>>
>> But no incentive to upstream code old (dead) platforms that they no
>> longer make money from.  We're not talking about kind-hearted
>> individuals here.  These are business entities.
>>
>> What is the business incentive to put hundreds of thousands of dollars
>> into something with no RoI?
> 
> Before you mentioned business entities refrain from upstreaming recent
> hardware. You question upstreaming not that recent, so basically
> business entity will claim it has zero incentives working with upstream.

Uh, this looks unparseable, I lost some words. Let me write again that part:

Before you mentioned business entities refrain from upstreaming recent
hardware. You question now upstreaming not that recent hardware, so
basically business entity has no incentives to work at all with upstream
on any platform. Neither newest, nor slightly older.


> Actually there are incentives for both cases - better code quality for
> the pieces being base for future devices, selling mainline supported
> hardware to other businesses, eventually less work for themselves around
> keeping code in sync with mainline. All these are of course difficult to
> measure from business perspective.
> 
>>
>>> Instead of pushing this change, please let's give some incentive to the
>>> vendor for upstreaming anything.
>>
>> Again, you're being specific.  We would also like/need to make the
>> same kinds of changes to other vendor configurations.  One's which do
>> contribute significantly at their own cost.
> 
> Yes, I am specific because we talk here about specfic Kconfig changes
> for one specific ARM sub-architecture. Same set of changes can be
> applied to other SoCs and usually have more sense there because number
> of upstream platforms is bigger.
> 
> If you have 10 different pinctrl drivers, you might decide to narrow the
> defconfigs to subset of it. If you have 2-3, the extra complexity does
> not matter and you just enable all of them. That's also decision we made
> few years ago internally in Samsung.
> 
>> The technical reasoning cannot be different because you do or don't
>> like the way the company operates.  Try to detach a little from
>> your feelings during discussions which should be purely technical.
> 
> I mentioned the less-contributing vendor arguments because you said:
> 
>>> Vendors are not able to upstream all functionality right away
> 
> That's the side-topic in this discussion.
> 
> Technically, all supported Exynos platforms require selecting
> ARCH_EXYNOS and require all drivers selected by ARCH_EXYNOS. If you
> mention some unsupported out-of-tree platforms, which I cannot
> audit/see/use, it is not a valid reason to change statement above. Make
> them supported, available to audit and check and statement above stops
> being valid.
> 
> Best regards,
> Krzysztof
> 


Best regards,
Krzysztof
