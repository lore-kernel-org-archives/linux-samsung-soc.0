Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EBEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:48:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348280AbiFPAs2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Jun 2022 20:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348036AbiFPAs0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 20:48:26 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034D25677F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 17:48:25 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id c196so110460pfb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jun 2022 17:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T8QZHlvVWLrvIQOydu6CCD5mHZxumuDa9jo1Phsr+pg=;
        b=J6oH+8YYpna2UuHlngoqbHlwOsqW317xprlm/D07O66XsGayhzATd619ZfLT40ZHgc
         gpSo++zbhpPiBXAbcrTF5C260ftStA8HzYy+qi29my7l6eG/6XdHtYcphMJwr6+0xPZT
         SGhi6wNMPOwB317byRy7gfNQ/0TMtcf8Km3cTcXxT0rV3w9dqNJFycBMXM9Ix/j17HXY
         tiuhgEnK4PkvOjQ0DlCUQJVGnva3IlAhhOCPXzVf/m3n1uoFlL7Gonn4md8YLFbP9481
         ceTa+98gpt1VkSK1Li6+y5lXC8gKkjkFZ63Ioj8dkJaYpIMjjbjyngCVrzr6MyUh4vqx
         epAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T8QZHlvVWLrvIQOydu6CCD5mHZxumuDa9jo1Phsr+pg=;
        b=jwlIQjs9OT37IM5OyyM7tpNxyX90cuox3mN/QfUBcL4ZSoJeVJd7Nqh9Gn97b5Oo4l
         nVCtAYGDrgn5l0CR3uWnpKakAFkOetIcv5ocUXQHHF636q7I8fnCdMJZ0WtZXFpvcs8y
         3IDwvpYuoPACG1Skdad4ro4haru29DTebWXm7PTx1eZG/4W1coHRbRDJPBuG7A4YGRht
         SYHVN23UICTsdmGRbIDXZCLF3QFqlVv2ZlQu1EH54a1h/MudhrAF2ZEkQyk6g8mYbmu0
         WZzSIwi+Sm0dD7lX/ZQoSfbUvlA3Zg2eiYTWP9iQT4OtF5isAGdkEGbQDVA2rJOLbEe6
         9lnQ==
X-Gm-Message-State: AJIora+lTgFhKDRGyiuoZGgDKPjSwT2kLRyQjQOKqeoavI/vfGFagAkr
        8Tf07aoOxx9rnigivXCS4CNgwQ==
X-Google-Smtp-Source: AGRyM1szfmFZxpBJgOkiIjn8nao0a7mgAaoEx/fSfpRRabavFTJbCHNmOH+rE/C6+TNI05JocHHG3A==
X-Received: by 2002:a63:3502:0:b0:40b:916a:9b19 with SMTP id c2-20020a633502000000b0040b916a9b19mr4859pga.33.1655340504518;
        Wed, 15 Jun 2022 17:48:24 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902684b00b001635c9e7f77sm253518pln.57.2022.06.15.17.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:48:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        arm@kernel.org, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        soc@kernel.org
Subject: Re: (subset) [PATCH v2 47/48] ARM: dts: exynos: align gpio-key node names with dtschema
Date:   Wed, 15 Jun 2022 17:48:21 -0700
Message-Id: <165534049852.17040.1588652474876774936.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609114047.380793-8-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <20220609114047.380793-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 9 Jun 2022 13:40:46 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> 

Applied, thanks!

[47/48] ARM: dts: exynos: align gpio-key node names with dtschema
        https://git.kernel.org/krzk/linux/c/97a9495efbdc5184930a75d36ca845d578e3ee1b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
