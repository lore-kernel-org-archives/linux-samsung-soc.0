Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A9C4CA279
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jun 2026 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026773; cv=none; b=DPwDSchiOiRwAB0kAE3G3ia3vAhheIflox7C+1kUGDStQijAAAMwLCt5Av81+feXz3zrzlaNHG+Kd7pyRJ3FRo3BS93ENf+d+QkBAMi9+ci7M+pmt9EiKd74RPcc34UanQv5kSMMjH4zbYM4v+BD1CqTNAc9Gl/nw6xGCL78M5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026773; c=relaxed/simple;
	bh=HnI0caHdpmOSArZpKOkNrIe2pGWQc/WccKwqJIBumVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bUMeEP4UVvT9uRWnGBbclofdSkY+Km4PuGXI2Tq0ZVAOlcNUxwe/1Hk/8UJSmFvznq8EJdNljSGd1LOEjJPAlsbd5VFHOLAo2wegLwyfHkaHxAG9cQ6K0Ag+yJ6xemF/juPTpbkaWnkMYgIlpisiGxlJQLrJilS6z2cC2nbP/aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h4g8SA4x; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4g8SA4x"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b12270b3so35169925e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jun 2026 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781026770; x=1781631570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXI8ebcI1laHpv8StR8ZbOvqbXt6rEwPLhMGagqpgZk=;
        b=h4g8SA4xpP1xFA50TZelGteKzNNZlqP/E00Zh9SRTs3iHYI1o5iXMHt0d9BkD8rcM+
         ++tCzayakPAzo74ivUKIcBKnm6RPeaihb18B7dMqhBY+aKWf6gsjzTxChjnJbL1jND9/
         V02rNclGoqu0duWqlQ6Uf2jsVoBOxhVE0lHxZhvCDO7D/YnBcN9NqUnsazlMcU35HW60
         VDURFuBpjHvdYkjWC+UyowE1JpWy+Umq1k9elKB7grP6QLQdjiI64rsEZZ4g/cOFjU58
         89bq2ih6dXtySR36meqeM/oYyDkzhrDGcvyEDVWXoOS4byGs34kys2IwMhRZtX41yDuV
         gsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026770; x=1781631570;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXI8ebcI1laHpv8StR8ZbOvqbXt6rEwPLhMGagqpgZk=;
        b=D69WXU4EZ3GYYtdyNBwEcKcnB/fSto53aa7b0WdoqjB5By6h2uDFfIMuaX3eCP961u
         ytqyLn/bc+IEmL4KRwNS0SLuboeiwZtE2/g0H5cfm5QRz5PJ+xRL7LJN9M6l5tri8TGh
         WkprXHcwjNFwW3tBNR/qsc+7brTx4EZq7VlwvWOmsAjWEpcBUvHen1x5n4JK603Y7MKT
         adK7Nl8pb8/QoUGpzP8dbHpxHVXd79la3z6vZ//HYEsVz5H2PlcDd98MYGVDng0sLvuU
         mUbKl7LSmBd8stAQTwKTbiQZJ0MFPn+mQTyjg7BzFft5hVP1+N9PogsyMwvqCO+QqDDI
         Ykjw==
X-Gm-Message-State: AOJu0Yyb/BVpUQUk2jQ09ICFkRHhaNInUR7jwj1xOJeV4dygHHg6LUd2
	JWOVOr0jOjTfzWFsMgbNvDdBX5+WFtQXjPYH189y7cHlbdHcnQjvafu7gqh73bnBeBzhIHyc4D4
	DUP3GO2Q=
