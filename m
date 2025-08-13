Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F632E8DEC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097307; cv=none; b=GFBVDTWwyd0jwLRi+8ZomxKZsQEIvmFPTHEeHzVGiUK92pyf1A+Ot42T+N0JaK9H83Ee+5bM66ilYLLrLA05GuN/R3tWKDaQYXoJLdhYcv8sHbhtoI4DbCO+Zp9wVx7edGJ/hd1X8fAtgFj46fAZ4nuVvltDkYe+BavPpOqambQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097307; c=relaxed/simple;
	bh=W5C4Jb/87TEkHjxZzTAhHGOUm7nNwtwZIRnVcZUesz4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JguXV700ta+8q8VmTAj+yvoP1W/FUAGN7RaATbqnPl8jPMc6v0utZ8QTLaJBcRKC9Y7ZGJQgxyZ2d4DakA6eJLQMq8BpeM60qHUWFhZWQPWSbWxV1xmXNf5GT7mTbjF9jxa/OKGsnahaMOwZEIIWrUoh3UPtU8Q6UJzLxj6ErBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o19woiQF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o19woiQF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b783ea502eso742459f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Aug 2025 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755097303; x=1755702103; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZjYg8bYZKeQRQQcTg3Cp0VfZeqh6q0mPFPEWR4Ir4Y=;
        b=o19woiQFJH5/yTf8WTZL16j5a8s5PIZOy1EhRpFHlVcrU7XzeVCB+vejDU2fdG9B5o
         Wce+ZRMwNoOmPcHZQo+G0/c4kbF5sWzLG06yk4lxET6FeuRY9Dxt+fqR2vWCTooCWfAF
         7t7xHiLzycLo6ZKZnG/KT6HBc/lzj2jMhN6Uai+MtjCfn+BklgMeEYU+1mhz3A4dYIGC
         iZdfD0O+QiAMeZSVhsQOFbeuQVfKCvRYvPR6Y3PDr5GH9lrLPuRAFMz+wpetnS23mA9H
         Q9qLfNZSf/NHzRMZ+7zOhPI5+GSRyYGS4SEu5+qNPvQ2aUY4RDLUpvzIOnyAqTgP4N4z
         Gi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755097303; x=1755702103;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZjYg8bYZKeQRQQcTg3Cp0VfZeqh6q0mPFPEWR4Ir4Y=;
        b=l063JV+f2YzFtY0YRfMQvlLIMs6/w1q30qmSTkWCWMfVoC5mRiYMMyFexBd+N7Om00
         hb8fTRYy5iC/ivHX44Oj6uMNndJBY32YS2LrXSIHm98WEIJJ8w3E2iKIcOoZuQ9Btp1Q
         C7a+shXXw8BXD+G+hfrfYSXrWBiH73SkknloJHFWz/CiiaqaQ+ZUBj7EO+8I3WJzhtRX
         Cndgm1A5QQUk4oxMFFuj7G7FqnCsaBR3elLBYdzrJuwDW6qJd/G77A2dbuyTxjZLOq7j
         B+KcVzmH3NoLYf1pSYmOr96Rp99s6g9c9G8uGW7/5laVNmSvI709AJ6n1Hga01aVZiaO
         KpjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrIPA/jjSvt11schlZOPEMxkUb+wX/OaJhnrCbebQ5TqkHb45czwsh3mloxgT17vqVGpjJYsc/prUpLtTpNzDZag==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGRmf7Gqcl4o4xHr7iWXJS8TTYqxswKuiq5NUt48vAZOvWa8v
	iEe0iiqee/qNm4HLSgrIVst8GYkYx2wkXadEP/35X8QM0hVOLI3I16DLFoAkXo2BNK0=
X-Gm-Gg: ASbGncuzzXZy/CvN7jBnKi5gunYHZUa7pWQjBcfjoMPacEKKv3628dsz1CNtShCyhZF
	TGf7xgPJ1SBHQ8frKSLeHc1tu8Xqc1T62aG1RffS0qdTJvIzy7J5m4FzHfeS/u62F4X6M7nyyRa
	i6x+esiQH3/1HwQ1alNWAYbXL/QpeCQWx3IlFbDyN97xRHDeSWsA/5s+TTUplvnHTmfmcERk0xy
	4c15PNFBDfIE77VFIIeZiHk+R+0nt+fMKfvSCmAso9tnc9FBUSRk1hcLvLFkEr7OWESVXQ5fxXp
	gjXnS4cld5oFvQLpzVzTvprr4yG7ouZ9owiJXAoSnCQ83IqX/YmWgZIuvba2sytxN2MzxvkyYej
	9kWLPdsvjyOOuCrce+j7wbU8zVoK+bCuqFAecHmBUmY2UC7HNBn7U
