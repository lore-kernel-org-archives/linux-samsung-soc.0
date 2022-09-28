Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33D7C32771
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Sep 2022 06:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbiI1G4z (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Sep 2022 02:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbiI1G43 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 02:56:29 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BE172ECE
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2022 23:55:56 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l12so13293383ljg.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2022 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8dV1Lr5j9/OPnh12zVCM9dCbFD5hUKaMv3VVQaPrqGc=;
        b=NQxyvXzYmP2752zf1x8HQKEVSqQFUsOk+AsT/8LG9Nkh5cn3yn9K2xCwOPGccIZMWd
         +asRcgUw7eYxwwDDp1h2zVy/wimHFYKLW9d989JI3MqwRfyphF3miqSk7wEyqeus//q+
         yCengcFi5fWEvXYdwbzpcTnViuQRu4+m4MEOcBw6Al8XXyx0Gyp2xkzJp8osxPhivdpi
         O8rELK78z/1rxty3TRSSxcF0W2e8hu6eS4S9whyHNd4XqCXzTXUaXWIPn5IUMEOafpZ1
         lKXkEjO0rtDkOhbVzswZizsH6QVZMFpFeEclfI0193oiviA/t/iH6ZRNdZdXs14toFXU
         h4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8dV1Lr5j9/OPnh12zVCM9dCbFD5hUKaMv3VVQaPrqGc=;
        b=m6ssoSUQ0Bk+qjjg0MST0a/CwnlD4lwYK/8rZF33vVCOSGdSil26q93CstTEow/xF8
         00912dyPyGQ2Y6fKt4p9cVwxwup275dU1+Q4YZXHFwdDGQB2aP8HH9Qw6pA8AAMaJOxB
         vXaNUQNpBEphUQLcv8rR63YWQLeJ9okrMZsSlV+yA12KAtPhPRZouQq1kyuCXCwGQ95A
         kQTj+s4a3KyOEWx/OaNFyyXD09GiYCcDKBuwycVuOifsDpBmgN2max7bdL3pHUYCR5sv
         dyCeuPzCgR9uVEuUKBn5HzWM2tJY8/ZtMz0HV8cfPKMbH9RmtaXBtDdd2ChOWhT4oIuB
         OmnQ==
X-Gm-Message-State: ACrzQf2LHFQzuw9PjYR7ixJiFIdPf+JAh92ZuJUmMs6lYblMbuaEnW09
        MChyeyzN/M3CFGsDDltWrgKozw==
X-Google-Smtp-Source: AMsMyM7fqCy+IkpiTlqpYoBS9gGXydQEN9RwE7fldf5qQAlM0rbyvNmANzSC++zPrsNcB2fElq9P8A==
X-Received: by 2002:a2e:9848:0:b0:26c:49b1:9cf0 with SMTP id e8-20020a2e9848000000b0026c49b19cf0mr10647881ljj.385.1664348154144;
        Tue, 27 Sep 2022 23:55:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b004978e51b691sm387869lfq.266.2022.09.27.23.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 23:55:53 -0700 (PDT)
Message-ID: <0a4c346f-52fc-1cde-e6d6-84b7bd0e1090@linaro.org>
Date:   Wed, 28 Sep 2022 08:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] usb: host: ehci-exynos: switch to using gpiod API
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220927220504.3744878-1-dmitry.torokhov@gmail.com>
 <20220927220504.3744878-2-dmitry.torokhov@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927220504.3744878-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/09/2022 00:05, Dmitry Torokhov wrote:
> This patch switches the driver from using legacy gpio API to the newer
> gpiod API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Greg,
I'll take the DTS change via Samsung SoC tree.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

