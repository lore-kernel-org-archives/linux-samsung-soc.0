Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F403C1F57
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Aug 2026 05:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895417; cv=none; b=gsa4QZXoE26YVWn4U3yhfUR9L+Ok7CIhpbq3u6W9FhAT+pJSakvavsozXucIZ5R87VxoWAwnus5TzwRqkIMxyBQ5nmAmR/vy9E8EkhFWPTwYbarhHAMMlqz1x7U+CJu3xjEHS9+DlbakD1cz2xYdFVhZT6C6d/KMNZTVDCEwX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895417; c=relaxed/simple;
	bh=to5uV5k5TOrazCBV9YJapntDtlNVOxHcGL/QcW0Vhv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aBLkwn4Fmcr5Rh9FoMCUPZzveb+sUXg93ns8MYtJ5p1tFeBc/4iYaKPzrAYc3o9RWy6BplOWQmwHF1PpyGnq98+2vlDssZhlP+nlQm4RCLzEIXw2zI8i9hXkdRYBsd5dntZQFvD7ptkWhNBu9JIZSsLRJ9JAiyma0Nqlf4JELcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmTyhuSi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmTyhuSi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482db627cd8so360302f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Aug 2026 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895412; x=1788500212; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vXjynDGOZctwtTH5h5fAKF7NFOdGmTdhhXt2jWPkW3M=;
        b=dmTyhuSiT+XT02yWRXNSzmaOSi06Hf2+xgu5FTnSYYG6I6b8S5dklZtuTs2kKq/EW9
         kBvXan3TPGueSsP3BgEjdKURcrivAYJTvQZRcAa03OAXuYx9SjX4jXOO4zHRCErtFTNt
         Xt0QiSptC513jNB+eIqrMqETzyonpD+dWXZhFDoXDJz4gmy1Ta99Zsr7jM6VXL64c83+
         ynREdnHbU/qd+mR/MZv5Exi+0naLZGEMwPNzPjb66FD8Bvzmib0bCwjwenxqAST/KtTG
         kUbpbGxlF+Y0xFYF3tCrbT0mYwmOd0AyqAa16460asQKoDrXaL2q0CV5uRyRkHvePUkL
         UMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895412; x=1788500212;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vXjynDGOZctwtTH5h5fAKF7NFOdGmTdhhXt2jWPkW3M=;
        b=FQ1aT8jYbiU1uJ3YOkTjKFoMyF8uE4aVo5VU5aGBGv06Tp6sq/F9Ojtw7t4fUX9iOl
         yBUxK/bIR3icnuwIjoCp0jfSt4OLXpCz9bp7TygGY0OkIibROkOsLyeUqLHKRay7RXx2
         SbNiCoM6u+Lzj1yJYu/7Fl+TP6Fvc5jltscu9I1/hWO89CSD7/MTAsytiO6wlnoI+w/c
         2EnzslHB1mPalmy7/DYmjxNEp8RpJeFM08YeZeRpQCiVX9FlLriGsKvF1BDskq/mEikA
         AMdqDctjNttT874TmHonXBWujUtP/Xt9lIkLWrMviL3yMCZFLzfPLCjDDU8ULSQMCppg
         WMzw==
X-Forwarded-Encrypted: i=1; AHgh+RqbUukBJjKF/UPHje+319Mv8I/g6O02jrwCb75fTQmO02UkZWVQF3mjh5gEevdJAdFWHKIfUZJo0IlTb503clUbaw==@vger.kernel.org
X-Gm-Message-State: AFuF++mv4P9FJVvu0UtevCYpEHDuJ6OwbA7e+LWwKa0nH9QA+J1UGMOM
	V7ggEEWmtrUZOt3GUSIN6JqwutAhdtJ4+MjOcF0KsaDdRej69Vc/eVgwRtZ3ABCOBdnVcjAe7tS
	sUOnN
X-Gm-Gg: AR+sD10fJSl/eEsCWreDegOaHBjdBNtT7BwV77L3xNTIpKHasnaBYUJ+2kGAuVnb3qa
	o5WtIy7ID/yb4LVj9I4BjvdcLFKnn44Wm8Vpv/opBL7bfTuHNU1zR/wDio8c0kIhVM8MVRfdbk3
	/dSB4bOTmjxzonlTUZFrH0+a/1iy29N5pJxb198jqOBCyb7YUjmPJhpmGxGLoabfAZHjO7jHeg1
	aL+DnQ+0i5O4Uw/zViBVPQ5JTCmFdzFCvYqdeKZQ/UHBus0d4gKutas9X0LnnsVWY1G7Y0zyRBr
	GGmN8HHyyfbPnnu4H7cunh/QhtuNwg5T9fn+Ja7HcMjGg9B6BcgDKC9tV23/sM7aKE2db2p2PRy
	X6nKqZ0C872dMoJ0pyEq51HBFtpflmBqt3YEJpiR3gvqhynp05Hc70UbBdut117uZ43IeLqNiZ+
	4jhSf5Sh8zDTPbFM8jGF6iWFK8awX9vYpWFd0VEVSS5I4/WzENd9S8+o4IjduK/DaCBvuWuFtMI
	lPl5wxqNbQ1lY8hFfwBQGjUf6YyPCjnK/cykuVdyRyb5Plqihdf5F4Em+BUh8w=
X-Received: by 2002:a05:6000:41d0:b0:482:f344:5325 with SMTP id ffacd0b85a97d-482f79cc0c0mr6024207f8f.3.1787895411715;
        Thu, 27 Aug 2026 22:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Exynos PMU fixes for cpu hotplug and cpuidle
 routines
Date: Fri, 28 Aug 2026 06:36:45 +0100
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0ekWoC/42NQQqDMBBFryKz7pSYEqtd9R7FhSSjDtgkJDUok
 rs39QRdvv/g/QMiBaYIj+qAQIkjO1tAXirQ82AnQjaFQQrZiEYopG23LqJ/r6j9OvviF8KRN4p
 4k6Mic9dd041QCj7QKUrg1ReeOX5c2M+zVP/W/7qpRoFCG6F0Ww+tNM+F7RDc1YUJ+pzzF+gkC
 5nHAAAA
X-Change-ID: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

This was reported by Sashiko here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
and was mainly introduced by enabling cpu hotplug
support and cpuidle for gs101-based SoCs.

In this second version one patch was dropped to keep things consistent with
downstream implementation and due to lack of information. Other patches
deal with a few missing error paths issues here and there in
setup_cpuhp_and_cpuidle() and around. They were updated per discussions.

Tested on exynos850 e850-96 board with sequential series that implements
hotplug. I don't see any regressions but testing from others will be
appreciated.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- destroy_cpuhp_and_cpuidle() is called only if
  (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) == true
  (as suggested by Peter) (second patch in this series);
- in clean_cpuhp_states error path the cpuhp states variables are now
  reset to CPUHP_INVALID;
- re-implemented "soc: samsung: exynos-pmu: fix use-after-free of interrupt
  generator node" -- used __free(device_node) at declaration;
  (as suggested by Peter);
- drop "[PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in hotplug
  callbacks". If we get some information about CPUx_INFORM registers usage
  then we may fix it later, but for now it was decided to keep it
  consistent with downstream implementation;
- Link to v1: https://lore.kernel.org/r/20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org

---
Alexey Klimov (2):
      soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
      soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup

 drivers/soc/samsung/exynos-pmu.c | 70 ++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 13 deletions(-)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

