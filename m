Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C451C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Jul 2022 14:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233525AbiGLOdb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Jul 2022 10:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbiGLOdD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Jul 2022 10:33:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41156BA175
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 07:32:56 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bp17so6410457lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jul 2022 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jk5vn9CGOZqBPVvC16b0gs+K/8My11zxk/PZwYeGhqk=;
        b=hvmjpGwtNQWftkomtM8o7hhEaDYeY2q2L9S1/96wYUYm8N2hdqRTJOs+Vx7fkB+myJ
         nKWsf8Ow5//LZssNBR7yjf9msB/wXanSDE+j8+/q1jKOIrnI8TUVnCsXM/OXdntKsbpY
         cR5RMTtfQk0KcsOga/8TjQL1iBQLXFSwKb+6HW+ky7rRNuNgEZbJfKm9AroGzgaj4DBU
         xAp9M9iWncl4VR70WVYyfx+zU+avLipT1h8HxDF3VT/hXQULiurGd2+62IiZfkJlGk6G
         7kR8zB9vYBg0EW9EnmdnVyIhA+5KNZ1kOawrJdIbI5i3Rocy6MOuHlrcljyZuYwp8Qlg
         rhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jk5vn9CGOZqBPVvC16b0gs+K/8My11zxk/PZwYeGhqk=;
        b=MQY+I6Pi+07nwX06bkSJSNtWzQceAXFECXyLpUwG7DjkFL64/YjSFug31t6/mQzdiF
         gC+DPIQq0BbIHr7Jp4k5WzE3X6ZvIzqjEVnRhGFtF7FxB3Wnwc28qIMf2c5S4qyBfNrb
         QDbgxiPnDeE3/c/FBSOMmARp96Z9jQHUBF8UJpeZKCKWIBPqJ34f+wN3SXA2sFndJ0Fc
         Lq0MiSAbmzHsUzNI8F+KHqTOSm0/wcN9VI4lbRSSIVQPwqHyu2iRlgVBmbhA3V2/W6w0
         Kw95hi6YgxiEuwSsDOJw7qsQfOtdyEUJIpolR4T37d/HYXcgA4BbyB5M+ev+HQy/EnRv
         xLfA==
X-Gm-Message-State: AJIora/AXXIuZqtemfqYN6U6jD0BB/yAd1+xe4MSNGfvS7v/zToW79NJ
        kMVkpEHBxj6jaFqSjqM5vjNGeg==
X-Google-Smtp-Source: AGRyM1ug4WCGQJstME6bRdw0u8dHSqhHJ9u4YQD9MuizqHptnRty/rdjewHiNi103/ScdQuHERveoA==
X-Received: by 2002:ac2:420b:0:b0:489:eac1:5d7f with SMTP id y11-20020ac2420b000000b00489eac15d7fmr3367158lfh.355.1657636375227;
        Tue, 12 Jul 2022 07:32:55 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b0047fb0d5e049sm2222048lfr.273.2022.07.12.07.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 07:32:54 -0700 (PDT)
Message-ID: <2c1d07fb-4135-2d33-0aec-0ac352528f15@linaro.org>
Date:   Tue, 12 Jul 2022 16:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] tty: serial: samsung_tty: fix s3c24xx_serial_set_mctrl()
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chanho Park <chanho61.park@samsung.com>
References: <CGME20220712140800eucas1p29b2518142084bcff075b0f47c1ddc7aa@eucas1p2.samsung.com>
 <20220712140745.30362-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712140745.30362-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/07/2022 16:07, Marek Szyprowski wrote:
> S3C2410_UCON is a 32bit register, so it must be read with rd_regl()
> instead of rd_reg(), otherwise the upper bits will be zeroed. Fix this.
> 
> Fixes: 72a43046b61a ("tty: serial: samsung_tty: loopback mode support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
