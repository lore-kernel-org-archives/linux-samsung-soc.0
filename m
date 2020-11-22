Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DA6C5519F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 Nov 2020 11:39:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5669520936
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 22 Nov 2020 11:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgKVLin convert rfc822-to-8bit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 22 Nov 2020 06:38:43 -0500
Received: from mail-ej1-f68.google.com ([209.85.218.68]:46647 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727660AbgKVLin (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 Nov 2020 06:38:43 -0500
Received: by mail-ej1-f68.google.com with SMTP id bo9so13536964ejb.13;
        Sun, 22 Nov 2020 03:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=upJqjhxuXAg4eiIE3k0jCGU7SE7hWfTC50ZWvfab5w8=;
        b=IQnkyU5St6dEeu/Yxn0z6q6y2bEcjBNOzOfw1KuWTt4gthe34CcFa5QzjuhZf+de3e
         7pTZsLw6eyabdroorBce9G/EayOvmR1hC39m2YIqmBLwD5sMV+yeudOF/IlGi4xDGPHL
         0lUnvrEwoDR42HekrA/BWFCtFkfACUndwakIDjjsnToaLoh6KpjMzklAu2c4M6XuycNS
         uAlY1FM7Bc1AZW5CpZU0C+lEWsQgSJKdRuEVKDSUsFRSVo0ARPf1Uogxsctkz9heRCxf
         guTuvEHWhw7USFnEDaeEYTz+dfIfUtNRcdPNtiNSk4590vTjvS5pqeGD2z8Bf4xBwlN/
         EH1w==
X-Gm-Message-State: AOAM530Lx6ghcnT3HmCAG+IS2Q8Tjm4dNcsd9lViv8+2HzrXYHdANmdg
        V2QC5CRdFHY2FLMgI0ol9aML2E5kC5k=
X-Google-Smtp-Source: ABdhPJxhb9DvBWCE//OCayCwtlu7ZneZAAc2qVtu2lPzW3IEYd/O2c17K72i+SZVeFeY4/eV0oquEQ==
X-Received: by 2002:a17:906:7147:: with SMTP id z7mr4456748ejj.65.1606045121317;
        Sun, 22 Nov 2020 03:38:41 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id f13sm3465035ejf.42.2020.11.22.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 03:38:40 -0800 (PST)
Date:   Sun, 22 Nov 2020 12:38:39 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: switch atmel mxt reset gpio to active low
Message-ID: <20201122113839.GA7781@kozik-lap>
References: <20201120160053.18942-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201120160053.18942-1-martin.juecker@gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 20, 2020 at 05:00:54PM +0100, Martin Jücker wrote:
> The reset gpio logic of the atmel driver was changed to be active low at
> around the same time this device tree was accepted into the kernel.
> Adjust the configuration so that the touchscreen is in a usable state.
> 
> Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
> ---
>  arch/arm/boot/dts/exynos4412-p4note.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please use proper subsystem prefix in the title, so "ARM: dts: exynos:".
Also capitalize names (Atmel) and acronyms (GPIO, not
gpio).

Thanks, applied.

Best regards,
Krzysztof

