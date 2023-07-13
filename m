Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A8C3C001DC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jul 2023 08:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234402AbjGMIRz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jul 2023 04:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbjGMIRQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jul 2023 04:17:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6D449CF
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jul 2023 01:11:24 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso3363615e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jul 2023 01:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689235878; x=1691827878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yb8d44+Azm1wudWtAn5xRkTck24UWL//WFKAbn+rUfU=;
        b=ascpkzLoPhhIgMmmEAEN6xdJt6oqEZdzliI5wE3gQb4AXxeOQldD1FYpjShjUe07oP
         MR8YE4EfOFtWYedwzGgQ1/0b5AHlXXu10s305WYBf9dGp1xBPkLl3glMb/oYXQG0BMrK
         4vaQux0LTz/IYS0tKb0ZBhM3WRhxT6n7LMdU1S0eaVj1lGFVIRpZAT17PWXGr1c8iVUz
         gKktxCb1KqwQ7XQ4qemWMOIwWYjjX1M9P5fqi2KitWoS3YrMUVOJbudikcjnBEDVx7tC
         vfI4xScCVshFZbi/nZnhVKtMLLCwG3TAQyitknHiE4ap5tuTFyTHJter+X5nk2hPO2uJ
         fRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689235878; x=1691827878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yb8d44+Azm1wudWtAn5xRkTck24UWL//WFKAbn+rUfU=;
        b=bok6CBJQ5xsRPrVcK7MlbMD1RyND4B4q/mtIdr1HB7QHuCjCrewDoGttd6U/VHd3x/
         0Jqw9nb7Hlu99phwQTsv6mjGrlAieV7bxP7Kv1WNm1NA00qe1lw4k6D0pQ4oJQe5HjMC
         8J9vTp63jsTVp9wb3hCDBS3XiOWxL6xfyMeKn5KD2IA7JYGSLmVJ0mlFdw59zUXyMrMy
         hpB+q3dGoYW2r3RMwc1BCr+X/MRgK0pcWAs0Al1h8NwuJDZV+k1SAdkJQCtng9w2EqH9
         z3wtfsYg9HlJ355aDNFjzQgiGaXgFS0BU/8N36CxRdg84za6AQPO6VWxiOdjBUSEhQUp
         zCYg==
X-Gm-Message-State: ABy/qLaz9gKIVpgN7+XoIy2D1Bltd5f0mAA88hAsaZ5BBWuVeFC4LvYf
        /9lP4ek/IW80mENvi+xMNTSy3Q==
X-Google-Smtp-Source: APBJJlEdublQH/URkoiDZqIG/L0SD2i5TgW5g+DYrQXBYFGXmThM0kaDm7NuUOXNoZ6JaeW2aokOiw==
X-Received: by 2002:a05:600c:20f:b0:3f9:b87c:10db with SMTP id 15-20020a05600c020f00b003f9b87c10dbmr694751wmi.3.1689235878121;
        Thu, 13 Jul 2023 01:11:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q4-20020adfcd84000000b0031134bcdacdsm7240492wrj.42.2023.07.13.01.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 01:11:17 -0700 (PDT)
Message-ID: <75d2dc5e-4cbf-2519-cdf7-8fde374126ec@linaro.org>
Date:   Thu, 13 Jul 2023 10:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 14/58] mmc: dw_mmc: exynos: Convert to platform remove
 callback returning void
To:     Yangtao Li <frank.li@vivo.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230713080807.69999-1-frank.li@vivo.com>
 <20230713080807.69999-14-frank.li@vivo.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713080807.69999-14-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/07/2023 10:07, Yangtao Li wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.

You even copied Uwe's commit msg... Aren't you duplicate his work or is
it being coordinated?

Best regards,
Krzysztof

