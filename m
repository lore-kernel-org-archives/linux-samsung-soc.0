Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4007EC00140
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Aug 2022 15:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236642AbiHBPTw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237108AbiHBPTu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Aug 2022 11:19:50 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B74C2DC3
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Aug 2022 08:19:48 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id z16so18247003wrh.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Aug 2022 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9wz2CvGTjf8QzBB82tcH4XUVcMY9Pl6sf5DDXzMIIqk=;
        b=TmKcSuxNlNa/PWpgVvm08qnSw+ZTD4TnRIVW6wZ+IEOdN/43XukzrWpDaygWqDBy5q
         sBF+TxrWN0OKcB17GOa9DPcZQ4Y3tAaLFHDbcK+1kyesZZ8zwmpHFDa6Q9FNPUufuqkm
         7a7LfJWVBR5doTcZxKGIOCTwvKQAs1jdOxnhe460fQ0DP0LKLKYZsyiP2C6vOMr6G86h
         tKgyDEyZI5Fs1vFhr3BpFpVEW8TzwCfOv1U6EplLR6Py6Vgr6XQT1rlmWL54IOT1xMl6
         l/LgnsRxqDQpoCarXwudn9T1TuS7ERWkBjAshBbxyDEO45g/sU+OIPqDRA0yRdHE/DKX
         F6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9wz2CvGTjf8QzBB82tcH4XUVcMY9Pl6sf5DDXzMIIqk=;
        b=Zq/Us6rOweWi0ozE+Lx29f4LP4YVaWviHVeObMeQBjc1YvKrpgtFgHJSnhJgfUdkic
         NA+n+M1rH7bCwF3mW0MNmoVG86qfVHfy0hgAgxNVkpGzD1lWv8dm/OTn1zakQBcMcKKT
         X+lwz9/p2pcmnILq1+tjdUGOcLrHMjKq/I/A3v0+mp3IUk+KgwytP5GXgHXAhE7I7P6p
         ocYwZpWFnscRInNbeHyq+CEGiZtl4Z3kQLrcLuQUR1fZDn4ykdZmohyBnOVNpaZy4A1Y
         KGgpe4bPt+6cPcxdw6tLRWWfojBn9n1adqFtIoH9cC6toELtxlK+zR+mZRhP1X+3DxWJ
         sXYA==
X-Gm-Message-State: ACgBeo3CbGt5baVQYm/X/5XU7R2Mh33c3Za08/7l9djSyl0Dfnu3Dh2p
        GY8jQD/CJ6Y6L593qc999BAuaw==
X-Google-Smtp-Source: AA6agR4t+h+O/wQAjvChvhMSKy6O5GiaDLGg/+u3TEG1q1mEY5E+NT7y16s5WqcK3e8dcHFVwpYJAA==
X-Received: by 2002:a05:6000:15c8:b0:220:6362:e578 with SMTP id y8-20020a05600015c800b002206362e578mr6153301wry.68.1659453586849;
        Tue, 02 Aug 2022 08:19:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3da5:bc9a:ba8f:a5af? ([2a05:6e02:1041:c10:3da5:bc9a:ba8f:a5af])
        by smtp.googlemail.com with ESMTPSA id h23-20020a05600c145700b003a35ec4bf4fsm19206473wmi.20.2022.08.02.08.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 08:19:46 -0700 (PDT)
Message-ID: <60071751-1333-6e3d-cdaf-60b865ebe813@linaro.org>
Date:   Tue, 2 Aug 2022 17:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: linux-next: build failure after merge of the thermal tree
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org
References: <20220801223509.3613888-1-broonie@kernel.org>
 <Yuk9C07obs+uPQJ6@sirena.org.uk>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Yuk9C07obs+uPQJ6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/08/2022 17:04, Mark Brown wrote:
> On Mon, Aug 01, 2022 at 11:35:09PM +0100, broonie@kernel.org wrote:
> 
>> After merging the thermal tree, today's linux-next build (x86
>> allmodconfig) failed like this:
> 
> ...
> 
>> I'll figure out how to handle this tomorrow since I don't expect to
>> release today, I'm just droping the tree for now.
> 
> The error persists, I have used the thermal tree from 20220828 instead.

I've fixed the issue, I'll push the branch in a moment


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