X-Gm-Gg: Acq92OFr2tUWIHGDfIph6XwI0GKbFJ+jpKPCvFVoIi5Y1CaTex4me9+bs506hfxR3Bp
	nXw4Z8jWwwjOKcMckGjMpI2c5F/uZcZJhnoTvPfm8Mho9nmcKPK+Rx6gJOSEOOzrc1IGrlK5x7t
	b3P5R4ILAc2HIuKIWykRIt029vvtjrk3bkcBckA2qqJn2Ltnheo9fV7CzzrHzPSzv78h1iA7xfg
	Qbmxv5yVian/NjGjhIjb7bX+bPNZ29SqPnRiDK1mep/bWeSPT5h/bQ5lhewJUJYE4V7nyB2OYfh
	rMQRzWn9P8d18xjZ9atonLT/Iogr6q3jRhykpQA1XEycd+lq/TcbdjJTJzpgs+SJ6iIhGg/dyVd
	AbV3FFUzUHi3h+lLoVF6OeWT5Q/4BC6j8iRe6hCAOARFN0Olj2QLpbP5an/BwTAhtHRdrJHIj8Q
	timZRI4jnJ5Qc5ykuraza0A9Qe8S9Z/OlqtGwVqOsz0xLyBnB5uw7/8pwONV8qBFlHD+zgxbSTT
	wVPLkkDFXL3qJiCQKiX/NkXZko=
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr343307615e9.2.1781026770436;
        Tue, 09 Jun 2026 10:39:30 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fcf5bsm593605215e9.9.2026.06.09.10.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:39:29 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v5 0/6] Exynos-pmu: Generalise cpu{hotplug,idle},PMU intr
 gen and add Exynos850 CPU hotplug
Date: Tue, 09 Jun 2026 18:39:22 +0100
Message-Id: <20260609-exynos850-cpuhotplug-v5-0-8422cf80d43b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpPKGoC/4XRS27DIBAG4KtYrEs1gMGPVe9RdYFhSJBi44JtJ
 Ypy9xK7UlJFVpcD4hvmnytJGD0m0hZXEnHxyYchF/KtIOaohwNSb3NNOHAFnCuK58sQUi2BmnE
 +hmk8zQeqGseaSiE6XZP8dIzo/HllP79yffRpCvGydlnY/fQfcGEUaMVsZUpQQtT84+QHHcN7i
 AdyFxf+UEpgOwrPipG6UqAFctm8KOJJEbCjiKw4q7hkFrhm1YtSPhTJxI5SZkWWDo10Sgr1d6L
 bFlrE7zmvYNqSIz2mpNcVtMWqZ/9Xp2M/r/yYb09I17i32MBYkKZmuub2uUlu0emE1IS+91NbY
 FNbzgyroANmLTqhlAMuus4ZpzrBJDR5nyL/7vYD1TX5bigCAAA=
X-Change-ID: 20260226-exynos850-cpuhotplug-69f1976eefa8
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Series generalises the GS101-specific cpuhotplug, cpuidle and PMU interrupt
generation block support, which is currently implemented specifically for
the google GS101 SoC, to make it reusable by other Samsung Exynos SoCs.

The PMU interrupt generation IP block introduced for google GS101 is a
standard Samsung Exynos block found in other SoCs, including Exynos850,
and it is not strictly exclusive to google Exynos-based platforms.
Access to this block is required to implement and enable cpuhotplug
on Exynos850-based boards.

As a next steps it will be possible to enable idle states on top of it
(if we get our hands on corrected firmware).

First patches work on DT bindings to reflect that Exynos850 SoC predates
gs101 one and adding mandatory property 'google,pmu-intr-gen-syscon'
for exynos850-pmu.
Then series generalises ("Exynosizes") cpuhotplug/cpuidle routines by
deferring platform-specific PMU and PMU-intr-gen updates to platform-
specific callbacks and then finally introduces new file exynos850-pmu.c
where such callbacks are implemented for Exynos850. Last commit adds
pmu_intr_gen DT node to exynos850.dtsi.

This series wants Exynos PMU "fixes" series first to make Sashiko bot
happy. This "dependency" describes sequential order of commits.
https://lore.kernel.org/linux-samsung-soc/20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org/

The main updates are custom regmap for pmu regs to support PREEMPT_RT
cases -- we need raw_spinlocks there, minor adjustments in exynos850-pmu.c
and "fixes" series mostly reported by Sashiko bot here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=4

This series was re-tested on Exynos850 WinLink E850-96 board:
-- by spinning "chcpu -d 1-7; chcpu -e 1-7" in a loop for a few hours;
-- by running script [1] that randomly offlines or onlines random cpus
   for a few hours.

I tried to implement it in way to not break anything for gs101, thanks to
Peter for testing.

Thanks,
Alexey

