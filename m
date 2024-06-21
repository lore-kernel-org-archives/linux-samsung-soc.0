Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720616E893
	for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718970951; cv=none; b=suUpX5nTLhKv6alaFs7Unpf5bvi6G+i3t5Wm95uYUY6f+0Vy9lOCVj6hHEPdA/QGSGKoZFfNF8Ckb/LlGSh4TmONveMd1q9hm2gSPiRSOe+l2KDOun8PKw7SonCZFuSZ8K6lOHY22BjAY6t8lzlPL7CnKTBJhSNtIPLVLCUITPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718970951; c=relaxed/simple;
	bh=gIYUPaRLaqQdrTEadtQVbh9QzpoHT0q2BKQGmXoTq3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afguYZkoCpNiLMgBItEFbVJNV/tm6cVX7PZOiKj7dYvPTWXoJNPpPC82FvVycORk/J8nqGnZ4jOItYbKHG7QdbqJURECdG0g+z0cIUZZsBomXzQMNPiEOraLZjMq5WcCmuOG0yRztIvFdYpPzSmOHIsBgJGZsaYSTUm0k3qrKuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3PxiIeg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3PxiIeg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-421757d217aso21779245e9.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2024 04:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718970948; x=1719575748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PCo1F6Ya6OR/yQ3uF5qfJxG3DZzXGFh5E4PjRee+Y8I=;
        b=P3PxiIegdjukZ5RoJbZ+iua/AQOSvTb0zI6+zw7D22mM5Um0EuRGYE1rY8cWrL/nyz
         ZRRAEY8BHfvA/LuV2dZjwd8HmiKLs5pwMBNUKExJYRYaiZgJ945N+5yge1CayIFsjHAq
         w8r33Ah9D9YrnXXU2m1g1gumm3tXvUwUKwRym3ZTorAvSLAcJUtpsZgLO6TUnZjQvFEL
         d2iQZnAfsa1GK6geFVW1WyVQxEaxQRbwoPYBNbHz2xpO08TlF52Xpf73vgAlRzL9Cx1s
         JRNMCmDn98yfHuCsRXfj6GtUk7vYBhocKiuev94M808sfI03Oz3Z5g32t9yMAqNQZkyx
         T7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718970948; x=1719575748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCo1F6Ya6OR/yQ3uF5qfJxG3DZzXGFh5E4PjRee+Y8I=;
        b=UtcsKwhGzJgWgKraW1sgBfXw7y0CCsFI0zRkLvuKi9fW0z9G5MLiU3btwB1GkC+ed0
         sJSXOIB840BM1OM1QmCXEDhTOFHtv5+m8G2WXAOT6leaq7PpvKXNVxsBKcPC1znrwBGF
         3PZpUxc1AXSQVzQVrsamP+5zGPc/Rrobtye65NFygggeF8ZA/CxPffmzl0eu2snxDLso
         c0/Vn8488ys9c7oxx5baeRTjbnhKWFc6D+LFrtkCwIAcKrWtwHQMHmPwT+ho9WlB0goZ
         K5/fOnkwu0SDrJCXRYzs6CVjaJpqhMEoY59YxP0t6ekytH1mcTcLvVvLPEyVgbD92lwT
         ngAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+U9d+zaEZlLhlr6jz6aco9pSeiO8kKnRoMiDXYAYIVGgKr96G+5UHMr8fIzSHFo8Bcqxk2P9IkgiZBDNPFGyOwSEUQfnZ1mv0Rvt6LbF5YfU=
X-Gm-Message-State: AOJu0YzUwbsQOjFQSqmiAFQNhdn7Js6QOHzhMy4tzRBvuhti1FECThMW
	6dMKKbrLbewwtQg7nL9m6ydwpAD5TNJfle/czlMQqMQ2Au/TD/dNQb9d5fT9Plo=
X-Google-Smtp-Source: AGHT+IG2ZzeF2yecrvNq84hEyosATlepWWCUYD4rioXxs0/RdSHjwr3JFRh5RYSXgIR/x10AU78J2g==
X-Received: by 2002:a05:600c:6a8f:b0:424:7b64:18da with SMTP id 5b1f17b1804b1-4247b6419ecmr62155565e9.0.1718970947732;
        Fri, 21 Jun 2024 04:55:47 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510::3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208dcesm60386725e9.31.2024.06.21.04.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:55:47 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: lee@kernel.org,
	arnd@arndb.de,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/2] Add syscon of_syscon_register_regmap api
Date: Fri, 21 Jun 2024 12:55:42 +0100
Message-ID: <20240621115544.1655458-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee, Arnd, Krzysztof, all,

