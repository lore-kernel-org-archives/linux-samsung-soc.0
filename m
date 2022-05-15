Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E2BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 May 2022 09:48:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbiEOJsq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 May 2022 05:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiEOJsp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 May 2022 05:48:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A1F2EA0A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 May 2022 02:48:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d15so21291920lfk.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 May 2022 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=qGxOq7T/f7Tns14YCD1lIIHt7LLOjEBdhYOlr/jBw+U=;
        b=KtCg9f7fR/qMyhPo5OBQsB9/whT++OXOEE9zGgmlzS+f1WinQef2U6sSxUU1i6cqwy
         bHXccEe4Ty03jlKADU6OobdJy00lYPZbw6AEd5ALGj/RTSN/eW/V4ElslxL+OkDSRzW2
         f/0LuCtS5AFxR2OlxDpeXdFzcITjB1qurdB2oV1SZHdek5SnSQzMfBk0mtfsQFzDTDqX
         YkxDSxYDXL02/0riRJ3/4nHZFhhWWPSUMKQyU2x+BIQD8TF7fbKH0lx3lZJX6vXk8gdd
         sY+N0l32y3Zl5mKAENPjeo9LyAOUSHe7oDqOob8SyqEj2WoeU8BZ4cYMukTmMtWIinyV
         FEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qGxOq7T/f7Tns14YCD1lIIHt7LLOjEBdhYOlr/jBw+U=;
        b=JUsutNAHLGF09OMWRBgbC7+FyAgFL4D95vXmabpdKC7t87VJr2aE5n7WzUDtp4OVQA
         oto5diSUBgJuLQmc3I8Z/J4TQMsDrQRX+sC3B7jqWssqiqgP9sNjWoM7LDJWyPaXtNpt
         HShCaUHJnxcs0JDFCwScaBpI1dQi3KiUS7QaiWCBHabZwgWy886iFWqiSJuGfa+n/nDf
         5IPIOmv/ruoaluF+aKHHEUgfpjSXpANOG3fHGL+J4WtTuuquJUWpEAO5t0bwhl4C9t2X
         HtIs8kgIsnBOB3KV81kSiJUS4R7MbK8mVC3AMfNHF29K9/d5LjPmBDCByJC3olKBZ0hD
         10Xw==
X-Gm-Message-State: AOAM530KtyGxoRRd1kGrG6IpMkRqZeBV4OcUoGqUQmmL9aTL3DUpeDPu
        YmSprdRv0xDHTWC43OLB4jbhAHF1KfmNuvAu
X-Google-Smtp-Source: ABdhPJwW1jd2qXdskYkbYOHvbUfn+nRO9jCAQ7buWH00FXW+UQmBRXNOja7qQLjuaTJ/rZKYZYDiTQ==
X-Received: by 2002:ac2:4e15:0:b0:473:c4c2:dc0f with SMTP id e21-20020ac24e15000000b00473c4c2dc0fmr9344241lfr.13.1652608122067;
        Sun, 15 May 2022 02:48:42 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c13-20020a2ebf0d000000b0025052e35be2sm1134536ljr.130.2022.05.15.02.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 May 2022 02:48:41 -0700 (PDT)
Message-ID: <79b727f8-0631-5a96-fbc6-6e5d637bab7d@linaro.org>
Date:   Sun, 15 May 2022 11:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCHv2 6/6] thermal: exynos: Add runtime power management for
 tmu
Content-Language: en-US
To:     Anand Moon <linux.amoon@gmail.com>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220515064126.1424-1-linux.amoon@gmail.com>
 <20220515064126.1424-7-linux.amoon@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220515064126.1424-7-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/05/2022 08:41, Anand Moon wrote:
> Add runtime power management for exynos thermal driver.

First of all - why? Second, I do not see it being added. Where are the
runtime callbacks?


Best regards,
Krzysztof
