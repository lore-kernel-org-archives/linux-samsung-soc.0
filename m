Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443B6EE49A8
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 07:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344238AbjHSHMh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Aug 2023 03:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344334AbjHSHMR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Aug 2023 03:12:17 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4034225
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 00:12:13 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99357737980so207372166b.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Aug 2023 00:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692429132; x=1693033932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQY6WnQ/m8u0RegAANKfIYUYTzgv1vRq3DZ3ly5dbAc=;
        b=hoyQJLUnCFxiJgpShvNrpr7ON1krFRmjhH8yBjPrQYeXnhfCwvq2ihXqH+8ZSQ2W88
         oBp8WyPcfHljYOXM9Vq5iLSDOwh+nhDgCpw7X4uzIHP9oVcUA/INZ7KyT/iHNRu83mAO
         q/WnbV71o4ipAcMtOS0SLibL2o11CXsFbU84tQfUZZkdNXqlXKJC+q+o/aPIbL7bD/UA
         fAkdqoa0j/21HfqIUA0W8byKEJLYSLPclr2Kfv8GvX/3PWooQv2y+3g40CETnE/pF4rw
         rTfidFQRMws5BZD3pwnI2rsIAmjtmfvp9JOBNNi/EPpIazWLX7ebZ5k0KdJvR7rBHVuq
         6lVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692429132; x=1693033932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQY6WnQ/m8u0RegAANKfIYUYTzgv1vRq3DZ3ly5dbAc=;
        b=gptw5WLOK2O8/40qpRjGQyeG1uLymF2EJTb3j3nOUWaOVcK7bNVqG7XNcdhGCRQd0K
         bFGdYLpspURBSPDJvzUiF7/DmPue3t5yzmkOReTNVubCZPmZUaYMA6J6F+ub6xVIAV+C
         BDyaiKV4Ip+BAlB+mqNTj5NybTkrHPDDKOSzS6nTvGnOcxIDgy+vaC+ZP/6MIlKK0oOy
         oD365uomSRZFmfwLtujCERgi+dv7jJa/749I+Adtjj9wgXZm/lnEBkZtUkhhT2tHmYUR
         Kv1QhleHOeyBWOf6oJZ6bTMsO5k70IQb6D1BkWiyNsUCfWSyI7q9w9+48J4slHHOPmqG
         9v3Q==
X-Gm-Message-State: AOJu0YxIJtzwsJHqAsbBmOHZYT1qfv03Rjeparnx6LyLvaj4yah7J4jT
        FedjIiUorMz3LxsPZmnisL83VA==
X-Google-Smtp-Source: AGHT+IHv0mbSafuvoUEE4REyPQRXbufTH55ANzGowPiFzcq9TWfOp9MryxUZZwsD+f0+37Z6YamLuQ==
X-Received: by 2002:a17:906:1dd:b0:9a0:9558:82a3 with SMTP id 29-20020a17090601dd00b009a0955882a3mr1137510ejj.58.1692429132476;
        Sat, 19 Aug 2023 00:12:12 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id rp6-20020a170906d96600b0098e2eaec395sm2195304ejb.130.2023.08.19.00.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 00:12:11 -0700 (PDT)
Message-ID: <2ba0ef30-3023-9184-db61-d5d5a64d02ca@linaro.org>
Date:   Sat, 19 Aug 2023 09:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/8] phy: exynos5-usbdrd: Make it possible to pass custom
 phy ops
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
 <20230819031731.22618-5-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230819031731.22618-5-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/08/2023 05:17, Sam Protsenko wrote:
> Provide a way to use different PHY ops for different chips. Right now
> all chips are using exynos5_usbdrd_phy_ops, but it won't always be the
> case. For example, Exynos850 has very different USB PHY block, so there
> will be another PHY ops implementation for that chip.
> 
> No functional change.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

