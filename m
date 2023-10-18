Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E636CDB47E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Oct 2023 06:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235211AbjJRGZW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 18 Oct 2023 02:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235137AbjJRGZK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Oct 2023 02:25:10 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271DB11B
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Oct 2023 23:24:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53e07db272cso10057975a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Oct 2023 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697610248; x=1698215048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0LSTDW6faOOZtWiReUGEV1kCZbo9a6/NHU8SOiXxrc=;
        b=FLck6fm3Q50JXB/FT7td+1zfeI+Pj4RhU0M8Dt//vNxC6vtJw93rxQc6VSyEGKz1Tp
         FOZan8trl2/3xGDNeX7Y/0qxJqIqCr50BIHBZOGf8iDwK+mZiwRGMYKMxmSJXoqC2XaO
         ZnF/o1KGSZ/gn3Jj6V5YDJyw8vRrvwIGGIAnnTdx1r1w5n3N3cFJ/aNybbfETGPK6RD4
         3uEHOajYE9VeDSwafuEC5eIAdsxqiEMB1KUKT60ZLyGdZf7iXgFf8xdPyJXYfppozTMJ
         1P2o0VGytDp54t5YPwWsBmLKMZZa5mOEg2OTQ7723PQEx/6GKS8Y+GPs4knFTVHMWITH
         xs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697610248; x=1698215048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0LSTDW6faOOZtWiReUGEV1kCZbo9a6/NHU8SOiXxrc=;
        b=iA3RZav867AtdiCUkJsrdfbtfuc3q8y2noqUmtngwDDpI7jCCNYN/WyU3fcHZLDVdN
         Z8eZ4ZFkygDSun9n1wosCS5ZuhaHZafpwVKt3eGG2XT0+2GsCEgQ6LFUx9Yb2ZVBDxyQ
         05EX4suisFi/HsG06oiPTTXKLKVbDuNn99TD3mrrr5nQyPaUf+6x8cVt4wNSwKSvL+ef
         V5Ivvy/aICqXATXCd04KYax9QSyPdPpOZWu8b5vBdkNQB3Y74ZJOZQm+grVcpTuKYif3
         LZeZYfBN3aYtMOE7o22EFv8SjcqrwnCWzgOi1uiNWj0RHh0DzmrhAVhFhMct/5zWr5F7
         hUsQ==
X-Gm-Message-State: AOJu0YylgDJ4Qey9B65SM6LtvSoPnNJE5qP8aNU1MFuFlxsKCxoDbk0g
        YrGi+jipIWc3U3Sq+TpCcOsWfg==
X-Google-Smtp-Source: AGHT+IFkxm1MnB5ryqx/bxdOF9swb/7TUQl4dvCNn74j4MyU/6anDE4hDdxSnnwnnJXSJnG7ob0naA==
X-Received: by 2002:a05:6402:4314:b0:53e:1b:15f5 with SMTP id m20-20020a056402431400b0053e001b15f5mr3286742edc.39.1697610248609;
        Tue, 17 Oct 2023 23:24:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id h15-20020a0564020e0f00b00530a9488623sm2242277edh.46.2023.10.17.23.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 23:24:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Raymond Hackley <raymondhackley@protonmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/2] ARM: dts: samsung: exynos4412-midas: fix key-ok and use Linux event codes
Date:   Wed, 18 Oct 2023 08:24:04 +0200
Message-Id: <169761020952.14892.6591419387867673696.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017101402.62740-1-raymondhackley@protonmail.com>
References: <20231017101402.62740-1-raymondhackley@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 17 Oct 2023 10:16:37 +0000, Raymond Hackley wrote:
> Input event code 139 stands for KEY_MENU, instead of KEY_OK as node name
> key-ok inplies. Fix it with correct event code 0x160.
> 
> Use event codes with linux-event-codes.h included for input keys on midas
> in addition.
> 

Applied, thanks!

It is however very late in the cycle, so there is a chance this will miss the
merge window. If this happens, I will keep it for the next cycle (no need for
resending).

[1/2] ARM: dts: samsung: exynos4412-midas: fix key-ok event code
      https://git.kernel.org/krzk/linux/c/25e20eedc1d63dcdf6f781588e8dbc37cd0aad16
[2/2] ARM: dts: samsung: exynos4412-midas: use Linux event codes for input keys
      https://git.kernel.org/krzk/linux/c/4a48fa417abc5b86da393c93ab63a9160076a248

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
