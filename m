Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F93AC38A2D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:49:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235094AbiJXOtX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiJXOtD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:49:03 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EA9100497
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:26:30 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id w3so5560935qtv.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ygEQgsnk9+cnssDub4433kT8dBZoeCOzc672ndoDWg=;
        b=SlDLfdUy7FfM/j7QiG7iu7R5ehXsgixPiskiqiZz8ANCZNMKNvKMN4SQ8xHCCFTfh0
         IL9CWmBAGeMmmEhW1d9oE6p6DFgtMh0RXGsgVR3d6OLaAjQofCUGiB+XtXIU2f46Hl2/
         LuG9p0eGO6BbiKnZeiD2PYnKGGMclmWBEo6u105MtfIoEGadCFMzniCqoEV3Oy70ODxa
         Xq5jzlXxHvetS3Bp4+eXdsAzg9rowI9ErRzPnmfM9Ydv+iFtqk4FJrClAKNnwQt5rsAj
         ZmcAHumpppe5TWyd9EA8LNrAYdlMYKcWdsQVbktKJHLK1zoZOpP9s3sjseMO+YsfMkc3
         7ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ygEQgsnk9+cnssDub4433kT8dBZoeCOzc672ndoDWg=;
        b=4v4HpTUNsdNRWyBtSR6muHfbuC/Q0jW5xQP9sTXfSsmqDdp8fmo1twnv0LcgOMOFIs
         v9M2Zd9iQPZVhRECMe1kQu6Rhtgi6TlSDUkjbPEQ+LN5mhFnLAVspOPj2DgOYJHFmZvq
         QbSt3WGJhi4k6bEv4wPJCkjbwaifuh7npZmV8DwnKQgksy8GzSzIzBZsLvk9YgkT78KD
         g8vsgjKefm4+wrdCQqxj4ZUDTPatNB32ZrcVkS8SUaTJC/t6WsIi3qd0Y/e0x4PjcqH/
         WReREoVjflqBNCGuIFlK8fURZNqJUEbOgakttzPtE/95SJrAYqbAXEWSUrgW8T33OSE8
         sl6A==
X-Gm-Message-State: ACrzQf28VOy1tDzvW/33BiGnXsgqhybjYaj2ERuGjn6zN/uehpzVGVtO
        l4gSsV3zNQ0IR5mfhuHbpV2eb0nv+icXaw==
X-Google-Smtp-Source: AMsMyM4VcQFVy//DqykW/4nb9YZadw+5ViBgauM82Dcnz44iWfoB2+pR/piEsUdOm+S967/Rk7Hf/g==
X-Received: by 2002:ae9:e8ce:0:b0:6ed:22ee:305e with SMTP id a197-20020ae9e8ce000000b006ed22ee305emr22141460qkg.255.1666615864646;
        Mon, 24 Oct 2022 05:51:04 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id x18-20020a05620a259200b006eeb3165565sm14833626qko.80.2022.10.24.05.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:51:04 -0700 (PDT)
Message-ID: <ed79cf58-17bd-5542-db9d-e6a9ea3a1bc2@linaro.org>
Date:   Mon, 24 Oct 2022 08:51:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 18/21] pinctrl: remove s3c24xx driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-18-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-18-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was removed, so this driver has no
> remaining users.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

