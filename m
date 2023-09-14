Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F27EDE98F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Sep 2023 08:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbjINIKl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Sep 2023 04:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235932AbjINIKl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 04:10:41 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98421BE6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:10:36 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-401c90ed2ecso7408105e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694679035; x=1695283835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hin5IormyU5dD/AsuAUUHoFBHLo1oonPXuLbsZDcZfM=;
        b=qc6tGIzJnXHJrkKuKH3zQCkBaNa+nHl0dY76oNkioDPkTilWsKWPTaH+FBcK0w4a2n
         w19xC4X9l1nKOJX241+zH6AvEaJZZqqGl6wQpvMkPRS1LHyNFtNwF1pmY9HOU5H5SfHf
         ApxExjKerMMFhDLoGCMgC4c10BVDXfJImxYIRlxgMNrLEq+rKR7u05pDe6RpFDTE6Ekn
         1npNGmMjRBY151t5W/Kvrd6c9wTpwS4ghOsmjMyrjRHDoQE4kYJWuSNESW7zjIqc7zYS
         tdUr0H4NPZBpiiNAyUiOjoxn4rNUsMSpJA/yD4At3JhUtRgZpUV+V4N2iGiimQ+SbRNM
         9dfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694679035; x=1695283835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hin5IormyU5dD/AsuAUUHoFBHLo1oonPXuLbsZDcZfM=;
        b=kU/1KA9a+wUw3L2vyFWbMHkHQzoP73CNRzxIeYJdiff9ufThIERLE3BeE9VxRzpIoy
         w2Wn/BAZhMOpnOuad8Xz2fGDGIeCCHrUEafPdWF88p2kcnLsxHU1tVDymJA1Y/C6BXuA
         MEfgKj4Z5DVG2kaOQWyR6xLE3aAy1TNfimimzsoDCdu4XL6KIwRyqM8Fp0I+GADuxTLb
         3SY8Loc8x83dWIK9xj85HDGEoFcT6x3gbu3w8Tx2C+EqHfIgCKw0No7tXThs7DXY77ZL
         ONFxS1RWOXa2HFQPni1iHI+Wg59ImdFUoHADmTa4ow0CN5B9Ru76bi3SVLFzzyJqwTxT
         8NTQ==
X-Gm-Message-State: AOJu0Ywrt9WsaHxmiGDmpYE3SXkk8XF7ZpReFf1HUKt6NGDH9TB4DM4d
        9jZqYb14J908GAcDxlvUGp4HWw==
X-Google-Smtp-Source: AGHT+IE4V2wgERUskaxyDybA22SPbjKwWDreD4TUrJWgmpWBN9TSuDjDhVZXOc5XcG6yR7iBkfIb2w==
X-Received: by 2002:a7b:cbd7:0:b0:3fb:a506:5656 with SMTP id n23-20020a7bcbd7000000b003fba5065656mr3969326wmi.32.1694679035279;
        Thu, 14 Sep 2023 01:10:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0ac400b004030c778396sm4152155wmr.4.2023.09.14.01.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 01:10:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynos: Use pinctrl macros for exynos5433-tm2
Date:   Thu, 14 Sep 2023 10:10:29 +0200
Message-Id: <169467902473.16247.3464125892860371063.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912055635.49092-1-jaewon02.kim@samsung.com>
References: <CGME20230912060640epcas2p43a9e6e11906d03641e76fb3df97462b8@epcas2p4.samsung.com> <20230912055635.49092-1-jaewon02.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 12 Sep 2023 14:56:35 +0900, Jaewon Kim wrote:
> Use pinctrl macro instead of hard-coded number.
> This makes the code more readable.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: Use pinctrl macros for exynos5433-tm2
      https://git.kernel.org/krzk/linux/c/d8c326bd5aa5d6aac0c4826dfeadcb02dc77ab88

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
