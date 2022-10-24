Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A91FA3740
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 13:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236468AbiJXNzB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 09:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236891AbiJXNy2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 09:54:28 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4657CBE2D8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:44:07 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id t25so5954891qkm.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQzXqrwIC0QwRKejNt8LVE2JYI0YL7ErsUlEluRisec=;
        b=VfrgqMHPLBsQhMyfqIb+txPYc98Nb3UJm4VvRFohYHEeVwpx5tEBEq/qBfp6gx8Oot
         qqNONpCEVA9Y6PrzVNsO2cPI6ZrdGi3zbCUh1qRXfqKP2iVfZD41ff+/vmbWKvqgjkY0
         EQD1PbksJVU2r1r1LaSqfAx+hNjRbpxbNlW37LpNKNDBaXX3PWq5lOiDnarzKr1pIiUE
         tPUO5uNmIfe527jUdxGKP4d7ckN7lInohm+x/98bvtgDhmWbTvMHzebP0K1gcFSynduB
         mhNDJ9hXNk/va2Neh8DUz32F1PN/3vPSVmgoBzSGtszc77n498r4iRw/HkVj2xnWNJ+N
         53zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQzXqrwIC0QwRKejNt8LVE2JYI0YL7ErsUlEluRisec=;
        b=rIg3UXUH1wjLsEKlQ05AOqeLQMF6UKbamgv3SCozKTqFwcHuWyN/Vm5/DGl/DIsXW2
         cXhOQZFFPw9nIwxJ2gGSYmYGMEvUvoq/0W1g1hFe1JFuUALdtocP5HtLttcVESpwsZx1
         gSm+8ycJDdExruSeIp3jT67Jdq0k/U+lgoFV8s/JGUi+zcplGzFE+8RMbXBi6tpvExDt
         aegkpy5N619p7sA952FZhIbkktX1YIRaKNpUJHnTPNrFwcxDLi08wv8U01ad4GaQn1lF
         eU88SWaAi8jyelZmoKvpCmAb17jFtMGn4PSueSllmS8w9K062HkU4YX+TDQrojhKAyhJ
         EfcQ==
X-Gm-Message-State: ACrzQf2g0HTXtWXG3xoXAlgyi5CdekLK/MM3KtSL4FbtJhZJyFMl7hNi
        MtuweZPZDYonLQat0DC1tlmEow==
X-Google-Smtp-Source: AMsMyM5GJlopQSnchtqeAVaJKk0KkeZOI6RZXCaagWiqyRgE+7EghQIXyEkNJ8GlAlpcNHsw1akpBg==
X-Received: by 2002:a05:620a:1469:b0:6ee:d38a:7acc with SMTP id j9-20020a05620a146900b006eed38a7accmr22626676qkl.585.1666615202919;
        Mon, 24 Oct 2022 05:40:02 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id dt27-20020a05620a479b00b006b9c9b7db8bsm15325374qkb.82.2022.10.24.05.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:40:02 -0700 (PDT)
Message-ID: <be51d813-f36c-61ac-88d4-8a18cc6507f8@linaro.org>
Date:   Mon, 24 Oct 2022 08:40:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 14/21] dmaengine: remove s3c24xx driver
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dmaengine@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-14-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-14-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was removed and this driver is no longer
> needed.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

