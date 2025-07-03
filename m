Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D12AF19
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Jul 2025 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547815; cv=none; b=UiIHM3+Fzej19dg8B3JIwxi5dh5nhr+Eyd/Tlpblq2kElG7b3NfAArPK5wsM2VEQsULLI32qf7lfsvv6qit9jj2yEtmz8UiNa2vk2Hu7DBhlQ2F8GjFYsnISshgae0RCl+2Aeku2KVWqZbsIhqE6FCXUb7iJApZH9Ris513FsPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547815; c=relaxed/simple;
	bh=ZYfjP7FwB1GpkWrGjPRU1WDQ3B9s1Ej+w3TERaVUTTA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u4lnsMVMmz6J12Tuxi4G/HHRZNdeEuehkERVwbGltn65q9zZnV9OBgl0CNSeC7YMkIqkgm2bzMH0XZMgEUIMA0JnypHWZc4IiBgYrN4mtx2VAGKyzX5ucC7jRsppl47hfETS/6ky1CK7xNfU+xk/xoVVJaWkYUB9Vyck1likgAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AOz6qUhW; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AOz6qUhW"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4531e146a24so47624755e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Jul 2025 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751547811; x=1752152611; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8sMnLmbVBtviSShW9F4axvuEDVtfhtpbcNw4bBlT7c=;
        b=AOz6qUhW7P+PPO2Jvo7E/0Hr8O2rVgb6NtEuLYeX4nQqS4cPMbOcH+DeyASKyk01u2
         e4dWeIlx3AcbYxITH5SZyh3Yk4S88Vs/r7iJMx4or8DYR+RjSrRXEicCbsZCfcOiFLct
         C5zDDaqYH27KLfU874rl+4scoIujbI4hDX8Lsnmb8xryNHVjivywH5scetZDaMhwWfa+
         1jA787GewInL3TRyzF9T7jlD/Aaqtj1N8qLS3Da9yxElqqMp6cJNiQaaER5KCirApY7I
         un3z4JU9lrjwmBBK1Pcs9lM0+h8WRIS1JQwqBt+0Kdt2r0KuoKG3imU/0FBLjBDft8bt
         g0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547811; x=1752152611;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8sMnLmbVBtviSShW9F4axvuEDVtfhtpbcNw4bBlT7c=;
        b=aWEsrln6ZgsmgWnQeeDtgIkJMV6r6jrZ7ybJaOrQSbpS8LR5v6DyAoCUKHXa0N88R9
         7E34IgqOuxDFck8Vb06qQPxnffmmD7LNVtONHIst+UDJiNjAbO9bq5zpmtu8goMgfMfN
         tcT/kJH3Xm5d/GtoY3jETooe1c1AHsnA9EQgLQJvICWNYKpf7ZLFc1k0CYraEEdADLyk
         8O1nQILQQ3RZorb+cMW/EqWp+Fh56daFgdAKqu4ZYf/dwIWJmo33f8CV+oUi/hQJrdPY
         Bn2XBmbZj7chYhH5yCV7wvKGZzzQ3UQyIAMiQieSbzmB6XAnMHLgOn5eZmDZ642BT69B
         6y7A==
X-Forwarded-Encrypted: i=1; AJvYcCUwfdsJSd5xGC3zrITfJfqFHkQ3QoYxxAo1YSWwK3wW2RCeA3X7BDa9UJMKdn56cfgKrUmnvlSD2d5CuDyA0yzQsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6MNtq2GR+ge98XCjg1FTpbUG1XLtOZqxInoBLn+UTko2NChOd
	uIZmMRvymPJNdjLzX7DGp3JYFelGPknZrc5KtCfNhHCWCT7gslOqYt6xLwTaP5lKb+E=
X-Gm-Gg: ASbGncsgGi5OIJsbeQ8pMM6wbmKc+ZJwpCPcTWxynzodQoD95sIyfAoQF3QvDwkJEO9
	dugQejmFA5mwue4AjhaS1qFzNZiUijsh/w2mu2pLuOBMLPhRgJGwdYisdFLyZlfmDjoFS0yWA1T
	2S0XZxXwuVfGlIEzqlqqlRYyPVhbAY4IXPm7C3XorEJZX/qdScz3FlO1Jv842ymthHSy5eVXB7P
	ytFpdMJFl2dW5BvdAG7jMou9cGbBj8b/Fy61h1GAjcxdQ9uOm4JrvkteHrC92bDUVNMAp8Q6hkl
	g5s4eCsW/UPDoZm9yqAGrw4CITBNB0XBR3jxbWhbRLpetLAzpxIFn1zuQkw/3plS+bAY9YYIuNv
	M//scNimAAUPBgxEy
