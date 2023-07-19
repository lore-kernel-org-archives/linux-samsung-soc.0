Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D294C001DC
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 19 Jul 2023 07:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjGSHg3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 19 Jul 2023 03:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjGSHgU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 03:36:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C381FE6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 00:36:16 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e99584a82so8964320a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jul 2023 00:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689752175; x=1692344175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/eA8pKJcHiUXAdf7PMzIQmFbGywWXqPi31I+AY3YSI=;
        b=zcw/4+UMUKRHWSV7ZaaICpSL1K1a5aGEZVjOWGjjENfPt5MZHpNNbx42sUroUBI11f
         bnNAb2iUqJDbigI/T2qj390igCk0o4WiQ/VhvlZWDxZFBAyjz9JrFIe623zRUffi1mWP
         1pPyYKT7xKnJPhIugP57JpDNgHDgirDZyGbf39+xK4mgyE0F4+nAbLVntqK1eJwPqLvN
         aModvdvWKl9GTgcJ5p89N7dkQuaZR62Qf7AHHO4GZR7Xd/6Kd5uutZfnFdMAjIBDE2Vb
         aKEYPQXR0XYDhZvnul1rSIzysI5hcLUBc07CdEH0J3NAAjYNiXusUxpC+Y4o8Ohftl2y
         LJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689752175; x=1692344175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q/eA8pKJcHiUXAdf7PMzIQmFbGywWXqPi31I+AY3YSI=;
        b=PyoFqVsVTrObrJ235w980nWMRoi+NS8JQIAmrh0fF8zMRsp6d0KUoz5zYWI4HZeKbz
         pkiubQv1+BHXXV3W26gi/eYXguczE1/Et9IipY9MdPCwidHub3vt03u+q2pibFkGizh8
         87a0o7z/31Irpt2DEDqqGmS3HO0evNd62bsmJR8zTozrGaeoDKGQK8Zx6Am3clPjf3rN
         DaH8OKjzb4QSSuQ5xEnhCVoyoOd8IMYcChPDJ1t3X9hIV1vAz2XIiM10AbN53uKrK76F
         clR613EqjBc1JUM4CtPRspkwwEBo90BE76C7Id9E6fw+qyzpF0Ue3BFXqmIeYe2j7a7F
         qU8A==
X-Gm-Message-State: ABy/qLaP0LKZwync0PVmlWGWFSDfIIZ7Cd1A1TKS0ZrQ5xhbn+iSG3xC
        kcQ5dgRiEN1Nv92dY0ZsEIPWgA==
X-Google-Smtp-Source: APBJJlGOf4hGTqkGyxwxOYlRSiFB90/uKqYCcXvS/KlM16eAlPWxbD8qeAUOU7RY51/m+vT3NlEWyQ==
X-Received: by 2002:aa7:d708:0:b0:51a:265a:8fca with SMTP id t8-20020aa7d708000000b0051a265a8fcamr1995135edq.27.1689752175402;
        Wed, 19 Jul 2023 00:36:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v5-20020aa7cd45000000b0051e069ebee3sm2310594edw.14.2023.07.19.00.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 00:36:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6] ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards
Date:   Wed, 19 Jul 2023 09:36:09 +0200
Message-Id: <168975215984.14599.9189608478970320917.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714101229.30641-1-aweber.kernel@gmail.com>
References: <20230714101229.30641-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 14 Jul 2023 12:12:29 +0200, Artur Weber wrote:
> Introduce support for the Galaxy Tab 3 8.0 series of boards:
> 
>  - Samsung Galaxy Tab 3 8.0 WiFi (SM-T310/lt01wifi)
>  - Samsung Galaxy Tab 3 8.0 3G (SM-T311/lt013g)
>  - Samsung Galaxy Tab 3 8.0 LTE (SM-T315/lt01lte)
> 
> What works:
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards
      https://git.kernel.org/krzk/linux/c/ee37a457af1d166f090ec68de26f94447d899c8a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
