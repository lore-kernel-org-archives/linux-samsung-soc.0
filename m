Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17730C4361B
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Dec 2020 21:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA96123A52
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 17 Dec 2020 21:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731468AbgLQVJh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Dec 2020 16:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730244AbgLQVJh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 16:09:37 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8CDC061794;
        Thu, 17 Dec 2020 13:08:56 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id u18so61289181lfd.9;
        Thu, 17 Dec 2020 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gh+cRW2sl+C0vj35cIyk8AWAJG0p1eAE2jjmqaNt3JQ=;
        b=tzVuoME5mkk0ewCI9ZG7Ll9ZFjpttii+sSTo1QFK0KggyPiPXryXky2Ijg1ryYzcfE
         bdMR+C+tqJFgkXyMuwPdzHDlW7OkJ62hzisv9q1wIS15NqVKbAKfwgCnzlhpQBFxR1Vz
         paZOhsnk6cdOfLCEhj7q8HAa+517EIDUiG3nKBjEncMcJ4oLZ5h5U/s7QVFPtmqRI6bB
         EVT+Csam9K8jn6KaRfsfLVnBl6eMosqGtDss69pSdh5dx8kwcrOPEmm6OMJeqUluOXKB
         xGgdHkCFSWZDPMNtrT29SKjjqoxHkRE7SlZOf4J1RpeKDEKbDW8xw3TP2Jfgktt8fg1z
         1MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gh+cRW2sl+C0vj35cIyk8AWAJG0p1eAE2jjmqaNt3JQ=;
        b=MNh1OtHVcmkCtWHzZSezBBbiQFsrlepITU22sLDvnTBEIybpW6LNH0K/FlsyxqNdj9
         jT8ly/cwQ7N6qsIbHf0vv2GLea+s8vwJag1IqH3X+OEovC7Jz2E4yzfxbnQuU+vKG5l2
         FQMima0FwMzYmBF7z28E0mFfUW2zUALc1yY02VuzrCEEoHETHaQsomxYv9K1BWpWcdwu
         OFWewdVVcNQwqvK4+SSB/9nkNs/FmWd1/2rdBOXO4Ei2C+njWuKqvQb/Splfa0rf24LJ
         n+UxSQ6ehN3xGU50drYknhBBtprBHxdnqZ2zzHR9M1SS5N5f/0XnUQVnBxB5er5NyaQs
         YXbA==
X-Gm-Message-State: AOAM530GBHfCXcqe7HotA2NT51FVZHHAMyg8GX1mI+2YcPWDraRCE2NC
        gEfVizYva6xHohlyTxQru7t+v9FknoU=
X-Google-Smtp-Source: ABdhPJyEsHiuOWJNpx05d8JXeklKX0iBkcrA1SWsmmFcyh9dHI9GvJVok/XzkmUStYTpw+cRjzSIUg==
X-Received: by 2002:a2e:b008:: with SMTP id y8mr498268ljk.437.1608239333515;
        Thu, 17 Dec 2020 13:08:53 -0800 (PST)
Received: from ?IPv6:2a02:a315:5445:5300:c354:4482:8a34:2852? ([2a02:a315:5445:5300:c354:4482:8a34:2852])
        by smtp.gmail.com with ESMTPSA id t25sm698837lfl.105.2020.12.17.13.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 13:08:52 -0800 (PST)
Subject: Re: [PATCH] clk: exynos7: Mark aclk_fsys1_200 as critical
To:     Stephen Boyd <sboyd@kernel.org>, kgene@kernel.org, krzk@kernel.org,
        mturquette@baylibre.com
Cc:     s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201024154346.9589-1-pawel.mikolaj.chmiel@gmail.com>
 <160820006410.1580929.8444804722224099547@swboyd.mtv.corp.google.com>
From:   =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Message-ID: <61a6d576-9f91-dd2c-fd09-7e243f6ec7be@gmail.com>
Date:   Thu, 17 Dec 2020 22:08:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160820006410.1580929.8444804722224099547@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 17.12.2020 11:14, Stephen Boyd wrote:
> Not sure why this wasn't picked up in the samsung PR. Can you resend?
Hi
There was v2
(https://patchwork.kernel.org/project/linux-samsung-soc/patch/20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com/)
but it did receive some request for changes comments and i didn't yet
had time to it.

> 
>> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
>> index c1ff715e960c..1048d83f097b 100644
>> --- a/drivers/clk/samsung/clk-exynos7.c
>> +++ b/drivers/clk/samsung/clk-exynos7.c
>> @@ -538,7 +538,8 @@ static const struct samsung_gate_clock top1_gate_clks[] __initconst = {
>>                 ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT |
>>                 CLK_IS_CRITICAL, 0),
>>         GATE(CLK_ACLK_FSYS1_200, "aclk_fsys1_200", "dout_aclk_fsys1_200",
>> -               ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT, 0),
>> +               ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT |
>> +               CLK_IS_CRITICAL, 0),
>>  
> 
> Please put a comment in the code why a clk is critica>
