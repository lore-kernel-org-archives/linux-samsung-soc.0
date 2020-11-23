Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D873FC2D0E4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Nov 2020 10:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AA132072C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Nov 2020 10:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtSFegw/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgKWKUO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Nov 2020 05:20:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:36858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbgKWKUO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Nov 2020 05:20:14 -0500
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94F212072C;
        Mon, 23 Nov 2020 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606126813;
        bh=lKWIE0xfvLNVmwvlh6n8fLQGdMFXyaSAl3QgCRzu1aM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dtSFegw/Yhyq993hTtZSIfwSEuFsrCkk8L8Ekyc64C6f+3eXL5ZdJfnp8MNcnRnf+
         qVLtmjb3lzgK9UHDQn+ywMqprnd+d9JgRyXdsdDNFGF7PHG8EEgXEnTJtU9L8xZO4B
         ToqlflHQBOvDoo8cluinH9R7YTJ9giRMO6VIrFQk=
Subject: Re: [PATCH v5] clk: samsung: Prevent potential endless loop in the
 PLL ops
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org, tomasz.figa@gmail.com,
        cw00.choi@samsung.com, m.szyprowski@samsung.com, sboyd@kernel.org,
        mturquette@baylibre.com, b.zolnierkie@samsung.com,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <CGME20201120155747eucas1p248a1f0b71fbd8f329271494d7a207347@eucas1p2.samsung.com>
 <20201120155731.26898-1-s.nawrocki@samsung.com>
 <20201122151602.GA5346@kozik-lap>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <cbc83ec7-57f3-8ced-34c6-8df5e0541fe9@kernel.org>
Date:   Mon, 23 Nov 2020 11:20:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201122151602.GA5346@kozik-lap>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/22/20 16:16, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2020 at 04:57:31PM +0100, Sylwester Nawrocki wrote:
>> The PLL status polling loops in the set_rate callbacks of some PLLs
>> have no timeout detection and may become endless loops when something
>> goes wrong with the PLL.
>>
>> For some PLLs there is already the ktime API based timeout detection,
>> but it will not work in all conditions when .set_rate gets called.
>> In particular, before the clocksource is initialized or when the
>> timekeeping is suspended.
>>
>> This patch adds a common helper with the PLL status bit polling and
>> timeout detection. For conditions where the timekeeping API should not
>> be used a simple readl_relaxed/cpu_relax() busy loop is added with the
>> iterations limit derived from measurements of readl_relaxed() execution
>> time for various PLL types and Exynos SoCs variants.
>>
>> Actual PLL lock time depends on the P divider value, the VCO frequency
>> and a constant PLL type specific LOCK_FACTOR and can be calculated as
>>
>>   lock_time = Pdiv * LOCK_FACTOR / VCO_freq
>>
>> For the ktime API use cases a common timeout value of 20 ms is applied
>> for all the PLLs with an assumption that maximum possible value of Pdiv
>> is 64, maximum possible LOCK_FACTOR value is 3000 and minimum VCO
>> frequency is 24 MHz.
>>
>> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>

> Reviewed-by: Krzysztof Kozlowski<krzk@kernel.org>

Thanks, patch applied.

--
Regards,
Sylwester
