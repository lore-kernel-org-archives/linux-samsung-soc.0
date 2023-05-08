Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F80C77B7F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 May 2023 17:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbjEHREm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 May 2023 13:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234386AbjEHREj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2023 13:04:39 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CD06EB6
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 May 2023 10:04:27 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso9103132a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 May 2023 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683565465; x=1686157465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAw+LmjENYP6n0JgiGSrlogWGfxzFdRErjaIx7RmFsY=;
        b=LTMddz/OjQ+Gm/xmlL+u9f//UGe2LOfuR2QNqJzmMZnvIZiQKDF67T0AybETmaDR4p
         ysi/En4tB8DzHIHnbioW4giP82BrA6hWqqLk96cwcOq4wcEiEBskOVhmg4RPrUuM+8yX
         BWHTqgQpir3cJFpFRlaHqTXrmcJT1mq+UhRZlWey/SVUmn4ZXBxLbzV0PlXDdFh3M80Y
         v4iZ2scc9q/Ri47zqfdG54NtONkYz2Zqfm4sPppc7549GT2GzVjl2k4OSUSqsuhqr2G4
         FM54FqM66QsUY9d94TGQSEO/gSftn9Q0GWhJhY527GaAxE1i7IKkiVVK3bamnBZYLnyg
         eHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683565465; x=1686157465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAw+LmjENYP6n0JgiGSrlogWGfxzFdRErjaIx7RmFsY=;
        b=OsZO7HzdsNC2GxwZzh30yErJ8oZt5c7kIZD9qDIys+fG2CKOCdDx5aBcfobRdYk1il
         05/WJ0/O95BpgvaeA46pRZVqDfq2MOSA7y+9GmPRWYj4SYtEhq0QCC7zmA/gKjPGBatg
         yWaJPZaHe4/xReOzOeg8+p5u+vm+rMfEIngsEb6zGipAg4l8vZ33QbDQGkqrWm6oCrZz
         qGm05grw9157x9dsSFkONzFrzBvk98b5YntFZ1mi31sB1NDLYurjbZosRcA5BPVto4IB
         XbVObgeDJ69ZXkggLY1swnFq6XUvzyLsA1WE9U5Abe99E/v+s9tfjzPw31sIkg3mhscD
         JX/g==
X-Gm-Message-State: AC+VfDyNOyQQO8Ly4gHzmmzABZAfguozhAj1YhbZZnjS/njCUzBPj/s9
        SpOtKUE3G50lpQy4LG21EYEqig==
X-Google-Smtp-Source: ACHHUZ4VYMYjYzSc1Acapa5ANUYEhCSkSLGGQ/iMjiXSFlOVs1VhRjgzciwj/nWArtp91698u0L/Yg==
X-Received: by 2002:a17:907:360c:b0:966:23e5:c8f7 with SMTP id bk12-20020a170907360c00b0096623e5c8f7mr5754200ejc.62.1683565465540;
        Mon, 08 May 2023 10:04:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id lh2-20020a170906f8c200b00965b7bf6aa5sm206862ejb.52.2023.05.08.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 10:04:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: s5pv210: remove empty camera pinctrl configuration
Date:   Mon,  8 May 2023 19:04:17 +0200
Message-Id: <168356544397.281925.652895138808564025.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421190202.15471-1-krzysztof.kozlowski@linaro.org>
References: <20230421190202.15471-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 21 Apr 2023 21:02:02 +0200, Krzysztof Kozlowski wrote:
> The camera's pinctrl configuration is simply empty and not effective.
> Remove it to fix dtbs_check warnings like:
> 
>   s5pv210-torbreck.dtb: camera@fa600000: pinctrl-0: True is not of type 'array'
> 
> 

Applied, thanks!

[1/1] ARM: dts: s5pv210: remove empty camera pinctrl configuration
      https://git.kernel.org/krzk/linux/c/b8039b4e40094e81351221275ed61ee7643cdb91

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
