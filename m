Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732C7C761A6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Mar 2023 10:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbjC1KH1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Mar 2023 06:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbjC1KHR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 06:07:17 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 838C66E89
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 03:07:01 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id er13so6322287edb.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679998020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZPljhKeSnuSGlSWfKaLNDMSdJrVY6lMlRIxToWIHSE=;
        b=vgTGHg8fA3BZsk9LUPzWlrSQZGnASPGPFuZqfImemSFhHCJj5lrtNpJl1qhJaeaYPE
         leDREJVTlbajzM8RI1c/JJjEonQftsvxksAxwpBnCXhjUjMQyZCY4O7SkHN3OBwzks9Q
         bSr5gSOwPFoaT1eeMkd5r80jXAD5DRr7hRbPRW9rD8V9QLlHdLS6qaVN7LXketIv2oGr
         aUCy2skJ6KxoLOyx9EuzZc6uSN/bxCuCJjKG7VExpH/QuwU/f09lG+YfT/ojSHZl4qh5
         XyE2kG1yPMFqjfQgNc0IQHuEDp6GG1mNDOzZOWLy0yK0OsdVuG6AogQkCxaEJ5VYdtiH
         4Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679998020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZPljhKeSnuSGlSWfKaLNDMSdJrVY6lMlRIxToWIHSE=;
        b=e4H/ArRpW1wHiBjuOF1u7PiDk6CzqnDi2jp+/3ihLylkzyYINgQZLSCCy4FunfTeBi
         b3hi1tA7MQAW07gSubywsmW4keMpO9AEBv0AjraT8sFna0zacwf8CYCJvnyjwiNN7/7A
         J000vZCgnbmyLsOaiDQ0V1+dPN5JYs/z7wf9bTnxB1Lgl510Nrn3P0EBFk6N7UUJvUAy
         dsVk66AyYnJwV1wpmECKqvOzlDY1C44GR8YW0pN1ieU1IYA19CkEw7/1pHuuqm8jqBVI
         KDqNJMlqyJGM204DDFoT0szu9apMEA2+D7pxsToJNo0FGArQ58GhC2ffvfKlz3rMQkQc
         vEng==
X-Gm-Message-State: AAQBX9czJCnlWd9zoJcSG9kz84L7h4DhSaQtk1xAaHmpgSwPXMy9kt4W
        13ltEJbYHxvuLw5w0ESOgEikzQ==
X-Google-Smtp-Source: AKy350ZFYyOvQbIZ2wc5ylrWhyV44C9OKuB3cjIa2tHpjn0Dm3C5pFk/kZSkKlTmHvKCSly/UXuydw==
X-Received: by 2002:a17:906:9244:b0:939:4c86:d492 with SMTP id c4-20020a170906924400b009394c86d492mr14400048ejx.5.1679998019965;
        Tue, 28 Mar 2023 03:06:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906b10700b0092f38a6d082sm15071729ejy.209.2023.03.28.03.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 03:06:59 -0700 (PDT)
Message-ID: <81fad553-e8c1-f387-4df2-70c91a6ebc33@linaro.org>
Date:   Tue, 28 Mar 2023 12:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next] devfreq: exynos-ppmu: Use
 devm_platform_get_and_ioremap_resource()
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Yang Li <yang.lee@linux.alibaba.com>, kyungmin.park@samsung.com,
        myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        alim.akhtar@samsung.com, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230328053853.23159-1-yang.lee@linux.alibaba.com>
 <8779217b-bd70-37a4-c779-139690048d4d@linaro.org>
 <20230328095337.sr6s3klmhiyz63pr@intel.intel>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328095337.sr6s3klmhiyz63pr@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/03/2023 11:53, Andi Shyti wrote:
> Hi,
> 
> On Tue, Mar 28, 2023 at 09:19:01AM +0200, Krzysztof Kozlowski wrote:
>> On 28/03/2023 07:38, Yang Li wrote:
>>> According to commit 890cc39a8799 ("drivers: provide
>>> devm_platform_get_and_ioremap_resource()"), convert
>>
>> I don't understand why do you reference this commit. There is no bug
>> introduced there, there is nothing related to this driver.
>>
>>> platform_get_resource(), devm_ioremap_resource() to a single
>>> call to devm_platform_get_and_ioremap_resource(), as this is exactly
>>> what this function does.
> 
> I've seen Yang has sent many of these cleanups, perhaps he can
> write something like:
> 
> "
> Commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()") introduces the
> devm_platform_get_and_ioremap_resource() function which combines
> both platform_get_resource() and devm_ioremap_resource() into a
> single call.

I don't think we need to reference that commit at all. It does not
matter when the API was introduced and just makes commit msg unnecessary
long. Instead the commit msg should shortly say why this change is
needed or even worth accepting.

> 
> Update the code to use the new combined function instead of the
> separate calls.

Best regards,
Krzysztof

