Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144CBEDE98C
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Sep 2023 08:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236237AbjINIKn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Sep 2023 04:10:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236206AbjINIKn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 04:10:43 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C34A19C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:10:39 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401b5516104so6713945e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694679037; x=1695283837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMQkGRZuOWX33tb/PbqZ09rPOB4FDk/5Zw4MRHH7S/U=;
        b=Y5XKTJ3awKNyiRBpjxXyfGWJqTzZ4r4RJVwHOwuINvVdMlEPYidfzaihFYi37Hsp20
         PXMYAVaqTsWJIAYKGtKtTAM68RAex7iGZ5SwdGx85PNUlAua/AKTbpuYZpFAgTagLpz/
         ERzlgmD9RNu0dHsfmw27K7LhM90M1IdjiFE6ahg2drjLy6knMYQZAsZtRvVkZpCqMtjJ
         0VfL01/78lGEMerF5rQ3C6pJ+EsYdXUPSczHXOs2UTcJF2Tfk7qBDa4Qle4Hw/xjXctX
         ish8wQJdkdURkrL8QNbB2KS0tTLJ0boa3HAIrn6ogE9x6EF74onpT+Y43MRPFaSc3HHf
         PPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679037; x=1695283837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMQkGRZuOWX33tb/PbqZ09rPOB4FDk/5Zw4MRHH7S/U=;
        b=vXb5IHfghcrmCoWYHK/hPUo7PBvIBI8qJ15gh3xce6wi+VQ/BvyHL3OmBw5nkmgEqc
         jk0JkHfYSButtYyovAsSrEkXxZqneFjrYmgu5vlG0uOr8Aumq+10pZlJ22POR60kJsO/
         A4IoEXQdF5lOZX2LXMwtxBsxKzLwVTkZhaDkIMo+gnm0H+fltpnADwCFWN4/40xxdinK
         aESNl5lYpN4cfJAfHgkU4u3BDJfNP2fw3c/JnuE5an+Ol9/pkZvZ/6/3IVHSxB0W4P/C
         t/QBOHtFi8vNFdSOp57uRICN2Xw7KIlKnFqOUwvVHDECla/a34s/aMcIjSnMHREr7B7Y
         UxJw==
X-Gm-Message-State: AOJu0YxDGIhQtHO0G+qAewXjFfhXnwGmfe4sGbGv4KSGloHWgyaQn71T
        UeNsXqCVgkHfHWcLYx7Mw++wmw==
X-Google-Smtp-Source: AGHT+IFxqQhwwTKH7xN4uv6LGeh2UbDCXDARXiHHlwBMWje0PJgx+4KKpeNEfWz3z+zCwLa6ijabNw==
X-Received: by 2002:a7b:cd1a:0:b0:3fd:1daf:abd8 with SMTP id f26-20020a7bcd1a000000b003fd1dafabd8mr4084494wmj.40.1694679037547;
        Thu, 14 Sep 2023 01:10:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0ac400b004030c778396sm4152155wmr.4.2023.09.14.01.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:10:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mateusz Majewski <m.majewski2@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: remove unused TMU alias
Date:   Thu, 14 Sep 2023 10:10:30 +0200
Message-Id: <169467902474.16247.5261231734946349576.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911133342.14028-1-m.majewski2@samsung.com>
References: <CGME20230911133414eucas1p116d395f8219ea34c284aa21d46033fa6@eucas1p1.samsung.com> <20230911133342.14028-1-m.majewski2@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Mon, 11 Sep 2023 15:33:39 +0200, Mateusz Majewski wrote:
> The ID of this alias is checked by the exynos-tmu driver, but isn't used
> anywhere and omitting it does not cause an error. Indeed, this is the
> only Exynos device that defines this alias.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: remove unused TMU alias
      https://git.kernel.org/krzk/linux/c/f28dde395937e000585ac87c0d1c18885661161d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
