Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C62CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 23 Nov 2022 08:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbiKWIUz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 23 Nov 2022 03:20:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236216AbiKWIUv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 03:20:51 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF43FAEB1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 00:20:38 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p8so27041032lfu.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 00:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhFEQELa4VkTH3dXCJFPIV5f7OVafEghYhmDz8dxAsw=;
        b=ti0fy3zFjpws7aumeLZs4bfmrqyyUmZEkE6AkEd6AxWduEk4ZrhiKtm/h+Mz00+5Sn
         qB5P8Ocx1KzMRETnzTrdSiQTQJZpH2sxphGQDOwOkPp1gJ6qYSrpGJSR6FlVbaKz/+9G
         Mcoq4D22FZP5gmimwaBhuHIdIBqb8DK8vXcRb7jF/7aMVzYFxLEN0HBcNJNg41b7wRas
         Z2GLoJ1bjuI6R6bDGvpuxzrCa1GLfvXyeR37Jbm2emzMKbucVsLle+IfrtD1+Fh52CEb
         HhZWkAE1deU4LoH3gLaPmorX8A4i63J+dKQLq2kBZOW0Afp2vABNv3A3NS56viGSPuln
         9t0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhFEQELa4VkTH3dXCJFPIV5f7OVafEghYhmDz8dxAsw=;
        b=6Jxa6mQ4zuRUcjd06q9Rssqc556aXqNBWKEwI+e413b6fOirJ40HJHKw+tsiBlivfm
         BmuwvfAU2DY+UqnAMJQlPUSILXUDmfC2zw6Zitnajc72ZUIlkSO3RfkLfBqnwlpzbE4+
         NIsul5/Yzy1vagMbti0KKf0gA3+Aust5LGawYgdFNOCxRzkCQ9nwu2qH9HIuTiLIWSaA
         vjUXSFHKgZ+TWUaCtbTs6Hjg0X8e3gUU+raVhYOhF5wpRhgVYEe/yGeVDq4Elaq26cWF
         n1iHx9GfBu9FEs++mfqL0nfBryD3/kR8pRHgnRPehKej2g4uMIo2VBywpK5jpJGslCaZ
         lt9A==
X-Gm-Message-State: ANoB5pm+GFhL0Ejc5ug0GSLLR1sF3LeMcwWetATgi9BqHoY+3XvL5Z2J
        T8j9BZKCFa77gNgB7Pd/gHvtqw==
X-Google-Smtp-Source: AA0mqf4CI8Ij3JSwtMSUrYc+lIf7HpUCJeQnclMNeRAu9pqSPkVrvgNxp3xG0b2MW5XqYTW6hP4Cnw==
X-Received: by 2002:a05:6512:689:b0:494:78cc:f153 with SMTP id t9-20020a056512068900b0049478ccf153mr8626000lfe.644.1669191636500;
        Wed, 23 Nov 2022 00:20:36 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j12-20020a05651231cc00b0048a934168c0sm2790896lfe.35.2022.11.23.00.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 00:20:36 -0800 (PST)
Message-ID: <4f4bdc95-16a2-df76-9787-df46a3b5e1eb@linaro.org>
Date:   Wed, 23 Nov 2022 09:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: (subset) [PATCH 06/20] arm64: dts: Update cache properties for
 exynos
Content-Language: en-US
To:     Pierre Gondois <pierre.gondois@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob.Herring@arm.com, linux-samsung-soc@vger.kernel.org
References: <20221031091945.531874-1-pierre.gondois@arm.com>
 <166742051292.139492.12539582422109367063.b4-ty@linaro.org>
 <7681ba8e-1036-7540-5eda-417ed204d35f@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7681ba8e-1036-7540-5eda-417ed204d35f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/11/2022 17:52, Pierre Gondois wrote:
> Hello Krzysztof,
> 
> This patch and [1] were dropped after a bad patch management from my part.
> v1 and v2 are identical, but [2] lead to the 2 patches to be removed.
> Not willing to worsen the situation, I wanted to wait a bit before getting
> back to these 2 patches and let them be removed.
> Would it be possible to take back these 2 patches ?
> 
> Regards,
> Pierre
> 
> [1] https://lore.kernel.org/all/2d8b2d85-7bc6-026a-baf9-11a47171ddc5@linaro.org/
> [2] https://lore.kernel.org/all/bb36df3f-5aee-256a-4d64-eaeb9bff998e@arm.com/
> 

I was expecting a resend with:
1. Fixed subject.
2. Changelog.
3. Trimmed list.

Best regards,
Krzysztof

