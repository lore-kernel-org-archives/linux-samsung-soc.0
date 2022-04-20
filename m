Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9579C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Apr 2022 06:32:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348065AbiDTGes (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Apr 2022 02:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346486AbiDTGer (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 02:34:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC7F11C0A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 23:32:02 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id g18so1379428ejc.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Apr 2022 23:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LUo/eeAJ/KUosDrWNZbH2eTvpC6cpi+HWWKICkjYZ+Y=;
        b=kzmAdT6AgQ1XVTIxdir03Gf7eNwiBGfM1dIRA8vMQ++0YJUWg3XoIGWbXZMNVKrlhE
         NMlafvk8lBd8nJgfhdnYaJCwdAyp1p5rVy8rsN9zhx73+0R5F6Tuca4v3MOcj8SpDzBu
         23ED1bnswghirk9YvAYL5hb7Gq+cTpIUf8qFfRRwEBJM1CqOKQqmLnHAnyx8KvDdkkwJ
         IAirPcjRswQN9zGXniO9xDSZ0yyo9BzdKOFkzMmCf00+qZUMGfaSpLgx7ahUbclRmAln
         wtnHPmIhMxx5DNvKeReufQTaO4jpbUktOIMXPENwMy3zCH/wB//Tmbgz5EOrmRrMWNX8
         TtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LUo/eeAJ/KUosDrWNZbH2eTvpC6cpi+HWWKICkjYZ+Y=;
        b=Ju0VRvoX+Mw7hibFsLwXPBG8ZPnayWrgjHfo9m/ONU+0xvo/P+SHWgtXq6s1ksiTw7
         1APvhXbOkrRMKw6jMAAmLSScOKzupMsD2X/Nft3RSu0FPq3hVP1TUppJjfA3uAoJjBVT
         wpWJZluPh2HWyR0tibyNBpc4CcfckhvbrkZn9p9OAV7Sgg333qngxn+Dx0JzMkIyp8oI
         yUyhEYnmZI01j6dAWip+kTnPKRqvt7RK77SDE4qkll5raYYPsOxxJIuwRW3vr4C8OWON
         Lq8pg+hvoXALPD5S6ua/0iW4yCTVait6XiGJbbQC//LK6QqFPtPQNMXJWeKifxAKzJV8
         Vgzg==
X-Gm-Message-State: AOAM532t8C5VoSgjRcfXblzv+vfRX9wRnrWa9mZMCkzZgzfWyIZipRTq
        TDLSa94E8buXTt5W1aZz9zBE0g==
X-Google-Smtp-Source: ABdhPJx5uQ9psKnjm3spxetT2uiUOfrJ63bQJwRinosS64hxC+75MHzSEglvneI5vtSnyzTLI4Njng==
X-Received: by 2002:a17:906:34d5:b0:6ef:af55:702 with SMTP id h21-20020a17090634d500b006efaf550702mr11929181ejb.430.1650436320981;
        Tue, 19 Apr 2022 23:32:00 -0700 (PDT)
Received: from [192.168.0.222] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o14-20020a170906774e00b006d5b915f27dsm6381067ejn.169.2022.04.19.23.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 23:32:00 -0700 (PDT)
Message-ID: <a1fe968f-a8dd-e149-1149-85380e60e8f4@linaro.org>
Date:   Wed, 20 Apr 2022 08:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: exynos4-is: Fix compile warning
Content-Language: en-US
To:     k.son@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        ALIM AKHTAR <alim.akhtar@samsung.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
References: <CGME20220420045732epcms1p7bdaf82873a4328153b456ee4e3a5660a@epcms1p4>
 <20220420051149epcms1p469ac91524037074586d368fe901e0964@epcms1p4>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220420051149epcms1p469ac91524037074586d368fe901e0964@epcms1p4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

You sent three almost the same patches, so how can we know which one to
choose? Please use versioning of the patches (git help format-patch).

On 20/04/2022 07:11, Kwanghoon Son wrote:
> declare 'static' to fix warning message from
> https://lore.kernel.org/linux-media/202204192315.ZHbOex51-lkp@intel.com/T/#u

No external references, instead quote trimmed warning message (only the
relevant part).

> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kwang Son <k.son@samsung.com>

Name used here does not match name used for commit, so please fix your
setup.


Best regards,
Krzysztof
