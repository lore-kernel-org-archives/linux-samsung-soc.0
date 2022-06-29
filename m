Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65663C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 09:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbiF2J7q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbiF2J7p (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 05:59:45 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570EE3D1F5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 02:59:44 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id c13so21412998eds.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 02:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wHx0xHehg63vfEGKTlzZUfteHn01fhYVqm+Y98MQ7+U=;
        b=cq3NqapgxQIZNLj/B4EpJSN83FT6u7scmebwaohN243g5lWrwO8nYBNIAUn1qhvgUb
         7jmmYqH4sKXTgPqROvurvn1vcXpXmylTudSKxbz3wfUavJZu/drqoz5sEa+W5iQTRblF
         5XSJkq1wtz/vUkhZOETe59hjQCYJ80VPeHXi2+7FT76LK3iGsf9cOxGtJxUm6fVg4+tX
         gHvUST/E4kcHFVBni8Uo5KdGCn6dbo2m2ucg+YQITuLGMf03hSWn6qRpS2d5prRfI4YM
         nOlY0VqzuovmFZbZyEnVCPfbor3VtedyU1MSOkm8RT7eAzy78HLxQXHEw1K4eepqjNJl
         5dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wHx0xHehg63vfEGKTlzZUfteHn01fhYVqm+Y98MQ7+U=;
        b=As1BzNcNLHhaVeebvayfJJv9Er5RP7qlqymU17bpZ9Iz/w6hitTUFbYVBVxkoxYcG5
         7yFYSdzRuTgZo3qqTu6Es61xF7pxUvrXUxjWLxpkXpsC591UFWCFB7so9KRk4IuzcyjA
         ADowQQQPQ9Ddxnuy5pYTs8+Oas1j808e2c65ARpqeE8w6VxM5UiqX4BLwQeHjRgRRC1m
         DjC/0CtbiGIK3kJWsp/xfbsT1ynrSzJVTjCXWY0CknbNOMpZRui8TEkwN74CJ6POCpin
         WarZ7H8YPfzO33aZ0akt4VkkvxZ36YzPygJeB5F1D9XW3LwflPV49VirbJpFROFA84vO
         hlxA==
X-Gm-Message-State: AJIora/w909SE4fdHYdbdEhRakYPNs0/i/rPYCqpfOVqwD5s/mF0254u
        dVmCkn0q5c9/2XhZUBm+P6080A==
X-Google-Smtp-Source: AGRyM1uKH7BIvUrbVdQs4hTQzzjvedfKmrpPqHS5rBnnbwQUfXiaigl6zGQSbVqTeAGptfLzPSzvTA==
X-Received: by 2002:a05:6402:430e:b0:435:9e41:6858 with SMTP id m14-20020a056402430e00b004359e416858mr3130822edc.69.1656496782905;
        Wed, 29 Jun 2022 02:59:42 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bo5-20020a170906d04500b006ff0fe78cb7sm7516695ejb.133.2022.06.29.02.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 02:59:42 -0700 (PDT)
Message-ID: <db26821d-9780-5829-5078-d8f8fe6e5875@linaro.org>
Date:   Wed, 29 Jun 2022 11:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] clk: samsung: exynosautov9: add missing gate clks
 for peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220628104138.152118-1-chanho61.park@samsung.com>
 <CGME20220628104347epcas2p4502a4524de0c98ababe8cab4b7b73c3f@epcas2p4.samsung.com>
 <20220628104138.152118-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220628104138.152118-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/06/2022 12:41, Chanho Park wrote:
> "gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to peric0
> and peric1 respectively.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
