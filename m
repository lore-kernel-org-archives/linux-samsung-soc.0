Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25944C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 11:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0700D60F9B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 11:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbhJZLD2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 07:03:28 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:57558
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235372AbhJZLDZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 07:03:25 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BAFAC40278
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 11:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635246060;
        bh=saCQu9EKQs4I6SKXkv5FjAbPTAvRNyG3cbYVa3bkKDU=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=AtabUELtunYvEKBaAWhHTSo9wen3CgzxJ0EHGKnFaOwGbj2qhj5WmZezOXpu8wIUP
         QzEH45Myz/6kxrn+2upe1YWuyzaE/itRdjsvuWx7tkQ/FHXsueN23TICyHE1rFy6i9
         YiEtzNyhwhl3uhmAer7FOOsXLVr+LQqGeGfoF2KCDtpIWFe2akiK3KhG7nOY6cssUr
         aJ71b14TmbsTNB/aKhIQgyTaqlkFOXMV/qy2WLe/CTQGa1fx5EWYmOsjZY0FFRd/LY
         mrjX0OXaYKXGQzRSqehwOpdruTjqDvBGGuAyyjIbkvvMsFS/L9/8HEO8fDXfGVm+M4
         f+2/EkHS8RX+Q==
Received: by mail-lj1-f200.google.com with SMTP id a20-20020a2eb554000000b0020de66f70bcso4175378ljn.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 04:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=saCQu9EKQs4I6SKXkv5FjAbPTAvRNyG3cbYVa3bkKDU=;
        b=2OqugIVxhzdVrhJHu2mKRn1Sy8CXqg40RyJx2aQ35ei1/p05a2IbNet0di41nnKu8n
         AcYBjmqLg6DsT65dv46fkbNSxO46rbyEJQtF+diPOvovh+lRe4ZFv8YYf1gvfjpXknGT
         3qHQWmS7tRg/FWjd+mZxZ1tiCzAWcO9ZM+dmPHoRqZCBLeMopt9XQ7BtpgfKBCIHydti
         CwIeeKyw+5Qqga+FrTImZxx42YZ4mwMXnqrPBk96xLFsw6DE7EpsXPQL/QncYyhWCFB0
         DKs96FKi//V4rLYHt3fIdZm4UPjA9cEW8lLiCLfqLMc0DnEYJnKBDu9IKdaqFFk7gUyA
         NrJQ==
X-Gm-Message-State: AOAM531oX1bpT0TtxaI8EaElF5EIHr/sk2uetT91V1lh5MaMtGYm8jKO
        ZTghBkWSxah0aEFv0ZmKmsIIi2cwKs7px2pIAEWyyw/WJVW+3VD5/TOcXwzwbKDoEup7qGZXdN8
        0YyNkR3/HBDXtYnmU2OclNtrLaqPqIdpBtIt2vMwRwR5Qy0So
X-Received: by 2002:a2e:9155:: with SMTP id q21mr2538926ljg.217.1635246060231;
        Tue, 26 Oct 2021 04:01:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0X6qDFP9FFCD5QwYHQV3v8kwvFuK6o5Wcp/OVDsZAZVQxLeOu6Nqkf7G3YizrzY3oQ+AghQ==
X-Received: by 2002:a2e:9155:: with SMTP id q21mr2538905ljg.217.1635246060059;
        Tue, 26 Oct 2021 04:01:00 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u4sm1893284lfs.153.2021.10.26.04.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 04:00:59 -0700 (PDT)
To:     Youngmin Nam <youngmin.nam@samsung.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, daniel.lezcano@linaro.org
Cc:     tglx@linutronix.de, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, pullip.cho@samsung.com,
        hoony.yu@samsung.com, hajun.sung@samsung.com,
        myung-su.cha@samsung.com, kgene@kernel.org
