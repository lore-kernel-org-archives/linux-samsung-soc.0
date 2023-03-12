Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B669C6FD1F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 16:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjCLQYG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 12:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjCLQX5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 12:23:57 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE43223D9A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 09:23:30 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id er25so11390032edb.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678638176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+xZrChxZkc6JrPh0xGVIIzxchyzDK5KbwG2kHyM3LRc=;
        b=ZUz15jVisj5kNtfOH06lkDcSBNDfdT/lXA3aHmV2d9hVxP4hpGbWRZY80T8hKeuYTD
         6T2mXF+W668+h5NOvc2BjXtMjGwP4Tkr4opimWqMwVUHsQk3EtNJytvTFra7ZlubBAxa
         2FUGNDqPfb/moKaebAGIe4WPqkoeDPLwhhgCP6hqvpYtyTDlf4ksjy6U6erxbFY6HWkH
         mWorRKDMUnDRe12oCoYmapaWaYEo3W/8ykacUjkQgJMA1dpQFIzPp5lE2Q0PJVmyXsJ0
         bs0dJVlW2s8fhcVTf7uppd8qamV2TN1FAi+UdFgPfverbv/krFdy94liEf3leBTLaynq
         0dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678638176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xZrChxZkc6JrPh0xGVIIzxchyzDK5KbwG2kHyM3LRc=;
        b=AtywJdfs0pE83t+UejMKETQAaaRv02IhI97BrV3M9ixCMUId07oATWdSCgnzsbUJzs
         w/ZrWg4Wu1HPRRtra9ylesJOTDiVoXWTtCEKU7fduclO9XDDmFSJnPl3Rsdox8yTCbNg
         05R5FyRjgkZSsdpwIyRYoVqepGzmcKHpZPo1fRzC3n+fqAplja1TrNX5mXBXruUiQL9F
         xHH5h51+UMmMLoxbLhamWeH6W4FYTq9hjKNQlgj5nzkSJ6fXgLzysJLxn4Ovqj8Yqxd9
         Iqfap3wq90RgOkEd/WIu3AVZXZuuEzMWIHHbkwqGyZ6JqF6ilFW8Z6wHl1xQ7o3ifcRk
         wN4A==
X-Gm-Message-State: AO0yUKU5D4Le05+wxVfkQ0tbjGg3BR5vpRsG0FKHJxSNCiA9kabZ2wsn
        Fxim0ggExH0Bv92lRAvlEX0ThQ==
X-Google-Smtp-Source: AK7set/A+que5qx2g6k/Nv3GDCYZJPcex1mjy+LxdlaNFrRsLCAOGWDOJ+k50aSzL3tfDGryksGYTg==
X-Received: by 2002:a17:906:2756:b0:878:79e6:4672 with SMTP id a22-20020a170906275600b0087879e64672mr27703036ejd.42.1678638176627;
        Sun, 12 Mar 2023 09:22:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id ks14-20020a170906f84e00b008ec43ae626csm2359153ejb.167.2023.03.12.09.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 09:22:56 -0700 (PDT)
Message-ID: <1f39c602-20ea-94a0-caee-54ae3dd10bfc@linaro.org>
Date:   Sun, 12 Mar 2023 17:22:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 14/30] clk: s2mps11: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
 <20230312161512.2715500-15-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312161512.2715500-15-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/03/2023 17:14, Uwe Kleine-König wrote:
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
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

FWIW:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

