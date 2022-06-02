Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855E0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 11:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbiFBL4s (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 07:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234160AbiFBL4q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 07:56:46 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C895D28B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 04:56:44 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id q1so9480712ejz.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 04:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=76Z8GE3DXJmJTcdOCuvjsGl067PCyvdg621Kp6ZPmOs=;
        b=nUnvwpnm2CqgoJOzy34iiNsE1itMvFN21EvwIuCSxDwNGw0jyxQ1rzM+4WrXS2Ag8I
         y6aBaxCFy3E77H9l4yz46Zb1fWqbZUTDDr0/u1UX4Bnbitm0VOyS5wgkAqc93PtC4hre
         mcAiKyRFx8lRdzXpzTyElp/0BtVPnKslt1enerbapdAz7UGcLTabTuvVLldT+/rSIGSH
         jmwhhd8qX5IrZ4JZT7/8xFwkh872hVAVjaD2KkSdr3QOKLpIiK3fqornp3oHmC/wXh4P
         9W/cf8o0+pBH7r1U6ki8OZAWEeDvt0XZYFt4FR/SVjXviKzAB6HMwM3vCA7+3ULweaSK
         kVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=76Z8GE3DXJmJTcdOCuvjsGl067PCyvdg621Kp6ZPmOs=;
        b=s/XgVZa9MK8bDAbAjOij5/iuYjmBE5yMfSzkURMikSDDyWuYcoHYBlew1EgclfA+61
         wpGDjOt77jdG6iEFdv55tedQqMen2L0IiVZumn6tXlX7q91BJZmfgNkUEKMAgi1isQtD
         LoYA5iO4HGKPkmpzd5AGB31tdZ4pjkH10CKcwJ7CS7gdGcZc3Y8w6jw0aJ2U84dQE7Dp
         ZuB+BlFJgpXDDUdI8wFVnPOMApRLs45/5dUrZArHV0KWm5NRV0w61l7KAK9Isuy5lSeF
         uox0rw8tF9zEmy7w3j3RHo0hCMa1ofLJUNZDOJu20vj2ibuw0HezH03V+51oVjgs0Ni/
         Bgcw==
X-Gm-Message-State: AOAM530tro2obEjXSGZHU5T+5p7k1+epbdL9b+8mNtZdCdYwYc/5Xu13
        15k7cV+deSc/kMr+dMFzSzrK2g==
X-Google-Smtp-Source: ABdhPJwkIrW4IiXzbJNiiaa1czY5sxTCu1ZzTseRaTcDWYufg5PWlgXL3tXanVdD7LyyCYQ4rFY84Q==
X-Received: by 2002:a17:907:3da5:b0:6ff:31c2:22d5 with SMTP id he37-20020a1709073da500b006ff31c222d5mr3740125ejc.509.1654171003292;
        Thu, 02 Jun 2022 04:56:43 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c22-20020a17090654d600b0070587f81bcfsm1686576ejp.19.2022.06.02.04.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 04:56:42 -0700 (PDT)
Message-ID: <a0d848eb-c312-ea66-c62f-b4bdb982a66a@linaro.org>
Date:   Thu, 2 Jun 2022 13:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] clk: samsung: exynos7885: Add TREX clocks
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     phone-devel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220601233743.56317-1-virag.david003@gmail.com>
 <20220601233743.56317-5-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601233743.56317-5-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 01:37, David Virag wrote:
> TREX D Core and P core clocks seem to be related to the BTS (Bus Traffic
> Shaper) inside the Exynos7885 SoC, and are needed for the SoC to
> function correctly.
> 
> When clocks are cut from TREX D Core, the eMMC and the framebuffer stops
> working properly. Other unknown things may stop working as well.
> 
> When clocks are cut from TREX P Core, the system locks up needing a hard
> reset.
> 
> Add these clocks and mark them critical so that they are always on.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
