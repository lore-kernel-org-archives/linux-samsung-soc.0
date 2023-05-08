Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6313EC77B75
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 May 2023 09:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233648AbjEHJC3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 May 2023 05:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233658AbjEHJCK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2023 05:02:10 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C898A22732
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 May 2023 02:01:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-966400ee79aso245761266b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 May 2023 02:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683536466; x=1686128466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdjVB1LcK65MjUQ5lAoWWtjhBM+KfEqN5gXnbsQlIK0=;
        b=t40AGY5/zL0/XXc7pQ4Npisl0XqlgKQc9BM/f43pHyOgmLT7RrDqoFoJaUTQjSel5S
         C0hfCvVd2YeezCX1ZvEN4S8f+dCNm5R0iCkNKEVLWdx8Kj39qwAww0eq7SztqAeoKWW5
         GNipyl/sTouqc+HG67BH0X5Xl61zdJnpc6kwIIYWg2zSJKppGoghENY4OPp31mxr23Tz
         Ug+u3P37klL3iESNEiUTRQRcRZqTFA4IPjV3KWkMoE0N/5vQOBwneqBDF1YytNJHFk7P
         HwF3YwPS2hc8WhTkpkuUEgKXk+igPwAGHa7roc6GAuDn3tfjp4+k0Tkp32ehLyCNzFL4
         6PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683536466; x=1686128466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdjVB1LcK65MjUQ5lAoWWtjhBM+KfEqN5gXnbsQlIK0=;
        b=WeCSPFl2byZH3zkVNKveWoBiS7LHN+yJDzCoVNyYzsTfZtTA5A69K3P1k6KiST/wH6
         4FNsCIFdhpep4iv+uGpn2ClJLKfdBNkmYqsdoW4i+/yaMoNp7/7JeMrSLehLKO+yZxMA
         qOu9ULSbjxCQNG7lKuGul9vikHS61mIumV4/n6j3j5y1pG52hga2L8Zvhi3Zy8ElB3hP
         ZxcWrf02Cd7qrDr5cbnb0fSMOlZzl/alnjODe47qxaUOUPPr9DwRxWkxdT/4BdC4SPc6
         QFm5uYaC9gTWPnPXThBUCJOmHfXC2SN2JR/7wHmmMyG2SkaLBkDTO4aQE8Ruuc+ne2WN
         /8zQ==
X-Gm-Message-State: AC+VfDxjZQbd/n9aTTktTx8qBSACNuUIaJx/iF/QmBxYJeqpHlqZlk5f
        R+S77O27cmVggCrzBRF9hd0U9A==
X-Google-Smtp-Source: ACHHUZ4HpKWDjurqiqoLaDtN/lfcKNWSX5+AEn0mGRBLeJKV/5W39K4QrEkUfS5UpnPMpO6vpYpdLA==
X-Received: by 2002:a17:907:5c5:b0:965:9edf:f0d0 with SMTP id wg5-20020a17090705c500b009659edff0d0mr7601374ejb.13.1683536466403;
        Mon, 08 May 2023 02:01:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709063a0a00b0094b5ce9d43dsm4685758eje.85.2023.05.08.02.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 02:01:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        soc@kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
Date:   Mon,  8 May 2023 11:01:02 +0200
Message-Id: <168353645813.78617.10247256011505870361.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
References: <20230508040433.13648-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Mon, 08 May 2023 06:04:33 +0200, Lukas Bulwahn wrote:
> Commit 0d297df03890 ("ARM: s3c: simplify platform code") removes the line
> in Makefile.s3c64xx to configure the inclusion of setup-ide-s3c64xx.c,
> with CONFIG_S3C64XX_SETUP_IDE. So, since then, config S3C64XX_SETUP_IDE has
> no effect and any further purpose.
> 
> Remove the obsolete config S3C64XX_SETUP_IDE.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
      https://git.kernel.org/krzk/linux/c/9d2edccb154bd98baf7f1e21d23f799e4f5e8359

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
