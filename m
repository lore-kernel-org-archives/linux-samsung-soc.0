Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700901862A
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002292; cv=none; b=GeKMSalOjY2RrjigL1tdShClYlRKcauNDXK97NXHjKx0un4Ij42EfSpsWYns6z7dxUOJFRBVG1Cytkn+MKwAmNdkJowoDINaTV1vvFpnC1GH8BZcSj/k8P01K0aY/nquQS/nHymNmbY8rcIMIlLiLj85W5R3nUBhgSjUyU5fQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002292; c=relaxed/simple;
	bh=NQ+MP9UQFifKSu2VgBLJEdIPCQK7TBnKXvvEwCt38zA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lyaEchUQfVd/UG7YwKqyK0+9wq5iLRZnntAVD1o+9EXyhgH1h1VQUHbYTn4NPC+hxNtFh+OirAIDI4xLmGCcdefJ5CBBobZUaBxnqYY1SnCTcZZC5uq/a82NJLEQYxk1278SV5+FH2mXNfTC6UzaXwIYRiZQYjdX4bgtOuBnWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oIDG4Fop; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oIDG4Fop"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3d5088259eso97626266b.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760002289; x=1760607089; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D8Y2hQ4PF+BjFgeq/9cHEzG8SplUoZPxKltHoG6YiyA=;
        b=oIDG4FopgDy4ZLRQWEQbN3zxezy+v0+ZOG/dnP+3Kn+CQjmx22HaT+jUfCotIW7QWp
         Ezkt7bkg3Uyn5ZYLgqWLI/LSPPb85jHVkQM8vq57bdJytF09o1ScaF5zJ5qoQ4gVRSfj
         SWIrOG2QD04UKo9SuV/1pdMmnHiaSTf0nwAg/eDPLXqms6TOKKv2RcVPDMvcdfy4Zd6E
         Bl6nuXHR6ZTam+CJnWd6y2axftlmYfXKmQCYfteIob8C6+Qcwq+YW9BOaElLgj6CXROE
         SfQWU0QI8zbrNUKqDGAzIsD+6fDqYrJnCuU5MmMasMVu7HrENNpCMFgmYsji2xBp7qpL
         V2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002289; x=1760607089;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8Y2hQ4PF+BjFgeq/9cHEzG8SplUoZPxKltHoG6YiyA=;
        b=jF+au9N+r4dIvdsZQpwb5Ub+Xy1dye+zcjbkAgRjZF9RXIC1qmMGob+pyUKZMJrlOU
         dizrcvrzrWFZmdfpXjQXovIYSOQCEnyKBbaOKvpTBhahc2cc/GxkNhmZUywAVvUCuBFU
         VzXx8FN+QV9VB/no39iHo3bXIW92HRE0jQIMIoOQMbTMzVaCrjjnyqys6pk0V1CHd5Vn
         oNM6ASY11rNWiRW+qk7+PvPw1qF0CR1fow4yG6WPAiMJInX0avFumsPa9FOuFHZYgLnz
         bP0bDQ28zV1Ktel8llI3u4+LzyNUz0DKMdgOvnjAzyuRbtrtWxJ1+5Rxfat2vITfshjt
         J8GA==
X-Forwarded-Encrypted: i=1; AJvYcCWko3LhwTipoPYnKGiXg/3F8zuS0tCyj4Pc7CTb/T57YnuTD/ioVMBcOTVSe0JPMFT5N+krqmH7VUf1k8NWDdgwzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRHrykd2G06YCqy2oE78mMOZXiiJ7bCypEVgRUzoSIIm090KRi
	d8y0bPgfnsOZ1ax0cIQsAjsKA5F61gmocJPbjiMMIR+mNsLFGhhZnAvQG+TQ1kdOR1M=
