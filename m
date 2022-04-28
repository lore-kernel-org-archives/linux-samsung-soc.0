Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D886C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Apr 2022 10:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbiD1KHJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Apr 2022 06:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbiD1KGa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 06:06:30 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718433EF06
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 02:54:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id j6so8422079ejc.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DBbj9vS4RiFSbV5R5DxxG2khMbNBoKzLwuIctcI4Aas=;
        b=L9cmlONc//L5dCt/4+WU2nzhjMngUTJ6znb5nHNh7fjINXCLkHSu7CVBmuQyI2GWeQ
         munaiWap7dNmrg5VJHQVJD/fr++mtTu2Nzippq5fjCOPNglIZSC/3dhgQ6cQ/9xHzwHN
         jdNaJrRJk4XO682JIf4A9MFDhKSEhDBxCfwVZwqCEkd01/nLxS6dMT6Tg0/4mvQrgCGN
         8Egovu+UaeilDMQggA7ecZMKVfBNlQ7Sf5NhRwbnj9d9TqV/65muAt3/aRYLbPAdM2pF
         uAcgXnhl0LvgCbhXruDxcaC4ApHSGjS0+BxjuJXR25lj3yLta4UouOgo7iZeytJxnhWM
         eN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DBbj9vS4RiFSbV5R5DxxG2khMbNBoKzLwuIctcI4Aas=;
        b=FIVxpkLSynJ/R8301O9122PAEVDJYikIViK+1WS/742Hf2QA7s1VP/bMQ4MOWfgLqz
         iwmXWrqxc6dwINIdba/Bi8t8XEwYQpcrEkboXRrKeVNCHIQwovYYgvZdBKTtlunSyqKt
         YKA3uPDqUSPXRy5wW5jeXiKDLXlO4rmdYKTj77PWg9+WtmQTW8oF1LA4AtnoGqs43IGk
         gPJg5dsreOTq9Jes+DFmSgj/fZ1jC5K0kSjLjy77yEWGaz67Kg5dlXXBAPHwtMr9cfys
         ReoJ1nkqNK4jAwLBr2kmYdwq4lbPmL9nbyJrMQg81EHiXhawQlXbvDGa74Om4Ctm3/HP
         mwZA==
X-Gm-Message-State: AOAM532G14nLW4i1gfyGvQSWN67SWUq6e5iX9xKUHGFY3uQmaJioOvmW
        VF64l1WiXJiWeKh22sF0shgpFr37I8gPBQ==
X-Google-Smtp-Source: ABdhPJzUDZjZ6FqfqR9CbNRRWJcRTyZXYsJlcIWLhXC9v0jQj+VsOYGcUY63+9v8dDPDpntyVJYgcQ==
X-Received: by 2002:a17:906:5d15:b0:6f3:77e6:2126 with SMTP id g21-20020a1709065d1500b006f377e62126mr23304886ejt.707.1651139690020;
        Thu, 28 Apr 2022 02:54:50 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090600d600b006dfbc46efabsm8125774eji.126.2022.04.28.02.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 02:54:49 -0700 (PDT)
Message-ID: <6981f93a-ef01-6ba0-4451-26526372d666@linaro.org>
Date:   Thu, 28 Apr 2022 11:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 08/10] ARM: dts: exynos: use proper
 'dma-channels/requests' properties
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
 <CGME20220427160347eucas1p23ce51e0fb49160d437961d98fd682c28@eucas1p2.samsung.com>
 <20220427155840.596535-9-krzysztof.kozlowski@linaro.org>
 <5eeac2a0-4293-675e-9dc2-25ed8ab3fb8f@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5eeac2a0-4293-675e-9dc2-25ed8ab3fb8f@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/04/2022 11:50, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 27.04.2022 17:58, Krzysztof Kozlowski wrote:
>> pl330 DMA controller bindings documented 'dma-channels' and
>> 'dma-requests' properties (without leading hash sign), so fix the DTS to
>> match the bindings.
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Are those properties really needed for PL330 driver on Exynos SoCs? I've 
> removed them and I still see the proper values read from registers and 
> reported in the log (Exynos4210):
> 
> dma-pl330 12680000.dma-controller: Loaded driver for PL330 DMAC-141330
> dma-pl330 12680000.dma-controller:       DBUFF-32x4bytes Num_Chans-8 
> Num_Peri-32 Num_Events-32
> dma-pl330 12690000.dma-controller: Loaded driver for PL330 DMAC-141330
> dma-pl330 12690000.dma-controller:       DBUFF-32x4bytes Num_Chans-8 
> Num_Peri-32 Num_Events-32
> dma-pl330 12850000.dma-controller: Loaded driver for PL330 DMAC-141330
> dma-pl330 12850000.dma-controller:       DBUFF-64x8bytes Num_Chans-8 
> Num_Peri-1 Num_Events-32
> 
> I also don't see any code that would read those properties. IMHO they 
> should be simply removed at all, at least for the PL330 related nodes.

In current Linux implementation they indeed are not used. Nothing parses
them. However:
1. They describe (hopefully correct) the hardware.
2. They might be used by other implementations of pl330 driver.

I would not remove them from existing sources, but indeed maybe there is
no need to add for new files.

Best regards,
Krzysztof
