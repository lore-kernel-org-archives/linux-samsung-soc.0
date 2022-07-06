Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BBCC43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 09:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbiGFJyJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbiGFJxr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 05:53:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E393C2610C
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 02:53:06 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t25so24995337lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=2FVetjxzklklHxgJM/McAptL/rX/8Wu5tgIb1xFKons=;
        b=GDZFJfKTu2z9DGUQGZOFzVVm15OzBXNo2MWdXF8GShZ931XRVEfsXqfmaDDLZpwigr
         I9gNHfLxGTV5mZzQEREVxUz8sIYUAK3i0fCaVDYmcDTtJzx9ILfAWxUEp1cwS3MNHdQ9
         meZZo76+OBDpCMERV1DN+TiLYEKPgcElLwlZyAgyIP/PW03uZNQuSpIXpadhlrDLusPj
         PKk2JV3WrKTo21M3QSIGREe/MOihZ2yHjlD18wEgtXd+M4jIHDxD05H5RsLzr8znmqB0
         rzn1l4yGjk4pg5q4qgCc0A4ENagaky4EwCAtYC8WyjUnvDnGRODvIzRiJavNWwSkmgSK
         CSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=2FVetjxzklklHxgJM/McAptL/rX/8Wu5tgIb1xFKons=;
        b=Nc/VTbIDxv8mgBYFKkcXPbETkAmX4Pb6P/iN/aCegBBt1VxrBv6nsOCwVCUGE8OczJ
         MqYnUrXfdTrEmVOzHhRnxNrg9SIRtfEO3zHYfiY4L61WWyNugd8pqAtMHNrWME9+cAMg
         KLpN9xDHUdzGbXkLxYZnRBRCQAhqVQrkTmDBYZgKSbxNakxOQYZXs4idOJEnK6C0QjXT
         9aqtlw8PN4HgC0M9Ypn6YlIcFbIGtlMOHwNc+iVks8N/IM5Pg5a2NOsKJYJ8Km1FxORI
         n49es8zfKeC5oBqnsNQAKWSUJWN4e3zZymOJV58mxr76M75HnUXnFIkEsS7sR10V9OeS
         xRCg==
X-Gm-Message-State: AJIora+V6mMHSd1mLDm5mQ8+/aAY4C0dEfCxMlP2dXqDCDzJ2XP14P4i
        1hkxmIxQPi3TwHVtC3ZT2PWCxTtsrPfMWg==
X-Google-Smtp-Source: AGRyM1uOBbTMS8AMMFv2zNraedxagLfPJH6pvKGDmkFCxpDv3V7ItVXLi3LOAha/9Zuecr0/jlyJGg==
X-Received: by 2002:a05:6512:e95:b0:47f:9d60:d90a with SMTP id bi21-20020a0565120e9500b0047f9d60d90amr27150833lfb.591.1657101184992;
        Wed, 06 Jul 2022 02:53:04 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id 1-20020ac24d41000000b004870ef4a0c7sm82400lfp.17.2022.07.06.02.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:53:04 -0700 (PDT)
Message-ID: <140c1c89-49a7-45bd-7f01-8a3ed1343437@linaro.org>
Date:   Wed, 6 Jul 2022 11:53:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: ExynosAutov9 SDAK UFS phy dtbs check error
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Chanho,

When running dtbs_check I found:
arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy@17e04000: clocks:
[[10]] is too short

	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml

arch/arm64/boot/dts/exynos/exynosautov9-sadk.dtb: phy@17e04000:
clock-names: ['ref_clk'] is too short

	From schema: Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml


and so on. It seems you miss there clocks.

Best regards,
Krzysztof
