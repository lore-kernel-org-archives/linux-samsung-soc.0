Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E18C636D3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Feb 2023 11:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231663AbjBBL21 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Feb 2023 06:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbjBBL20 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Feb 2023 06:28:26 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4827820D24
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Feb 2023 03:28:25 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so3468183wmb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Feb 2023 03:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6G7C6+CbotlLHhV5pB8v4PiXcl3SeDboC1BfDqfKOuk=;
        b=VxLUhaPGapq/mN890GskLmZRb5wZr1N1JPiiwQly1P4ZqxNFyhiITm0kzVOsbEeA9E
         1AwYwov2+tU4UdamIIXNsBDTaaVHqkc9empQD+2wpkcPXeTjjpjDvgpnje4oMbRtA2AK
         pf7e2KHFSjCjUx2zqa4RHVRHJe1p38l2OCKTQNREi2aoujQYC+jBAcYrtxv7FlZXkd1b
         VqiaZp58TMt2IhvhqV2csYxfnI7zM1IoYelskqC7BAuMlyOFjCzS4/7x8weds+Q58nDg
         moI7hB/fi8onNCjc38WeJDEljExv6/ATxp14bAJpRKcaPxBqDfM30/HrMkBczUpijPHj
         UI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6G7C6+CbotlLHhV5pB8v4PiXcl3SeDboC1BfDqfKOuk=;
        b=isHEfUwkWmTrywWdEaSl9xiX7yPPF7YiA5lGj/ju4j0dcywFxEParsU00WRx1vNHC5
         GxR01OiTXgvFu7HmA9LAd7l21Aug9a+w4YHxN+CB04tu17eScvFGVyvyYEqYzgc/AtM6
         yqcbv2HVEVzkDJ5KI2RsOGNbuEc8yDDAhG0huNyYR+4oGaLXJJg6eo3LQJYjpfkzt+F7
         I+QsGqa489+RBptZRtIGfMlbbsF8Vf0s3J8QwUtE8OB1mWOBSTg4tz5eRlRpRRvJMsUx
         KleFYP6f9wn/fgBdMvOXTBa2i9siV1aC/FW2qlERIbm5UUZfCWolTvPzVHiEmifPDLTl
         QB4w==
X-Gm-Message-State: AO0yUKUoTWpCzEQ9CTQEtOkUM3tEqfAAQMw+B2NxUdVD4/dYBUdZmt5g
        QJ79iES06r3zGd+V69AtFkm+Ek+ff49nXHHA
X-Google-Smtp-Source: AK7set8g8w7bdeLSLWWG6jKSrWmqZW5B7wOaDHauzzAmPFMYlzAOK0TFE7LRWIEkCIF+Qo265e4C/w==
X-Received: by 2002:a05:600c:4447:b0:3cf:ae53:9193 with SMTP id v7-20020a05600c444700b003cfae539193mr5419631wmn.39.1675337303887;
        Thu, 02 Feb 2023 03:28:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bce11000000b003dc492e4430sm4576133wmc.28.2023.02.02.03.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:28:23 -0800 (PST)
Message-ID: <45ed6cd5-16b9-dab5-cdc1-9a15009fbe54@linaro.org>
Date:   Thu, 2 Feb 2023 12:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] mfd: sec: Remove PMICs without compatibles
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Lee Jones <lee@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20230131183008.4451-1-virag.david003@gmail.com>
 <20230131183008.4451-2-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131183008.4451-2-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/01/2023 19:30, David Virag wrote:
> The S5M8751 and S5M8763 PMIC chips have no corresponding compatible
> values, so since board file support was removed for this driver, there
> is no way to specify these PMICs as present in boards anymore.
> Remove leftovers of these chips since it's dead code.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>

I see removal of define in patch 2, so:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

