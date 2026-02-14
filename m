Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D5228D8D0
	for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771093179; cv=none; b=m2MHAcDJNDZAPS7cge3Uo9KuRV2vRy/JlidXNeY6b4dyiK2z4RnaoxQ6zmMqlBJA2Z9anOEgqX4l2FxZSNT9O5HozFxqqmNd/JtcIdup+hNI8aLAUZ0Ug+RDCcCcqeNrDRXQuMvEIyl+oRfyTxkIr5PqEhCVsJ8ckDHkbAgVvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771093179; c=relaxed/simple;
	bh=Z5DKtGR8+CrDHXa8SPC7JtEYn8mGrUmgCA/wZCeWqoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OtAo0IzJVQE8lFInP7BiHZOToIMCg5P/oS1yYgMeNFNqALhbYNl8rPks+PzIlwxNCuWDWRulJNxxN+homFdUzBJeFKaASLXeMvbT54JbzxGkCsxhWc8zOMU4Hd6kb0Lwevbp3ZOZL+qnYqLrZNdHv4Y1bAgkvAcMwCbE0spN3qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8BJun/M; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8BJun/M"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a871c8b171so10956265ad.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Feb 2026 10:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093178; x=1771697978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZthU/dBSxhU1jw5Zz5Kc0iDhp0uS8p8MD7uxvdSwEY4=;
        b=X8BJun/MdqJC8/Qmg2IiogO/YEsr7EMtbsLDvPuJHuGvLXsMtrLaQAK8CBpBz+RMdG
         oppVlPTTzEn36m+e7jFJednO6hNJFeMkl9M93CvZo32NNDuiZWgyiPNjRADBXehHs1VU
         7exT1N3PkXaxqZXTvt53H4QedYh93Zonx7dw7p50z5y2Dh8dHUWbrozWKsiQ2RHM0OLf
         jVxKbF2GFnFYiR/sHdpFeb/eALIli1co2OISspTiQ/WhcU4h3LWA4W3/t9okVRFPxDtJ
         RX//kFu1RQ+AOnXD8wGzgDqxKZRj6pO4R/oERIzdhmnBUIvhlvy/XuDAiytINAkfFWEV
         jFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093178; x=1771697978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZthU/dBSxhU1jw5Zz5Kc0iDhp0uS8p8MD7uxvdSwEY4=;
        b=KwIt9NeqURUuLkU1x5cM34xHuJ3Kyd4t+wp8d+Yzjpk53EeTgJbBb60XlEL9TGYjtG
         AZTpsvC3pJGCXJOtavlUNQYE6dX6tsLvojZNPloZ4rZm1G6UPA3ms/UjBtJmkgCRRlku
         xQaPfCXQ5kHQhnTzGaCk1FOx1uY9qlYD7V7Rrdll6Qgo2HyyyJPJYq8IkeakrSMJ4H61
         pi2/w9Lb6O/W4+TwszgYF820bL7zSfIp2n2Jm99lIdJXUpbnPQ3qsRjPI2RAWMqJ3Fi+
         MTcmXIINuju0NSG3LL/AKkTyXAkyNIPCTwktNyXF9Umg2oSFFlUBvtUVGRB7g1ratjX1
         1umg==
X-Forwarded-Encrypted: i=1; AJvYcCVHB54mqEb/2124ka6sBk6ZUOKr2oRhME0NjAbmBVZs9vC9haNC4k7K4MMcuGZgK5+22q05iVwqJQxW4Naplzgf6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAgGOWIBRGSSLp/Mac4BtzBzl01kFtDqgsZwsMUmOyHpaS0GbX
	Ewlb+6MY7QntnDPwGla6S7+e2RK9ZmnxQGRyyoYnLkq8L9R0lXhhLw7V
X-Gm-Gg: AZuq6aJLPA19Lff/BEFjt5qpT/6QSfhdXgQoWd6sE53rIEsnsqIdCm4S2ssWhP5kEO7
	qS5GmykIRuEsyznE1kmFSnpjKYHEYT64V4QPobM58o6TqXaEHfTLTA8WQtvec7TZN+klBU4+pUn
	Dg3SR+C4Wo8HzQZTmnwXX7iflEiuh6Axtjvzu5nwHpiN35rOWFg2DLi02OhDhBrhtqc9nn9+tos
	HPtgxrhf5GXcbQ+jVIOv4ykjEuLKkjFLHJ8am7zV1X/fwNR39q2iL3C/pOL1zYkAGmcTO2lrg0L
	Mi+0pnBhTHzpQBCjPapVZSkDs9gBWiMieiyntoBnbHccYIaHNaIJDgCoPC8le3Uk68VhrCwbOvi
	oudxWzsaT5OawpPoEdqPlxd9PODRxhvtpaOdpqsU1wOA0ZABVuSbLFyIf/v3YgqbcpfVahGVJ/p
	Uu/pCVCzyHsjTzVRkPxGo=
X-Received: by 2002:a17:903:37cc:b0:2a1:e19:ff0 with SMTP id d9443c01a7336-2ab505cf397mr61192685ad.39.1771093177563;
        Sat, 14 Feb 2026 10:19:37 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:19:36 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 0/9] Exynos Thermal code improvement
Date: Sat, 14 Feb 2026 23:48:57 +0530
Message-ID: <20260214181930.238981-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

This patch series is a rework of my previous patch series [1],
where the code changes were not adequately justified.

In this new series, I have improved the commit subject
and commit message to better explain the changes.

v8: Refactor SoC-specific configuration to new exynos_tmu_soc_config
    structure which help clean up the callbacks.
    dropped the IRQ clean up patches, with new approach 
    it will be much eaasy for new SoC to be integrated
    and the code will be much better way managed in the future.
v7: Integrated my RFC patch which improves the IRQ framework
    for all the SoC link below.
v6: Add new patch to use devm_clk_get_enabled
    and Fix few typo in subject as suggested by Daniel.
v5: Drop the guard mutex patch
v4: Tried to address Lukasz review comments.

I dont have any Arm64 device the test and verify
Tested on 32 bit Arch Odroid U3 amd XU4 SoC boards.

Please sare the feedback on this.

[7] https://lore.kernel.org/all/20250813131007.343402-1-linux.amoon@gmail.com/
[6] https://lore.kernel.org/all/20250616163831.8138-1-linux.amoon@gmail.com/
[5] https://lore.kernel.org/all/20250430123306.15072-1-linux.amoon@gmail.com/
[4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
[3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (9):
  thermal/drivers/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
  thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
    clock
  thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
  thermal/drivers/exynos: Remove unused base_second mapping and
    references
  thermal/drivers/exynos: Refactor SoC-specific configuration to new
    exynos_tmu_soc_config structure
  thermal/drivers/exynos: Relocate exynos_sensor_ops for forward
    declatition
  thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU
    probe
  thermal/drivers/exynos: Fix some coding style issue

 drivers/thermal/samsung/exynos_tmu.c | 501 +++++++++++++--------------
 1 file changed, 249 insertions(+), 252 deletions(-)


base-commit: 770aaedb461a055f79b971d538678942b6607894
-- 
2.50.1

