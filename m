Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69636C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Oct 2022 14:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJMOgB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Oct 2022 10:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiJMOf7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Oct 2022 10:35:59 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF6DEE8A6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Oct 2022 07:35:58 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id h10so1383807qvq.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Oct 2022 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpSbvfXL/4v8AdLedT3KfgIShsnNI4hVyx9+h5TvGBE=;
        b=Ji3otMdig2rRu0rgNUdEHutyEJCuixHBCVeuk3qrRA3/MAXZSXcOMh6BE2e5qsuLXQ
         N0MlMIM1zc8FtBB9v1jeGYs9eraT6LvnkX71upj8ZnPlGUNa0/8tmJEf/UfWKJEOlLTX
         GFVs7uO5gtGyAe6agMqyb4TdMRabGjE3gYxUSUMIo/wurc2RwVzuZ9+zeH7yrzMYX5tA
         iyzn0zsa5dTKW7v5wRoIM5WEFvoygJMv4xQiUQt0l4d+Hj675O6BXBTm9xGfOlUfT3+w
         grvDGP5yva1FcWvEVW9UyeJCiqAyfxZ4bVHMbN0rvLyOQF44RnHsiJZs+kzfUuuMYbxM
         7HcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpSbvfXL/4v8AdLedT3KfgIShsnNI4hVyx9+h5TvGBE=;
        b=Fz299/n0kSSCqDs4tA5NOvmtyUP/9bn1eUH6OW2W53kNNxsK1xec2CyafqA6BkxYWj
         iK8ZumCidMUPo1R4Jt/f2JJ1dRB9UUid1EoZntf4IhfeF2sRvr8VN70PLjUuZH7qYRv6
         7HgO8wMlYZ/TLvAh2Jb5hHhsBn8v21MTfgGkEtEey/sdIobRSdEnq/M28MTy1NCx3GsI
         mPvXGM9oI3dxT1hZI0isiqBShqQCXg9MzI5lsehAjB6svz4Xy/ClHXL7FDrncqbtYEOe
         6NX2U34LX4ytd4Ahn+pmU7gnOMtGAnOB9sfn3hiYYGwZaGNY+gEJWRS7wLdY7OaTbg/H
         g/HQ==
X-Gm-Message-State: ACrzQf2fwGFlYiSEo8638R5OXlEr6ZKmR8pjNyp9fuxiOv0tOj220F2B
        SAmfYd9ImVwyOHV2vz/ZmHw8Fw==
X-Google-Smtp-Source: AMsMyM7BdKabvNmp8MIilLZLrkIn41ksqqP2Kii4roZMXarGWDSD6Z4pAavS9O1eSSjT68us+nJzWQ==
X-Received: by 2002:ad4:5ca2:0:b0:4b1:91d6:2be3 with SMTP id q2-20020ad45ca2000000b004b191d62be3mr27862117qvh.51.1665671757663;
        Thu, 13 Oct 2022 07:35:57 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id m3-20020ac85b03000000b00394fce5fa64sm91204qtw.9.2022.10.13.07.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 07:35:56 -0700 (PDT)
Message-ID: <7315338a-762f-51a4-d26f-d94de71dfcf2@linaro.org>
Date:   Thu, 13 Oct 2022 10:35:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [RESEND PATCH] clk: samsung: exynos7885: Correct "div4" clock
 parents
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221013151341.151208-1-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013151341.151208-1-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/10/2022 11:13, David Virag wrote:
> "div4" DIVs which divide PLLs by 4 are actually dividing "div2" DIVs by
> 2 to achieve a by 4 division, thus their parents are the respective
> "div2" DIVs. These DIVs were mistakenly set to have the PLLs as parents.
> This leads to the kernel thinking "div4"s and everything under them run
> at 2x the clock speed. Fix this.
> 
> Fixes: 45bd8166a1d8 ("clk: samsung: Add initial Exynos7885 clock driver")
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---

Looks good, I'll take it after merge window.

Best regards,
Krzysztof