[1]: https://github.com/laklimov/xlam/blob/main/e850_cpuhotplug_random.sh

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v5:
- updated the commit message of ("soc: samsung: exynos-pmu: add Exynos850
  CPU hotplug support");
- the if-check for the presense of pmu_data->cpu_pmu_{offline,online}
  callbacks in setup_cpuhp_and_cpuidle() was moved to before acquiring ref
  counter to intr_gen_node (the initial issue was reported by Sashiko);
- added pr_fmt to exynos850-pmu.c to have more meaningful error
  messages;
- added parentheses around the `cl` in `EXYNOS850_CLUSTER_CPU_OFFSET` macro
  (as suggested by Sashiko bot);
- custom syscon regmap with raw_spinlocks for pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- using topology_cluster_id() and topology_core_id() in exynos850-pmu.c
  (the initial issue was reported by Sashiko);
- removed smp_processor_id() usage fomr pmu offline/online callbacks
  (the initial issue was reported by Sashiko);
- added/resorted headers in exynos850-pmu.c;
- Link to v4: https://lore.kernel.org/r/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org

Changes in v4:
- remove blank line in file exynos850-pmu.c, commit (as suggested by Krzysztof);
- only update trailers/tags in commit messages;
- Link to v3: https://lore.kernel.org/r/20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org

Changes in v3:
- dropped two commits where samsung,pmu-intr-gen phandle is introduced and
  where google,pmu-intr-gen-syscon is deprecated (as suggested by Rob Herring);
- addtion to maintainers file was moved to separate entry, change commit message;
- commit message in "generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs"
  was updated since it no longer touches samsung,pmu-intr-gen-syscon;
- added missing asm/cputype.h header to exynos850-pmu.h
  (reported by Henrik Grimler);
- new commit "dt-bindings: soc: samsung: exynos-pmu: Require
  pmu-intr-gen-syscon for Exynos850";
- Link to v2: https://lore.kernel.org/r/20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org

Changes in v2:
- moved gs101 cpu {offline,online} callbacks to gs101-pmu.c, updated MAINTAINERS;
- added new file exynos850-pmu.c with cpu {offline,online} callbacks and
  exynos850 pmu data;
- new patch that adds exynos850-pmu.c to MAINTAINERS;
- moved pmu_intr_gen to right after pmu_system_controller@11860000;
- merged two patches that update google,gs101-pmu-intr-gen.yaml together,
  now rename and adding exynos850 entry goes in a single patch;
- commits 5 and 6 from RFC series are merged together and reworked,
  cpu_pmu_{offline,online} callbacks are moved into pmu_data struct, and
  callbacks now need pmu_context as an argument, exynos_pmu_context and
  CPU_INFORM defines are moved to exynos-pmu.h, gs101 callbacks
  renamed. It is really better to check commit description.
- Link to RFC (v1 from b4 point of view):
  https://lore.kernel.org/r/20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org

---
Alexey Klimov (6):
      dt-bindings: soc: move,rename google,gs101-pmu-intr-gen and add exynos850
      dt-bindings: soc: samsung: exynos-pmu: Require pmu-intr-gen-syscon for Exynos850
      soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for Exynos SoCs
      soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support
      MAINTAINERS: add Exynos850 PMU entry
      arm64: dts: exynos850: add PMU interrupt generation node

 .../bindings/soc/samsung/exynos-pmu.yaml           |   1 +
 .../samsung,exynos850-pmu-intr-gen.yaml}           |   8 +-
 MAINTAINERS                                        |   9 +-
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   6 +
 drivers/soc/samsung/Makefile                       |   2 +-
 drivers/soc/samsung/exynos-pmu.c                   | 146 +++++++--------------
 drivers/soc/samsung/exynos-pmu.h                   |  34 +++++
 drivers/soc/samsung/exynos850-pmu.c                |  95 ++++++++++++++
 drivers/soc/samsung/gs101-pmu.c                    |  49 +++++++
 include/linux/soc/samsung/exynos-regs-pmu.h        |  15 ++-
 10 files changed, 258 insertions(+), 107 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260226-exynos850-cpuhotplug-69f1976eefa8
prerequisite-message-id: 20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org
prerequisite-patch-id: a36b838f6524b89818ead01648e27177f002b1b1
prerequisite-patch-id: 85901b4ed10abf67809a9f28bd2be52356f93526
prerequisite-patch-id: 6e4d2217a7231375df85a12910badb8b2b8e1fd6

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