References: <20211021061804.39118-1-youngmin.nam@samsung.com>
 <CGME20211021055112epcas2p278145beb21cd6cc4217813a41c1e1407@epcas2p2.samsung.com>
 <20211021061804.39118-2-youngmin.nam@samsung.com>
 <0c5dcdab-7aa3-a98f-e615-acbe98489935@canonical.com>
 <20211021082650.GA30741@perf>
 <1b93aaf3-ed64-b105-dec4-07b6f27b385b@canonical.com>
 <20211022042116.GA30645@perf>
 <da83de3a-e7a2-f9b2-80f2-25c39717c3e4@canonical.com>
 <20211026014732.GA45525@perf>
 <91e926c4-9a3a-196d-1451-d3e7d38fc132@canonical.com>
 <20211026104518.GA40630@perf>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v1 1/2] clocksource/drivers/exynos_mct_v2: introduce
 Exynos MCT version 2 driver for next Exynos SoC
Message-ID: <11ca846b-c8d6-37c9-8ee2-4740fa66d974@canonical.com>
Date:   Tue, 26 Oct 2021 13:00:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026104518.GA40630@perf>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/10/2021 12:45, Youngmin Nam wrote:
> On Tue, Oct 26, 2021 at 09:10:28AM +0200, Krzysztof Kozlowski wrote:
>> On 26/10/2021 03:47, Youngmin Nam wrote:
>>>> If everyone added a new driver to avoid integrating with existing code,
>>>> we would have huge kernel with thousands of duplicated solutions. The
>>>> kernel also would be unmaintained.
>>>>
>>>> Such arguments were brought before several times - "I don't want to
>>>> integrating with existing code", "My use case is different", "I would
>>>> need to test the other cases", "It's complicated for me".
>>>>
>>>> Instead of pushing a new vendor driver you should integrate it with
>>>> existing code.
>>>>
>>> Let me ask you one question.
>>> If we maintain as one driver, how can people who don't have the new MCT test the new driver?
>>
>> I assume you talk about a case when someone else later changes something
>> in the driver. Such person doesn't necessarily have to test it. The same
>> as in all other cases (Exynos MCT is not special here): just ask for
>> testing on platform one doesn't have.
>>
>> Even if you submit this as separate driver, there is the exact same
>> problem. People will change the MCTv2 driver without access to hardware.
>>
> Yes, I can test the new MCT driver if someone ask for testing after modifying the new driver.
> But in this case, we don't need to test the previous MCT driver. We have only to test the new MCT driver.

Like with everything in Linux kernel. We merge instead of duplicate.
It's not an argument.

>> None of these differ for Exynos MCT from other drivers, e.g. mentioned
>> Samsung PMIC drivers, recently modified (by Will and Sam) the SoC clock
>> drivers or the ChipID drivers (changed by Chanho).
> From HW point of view, the previous MCT is almost 10-year-old IP without any major change and
> it will not be used on next new Exynos SoC.
> MCTv2 is the totally newly designed IP and it will replace the Exynos system timer.
> Device driver would be dependent with H/W. We are going to apply a lot of changes for this new MCT.
> For maintenance, I think we should separate the new MCT driver for maintenance.
> 

There are several similarities which actually suggest that you
exaggerate the differences.

The number of interrupts is the same (4+8 in older one, 12 in new one...).
You assign the MCT priority also as higher than Architected Timer
(+Cc Will and Mark - is it ok for you?)
    evt->rating = 500;      /* use value higher than ARM arch timer *

All these point that block is not different. Again, let me repeat, we
support old Samsung PMICs with new Samsung PMICs in one driver. Even
though the "old one" won't be changed, as you mentioned here. The same
Samsung SoC clock drivers are used for old Exynos and for new ones...
Similarly to pinctrl drivers. The same ChipId.

Everywhere we follow the same concept of unification instead of
duplication. Maybe Exynos MCT timer is an exception but you did not
provide any arguments supporting this. Why Exynos MCTv2 should be
treated differently than Exynos850 clocks, chipid, pinctrl and other blocks?

Daniel,
Any preferences from you? Integrating MCT into existing driver (thus
growing it) or having a new one?

Best regards,
Krzysztof
