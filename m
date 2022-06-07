Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A38C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 12:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244063AbiFGMme (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 08:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244069AbiFGMm1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 08:42:27 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546901FCFF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 05:42:24 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id h23so23865028ejj.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 05:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hx+YU8X87nw4MVOTQmNYp6p2FiJ4sffRycyNV0L9c0s=;
        b=jQR0bnWxBW5VGj7k/Kg79jMnq9OfCjUdaRvqwc/nPI71bU/TSgx2F2QGJKgS4x/jiQ
         mACj/xtOBHUTA9MPIzKgVAFLDovPBvhQPtphfSA/8sZcCCOiHgjf1j2M8rLA3y5lKNjH
         tgsHwk/2cAS0b7ylpUqZZbLSxUziM44hoSYZXZfoq5q9M0OvYSUbK/ogje19KisnJZDH
         JQpvmLZLEBFxzDTrjN3MGzWIAT7xRasWzxvvqC99A4n7+l2SGijjUvTeY5Wvmho02BCi
         s65uegPwrY/uokQArL3imLjvZsYStnfd0iYt24EdXhMokgCjM8VE+M/0VVD1we6ckkcV
         9xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hx+YU8X87nw4MVOTQmNYp6p2FiJ4sffRycyNV0L9c0s=;
        b=gckNZ++j6np2FWtX4IdP9FeAw5yOBmpBABzkanXlejfPiEEzT2yW6sZUuqze6OpCya
         fv6Y2UPaKA296F9RGMRMB48FXMtuaTJ6CFJXaFcDyN24C+eJBIv81qPskT1pJ9v7QKbe
         C9cd97LH8/F6qMFrzkrB2KKTM9kowMCZV/Ua4OSfQb85yBmSxPbTvSb0zOyFsrqDeJkF
         VmkAbssDm5yDT5tHSXyEBauAtkUeVbymQWhRbVgS7DwszhYFXoRfX5lUujF/NnT2Qz0p
         KXR7w6wiY3Am62giVQN6YM0/6J73SDns1G0SjdzjrzDwEeTHTRboXURS8G/WxmcZlFs7
         niPg==
X-Gm-Message-State: AOAM531giLcPECnHQd8WaaEyKqg/QwAzKiQ8R6pfp7RA0njuVXPiaxOz
        e8A+vhOwvdxLZNaHRw2HUBfM/w==
X-Google-Smtp-Source: ABdhPJzrDcw7COBB5CK6AHvvI8A2n2rdj9k5IJJSD9GbjYt8SZMwjcb3HrEZsuS+PPeUx8mOrZFOkw==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id gb5-20020a170907960500b006f50c667c13mr26010612ejc.66.1654605743796;
        Tue, 07 Jun 2022 05:42:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o19-20020a1709061b1300b006fed85c1a8fsm7685692ejg.202.2022.06.07.05.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:42:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     XueBing Chen <chenxuebing@jari.cn>, krzk@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
        alim.akhtar@samsung.com, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2] ARM: s3c: Use strscpy to replace strlcpy
Date:   Tue,  7 Jun 2022 14:42:21 +0200
Message-Id: <165460572961.134654.6070440562526650212.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3e0217ca.a1d.180f90f39c7.Coremail.chenxuebing@jari.cn>
References: <3e0217ca.a1d.180f90f39c7.Coremail.chenxuebing@jari.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 25 May 2022 10:32:46 +0800 (GMT+08:00), XueBing Chen wrote:
> The strlcpy should not be used because it doesn't limit the source
> length.  Preferred is strscpy.
> 
> 

Applied, thanks!

[1/1] ARM: s3c: Use strscpy to replace strlcpy
      https://git.kernel.org/krzk/linux/c/c241d049122b49698d9094c7ee7a0215fbc04cfe

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
