Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03292C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 10:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbiGEKmD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 06:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbiGEKlu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 06:41:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3EA15736
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 03:41:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z25so2267181lfr.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 03:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tU++a3VhXs0FHkamB71zlsh9dBT4mNkgeu3fGVWqT0Y=;
        b=AbTKuV5dBPW3I9PCByEGA8Hg7m81MxuLH9kH5B4lEXfNJM7ZBdry6/bhXdCT0jzjhW
         FmBqbZpR9aanW0p8bWoZKzgCdTeT6CSRFr52glCPF7KsnEr7TY6j/ANrvdVCvW3EmnTR
         GI0MlbDzX/hQ5dl3Rwc6TI2PFmKpdnU87ITukWLJKe5q4w4BnUniIwMkyxCPWjhunGnC
         9x+eCRcupZwP+lm724e9WagY4OudDVtahADTuRat/jhsfo/vOXz6FrbnGpdCnLwHwhl0
         ZV6oHc9YADQ0k081bmVqrJC2H/pb/DqySpaxIODDgHNf0Gez74ZP+j/OA3IYhvgfHgPC
         4Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tU++a3VhXs0FHkamB71zlsh9dBT4mNkgeu3fGVWqT0Y=;
        b=FmaHlTokXI8RFIMNttwVn6xqPORgMMfQhQ3SNNPcKNLzJf67szu+XttIgKnPGNsco3
         hfqrKvyR+s09xRl5e/S++uBuLYPw0jP1f31IBRBXv+IDnls7t6lD3A7lZqVQIRTXGSx8
         9ZTAuLtzlMJCHLdeeE313VmBHr5V0ne8j+XxDb2dhq/0V6dsRGkmvwoOc27PknXya+ug
         bLT9u4aqTtugjzaNKWIjoCPwNb4e8yAUiP4KBnXJcfiUkESDMnbnxfW0yLvwoP04cDTS
         7dTEkBbfMZZm3T0e+748O639tlvIaJhIxuJYEZ6ZCHiEaSLc7PBJdaglkiSPu0ROIS1g
         cOtw==
X-Gm-Message-State: AJIora98HKO7DqOFUWWfzaJlQLFpX8Pg4ZBuhD5Gr+Shb2k5bhyCiJE7
        h8JGIdnSVYJbcwzkXKzjHssP2oTq8DE5Xg==
X-Google-Smtp-Source: AGRyM1uk+uaSzYZ2JyDGqUITJSzmPAOmf/idfI6DZ5PmsT8n7cvtwS30sgV0JOlHv+lcMcuYfnLaqA==
X-Received: by 2002:a05:6512:1393:b0:482:b5a3:3fe0 with SMTP id p19-20020a056512139300b00482b5a33fe0mr5203908lfa.265.1657017704055;
        Tue, 05 Jul 2022 03:41:44 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id q24-20020a056512211800b0047f615b5cbfsm5619814lfr.211.2022.07.05.03.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 03:41:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        chanho61.park@samsung.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynosautov9: correct spi11 pin names
Date:   Tue,  5 Jul 2022 12:41:36 +0200
Message-Id: <165701769258.78614.14200320121935846404.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220627005832.8709-1-chanho61.park@samsung.com>
References: <CGME20220627010103epcas2p174bb652624219cadc106275abf51f83a@epcas2p1.samsung.com> <20220627005832.8709-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 27 Jun 2022 09:58:32 +0900, Chanho Park wrote:
> They should be started with "gpp5-".
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynosautov9: correct spi11 pin names
      https://git.kernel.org/krzk/linux/c/ba205449828f47f80532a1453beef5eed2982176

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
