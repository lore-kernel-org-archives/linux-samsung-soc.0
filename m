Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD0DC04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Jul 2023 08:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjGZI7g (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Jul 2023 04:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjGZI7F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 04:59:05 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1AC1BCB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jul 2023 01:53:08 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98e39784a85so159462266b.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jul 2023 01:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690361587; x=1690966387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y323VqrnUwbgFr3AWb69nYFgPXshHmv3xK/j+qJy0Bg=;
        b=Xfj/4PSo4GwepbrqH4ykwdWq2F3+aV9+IwCm0z0na6qALSSvFky5z/aDJjzySbo8xf
         rb0gc8He5P3H0AQFdfQsakIc4/6km7FAGGWGYQVURdtmpkN7YsomsMD7xgvL7zOCvEaP
         gVqzVgEhGBN/zbM+4mdju9H9V05u2avVS7KrPearyxsIcOs0vN6kZiVIoy3hNLEG53px
         A7jAGYO5IFdGEJ4XkvMycqSaZ4qacog8mhjWxx3OJnizcqxWRB9aNKln6aG1WGgpfleO
         DDnpy6KWwh3ZRACV0/UhJiwVASCqgfkKkxmqY/7DxEZPL8mbNOIRPf5kei2uFRhRy+gg
         G5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690361587; x=1690966387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y323VqrnUwbgFr3AWb69nYFgPXshHmv3xK/j+qJy0Bg=;
        b=BAUabeaku8l2SQ+oEBWXKLQqVWkQYWPApdU34LX+YcYWshfxSRBXsxUHlSTe8cFJlb
         7zNnCTX6nRkCDG2DURqh3oD+IY4ut1EzF1RKwPwN3q1p8iXLdOMODcqwqUK9IdY2nWsz
         iSuvicscCVzobv9kd5MpwyYncqotE3+jjXES4atqNg8/C5n5nTddtnIWT4bgDjqF0ndR
         a3G697Cv2Q8PwwdC2eltAOAh2M93hv5TeeD6KrhCN6mhqGzzcA3YXg43kU6nZMhIGTAj
         OZyu2zuaNryqtFntomIIrjIY+qHssaxUqQuuBkzJCQvaPRsMSOykti1sIB48GzHgJC0A
         3Xhw==
X-Gm-Message-State: ABy/qLYGLqDG8xUOZ6YCt7PJoLbalYzTUpqxVQHe+HjalRMNfbh6CU++
        u1q9M9Gm8eSsIwEYUy/mvvXatA==
X-Google-Smtp-Source: APBJJlGJkcswTgOcEC/0azVT1I0P9EPqZI5ur9E7qHLTgnW7AEp7IKoSN5ESxsx2FVdpiE8O5+jd6Q==
X-Received: by 2002:a17:907:d01:b0:978:8979:c66c with SMTP id gn1-20020a1709070d0100b009788979c66cmr6659274ejc.18.1690361587522;
        Wed, 26 Jul 2023 01:53:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rv14-20020a17090710ce00b0099b921de301sm4606340ejb.159.2023.07.26.01.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 01:53:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>, replicant@osuosl.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4412-midas: add USB connector and USB OTG
Date:   Wed, 26 Jul 2023 10:53:02 +0200
Message-Id: <169036157564.124820.10583684522543257497.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230723142417.97734-1-krzysztof.kozlowski@linaro.org>
References: <20230723142417.97734-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Sun, 23 Jul 2023 16:24:17 +0200, Krzysztof Kozlowski wrote:
> Add full description of USB-MUIC (MAX77693 MUIC) and MUIC-MHL
> connections, along with proper USB connector and OTG mode for DWC2 USB
> controller.
> 
> This fixes dtc W=1 warnings:
> 
>   Warning (graph_child_address): /i2c-mhl/hdmi-bridge@39/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: samsung: exynos4412-midas: add USB connector and USB OTG
      https://git.kernel.org/krzk/linux/c/57f706bf73079379a9e9f5490c94c2473077bb2e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
