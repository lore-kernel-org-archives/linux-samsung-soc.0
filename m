Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF85C54EE9
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  7 Sep 2022 09:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiIGJHS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 7 Sep 2022 05:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiIGJHS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Sep 2022 05:07:18 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C107A516
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Sep 2022 02:07:16 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id az27so19306906wrb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Sep 2022 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=IFfO8s24X4L6IiX71R+uIe6DXsqgosywnjWvsxtv3Ew=;
        b=TuG9vzaPdZNZybNQ1CIY26t6SbgnlgX+ISm0najnlfKQ215iQ26dI/QsM2o/sSljjQ
         1SMgIrAtBeagSRJ1ASNxQRmKfmi5J1IZekJU1zkb0ciLsWo6INl5EgpyGSPbinF55ZRJ
         jypbqx3648Aat5NjxTcCkUpwGrtjY4bTb+bgkp53A+YSaZBhBoTj0RYAqAqQBdYD+Fsv
         DvEonYMYL4i/9Sv71TA/KPNyutryRXrVuGBbS9tfOX4kXS1ASkk1W3TfgrFkOibddNaM
         P1VBbF4/u+/MhRORVNM3FThLrzsWq+IHM6g6hiOJyPEBGNYTzAT8oCKTrodLjU50VvAV
         Eg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=IFfO8s24X4L6IiX71R+uIe6DXsqgosywnjWvsxtv3Ew=;
        b=pm/y81YY+Y4L3w532O/4No9pVcUpxqiAmr7kIaTs5I05gZaQLAUX+Yok48bxnNAdDi
         Kl1RNPHUnJkulxXYhxpuSHrBnW8/sNAne9Tmlza3+9ClwaazfZWfLfpvaNrQ6xBXHDe8
         fE6Wq60gkW4+R5s+YM359Q1CI/HUOsaU8r9HlWXrFbvNDqKVT+NHxakN3nu5u910iSfX
         IXVl9v7upouysu0JoZollBoahZtHoaUyGtvlik6Z9EhYIu4EmDuytJKxqL5npertKx7E
         ZKwt7/RozOWsK+B350mhv4RCJoc/eycJefPVTY9gYy8dtV8jwCAPB9bgOMtDB51TKSaU
         O0fA==
X-Gm-Message-State: ACgBeo3IJlevrXTqyglCQG5+u0ctA/tViI+iOSAKBOHHAkyQhVRB46Nu
        mexNb3gM5EMYnL3xTdDkQj631iMglzw9Ig==
X-Google-Smtp-Source: AA6agR48lqIv2qlI6YDo9XWqTGC1l2K8ft12K29sufasxevueMiTov8EQXDNfyfvekSrIt/9hMpzdg==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id d7-20020adffbc7000000b00220600418camr1379849wrs.632.1662541635444;
        Wed, 07 Sep 2022 02:07:15 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id f25-20020a1c6a19000000b003a840690609sm27982950wmc.36.2022.09.07.02.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 02:07:15 -0700 (PDT)
Message-ID: <cabade8b-256d-904d-bbf5-a4960fe75179@linaro.org>
Date:   Wed, 7 Sep 2022 11:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 3/4] clocksource/drivers/exynos_mct: Support
 local-timers property
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     "tglx@linutronix.de" <tglx@linutronix.de>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220609112738.359385-1-vincent.whitchurch@axis.com>
 <20220609112738.359385-4-vincent.whitchurch@axis.com>
 <d0f3bab8-fadb-709c-7118-20e23fba1dc4@linaro.org> <YxhdYAmSIzUGN5od@axis.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <YxhdYAmSIzUGN5od@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/09/2022 10:59, Vincent Whitchurch wrote:
> On Tue, Jun 21, 2022 at 03:11:15PM +0200, Krzysztof Kozlowski wrote:
>> On 09/06/2022 13:27, Vincent Whitchurch wrote:
>>> If the device tree indicates that the hardware requires that the
>>> processor only use certain local timers, respect that.
>>>
>>> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Daniel,
>> All patches got my review. Do you need here anything more? It seems it's
>> only me who reviews such code, so I don't expect more Rb-tags. :)
> 
> It's been a couple of months, and unless I'm missing something, it looks
> like this series did not get merged, and nor did it receive any further
> comments.  Should I resend it with Krzysztof's Reviewed-by tags?

No, need to resend. I'll pick the series


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
