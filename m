Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B91C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Apr 2022 12:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241428AbiDKMFh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Apr 2022 08:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345353AbiDKMFg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 08:05:36 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E38338BD2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2022 05:03:22 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id b15so18095178edn.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2022 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sryDvYgEFOGv4IJF4K9rpE4qtbHpyGvRB0BObkRxaW8=;
        b=ZeuqxHL/xUOhw5sAPzbxJiW+mJhv3tLnVd1zttqHoikIexQgEMDzM+4xsDCWR2apar
         oI7AhLc2by1lLL6ho7hSn8JKR0sJPmgqjVyY6s4nvpRusOCaM6VuF8awJGJy5DwRtODF
         aHOKshJCRPSvu3Rw3gD5QAC2273wgiNYnNUnXFnSIlgev7KYQOMwOhwS20E+aF/Z2FHW
         egUy+D/7mLCVl6M3fTm2PM15/ePGufZF1kt8lTTt20B25HTcm7jCI6sZhOiteX40Nqpk
         UdJMYBTyZ78iouZsh8cblU2innmiGIr3OJGCPQwRU9bLivSpl2avqwiu5C6YQ7aBxsqb
         afIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sryDvYgEFOGv4IJF4K9rpE4qtbHpyGvRB0BObkRxaW8=;
        b=d9MGjXon8gNO3Fx7wP1nGoKNehYrr6SKgINrArb24sZ5Ds2y2QS4IQsA4LfuXDKFgw
         dx0ChR/K8pP7csdt6O7WQyqj8lgNhgWTQW6/4BK8qSozcaBHc8kyfr7DbeasEZOJjohS
         jAuuYJAkMeIvBZRLOgKzTh6oEvlyVMf/KMsrZCRj1XO7a+9uXB/sCeNz3z5/vFg3FWOl
         Wwcjrq0lpiDXMwgYNCXZO1rB2+NaPHoKzHuX2g5eMD5qCTsOLdyQ910tAVMow3L2IVYC
         q/y6mAP0rEwXbtvbvnlCo1q051151xRMHxfiwnwJHmnl/Ya8da6UoGp1U7273WoRLnly
         mQmg==
X-Gm-Message-State: AOAM533nlx5iQckLpL/lMa8lfIhHK8+yuswEoefHWwgLChyjGL9jY84p
        WseZPHC8XwPgPWQBDqkRiBFRRA==
X-Google-Smtp-Source: ABdhPJwfxX3gqy6wbrPbt0StZfR/zFoOxk9BdsKT3mp55beZn2LBapIU+Ud3zwIytSzkgcRx+Htamg==
X-Received: by 2002:a05:6402:1941:b0:413:2b7e:676e with SMTP id f1-20020a056402194100b004132b7e676emr33445108edz.114.1649678600506;
        Mon, 11 Apr 2022 05:03:20 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id vz13-20020a17090704cd00b006e86ff07609sm2854334ejb.33.2022.04.11.05.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 05:03:19 -0700 (PDT)
Message-ID: <9e168479-9fcd-d3ea-3c06-8d186e53a18b@linaro.org>
Date:   Mon, 11 Apr 2022 14:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Qianggui Song <qianggui.song@amlogic.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <maz@kernel.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
 <d1f873c6-150f-5f4d-7aa8-7bb15823d991@linaro.org>
 <YlBXSVyj88CqjGj4@smile.fi.intel.com>
 <3b527700-444e-1f6e-fee1-5cd6ed2ef7f9@linaro.org>
 <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YlQXZ3Ye13rObMy8@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/04/2022 13:56, Andy Shevchenko wrote:
>>
>> Makes this change smaller so it's easier to review.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/log/?h=review-andy
> 
> That's how it looks like. Tell me if it is what you have had in mind.

Yes, thanks.


Best regards,
Krzysztof
