Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F8AC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Nov 2022 10:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiKHKho (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Nov 2022 05:37:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbiKHKhT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 05:37:19 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8BA4090E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Nov 2022 02:37:01 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g7so20646187lfv.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Nov 2022 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1eU2MNzr9lEfofB/L6YKz5jRjvrNUwGoC1RPrJsqIc=;
        b=qxlKoNOCj8bwEn/unr4ZPcnBCXcdPnwp6/SZBWWeD1f+nNzLQZ17cHnkenX1JoZ+nJ
         l5mhxoz3baMzHRwcGvuZBeAgFsbmfiw5waqPt908NhhIv4tecxmqQPdV0Dhf9IJm8Dt0
         k0NtuvI7zoLtlVsm93UDSI5nvXT8giTAEmr04mTtPEhLQpmnA/bd5jRs34pBIxkPVDZp
         sLD6ufM7RkVvdGhirGvWrEpWffO+PQUzvRoxY2bs+2fNm4Hu8I9+dliDE1l3I0yRMuNK
         qnErbVUK+0FDLBkKVwWv6dWzXNsnSoy7R0nrBCaZxdKQNiCL0RQeH6J78bt+69PPVLrT
         Kytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1eU2MNzr9lEfofB/L6YKz5jRjvrNUwGoC1RPrJsqIc=;
        b=XUC7i4dYmyjx5oq0sgoY9ATxQUdS9o3OCW5ayTgtiYBvjjpojpgx44PPaq5lSQaxJp
         6BdEBax/EC1lXasi/vYzSMhunml2Gifgtw7EqF5WJ/6grXv2Td6k1NDXkqYTrs3U798e
         iMzrl6h15bfyXnxk8OovQ+eA95KDZyNJIpzFo5L2CFg900+XPfYUHllgMwXvnInez6jI
         G7vL1EBW99CQV/KU+1YC2Wt10B4YMnxeRmYCVhC1JuwoBRKwzRzx5A7GOS8kqPH8w6ZH
         h8Qge6XWXr/i8vTicFmDQA4Q149O6XVXT5lvNvqHpchI7bmytFY0v2y+5kjGlZMMDIdE
         EL6g==
X-Gm-Message-State: ACrzQf1xqRF7QLMCF6n6MdKpPrwGx1FvXYS+HbWehv7O77wUW7vPyE/W
        3ca8CAB8ZZxaHY1iRLKJNUHV8oODusj2zQ==
X-Google-Smtp-Source: AMsMyM6S9IhbB/K0PCnZCtTSePbIeEuS4EFok4irDdkDhHZDjaoZyjyvFW3wOa0V66uhD+fgmiISkQ==
X-Received: by 2002:ac2:569c:0:b0:4b1:966f:7a19 with SMTP id 28-20020ac2569c000000b004b1966f7a19mr8890286lfr.587.1667903819567;
        Tue, 08 Nov 2022 02:36:59 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b00497b198987bsm1726912lfg.26.2022.11.08.02.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 02:36:59 -0800 (PST)
Message-ID: <2ba09d50-229a-25d6-e437-c0b31429eaf0@linaro.org>
Date:   Tue, 8 Nov 2022 11:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/6] dt-bindings: sound: Add sound card bindings for Tesla
 FSD
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        'Rob Herring' <robh@kernel.org>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d@epcas5p1.samsung.com>
 <20221014102151.108539-4-p.rajanbabu@samsung.com>
 <20221014151325.GA1940481-robh@kernel.org>
 <04b901d8e529$573b17e0$05b147a0$@samsung.com>
 <253fc459-c3dc-7710-6f34-0466d5301482@linaro.org>
 <01c101d8f333$b3bc8db0$1b35a910$@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <01c101d8f333$b3bc8db0$1b35a910$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/11/2022 06:33, Padmanabhan Rajanbabu wrote:
>>>
>>> The actual reason for having a custom sound card driver lies in the
>>> fact that the Samsung i2s cpu dai requires configuration of some
>>> Samsung specific properties like rfs, bfs, codec clock direction and
>>> root clock source. We do not have flexibility of configuring the same
>>> in simple card driver (sound/soc/generic/simple-card.c) or audio graph
>>> card driver (sound/soc/generic/audio-graph-card.c). The binding has
>>> been added to support the custom sound card driver.
>>>
>>> I understand from your query that the newly added card has device tree
>>> nodes and properties which are used in simple card as well, but having
>>> a different or new prefixes. I believe to address that, we can
>>> restructure the string names to generic ones.
>>
>> You must use generic, existing properties where applicable.
> 
> Okay
> 
>>
>>> But I would like to understand, to reuse the simple card or audio
>>> graph card bindings, can we add secondary compatible strings in the
>>> simple card dt-binding for the custom sound card to probe ?
>>
>> If you see other vendor compatibles there, then yes... But there aren't any,
>> right?
> 
> Yes you are right, we don't see other vendor compatibles. But, am I allowed
> to add such secondary compatibles so that we can extend the simple card
> and its utilities to a large extent?
> 
> If no, then I believe we will need a separate binding to extend the generic
> properties.

If you have any custom properties, then yes. But you don't have.


Best regards,
Krzysztof

