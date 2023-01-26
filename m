Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341C8C05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 10:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjAZKS2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 05:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236862AbjAZKS1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 05:18:27 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7178A2915D
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:17:55 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h12so1223440wrv.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 02:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSaaUyRl+8LAiEw6f3Sm8SchTE7R6yler7f1jr959YU=;
        b=DFD83/OR8SysvM+u1PfUkH+p5SM4qpCRAnfQhR088T7ezKQ3dZC1zNa0n9YwkzeLs+
         sF0pxgnXmDI8DnYK608JFkwJoc6br+Z8ySXaGi9uX70wJZRk8xj+hS17wkUdXB7tYtXp
         +LO1ijdi6SMDVPGrbDZ/5ComhLyvelPHHNDedwZn+nDEfjaxLHj89OBDP2isZSlIoVae
         572xafQaHGnNk42hAlx/QIjiK5YCQ0X1o2dJwd8R6YPWcpR8Dry9BhG5TYRDPmTB567O
         rFtZ8bSVkR8wqVPasXghGhG4iu9jIooxyGefdyCvYnIqFhzbp+J+IZ/NqkyoazoX0wvJ
         AUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSaaUyRl+8LAiEw6f3Sm8SchTE7R6yler7f1jr959YU=;
        b=M918RUs5bgQ3awiOITuerOKSjGVi1tYyQPIOi9D41ZokiQzth8rgm+DDI7ROiSamRN
         BtDNLiL8KxsEvD56W0ntA3tQ6DTIOP0SCQx1oYZFAfY2C9iplVPv1sOf4IpLVON6b9w4
         C4S9KsNKNR5Aa9YoUrauMMNmoqqGdiAeY35SRde9kxNlj08GO5Ug5MkqwTTUPSS5nTp8
         ZI2CfDQTcwfMn8w3dQkfg5B3kznUuuOMTy0NjqoMcBRfg3I88r3Wa1cTa1OEIAlDghqy
         Z40yDJghWYfX+gxbNdbXwCzVLVOT/r8ZsmZACvhwkjLrmZX0GChGy1qjTDhL1HmfXRQP
         SB1w==
X-Gm-Message-State: AO0yUKVD8KXeNbw/f6K76siwz58eJbOtDPkmEyhradxZYxxvuJGkg97+
        Bd8Ex3UzpOCP+6ND8fsek6zmXQKNrezxqo0b
X-Google-Smtp-Source: AK7set/sXYLotV3kzWCJDxfSdKq57E5wYvEyQGLwZoOgP4MV0ydpZugdbgpcAXjTU5hQ8x1IeF7y7Q==
X-Received: by 2002:adf:f409:0:b0:2bf:bb71:dc55 with SMTP id g9-20020adff409000000b002bfbb71dc55mr4945057wro.52.1674728271110;
        Thu, 26 Jan 2023 02:17:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a17-20020adffb91000000b002bddac15b3dsm868315wrr.33.2023.01.26.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 02:17:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        phone-devel@vger.kernel.org, replicant@osuosl.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 6/9] ARM: dts: exynos: use generic node names for phy
Date:   Thu, 26 Jan 2023 11:17:44 +0100
Message-Id: <167472826059.11433.2855433349956906292.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125094513.155063-6-krzysztof.kozlowski@linaro.org>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org> <20230125094513.155063-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 25 Jan 2023 10:45:10 +0100, Krzysztof Kozlowski wrote:
> Align HDMI and USB phy node names with bindings expectation.
> 
> 

Applied, thanks!

[6/9] ARM: dts: exynos: use generic node names for phy
      https://git.kernel.org/krzk/linux/c/7bac2cd7fff73dc2b3600c83aeb1c57100cafe70

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
