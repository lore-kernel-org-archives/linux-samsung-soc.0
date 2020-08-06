Return-Path: <SRS0=KIUv=BQ=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1059C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:32:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0B0B221E3
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 Aug 2020 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596738740;
	bh=VAU1eGfzCZfS7G3FX+Wn/xXTQQH5HorEtjLf+F1OX28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=L7mVSN2gE/nkqsaXrMg6s3NxcCFOOljUsl3GJrQkIlXadaRQ/26d5g6SfTTvFsaFm
	 6hljokizOt4otwIBFp372mlwa+k5BQtbyp5EAdgO2e7DP1HAh/Y7koMIiX+NqOAYCS
	 Q9gDG1foZDMninrR4y6ABpECf1DVFmay9hucm9Oc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728545AbgHFScK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 14:32:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbgHFSbM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 14:31:12 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C1CC0617AB
        for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Aug 2020 11:30:13 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c19so7103643wmd.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Aug 2020 11:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:resent-from:resent-date:resent-message-id
         :resent-to:dkim-signature:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=GgIOF6fyOLm4ikN+dwT8dD5n4ZkgAd1xYodf6BTwDNg=;
        b=B9z2cGZ7qqv45cLkEZjfohTRMNsbT3ejiM3BfLC3OXytMv1OkcEkAkaaUJaHJPhWpL
         MwM1MbtZs6RXR0iQVBNgDtVd8Oakvd2JCo2zvdmIfyfsui0XeHcgADC4XHafwHvzY7JH
         X7gC0JnqlE6wmwcUFS17csusyNYpVh9js6e8zSjijWTWre3prRYLo4hWlmrnepoHSYPg
         4dyjWHCY2m6Blg8+gZRmjNIei6pbeAe1fuNd40+P5Z9u4lYAlgGfn1uYm5QefcQ4Zzbf
         gXl0MPVaIC0BFkcS98IzPdFRVzKUt1ROYr9Q7jZb4zRYwZT6Ab+PTcHyg00vVkVFVyqW
         cL1A==
X-Gm-Message-State: AOAM530ZyfF0g6uPRsWXRmoJU3h5LGq3/qyv2cV8UYW7mhSb3jX2QSzo
        0qr3gIIp00ptFmowxsXL/rALftR8UUE=
X-Google-Smtp-Source: ABdhPJxl5MUeWEL7oVbFhojCa/tPtimCBT0VkhOj21t9+a610kxFnfI+NV9BgUMt504vgZ+vbwktKQ==
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr3624303wmj.129.1596738612172;
        Thu, 06 Aug 2020 11:30:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.117])
        by smtp.googlemail.com with ESMTPSA id o125sm8298042wma.27.2020.08.06.11.30.11
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 11:30:11 -0700 (PDT)
Received: by 2002:ab3:1105:0:0:0:0:0 with SMTP id j5csp1542887lta;
        Thu, 6 Aug 2020 11:25:21 -0700 (PDT)
X-Received: by 2002:a17:90a:e643:: with SMTP id ep3mr9895831pjb.18.1596738321257;
        Thu, 06 Aug 2020 11:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596738321; cv=none;
        d=google.com; s=arc-20160816;
        b=N1XyDugyBKUwiBWBUBjvNFj2xUeadcOwUKFNzLc69oUrH6WTd2HHpPMjhiMcw/pJ6t
         N62bO2N4a7xr7/2x4vQ5HDfx1oNlzORBK/X4o8pr40/xpo6uswB537nox8iFuljI5HWR
         M+O9E60PDybqrIehP9sMhG+O7ZzJjjC+sHL/efttA6tIpXVdUjx9KbCgFOKCUZj+A680
         uNc9WZISpnlFXsV3fcrghluOG+zQezKqKd0Qql90aDBDrva0nt1UmiGIWDvVGj21ayWC
         2n3Wh0WtDCMu2EW2kC3atC8AX8aoW2Ltmt+5xQxJvtnHCBVEfmuTdqZrADS6nyQjx8+Z
         mnDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:delivered-to;
        bh=GgIOF6fyOLm4ikN+dwT8dD5n4ZkgAd1xYodf6BTwDNg=;
        b=hjBMOjkw9HJya5fjlYA59yKkXbdBn35VL3IFotbmwhQqu6Tp06tSLSEsVgH6ndD02p
         ZJZ0QCpYnFEXY17H7uJh5JJ0ReMvBX9szB4k9eelChjD2h+AyvxX6dEzvhRhJyWCc2HO
         w/9ZvPG5YUv7jr9/DDqE9k50YZibeQcmWI2VtCIvEsIMyt+3aBBsCDoKkpDilva1+oQK
         LGqq8kPo/IYSw8NmLQ5aqmAbchRwT3fdhE0Lzo2hzQu3OyW3kOH1N2n7pLW3HQBU1l5f
         GH3PaOGb/dWBg+s7alp22kMveWuNJIM4ezwoJXRqxRu4sXMOoxj1bbYka2JlAwm5kdS0
         feKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=EXqHoFUB;
       spf=pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) smtp.mailfrom=krzk@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from mail.kernel.org (mail.kernel.org. [198.145.29.99])
        by mx.google.com with ESMTPS id h7si4259802pgi.405.2020.08.06.11.25.21
        for <k.kozlowski.k+kernel@gmail.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 11:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of krzk@kernel.org designates 198.145.29.99 as permitted sender) client-ip=198.145.29.99;
Received: by mail.kernel.org (Postfix)
        id 6A8FB23101; Thu,  6 Aug 2020 18:25:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E5F623102;
        Thu,  6 Aug 2020 18:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596738321;
        bh=VAU1eGfzCZfS7G3FX+Wn/xXTQQH5HorEtjLf+F1OX28=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EXqHoFUBTp6Wfsbm9vRJqQUKwEuV8d/XmfWKVnu+R/hlUZPEP0voCFwpiql36+fxN
         aVXfleK8EVRRbX0y8jxECPsZOaSciaIITxd4jglIIpSQ8R+zRbAXAlo6GjrQ1waz/y
         fqaLnN6L+cykz+Rh4mjkkNs96GoIwR4C2gn4J77I=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 41/41] MAINTAINERS: Add more name matches for Samsung SoC entries
Date:   Thu,  6 Aug 2020 20:20:58 +0200
Message-Id: <20200806182059.2431-41-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
X-TUID: 9/YpJcP7Bxdz
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Samsung SoC maintainer entry covers drivers and headers matching
"exynos" name but except that there are also files for S3C24xx, S3C64xx
and S5Pv210 SoCs.  These sometimes do not have a separate entry for a
driver maintainer thus might miss review.  Add them to the Samsung SoC
maintainer entry to cover all SoCs with name matches.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c74aa41e35b..7dcd9305a622 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2422,6 +2422,9 @@ F:	drivers/soc/samsung/
 F:	drivers/tty/serial/samsung*
 F:	include/linux/soc/samsung/
 N:	exynos
+N:	s3c2410
+N:	s3c64xx
+N:	s5pv210
 
 ARM/SAMSUNG MOBILE MACHINE SUPPORT
 M:	Kyungmin Park <kyungmin.park@samsung.com>
-- 
2.17.1

