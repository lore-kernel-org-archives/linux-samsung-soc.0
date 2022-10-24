Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D529FA3743
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 14:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbiJXOKv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236864AbiJXOJg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 10:09:36 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52441C513A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:51:30 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id o65so7591304iof.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qf5QsYgh2ubEhyoXafR9Kn67ARvXDBZur7bOPc+n/Bo=;
        b=p1vNCJ7X8KKqRqOvcCIXMfbJLj+u7cqBipeu2tBcTR9gb7FTq/FxIhtEPXP4EbCyX+
         b8I50Rp/0nU1+lvqCZ+XUDwbKxfynxRGTBX01G4DJImc1cJADmEYzHKrzsgus7sZisVY
         5ogHQFYV6UznU2kHi3Yj1IGBbhXrTP+dLm0fFMLPJS7y8+231L/a/CqR5gjz5Fwm6nvO
         6M194xkD8RT+uuVJ65JtDGsv7hF87eHB8OGmRiqTHMrR2BtMCZP+dioBkAYN6Wmwersv
         UaE8eQzXHLWw0vXDyUcxtch1CqCD/Sk42/P5YQg6cJ/lhnUrGPu99CZe2CfzkSGSm3bH
         YPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qf5QsYgh2ubEhyoXafR9Kn67ARvXDBZur7bOPc+n/Bo=;
        b=LIsWmydTu6pMt/hNyWenzSevCiHCnga1fLB8q0lgrSEKsDJIwtZPAVf/FNO0Vuc1ff
         4COW14yL5UTdVph1drBlmr3/sSzMAw1ZqQl8KXxlU777CGzgEnxMBFzqw3hJzdEqocml
         d4O/0VcTpvB1XjqMi0agzI8ShCdhlhOA1SqBsVxeXOCXSbskYvEgpaxlbMMMqXrfJ3Ig
         s9//PNjz/Pp6tQLLWF18jcoVuJd4B64FSc91JXIGgeVSDYsRN4IQZrWmFhtDxncvdCmH
         mvoXCj9wFyiSib9tS+6oYizP8gpsuah2cUs7KgzSzThY1BYQF6KJCE6cVe+0wX88wxrO
         TSKA==
X-Gm-Message-State: ACrzQf1QmT+zonXQN11fFpz4+SIm6EA3G0EY+PSTMs5GE4JQ1UyvcMZP
        a/kkiIbqC3kZ6Gxte0DQUred+7hkOebUCA==
X-Google-Smtp-Source: AMsMyM52NKv6SK0ywQRUj5knTKvSie99CLY/ydJHwCLndJgZV0IUmqP6mLOFgcvBx/OEagNE0cg5Uw==
X-Received: by 2002:a05:622a:1743:b0:39c:d80f:9b93 with SMTP id l3-20020a05622a174300b0039cd80f9b93mr26057665qtk.571.1666615040623;
        Mon, 24 Oct 2022 05:37:20 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bz12-20020a05622a1e8c00b0039a1146e0e1sm12820884qtb.33.2022.10.24.05.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:37:20 -0700 (PDT)
Message-ID: <5af7d4db-b171-6149-4d24-c40c7115ebfa@linaro.org>
Date:   Mon, 24 Oct 2022 08:37:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 11/21] clk: remove s3c24xx driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-11-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-11-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform is gone, so the clk driver can be removed as
> well.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