X-Gm-Gg: ASbGncvM2gzmCPrhVsF3ZxfHHqnUcjvLC/KOkQnUcsEpV0ChPH8UbAqkd7llIlXQeg7
	ao+aHQKm9qNW8FIun+NWRuAzixv7Cu67yWVYLnCs+wb6+T165xvCdRAiKkEvi0xAIXGeZ+9lUvJ
	9C7JXPgVCqfD2If1zbhuSltztKHKJuUjywWK0QGZLRejoRZvAA+WZ+H8OtJWPpmAo2vL4CB0UwZ
	Iu4n43uACoBppeyzF3LvAV74JRaKbzEu/O1t2NGjIsfHeGQV2ZEPYgLfGkHpSNMn12WYLE8581i
	55qGaklxYHd6uaG70rphD+WjippJorERyYBIibTg0n2+6jXKg25JVmVoh6jYltbAQNkaAaKKjvr
	mmvPiCPWdIVuFIVbu8OrW396PfoHb2eS8oNfZPDw9VgNu0McNo4UTzpkxB4um7z9J0O6kgXtMBd
	kKA2/pbc4eyQ3Mvre/oU7yspECt095e+22N7MmHHbV1KfeMle4TSI=
X-Google-Smtp-Source: AGHT+IGbdEUE3PNoZYCS6NfJhqFXaPk0SnM9PnNIqtON966v5IoYDwxlU8rH3tGA/l00b+ZA3818Uw==
X-Received: by 2002:a17:906:6a14:b0:afe:764d:6b22 with SMTP id a640c23a62f3a-b50aa48c4cfmr690831366b.9.1760002288707;
        Thu, 09 Oct 2025 02:31:28 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173a41sm1855670766b.87.2025.10.09.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:31:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] soc: samsung: exynos-pmu: gs101: avoid SError for
 inaccessible registers
Date: Thu, 09 Oct 2025 10:31:24 +0100
Message-Id: <20251009-gs101-pmu-regmap-tables-v2-0-2d64f5261952@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOyA52gC/3WNwQqDMBBEf0X23C1JRKs99T+Kh2g3cUGNbKy0i
 P/eVOixl4E3MG82iCRMEa7ZBkIrRw5TAnPKoOvt5An5kRiMMoVWSqOPOuU8PlHIj3bGxbYDRaw
 uprRd7aoiJ0jrWcjx6zDfm8Q9xyXI+zha9bf9Oc1f56pRoXZ16VRtFLX5beDJSjgH8dDs+/4B4
 FuICL8AAAA=
X-Change-ID: 20251001-gs101-pmu-regmap-tables-8726ac9f853e
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
X-Mailer: b4 0.14.2

Accessing non-existent PMU registers causes an SError, halting the
system and rendering it unuseable.

For gs101, we can avoid that by creating the underlying PMU regmap with
the read- and writable register ranges in place, because on gs101 this
driver controls creation of the regmap.

This series updates the Exynos PMU driver and gs101 in particular to do
just that. For gs101 this is easy, as the exynos-pmu driver creates a
regmap and we can update the regmap config to pass in the registers.
For other SoCs it's not as straight forward, as syscon_node_to_regmap()
is used which doesn't allow passing a custom regmap config - those SoCs
are out of scope for this series.

With this in place, invalid registers (by drivers, or even plain
debugfs), are now simply skipped by regmap, leaving the system useable
in that case.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- Sam:
  - add regmap_access_table forward declaration
  - add kerneldoc for struct exynos_pmu_data
  - update gs101-pmu.c header to C-style (Sam)
  - ctx -> context
- update commit messages as appropriate
- collect tags
- Link to v1: https://lore.kernel.org/r/20251002-gs101-pmu-regmap-tables-v1-0-1f96f0920eb3@linaro.org

---
André Draszik (3):
      soc: samsung: exynos-pmu: allow specifying read & write access tables for secure regmap
      soc: samsung: exynos-pmu: move some gs101 related code into new file
      soc: samsung: gs101-pmu: implement access tables for read and write

 MAINTAINERS                                 |   1 +
 drivers/soc/samsung/Makefile                |   3 +-
 drivers/soc/samsung/exynos-pmu.c            | 136 +--------
 drivers/soc/samsung/exynos-pmu.h            |  37 +++
 drivers/soc/samsung/gs101-pmu.c             | 446 ++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h | 343 ++++++++++++++++++++-
 6 files changed, 824 insertions(+), 142 deletions(-)
---
base-commit: 78578f59c6d2d7ece395fa438c7c82a25c9ed9e7
change-id: 20251001-gs101-pmu-regmap-tables-8726ac9f853e

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