X-Google-Smtp-Source: AGHT+IHGvynWNGnvSA7OYlBBf/7gl/Nh7E2z9kJEbRhnGw3Vbg8mnkSNWKEci8XTra92+d3/1Aer7w==
X-Received: by 2002:a5d:64e8:0:b0:3b8:de54:6e64 with SMTP id ffacd0b85a97d-3b918cf9b79mr2657354f8f.26.1755097302446;
        Wed, 13 Aug 2025 08:01:42 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4533f1sm48402964f8f.42.2025.08.13.08.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 08:01:41 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/2] Add new phy_notify_state() api
Date: Wed, 13 Aug 2025 16:00:45 +0100
Message-Id: <20250813-phy-notify-pmstate-v3-0-3bda59055dd3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ2onGgC/3WOzQqDMBCEX0Vy7spmY/zpqe9RerA20YU2kSRIR
 Xz3qtBDDz1+A/PNLCKawCaKc7aIYCaO7N0G6pSJbmhdb4AfGwtC0lihgnGYwfnEdobxFVObDFi
 ke6t1TbbUYiuOwVh+H9LrbeOBY/JhPjYmuae7rpCIRCi11rlSiqSqgWA0yYS8D2wtu8uTXRt87
 kMvdtFE3/LfLxMBgu1k2WChGimrH8e6rh8u7y8B8gAAAA==
X-Change-ID: 20250703-phy-notify-pmstate-f02ba5582f65
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=W5C4Jb/87TEkHjxZzTAhHGOUm7nNwtwZIRnVcZUesz4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBonKjT7hPpRY5qXZZedoet2Il5XVhKZC/pOtbKi
 +0CtwW2VqqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaJyo0wAKCRDO6LjWAjRy
 ut5TD/0TOzju4DzjH2y3pvzRzJijBdv5apB8VHPYifqqj7MLn86Izngf41KZwGwKbazWnZUQsbO
 1EnJFS0eECeObLYmtsuyAvCeTZpzp76buX55s0arQgnrFia742gUzSFLTMckgDZ2kQe7ZfdcB/7
 mVi9suq05k1eFJPKUQJoYbj2L5i7akr6TBQIeZ1XqJnp2OOFr009CI7pRF35hRcQrx4x3TmG5+z
 d4Qwz92t5VIRUB5dJqSJjplMQOthKYpdfc0SdwnGWgJtRtTDvyQdxUprh1rlWzdtbZPhnkFt4pW
 Dd00kxzySCvu8neFuSdVAsC0tSfQXN/eQrTToqzxuWtv8ZCt7zehCBKZbuQOZHMtvYHR3EqmSYZ
 oKn4GhUnCWUWXw/TZ9OAXM1VppLz+XqjeTgHaL/Bj7ewnO1jEe0UaTpa6I9KRHwXjHpiLmqBAG3
 5Bt0FU6QTDoPKejfGLE0nUgNb+5glAK/GASaA/lnyoHYz0fYWIa297yHH08FwXrzf8F7fGcMiui
 jGATUZDHuI6qi2yQ2bgjT7f0OvjDDNWnFEXKjkZfs7uvy2m3N2g6lkmntTC9weJ0WGnCJrtgrRA
 dTbHzxY0pC+tAMc8nkWDbxryoEHc7AqGCwt8o1NUMY4ZPoEquzQHAsq1vHQTuwQXSdm6p79g2ed
 rioz0wrkgrHVGQQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

This series adds a new phy_notify_state() API to the phy subsystem. It is
designed to be used when some specific runtime configuration parameters
need to be changed when transitioning to the desired state which can't be
handled by phy_calibrate()or phy_power_{on|off}().

The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
need to issue some register writes when entering and exiting the hibern8
link state.

A separate patch will be sent for ufs-exynos driver to make use of this new
API in the hibern8 callbacks.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:
- Rename API to phy_notify_state(). (Mani/Neil)
- Remove inline kerneldoc comment (Mani)
- s/phy/PHY (Mani)
- peripheral specific enums in phy.h (Vinod)

- Link to v2: https://lore.kernel.org/r/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org

Changes in v2:
- Add new phy_notify_pmstate API() instead of using phy_set_mode() (Vinod)
- Link to v1: https://lore.kernel.org/r/20241002201555.3332138-1-peter.griffin@linaro.org

---
Peter Griffin (2):
      phy: add new phy_notify_state() api
      phy: samsung: gs101-ufs: Add .notify_phystate() & hibern8 enter/exit values

 drivers/phy/phy-core.c                | 25 +++++++++++++++++++++++
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 38 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 +++++++
 include/linux/phy/phy.h               | 19 ++++++++++++++++++
 5 files changed, 117 insertions(+)
---
base-commit: 43c3c17f0c805882d1b48818b1085747a68c80ec
change-id: 20250703-phy-notify-pmstate-f02ba5582f65

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

