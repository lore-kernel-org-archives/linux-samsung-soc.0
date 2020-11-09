Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A38AC2D0A3
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 16:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A62B42074F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Nov 2020 16:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c59sbleX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730208AbgKIQfe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Nov 2020 11:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729570AbgKIQfd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 11:35:33 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA30C0613CF;
        Mon,  9 Nov 2020 08:35:33 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id s9so9385396ljo.11;
        Mon, 09 Nov 2020 08:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NGAQMa+8hqksmB/zNvbqBSA91HcWOtTXAg0YiSnfUqQ=;
        b=c59sbleX65uS8HSvh1mLRX5ytchlZ813A83XynQTdTIUxvth/nl7Tvht+oIqCuIHFY
         GD8NYziZTPIDjvxlGA0DArIL47SAYJMi80DaEwGe1wG9Hsb0eKvt5pF9EIrkdWqZ1uEP
         NOQhNXSAIqqH78eAaSSlpHepXTEjdzCc7CwhK4bGCCHHwMrh2Ck//l/slxcD8OWt0k5c
         HgS8Lu8B72l4fzHuOx/8oMwTCQKK4fxRVaDh4yXkv8bpdn/tYtrBGVACHFiGGietpvnn
         Zw6F8pdfvkmQjE4bQJbch/LpKDcqgHK2kWc3H9zrJdaJ1O4NcCRrInSlTXXaySjxLO92
         IvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NGAQMa+8hqksmB/zNvbqBSA91HcWOtTXAg0YiSnfUqQ=;
        b=sZDTo1fYHvukCQ9HHQ6ryqaS8GcxU1EEBRgXYAELrRs9mKWSzGiKnqx0mugYcORBCJ
         zwcbZoO+QLEnJR36HTsYJW0AQl53Rtm1usfK5kICzjzWqVW6U7qANCs7v3d7gzRJ+Fuu
         vB8dqMxIMfLeRwhbruN9jhRi9CH8ZQHyQlEHuT4Gv6eN1WrhBk+ZEVzSNvuTK5iJ05lH
         w+3VeKqj0Zqdc/vFVwLphX7ZPRzp5q/qR9aBcsCBNGZmCHyxmM91090M0dcvqJ7Q+IGg
         HNmxHy+YuLZWtSMOmtnaJ4AMOQhMJJJSr6KPrScUNjjf+LblaWeqAsz47EeZpTljiVbl
         FAzQ==
X-Gm-Message-State: AOAM5315ty0mbN1P5KHjwspRDA5L+IDhYT7rNbnSKR0xJywqLjQcz8sL
        u6G7oepC50VUOgmukiKwj01rdrlZ/Qs=
X-Google-Smtp-Source: ABdhPJyaeskXs3jgEVDwdj8N3cnxOy5NvrTiFeRPa39fK0pD4VZ0gqVPrJ4wFG4EYtPeOPg83MDSfQ==
X-Received: by 2002:a2e:9449:: with SMTP id o9mr6094920ljh.457.1604939731343;
        Mon, 09 Nov 2020 08:35:31 -0800 (PST)
Received: from ?IPv6:2a02:a315:5445:5300:b3d1:4882:b1cf:5e61? ([2a02:a315:5445:5300:b3d1:4882:b1cf:5e61])
        by smtp.gmail.com with ESMTPSA id l6sm1785934lfc.8.2020.11.09.08.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 08:35:30 -0800 (PST)
Subject: Re: [PATCH v2] clk: exynos7: Keep aclk_fsys1_200 enabled
To:     Sylwester Nawrocki <snawrocki@kernel.org>
Cc:     kgene@kernel.org, krzk@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201107121456.25562-1-pawel.mikolaj.chmiel@gmail.com>
 <a2fdef20-9c0d-ee59-bc2f-411391f4f58b@kernel.org>
From:   =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Message-ID: <0efe8698-68b6-030f-4b8b-f52dbc3d1be9@gmail.com>
Date:   Mon, 9 Nov 2020 17:35:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <a2fdef20-9c0d-ee59-bc2f-411391f4f58b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 09.11.2020 13:32, Sylwester Nawrocki wrote:
> Hi Paweł,
> 
> On 11/7/20 13:14, Paweł Chmiel wrote:
>> This clock must be always enabled to allow access to any registers in
>> fsys1 CMU. Until proper solution based on runtime PM is applied
>> (similar to what was done for Exynos5433), fix this by calling
>> clk_prepare_enable() directly from clock provider driver.
>>
>> It was observed on Samsung Galaxy S6 device (based on Exynos7420), where
>> UFS module is probed before pmic used to power that device.
>> In this case defer probe was happening and that clock was disabled by
>> UFS driver, causing whole boot to hang on next CMU access.
>>
>> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> 
>> --- a/drivers/clk/samsung/clk-exynos7.c
>> +++ b/drivers/clk/samsung/clk-exynos7.c
> 
>> @@ -571,6 +572,10 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
>>   static void __init exynos7_clk_top1_init(struct device_node *np)
>>   {
>>   	samsung_cmu_register_one(np, &top1_cmu_info);
>> +	/*
>> +	 * Keep top FSYS1 aclk enabled permanently. It's required for CMU register access.
>> +	 */
>> +	clk_prepare_enable(__clk_lookup("aclk_fsys1_200"));
> 
> Thanks for the patch. Could you rework it to avoid the __clk_lookup() call?
> I.e. could you change it to something along the lines of:
Hi.
I'll send v3 version with this fixed.

Thanks for review and comments
> 
> -------------8<----------------
> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
> index 87ee1ba..9ecf498 100644
> --- a/drivers/clk/samsung/clk-exynos7.c
> +++ b/drivers/clk/samsung/clk-exynos7.c
> @@ -570,7 +570,15 @@ static const struct samsung_cmu_info top1_cmu_info __initconst = {
>  
>  static void __init exynos7_clk_top1_init(struct device_node *np)
>  {
> -       samsung_cmu_register_one(np, &top1_cmu_info);
> +       struct samsung_clk_provider *ctx;
> +       struct clk_hw **hws;
> +
> +       ctx = samsung_cmu_register_one(np, &top1_cmu_info);
> +       if (!ctx)
> +               return;
> +       hws = ctx->clk_data.hws;
> +
> +       clk_prepare_enable(hws[CLK_ACLK_FSYS1_200]);
>  }
>  
>  CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
> -------------8<----------------
> ?
> 
> --
> Regards,
> Sylwester
> 
> 