This series adds support to syscon driver for a new of_syscon_register_regmap()
api.

Platforms such as gs101 require a special regmap to access PMU registers, which
in the existing upstream client drivers are accessed via syscon regmap. This
issue was partly solved in [1] whereby a custom regmap is created in exynos-pmu
and a new API exynos_get_pmu_regmap_by_phandle() created.

One issue with the approach in [1] is that it required client drivers to be
updated from syscon_regmap_lookup_by_phandle() to
exynos_get_pmu_regmap_by_phandle() when obtaining the regmap.

Whilst updating to exynos_get_pmu_regmap_by_phandle() was OK for exynos
specific drivers, it meant other drivers like syscon-reboot and syscon-poweroff
which span multiple SoC architectures could not be easily re-used.

In previous review feedback for USB phy and gs101 poweroff driver Krzysztof
requested [2] that we take a more generic approach that other SoCs can also
leverage.

The new of_syscon_register_regmap() api overcomes this limitation by allowing
a SoC driver like exynos-pmu to register it's SoC specific regmap with the
syscon driver. This keeps the SoC complexity out of syscon driver, and allows
client drivers to continue using syscon_regmap_lookup_by_phandle() as before.
The solution allows more code re-use and can be used by other SoC archs.

Notes on probe ordering

exynos-pmu runs at postcore_initcall, so all but one of the client drivers
(ufs phy, usb phy, watchdog) run after the regmap is created and registered.

The one exception to this is pinctrl-samsung driver which is also
postcore_initcall level. The exynos_get_pmu_regmap() and
exynos_get_pmu_regmap_by_phandle() have been temporarily left to support
-EPROBE_DEFER for pinctrl-samsung driver.

The longer term plan to solve that probe ordering issue is to enable
fw_devlink for syscon dt properties so they are correctly listed as
suppliers in /sys/class/devlink. I tested a PoC patch (see below) for
fw_devlink and that seemed to work fine. Once fw_devlink supports syscon I
believe exynos_get_pmu_regmap_by_phandle() api could be removed. The main issue
currently with fw_devlink syscon support is the wide diversity of dt property
naming currently in use. That was discussed previously here [3]

1248a1256,1257
> DEFINE_SUFFIX_PROP(syscon_phandle, "syscon-phandle", NULL)
> DEFINE_SUFFIX_PROP(pmu_syscon, "pmu-syscon", NULL)
1358a1368,1369
>     { .parse_prop = parse_syscon_phandle, },
>     { .parse_prop = parse_pmu_syscon, },


Note one previous concern from Saravana about syscon potentially probing
before exynos-pmu driver and it relying on drivers/Makefile ordering. I tested
this and even if mfd is listed before soc in drivers/Makefile exynos-pmu
always probes first due to syscon driver not setting a .of_match_table entry.

Once the syscon and exynos-pmu patchs are queued I will send patches for
watchdog and ufs phy drivers to switch back to syscon_regmap_lookup_by_phandle()

Many thanks,

Peter.

[1] https://lore.kernel.org/linux-arm-kernel/20240219204238.356942-1-peter.griffin@linaro.org/T/
[2] https://lore.kernel.org/lkml/06383015-51b2-4f4c-9fd8-e4f7ce12f44e@kernel.org/
[3] https://lore.kernel.org/all/CAGETcx-CCpaV7R0O0HpDpoX6KxQBuJiMmKdWA8nDE-5Qj2Sa7g@mail.gmail.com/

Changes since v2:
 - Move allocation outside spinlock area (Arnd)
Link to v2:
 - https://lore.kernel.org/linux-arm-kernel/20240620112446.1286223-1-peter.griffin@linaro.org/

Changes since v1:
 - Collect by tags
 - Keep syscon lock held for check and adding entry (Krzysztof)
 - pass pmu_np not np to syscon_node_to_regmap() (William)

Link to v1:
 - https://lore.kernel.org/linux-arm-kernel/20240614140421.3172674-1-peter.griffin@linaro.org/

Peter Griffin (2):
  mfd: syscon: add of_syscon_register_regmap() API
  soc: samsung: exynos-pmu: update to use of_syscon_register_regmap()

 drivers/mfd/syscon.c             | 48 ++++++++++++++++++++++++++++++++
 drivers/soc/samsung/exynos-pmu.c | 38 ++++++++++---------------
 include/linux/mfd/syscon.h       |  8 ++++++
 3 files changed, 70 insertions(+), 24 deletions(-)

-- 
2.45.2.741.gdbec12cfda-goog

