Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6EBC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Nov 2023 15:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbjKNP0w (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Nov 2023 10:26:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232378AbjKNP0v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 10:26:51 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A0AED
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Nov 2023 07:26:48 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-77ba6d5123fso553277685a.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Nov 2023 07:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699975607; x=1700580407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7F8QgjG6LQI/HDtH6YsJ8pzu6k42g4LGlXjrIxXLCg=;
        b=vd+Ic96Csx85sJu/M1HPsJIDkVkkZiDB5e7uauOUL+rFLjxmWH6BOGPBwhITNARXhP
         F7wcNagTf9xnBKXqnQnNsD2aJH5UxkpHGXoJs7PkE/CEM40b2Eh6/+YaQIn+MOLoTPQU
         MRjIpIYNfx3aQPrYeHurWL1u4rfh1o7sAvpZnsHvH6M81LOicWvJTUNbLeSZxLfWa4A0
         SXtAgLjAQnzUi4+yw+Fmo+A9A7lb1KIAHJ7lE5Laz4cBDEipVucyTYGp0VfVxcVXLRj5
         HAF64XvvEHn2uQuvC1n3PO/wjDi0nL0mhy3kwZXl6HbEUH48ikurAo+M3gQlfqKLaYRj
         sQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975607; x=1700580407;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7F8QgjG6LQI/HDtH6YsJ8pzu6k42g4LGlXjrIxXLCg=;
        b=nMUOdmmN5tl+mT3sZN7q1Pm/QRcBXzTkqe+V/fM2EXga4yUj7gFRhjHRmsW8ydd7gt
         2FThbVoQKUlUrxfKwgbTx0ODNbO2kQYk0uPaEw8r5ot+pw2VPR6R9dc6XBOnqQsaOL1k
         8P5/sGknhRUHCBOYf+pRKl9xjO6alf3xbjJYt/EnL359uxfMycamEsJVIaLzBL7YYxMr
         s47A2ghRSI73aj9L6lGrY5jhJG8CXKDBphxDNnATF+jKMAqg5mLUqjI/Ua/QNBr8Hyl3
         oOrQ40Kf1kR3E3amY/8az48tvvPP51isz8f31L1iwmqYYn+L/45DLYPe+d5t/NvQR+gq
         A8fQ==
X-Gm-Message-State: AOJu0Yz6tf/kpPQX99VS6Lpx/JXlXGK45VUYBIynOUOW8fofj+V9sxLJ
        cUFPfZ2i+f73AJiTpDASAyLF0A==
X-Google-Smtp-Source: AGHT+IF0Wl1kVxFaBCj1GO4wI262SpQaQZD4Ao8J20Z3un2G8Y7PMNcnaECfZqEqkeoPrGFuvA2i3Q==
X-Received: by 2002:a05:620a:4712:b0:76e:f90d:85d1 with SMTP id bs18-20020a05620a471200b0076ef90d85d1mr4028598qkb.26.1699975607743;
        Tue, 14 Nov 2023 07:26:47 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id s3-20020a05620a29c300b0076efaec147csm2716087qkp.45.2023.11.14.07.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:26:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231027040338.63088-1-jaewon02.kim@samsung.com>
References: <CGME20231027040435epcas2p4628f9c61d4622ed4c4b62edc4486e2d1@epcas2p4.samsung.com>
 <20231027040338.63088-1-jaewon02.kim@samsung.com>
Subject: Re: [PATCH] arm64: dts: exynos: add gpio-key node for
 exynosautov9-sadk
Message-Id: <169997560713.7305.9969596641933403889.b4-ty@linaro.org>
Date:   Tue, 14 Nov 2023 16:26:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 27 Oct 2023 13:03:37 +0900, Jaewon Kim wrote:
> ExynosAutov9 SADK board has 3 keys to test external GPIO interrupt.
> To support this, add 3 gpio-key(Wakeup, Volume Down, Volume Up) node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: add gpio-key node for exynosautov9-sadk
      https://git.kernel.org/krzk/linux/c/6479f40a10f773d712f645c3d7bc2ffd5904aa6c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

