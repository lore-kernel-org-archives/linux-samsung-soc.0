Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D59C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 17:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbjHHRzp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbjHHRzR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 13:55:17 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1259329892
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:24:58 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52307552b03so8070593a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511884; x=1692116684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rq9CGfMIPSDr9ZlL/JERcR7sYpgjvn+r29Kl2qTSWpE=;
        b=rvos7TuNZ/JfpEIEVCKjWZgcx9SZOpJa6A3Rt70xE1jaX97+8CUY/o714F8O5T8jX/
         zZyM7OUpacc3jBy6xBuYm/PBMd35No2f7qVlBdmFKbawH3sae4LmR3llQK2GklsOneLG
         H7ahy5A3ek4Yc6APVN/LggFaY9Jaec6RxVdXao1d5NoJCL8TNmF3KK8r/vt5NxXM18y1
         yAV/xV8apOh8bxNX4NTMufj6ieKw6CrUwS5vMslnKkXBB0hvl/mTdDJvldJCIkyTh/8S
         UCZd46+y5jo1sHCXRsXP0DyDocm23hHrMGdBmZsrWIWtAH8LpadZ278ADwMm7SqPX6Pq
         Id6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511884; x=1692116684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rq9CGfMIPSDr9ZlL/JERcR7sYpgjvn+r29Kl2qTSWpE=;
        b=Mz0k/cHNXDgL/WIdPjruGLwFVW9FjvBnk5FCemVWA+VuAjrWByMWU0ucHA6xK2Q2bK
         5HTCSL31VJE833ufW3hcf4Xbhtf6VIHdoiNi3OLYcGNMjikLGUbQdrGplOVrizXp33xm
         yApmPxLzjRXZrDD+cX/yAgJ05QDqaFgEjWc4oiAZBv8VyVzUVI2+EAqQWczN5Q/GUqjF
         Fzq9//1LUZxljifxpvk10LdrVpD2EA7j3ALVb66ZEDkUheqlHaZgnwTD8hL01d40kMdE
         uY/s3OiR7iuJAe1x64eULF/rHNmEcF7mFquWrrlresnxC/lWSdBzj/vbcDZ7QYzMMM7y
         Z5rA==
X-Gm-Message-State: AOJu0Yzu2c2wZW/yrWp9lvDggTkM0N+NKP7YaAyp/qSSAOWAFhR2xhV3
        cRjhlMqrDR2RQGop15cEtmENuCtNM/cO3XicO3k=
X-Google-Smtp-Source: AGHT+IHxzkAXBfNJDNcknbZH6tlIYjJNFyXEZDfCnRpxQMJVfuN4V6svYqKu4KC6ef0+KBpYIwyrmA==
X-Received: by 2002:a2e:9f4b:0:b0:2b9:3db7:322f with SMTP id v11-20020a2e9f4b000000b002b93db7322fmr8508153ljk.18.1691492178941;
        Tue, 08 Aug 2023 03:56:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c378c00b003fd2e89620asm17797634wmr.40.2023.08.08.03.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 03:56:18 -0700 (PDT)
Message-ID: <d7cc1aec-17be-502d-47c1-3163a2766ee4@linaro.org>
Date:   Tue, 8 Aug 2023 12:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 11/11] dt-bindings: clock: samsung: remove define with
 number of clocks
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
 <20230808082738.122804-12-krzysztof.kozlowski@linaro.org>
 <20230808-scarcity-sprung-c0c2abc2971f@spud>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808-scarcity-sprung-c0c2abc2971f@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/08/2023 12:53, Conor Dooley wrote:
> On Tue, Aug 08, 2023 at 10:27:38AM +0200, Krzysztof Kozlowski wrote:
>> Number of clocks supported by Linux drivers might vary - sometimes we
>> add new clocks, not exposed previously.  Therefore this number of clocks
>> should not be in the bindings, because otherwise we should not change
>> it.
> 
> This sentence reads super awkwardly, not by any means important to
> change, but I'd likely word it "Therefore these numbers of clocks should
> not be in the bindings, as that prevents changing them".

That's better, thanks.

> 
>> Remove it entirely from the bindings, once Linux drivers stopped
>> using them.
> 
> I figure there are no consumers in other projects then? If so,

Difficult to say, nothing known to me. Anyway these are not clock IDs,
so if anyone actually relied on number of clocks in the bindings, they
would have trouble in the first place.


> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


Best regards,
Krzysztof

