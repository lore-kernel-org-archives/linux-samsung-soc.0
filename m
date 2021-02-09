Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68122C4332B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Feb 2021 20:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BAD564ED2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Feb 2021 20:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhBIUC0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Feb 2021 15:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbhBITwA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Feb 2021 14:52:00 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2C6C06121E;
        Tue,  9 Feb 2021 11:19:32 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id es14so9230014qvb.3;
        Tue, 09 Feb 2021 11:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OfTABNqV2/dgIczcIGpTslZ48bA8VW7hHVaIj/4GfsU=;
        b=JkitmTFeJmEERO+haqbix/PAz2MfSvvtnk7W6zSTIxx8Y+1tUVd7r7IiNoMLcH3HW3
         YNXR0G3VK0SEMJEEyQTjuybZ2b/IA5HGgyp5sGkrSKp0pInvOBcK5SXM8v+gbwmjFWgi
         KHiXvShvgfeddE+EdtdTz6b0HgrJUD4zyeuxAHua2aI5modiGThykPiddh+bTQ9FMRVP
         1NcJCEVQs+JM3zzTMXzBWrqRyHy9wwGVUvQK1Sea2dGWm066uCVSFkx8S8ycMr1zbHuN
         B+MK7U+rmeAhaZTqNTrq4axpyLWd6FpngeUAd6J1SPe746dDnOCwKgKUnYOH/vbFBtcP
         dmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OfTABNqV2/dgIczcIGpTslZ48bA8VW7hHVaIj/4GfsU=;
        b=jf2Zxrsg+tww3qlrCW5FU31+hAiV8Dy2kydXwZG49Kt7uE5RWDi7DfoLU8Szv38uiY
         pb5dDfze9kSKzoJAG8CR3a8jziV5fSoqMX7XffoRQQ31W6pQNfjUu57NmQ0SQ5piA7nE
         QMHMRZJPoXjVH+H8dC65ogD1BePB/7CJhLtqvm38VQtgjemOT7GbjX0u/wYr8dA/7j4m
         DCIW3ii5WFETM8dYZhRymKJlWRRYUH4r6kh7uhc+w8b7XuEDNCFicbUo+AM2+Pefnpj9
         XuDmC08TBareEbfoRuVdUoHAfMR83srK/7EDnHNoSYm7L5fBpGbmqozyanZLNVfoo0pj
         2xeg==
X-Gm-Message-State: AOAM531ZY1PQgnXdYROGG0rdribykR9pJPCucCeOBGv7blmwRWLoz1aw
        OBeN7UrepL9hb10ckUQ9Gt4=
X-Google-Smtp-Source: ABdhPJxwpTfsaltd2sTJ+PIvZKKbEuql8jMNGKrFTE7F39NpOxjAuHsIOjA6wv1M8yFV/SlghlllTA==
X-Received: by 2002:a0c:9e50:: with SMTP id z16mr21934994qve.13.1612898371968;
        Tue, 09 Feb 2021 11:19:31 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id v1sm3558596qki.49.2021.02.09.11.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 11:19:31 -0800 (PST)
Subject: Re: [GIT PULL 2/3] ARM: dts: samsung: DTS for v5.12
To:     Arnd Bergmann <arnd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
References: <20210125191240.11278-1-krzk@kernel.org>
 <20210125191240.11278-3-krzk@kernel.org>
 <20210206134531.l5vpzlmev4v3f3uo@kozik-lap>
 <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <67970952-e048-efbf-446c-a703da3bc037@gmail.com>
Date:   Tue, 9 Feb 2021 13:19:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0Kgn9PTHjsU7MbJPC8vatvb9KYJJKWxrx7zQzTNgK10g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2/6/21 8:35 AM, Arnd Bergmann wrote:
> On Sat, Feb 6, 2021 at 2:45 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Mon, Jan 25, 2021 at 08:12:39PM +0100, Krzysztof Kozlowski wrote:
>>>
>>> ----------------------------------------------------------------
>>> Samsung DTS ARM changes for v5.12
>>>
>>> 1. Use new compatile to properly configure Exynos5420 USB2 PHY, fixing
>>>    it suspend/resume cycle.
>>> 2. Correct Samsung PMIC interrupt trigger levels on multiple boards.
>>> 3. Correct the voltages of Samsung GT-I9100 charger and add top-off
>>>    charger.
>>>
>>
>> Hi everyone,
>>
>> Any progress or new comments about this pull request?
> 
> Hi Krzysztof,
> 
> Sorry for not getting back to you on this earlier. I discussed this with
> Olof the other day and we decided to merge this, I just haven't
> gone through the pull requests over the past few days. My plan is
> to do the next round on Monday.
> 
> That said, I'm still not happy about the patch we discussed in the
> other email thread[1] and I'd like to handle it a little more strictly in
> the future, but I agree this wasn't obvious and we have been rather
> inconsistent about it in the past, with some platform maintainers
> handling it way more strictly than others.
> 
> I've added the devicetree maintainers and a few other platform
> maintainers to Cc here, maybe they can provide some further
> opinions on the topic so we can come to an approach that
> works for everyone.
> 
> My summary of the thread in [1] is there was a driver bug that
> required a DT binding change. Krzysztof and the other involved
> parties made sure the driver handles it in a backward-compatible
> way (an old dtb file will still run into the bug but keep working
> with new kernels), but decided that they did not need to worry
> about the opposite case (running an old kernel with an updated
> dtb). I noticed the compatibility break and said that I would
> prefer this to be done in a way that is compatible both ways,
> or at the minimum be alerted about the binding break in the
> pull request, with an explanation about why this had to be done,
> even when we don't think anyone is going to be affected.
> 
> What do others think about this? Should we generally assume
> that breaking old kernels with new dtbs is acceptable, or should
> we try to avoid it if possible, the same way we try to avoid
> breaking new kernels with old dtbs? Should this be a platform
> specific policy or should we try to handle all platforms the same
> way?

The current policy (since before 2013) is that newer kernels,
implementing new bindings, do not break with old existing dtbs.

Old existing kernels are not required to work with new dtbs.

See Documentation/devicetree/bindings/ABI.rst

We can choose to change the rules, so I'm not saying that the
discussion should not occur.  I'm just pointing out the
current policy.

I think that ABI.rst does not state "Old existing kernels are
not required to work with new dtbs" clearly enough, and
should be updated to do so.

I also think it would be good to explicitly say that care
should be taken with new bindings to not break existing
kernels, if reasonably possible.

-Frank

> 
>           Arnd
> 
> [1] https://lore.kernel.org/lkml/20210130143949.aamac2724esupt7v@kozik-lap/
> 

