Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D92C3F6B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Aug 2022 10:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiHPKKn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Aug 2022 06:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234266AbiHPKKE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 06:10:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A84F83F3A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 02:24:37 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o2so14095697lfb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Aug 2022 02:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=dA9DhESaxIAdSuqYA69VElvQhXKaLx6GMaT3o/MxfcQ=;
        b=pAYcHJ/DCBmLR9cpFpCsw+KdXs1oauKhBl0AkYjD7c8nyjJj3+eSFlS1/VCuw6wHn9
         G6OSm0FBh/QkaDRo1ti/hDuY4VmQvslzvGnlspUuKrS3Ky3DqzYNHDKNgYRhw1Cpkhnu
         cQtq6kzHMGotOKUXCPwoF0INia1hvQ/0Wt/ItkiqaFpHIy9U0m0cfVYiINu5hbBYp9bK
         72rA5DZv4lzP86L9AgRiQoJjX8/H1O7S3YDKfwWUZan2CnkXRaTyakvAAzoE+Wd/YAAd
         Hp/L5aZT4N6+3GtRgdA6f5T5yzIrcXG+IQ1Zr2670IWXX4JWNoWAye41nXDKSW7HVCnC
         aj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=dA9DhESaxIAdSuqYA69VElvQhXKaLx6GMaT3o/MxfcQ=;
        b=A2yOEXCCEVA2PL9dq6xz5Rb3eO6eZcUG1HnKM0JO7/Rdvh1axN0H1J4QYHx2Iwn5dy
         EsTPr1ReH+6wBIP754+wMatOKA6fF/7ORYidvmmsT389l4KAkMU3kvELszb12X+6zkYC
         WhzuOEV3QKdbfLA7NWcB8tQyEsmX6yj9NvqH7Q3WdEW9/Gp/48kd7NNFRvA5bIktM40/
         CmBIkObytBzZZgvN7aZ1SurVQdvGfIzWhkE4Q9OWq1hL6lWDxXLZhrXTQU1YAvvsF1X7
         GOQnameuwn2Oy/wZT77WuGntEJBDhBJgTX9SdqiwVN/xtBX4ZRxRaEmhacRssKwzBVjI
         mL/A==
X-Gm-Message-State: ACgBeo3LowmVQvFj+y08G5WQL+MPKRPaBCd/xihu8Hclc46qFMNHWv7O
        9YYc6ZXGQ7g2cRzAbB6HLGvAjQ==
X-Google-Smtp-Source: AA6agR4SacvxqdwEQnvdddBBMXsDS1BirINw4bHykF8sOxTwdBrYtb13QtvhxD+krOjDjpFrrNwVeQ==
X-Received: by 2002:a05:651c:154b:b0:25e:c73d:a786 with SMTP id y11-20020a05651c154b00b0025ec73da786mr6211788ljp.397.1660641875620;
        Tue, 16 Aug 2022 02:24:35 -0700 (PDT)
Received: from krzk-bin.. (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id v11-20020a056512048b00b0048a8c907fe9sm1326420lfq.167.2022.08.16.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:24:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     tomasz.figa@gmail.com, linus.walleij@linaro.org,
        saravanak@google.com, alim.akhtar@samsung.com,
        s.nawrocki@samsung.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1] pinctrl: samsung: Finish initializing the gpios before registering them
Date:   Tue, 16 Aug 2022 12:24:32 +0300
Message-Id: <166064186857.38288.3043355425920212927.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727013349.3056826-1-saravanak@google.com>
References: <20220727013349.3056826-1-saravanak@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 26 Jul 2022 18:33:48 -0700, Saravana Kannan wrote:
> As soon as a gpio is registered, it should be usable by a consumer. So,
> do all the initialization before registering the gpios. Without this
> change, a consumer can request a GPIO IRQ and have the gpio to IRQ
> mapping fail.
> 
> 

Applied, thanks!

[1/1] pinctrl: samsung: Finish initializing the gpios before registering them
      https://git.kernel.org/pinctrl/samsung/c/152a81a0b1204e9c7f4af0004b5ed7a8d67dd037

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
