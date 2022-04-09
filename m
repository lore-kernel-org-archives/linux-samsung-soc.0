Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E7FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  9 Apr 2022 15:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242513AbiDIPjt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 9 Apr 2022 11:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237834AbiDIPjs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 9 Apr 2022 11:39:48 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7823E5A092
        for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Apr 2022 08:37:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id s18so251232ejr.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Apr 2022 08:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Gzglw2XqSCHwkCRUmugqAY3H/7JuWh/cx5iFBk0ayFQ=;
        b=ETF6Ldmf7dVZ0i+ZXbQnqUvEBNUeXXxbamzxGWAAbpf+EOdA0ioE6C7mLchuuI//SY
         0RsWtzKRCut5wq11F2mD1XxLME6xE9k8KKmx/5a8FwjGgkeJdnbEJmpw3BJlW00wumQp
         XGMC1dflAg1zjDv4dE2XnDb+qNUTUYpK0Zyzpn8flcycAgI7cnhs3e6EOG+jtEy7f6v8
         bx7KCTbX+zLu1cooWxgIW4edFGy/eK2Kc4ow12stXhsWqNjh/KPrABB6G1IK0PFGaB/j
         u40WxIu9bc/A1GmcFSMPBxFMv4Et0TrePJqlc0y+qwlHTkRz3KmL9So44ruc7PTbtiZn
         Q7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Gzglw2XqSCHwkCRUmugqAY3H/7JuWh/cx5iFBk0ayFQ=;
        b=mKbPbeCqWm0svVEORGizaKBYBnPhIGK2/J91QCfMZVCIhlIpzWAJnIIWGX11x4bfp5
         tkYf+rIcFZGW/PrpUEIYyJwGbYM+sDbI1O8HFsYv4C1Iytaen8xOhhTGldHpSVznkCWx
         G/mFbHdzhTs83Ph6FZjAeM4i491DwsDYMhdfYAdTLToVxsNt8YvHykCmwH4XDSE2zEI5
         xfGwdgYdExj8V4hO+K8r+6M/r193PXvFmdPxjkpUPDAdEscU13fPcPIcmbzxM980FfBQ
         wbgjbPh3WbpYnecNVtBgRUBNi4blf9fN/BqdzZaC5oqzhrw/Xm8mJp8WNuWbVZqfucIW
         93Zg==
X-Gm-Message-State: AOAM53358IVr0qZeN61tSyAwaPSIY/m9sK50W/5o/uxx12vR9bacuPCL
        wCBNYzXXiofrIkY4QekqxWg=
X-Google-Smtp-Source: ABdhPJwIQ5dmdmuYq2MDXMasuHumH1MGVEFjRU+W0sV68uP/qH6kHZb18CgvchJ3dzl0kwg8Dwkvqg==
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id nd14-20020a170907628e00b006d9c6fa6168mr23099012ejc.132.1649518658896;
        Sat, 09 Apr 2022 08:37:38 -0700 (PDT)
Received: from adroid (027-177-184-091.ip-addr.vsenet.de. [91.184.177.27])
        by smtp.gmail.com with ESMTPSA id gq5-20020a170906e24500b006e87644f2f7sm571338ejb.38.2022.04.09.08.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 08:37:38 -0700 (PDT)
Date:   Sat, 9 Apr 2022 17:37:36 +0200
From:   Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>
Cc:     linux-samsung-soc@vger.kernel.org
Subject: Re: [RFC PATCH] pwm: pwm-samsung: trigger manual update on 100% duty
Message-ID: <20220409153736.GA38137@adroid>
References: <20220409134005.GA12218@adroid>
 <364b4ce1-5160-0f48-9d4c-ab8f7f6cc1b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <364b4ce1-5160-0f48-9d4c-ab8f7f6cc1b6@linaro.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Sat, Apr 09, 2022 at 05:01:42PM +0200, Krzysztof Kozlowski wrote:
> On 09/04/2022 15:40, Martin Jücker wrote:
> > Hello,
> > 
> > I have some trouble with a pwm backlight in the p4note and I'm not sure
> > what the cause is. The problem is with setting the backlight brightness
> > to its maximum value, which will actually turn off the display. All the
> > other values seem to be working just fine.
> 
> A bit similar issues was fixed by Mårten (5d82e661398e ("pwm:
> pwm-samsung: Trigger manual update when disabling PWM")
> ). I assume you test on a tree having that commit.

I applied this to next, so yes I do have this one :-)

> 
> > 
> > Looking at the documentation for the pwm driver in the exynos4412
> > manual, I found that for pwm, the higher the tcmp value, the lower the
> > pwm value is. Enabling debug logging, this seems to be exactly what's
> > happening for values below 100% duty, but when the duty reaches 100%,
> > the tcmp is zero and then gets decreased which causes it to wrap around.
> > Looking at the rest of the code, this seems to be expected behaviour and
> > I would assume that it should cause the pwm to never switch the value
> > from high to low which would also fit.
> 
> I miss here some details.
> 
> The tcmp=-1 is written to registers for the next duty cycle. When
> current duty cycle finishes, this new tcmp=-1 should be loaded into the PWM.
> 
> It seems that this loading does not happen in your case. Correct?

When I change to maximum brightness, the pwm does trigger an update. It
writes the value to the register, but for some reason this causes the
display to turn off on the next cycle instead of going to full
brightness.

> 
> I tried this on Odroid HC1 and works correctly:
> duty_ns=2000000, period_ns=2000000
> tin_ns=240
> tcmp=4294967295
> tcnt=8332
> 
> What values do you have? How can I reproduce your case?

For me it's the following values:

duty_ns=78770, period_ns=78770
tin_ns=10
tcmp=4294967295
tcnt=7876

For the patch, this morning it's not fixing the issue anymore. I might
have messed up while trying around with the tcmp value yesterday night
by still having the wrap around guard in. I thought I double checked
that, apparently I didn't.

> 
> Best regards,
> Krzysztof

Kind Regards
Martin
