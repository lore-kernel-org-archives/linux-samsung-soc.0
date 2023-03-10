Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3D4C6FD1E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 10 Mar 2023 21:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232206AbjCJVrg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 10 Mar 2023 16:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjCJVrG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 16:47:06 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0488149D0A
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 13:45:03 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id i34so26044736eda.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Mar 2023 13:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/tNj9gS25pI9VyRe21DRJsXFmXi538O3sDmJsaIhbM=;
        b=mHe+pKeIu1CXbogKykneE+Fc+HhQ3E2/eoguPMQut6YTvOAz1EhASWFdf/7bfL247/
         z7QRjGBRyKglxyCfaEAwl3mzkZlUOiSlzskD/okpjWOrGvwcDsyatzbEXNKNZfDvRkQ6
         WzGjeE5QzI7y3yg9pMftyw6nAGAPsLUZA27z00CtMF+/+cCRmc4mBJxLiG8HuSgOupKf
         QmZa2V1EY12i0B60PKfX2Fivzd9kV780zd60tYf7MMADlormeIe1BOWMbUUD2E7XNBoj
         f8dksX5HAgHm2n8OJQzR7k61dlBN+uEAbUHOq+A3yL+uNAy0SWLHBy7NXjJLWZKBmi0S
         fTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/tNj9gS25pI9VyRe21DRJsXFmXi538O3sDmJsaIhbM=;
        b=Dp47GXw1b3REFabAFkhgaRzM9/pUO1s3SbqY0h84FIDb+GHIi8QiAn2HZfZ9FzSilO
         2IAOuGEv8PHzVxM2WzK9zTkYYOvPe1kV+l+JwoKn49WE0CLwQfCfaUHv5Zhj7HAxeOnC
         OJc7WfJ2Ic9G/pK7HvVdJ8plUS1BZX/nwXt5l//7SyW/9ok88E3tLltdPhYPmxYfzonY
         ZpS2n0iu1rBheTfQ+3WrqCkNeAx2b1q2ASezM1lAPj6nIV4PFchwiiZsk4LG8Lr1kJ0h
         JIQ6HweHNq/tw/u5WALfq2BdQ5Nc36iWfrlHacrdgmmW7xknooP5BcIWG+SNdI7kaR7g
         dreg==
X-Gm-Message-State: AO0yUKX8SbPEBWTZOVdTEP9+XPZwPydQvkbB6fzR52H1Ovg0xm5LMyIY
        khm19DdPdwQ+9PQrcXsM23iGsA==
X-Google-Smtp-Source: AK7set8DLp9mJ4FR8mx3RvxrKuccd1KMSGK8/5PRNVTAH2zIEOB1tnCrI4pH8lb5tGq2IO0YUqWmjA==
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id sd15-20020a1709076e0f00b00907672b736amr33166740ejc.31.1678484680278;
        Fri, 10 Mar 2023 13:44:40 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090627cb00b008cce6c5da29sm334571ejc.70.2023.03.10.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:44:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] ufs: exynos: drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:44:34 +0100
Message-Id: <20230310214435.275127-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214435.275127-1-krzysztof.kozlowski@linaro.org>
References: <20230310214435.275127-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/ufs/host/ufs-exynos.c:1738:34: error: ‘exynos_ufs_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 7c985fc38db1..0bf5390739e1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1761,7 +1761,7 @@ static struct platform_driver exynos_ufs_pltform = {
 	.driver	= {
 		.name	= "exynos-ufshc",
 		.pm	= &exynos_ufs_pm_ops,
-		.of_match_table = of_match_ptr(exynos_ufs_of_match),
+		.of_match_table = exynos_ufs_of_match,
 	},
 };
 module_platform_driver(exynos_ufs_pltform);
-- 
2.34.1

