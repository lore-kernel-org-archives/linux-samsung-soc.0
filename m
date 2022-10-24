Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BB9ECAAA1
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236843AbiJXOBz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236928AbiJXOAm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:00:42 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E750980495
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:47:27 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id r142so7537731iod.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bPvGa97y5q4/yNn+YYREFINJ16OQcdMmVgM+wz4Gjoc=;
        b=qBrKhoX3br7NLa0X2PY4m8righ7u83mybm9+NRa9wbf3xFOT/FbXAC4kU6JnNMZQ90
         5svF30fqP3MU5aDod6HAn09pBVDgb6DBkvTZ74Isgw17vB4XtOjO7m163cnAdyaHhIrA
         g2TCsmWfOf9HNi9TXQb64BQ7fuFFOmpmxsYqJt1COp4kZD+q0vtxdpFVlAVv7GkcQ8YC
         ffwJcNMHOT7rmySlWN+t4QiGyZKaPEXJdxnxOgvOcf1mMWkp0HRJQCN+io1dYF1gh6q+
         eKAtnXWL1iAzEhwJtOmiDpngEozELlGSyUwOlWtKzIrWgiJ9U6m2WY82ouYVfiWeJjL8
         MdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bPvGa97y5q4/yNn+YYREFINJ16OQcdMmVgM+wz4Gjoc=;
        b=epWk3eiMPUUvtvPP9B0DaQlmrcUt+1ceKRuaOaLYyAGPrCZ4OYBzhSYf8DXjZlIxI4
         mL12yst1400/iPhQbhPF3KtfTH81Lb68pn9RNhNM69G59qg8zN20+NnjtTq0VowPhhmC
         GGhyIrQbZI5aau2kyrAKUzhEbQhjSWjtjswd70YXlpb+roaTIEZbxnjIY7OdKuxt75Nc
         0eTI9sLGGjEbV/GAYCioJPh7z4ErKPZzoJtiKZAt3z0S46SGA6iS3CexO4erD+gefGPk
         47uzGKWBG9A6Vi0x0Kc4hyohONac8sxzGsCA4JlgwlJVvuOb9I4kbg8B+NI4v7l4NaXz
         0lEg==
X-Gm-Message-State: ACrzQf28et+EdyuDLM0f2DrRuu8pZIv+9iqDmj3FnYv3t70zk+QnKUb0
        dlO7mTX0TeShFPcUQtDtU1u9QjYfttdN5A==
X-Google-Smtp-Source: AMsMyM7EYh1ejwFY2USGW8DFT0b/rUYzFLiVrz06YsLEAhRKFwNDPvh1rFazu864RVBKbhTwpJXvvg==
X-Received: by 2002:ac8:5791:0:b0:39c:f20f:b7f5 with SMTP id v17-20020ac85791000000b0039cf20fb7f5mr26487093qta.360.1666615077517;
        Mon, 24 Oct 2022 05:37:57 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id do35-20020a05620a2b2300b006b95b0a714esm8020183qkb.17.2022.10.24.05.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:37:56 -0700 (PDT)
Message-ID: <7f7ea721-42c7-6d5c-6b84-cf597d21ac29@linaro.org>
Date:   Mon, 24 Oct 2022 08:37:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 12/21] leds: remove s3c24xx driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        linux-leds@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-12-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-12-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform is gone, so the led driver can be
> removed as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