X-Google-Smtp-Source: AGHT+IEZcpwBB34LdSCvoGZVWtrYKSw+G3TApJ8ZTvGGFXgDj4RIhH4+oyBw0wZkTYa243/SZJTHFQ==
X-Received: by 2002:a05:600c:3e17:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-454aeebbbd2mr18095885e9.0.1751547811082;
        Thu, 03 Jul 2025 06:03:31 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99693fesm26170005e9.7.2025.07.03.06.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:03:30 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/2] Add new phy_notify_pmstate() api
Date: Thu, 03 Jul 2025 14:03:21 +0100
Message-Id: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJl/ZmgC/x2NQQ7CIBBFr9KwlgYG0caV9zBdoA7tJApkII2k6
 d2lXb6X/PdXkZEJs7h1q2BcKFMMDeDUidfswoSS3o0FKLDqqoxMc5UhFvJVpm8urqD0Cp7O2gH
 8xYo2TIyefkf0MTaeKZfI9fhY9G733FkrBaC0tbY3xoA2gwSZsCD3E5P3FO4fCo5jH3kS47Ztf
 8gMlG2uAAAA
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
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ZYfjP7FwB1GpkWrGjPRU1WDQ3B9s1Ej+w3TERaVUTTA=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZn+gsenijhnxKUpeWCimXuCgH87uwqGvZ5h9B
 ItzoiuZf8qJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGZ/oAAKCRDO6LjWAjRy
 ukmVEACZ0M/YG9thUntvvqJNn1ALzw38f/38Op1eJmLNktFegKZPe7cw3exdz9z5Cedz8JKpRdJ
 7OLXUspk0PpOMeSlMxgZ9/I/SosG/NW6FogiUTYp5NP6cJI29frGBmPBa58ESACp2ZmoT6HU4WK
 4iuxz1sz905KPYKeQzbVvDpq7cvUeBU2lDndiUpYca1IIcpABOYdS+vaelSaHOUJ16BijTMUYF6
 LA1Sno7YcJrDHwck9XAiMsRtx1TCxevJ+UOw+MctfARkFmEtby1l5PlEQlkXPNTHZvofoxZ/jMW
 ecICz63mFFrvCfa3AecCmFACrO4CtMilo04/Z0r75qy5guAoel/HytbeDZBZanDRAM4Kz85tPQ1
 I1QYPj1YWVsVwxpASjNuNl5OIbczHipzsEUhKj7pi5x9jao0uOAmE/WP0bDXmSdtbq4CRMo0IHT
 VNdfkbqSEfdT1HaTDTm9zfjYO2UqkmOc6b9eQR4zvYi326n1Q26GI0wfean3GWWwc2uOjxnu7ew
 I9tBJtZsxQ5dDSPxXX7fbvsBMf5kM2KXbL96ImXGDH+kULjShiixR6gZcGbV8nqrEhWkPQZl46t
 eACzHe60dZh/t9eSzVZoRSIaXArw4G4wEjNrLNSTK95TM/UvamybZPR43mJK7borZCi7xrdcz60
 5JvP+ZqhLH1zgZA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

This series adds a new phy_notify_pmstate() API to the phy subsystem. It is
designed to be used when some specific runtime configuration parameters
need to be changed when transitioning to the desired pm state which can't
be handled by phy_calibrate()or phy_power_{on|off}().

The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
needs to issue some register writes when entering and exiting the hibern8
link state.

A separate patch will be sent for ufs-exynos driver to make use of this new
API in the hibern8 callbacks.

To: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>
To: André Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: kernel-team@android.com
Cc: William Mcvicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Changes in v2:
- Add new phy_notify_pmstate API() instead of using phy_set_mode() (Vinod)
- Link to v1: https://lore.kernel.org/r/20241002201555.3332138-1-peter.griffin@linaro.org

---
Peter Griffin (2):
      phy: add new phy_notify_pmstate() api
      phy: samsung: gs101-ufs: Add .notify_pmstate() and hibern8 enter/exit values

 drivers/phy/phy-core.c                | 25 +++++++++++++++++++++++
 drivers/phy/samsung/phy-gs101-ufs.c   | 28 ++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c | 38 +++++++++++++++++++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.h |  7 +++++++
 include/linux/phy/phy.h               | 25 +++++++++++++++++++++++
 5 files changed, 123 insertions(+)
---
base-commit: 97bdc30f39b63758868f67841cebb8c50869e16d
change-id: 20250703-phy-notify-pmstate-f02ba5582f65

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

