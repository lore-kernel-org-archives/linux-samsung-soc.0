Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BC0C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57A4C61C4F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhKONrC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:47:02 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:60732
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236499AbhKONo2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:44:28 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 27AAB3F1A6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636983692;
        bh=1ZCgOXXdDSaFd9PKWHDCusbT3xu4LFc8Tvux7T3aIBU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=E8q3sFU/wVQgJ/aB+lU5l4bzwv61AZwZHSXnM/ZUKZEH93Hb+LGYhrybp/VGi+B9+
         ZOce0MfCMta2lVTF5N21atORfucvi8QY9fZWTWUNmlev2CddnYXFboONcfTQq6+TFn
         XJEpQVrbEiN3cCl2AR6vLgA3KNlCsOleEOSXYLwr9v8uf1uAFVKd2vG0zRohCcjAbG
         GuYM6jIqdC1CF1WYolB3IFaucAQ8V5F9qttZit4H6sfPp9wibXT4GjQGFYHz4xcKOg
         7RnXJ8wFEvdqx1md1URx3CK5swDjVu0GNiwJJOghbP7Z97eZYjJYHVI2bWxNM0CawQ
         ESVP1t5GICchA==
Received: by mail-lf1-f69.google.com with SMTP id i1-20020a056512318100b003ffd4e89eb9so6715134lfe.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:41:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ZCgOXXdDSaFd9PKWHDCusbT3xu4LFc8Tvux7T3aIBU=;
        b=K4vXrW63XxPvKTgtfcdTm4trNkQskN6/4fhz+2n1CIcYTfqWEZQRw2v9NvKf3lUidJ
         1azeeYSVi1ywzOCJWr+hF18Lk5SnfWZrTIHayAUFhPa/YeHRXmE/25mHgZlLPD9OUit/
         zH52veLNWW4QRUKinp6/2OUdfvTjRkpm2XC6z32wtL4LPNJWtdiLQqrYEa42Fht59yis
         Ywb5OMOl98WDUtwimk/EebH7m+nRQWGSu5vasUkodILdHlrawT4modcSS+piEXrxT6kC
         LVpZ6iJOFr5v5AaG+dSDqnHb4W9AxkKDw/EDhWy5bNdtbi9jGaItbBJxdRTYaim8W8gg
         1wwQ==
X-Gm-Message-State: AOAM530G8xMmQ0b6i0DQlo1T/pbP6e9u0+cWMc5tlXdClZhDSOIslAjD
        VG+ulacfHAfG0dIEBH8hhrsC9/EB1WDcoo04GAX2YKfS01ISpQr7KLXj56/7B8Y7WVvmccQzN18
        Byp5sffO0sxJ3RzZfSSVv53+IqRr6JbSahMQTTeFRVKkq5LdG
X-Received: by 2002:a05:6512:691:: with SMTP id t17mr34698461lfe.220.1636983691674;
        Mon, 15 Nov 2021 05:41:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxng74YqcBM5rQLyeNbIa3LcnMO+DI/reH2X/yvLXYaZUD1UX6NyysXD1j0gLvJDKBiAD7CTg==
X-Received: by 2002:a05:6512:691:: with SMTP id t17mr34698445lfe.220.1636983691527;
        Mon, 15 Nov 2021 05:41:31 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i3sm1421786lfu.156.2021.11.15.05.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:41:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: samsung: pmu: Document Exynos850
Date:   Mon, 15 Nov 2021 14:41:26 +0100
Message-Id: <163698368315.132512.2195595073396495435.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028144313.9444-1-semen.protsenko@linaro.org>
References: <20211028144313.9444-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 28 Oct 2021 17:43:12 +0300, Sam Protsenko wrote:
> Exynos850 SoC can reuse PMU driver functionality. Add corresponding
> compatible string to PMU bindings documentation.
> 
> 

Applied, thanks!

[1/2] dt-bindings: samsung: pmu: Document Exynos850
      commit: a67cce83945170994fcef241b934699b6018b707
[2/2] soc: samsung: exynos-pmu: Add Exynos850 support
      commit: f5dc0140d483fcc6417d1d655481f0ff1de390b0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
