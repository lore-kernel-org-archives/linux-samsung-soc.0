Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7D23ABAD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jun 2025 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634475; cv=none; b=kKLU7TpKDIsa5SDxQFPiglNJRi/MWdygU2s0dcH+sKAvfRbTYui3e6eg4XW/9i5/8EETWc0ul9o4LuvNrw1HZ5l1vt2S7hVqUwnPuh0ojjeuZ/rcICBPMKs+E1xOfw1t1mxCGzPHCecBA2LzDm1mS5W7yicTPTYflwJAOYxzD2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634475; c=relaxed/simple;
	bh=GKoJGEPtGbWX3S6SDM1+Marr1BzItueAulEfS+IMNmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RfggcORHV7wEtOt3D2Jn+IspPI6A/Gy1FWNKu25eldn2LfIEgMblepinxWbZN4UC5uJ26JOTK9izCSmg15lNYb0BJq04/Z/U0i5ZqPrPpQHtRkO5o/ZnzDop3cben0klDNJBPNPu0AOhgZ2VfDnptOBFe77mq/NySjT8QlZV/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAv9o0ld; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAv9o0ld"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso4138490f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jun 2025 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749634472; x=1750239272; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ee00Hv2n6pfIABOlHh41RgmvlkFZztRqY8NW1iNthOU=;
        b=WAv9o0ldOts9ZS3mMAvRQNUW1DAFH6aBIzBXkh3v5wU7e2nSi8HM0HX0yrAu0i7BTF
         UaYpEmWLxnsQeHYy9svhEWnotMkAf0ANw+DNBUKsZFkmXg7pDeHRvA2rgh1kd0PNn4rC
         3q9EAHsVcd3JEnwX6dhclEoO91mJbtizdSDCfDJJPWMGhHpYPKcT3FQ7g7+vdM77Bg1F
         lmMf5hu57DJckE/1WZfzZCCsMQL/mM+IYVwGLCppIHg7b2Rb0EPKYlpAUzPan6Hb+4Ws
         YNt+LgEgiSzD9GqqOIW2Lkd56GvVNQ5inLCn94gOeOWtBpA8tEHk6CQwFzScKENrzdXB
         9Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749634472; x=1750239272;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ee00Hv2n6pfIABOlHh41RgmvlkFZztRqY8NW1iNthOU=;
        b=JtPxUXDznlelnOhKXGuoXBR5NVYzAIwlGxc2FkcJbvQKBQHk2MLmprVF9ZeQrSqk3d
         T8SxFIV4uONWZs7Xw+z+q2IYWXPR3jclgk4F6kNm1tWpz/JaHL72Q3fliAD2K3K2it/b
         wvDsqwT9tPm0fhmOwagvBjPXrBgMU7hPI1yC8RJ7BiReWT2NSnjAAaS3XWDWw6KKAUIv
         ZXvYIZkiar56Qh5VyxL1EB0bujVfPX3D4inqndihqjie0FSkr3inpQUJ1cEJo8AkLFjC
         2TDHt4JNGwZIWJBh+iYUvUX/QeqIccVf2YOash7TGdBBCnkplE8Ew23bvzNmHUBPjrqu
         C6Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUhJNYoCdhrn5KEsi04UTdePEvBXV8TfFah29cs81E4hh31bNFrKNqTbVjE1NZkN/PKW4ckt8TvNSlmH406KOMydg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySbdMd52HgU+IvG/5syQ96tHj47ok33arBd4E+NQuvUFsmkHit
	OSNn0kXqGIsXJqsL2DtYo0/zmKEiO7fELJg7hveYRkYr/t2CpFclf1LVSxLmBxDN/Z8=
X-Gm-Gg: ASbGncvNcLFcuI2Q7ygCd56f9hITmSJAZrVCe2TBsWz/QPde8P9doSMpAbVM5zufki8
	rAzt+7TYmpPveXKkuo8Pxs7xnY/r04+/4747uweB50+163GRghV3TkYvmB2ism1VYIhqFke2e5i
	N17KppyxLvfSP0Bn3xuCkqSg8SJHistpggnZiB5oppyopfolZ0i25tTAqY/GVgfnGtsk195p6eb
	D1/b1vHu+D6TqqBMfu735cfNu/4f8V9/HSw7TC8gyFHt78ZmQ7VIm4Sc7QkAr2APoXGoAMHJZvk
	Yo0bndZveYeTN3QqJ70y06SJN+gQ9NIFCr+m2E3PfaokMLaxCofR8d+Zk7ncLWRQa3kOXh33kUg
	6jRa38PP/3U7THsY=
X-Google-Smtp-Source: AGHT+IEDfONFcz3C9oPCAFFX7yDk+W3ZbpOIarlrBc0Cek5xrML9ciwnj6IGvkq3dbXA+yuDleTE6g==
X-Received: by 2002:a5d:6101:0:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a558a56a92mr1506354f8f.13.1749634472342;
        Wed, 11 Jun 2025 02:34:32 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453251a2303sm15467005e9.31.2025.06.11.02.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:34:31 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/2] Enable CPU Idle for gs101
Date: Wed, 11 Jun 2025 10:34:24 +0100
Message-Id: <20250611-gs101-cpuidle-v2-0-4fa811ec404d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKBNSWgC/3XMQQ6DIBCF4auYWZcGiIp21Xs0LiYw4iRGDLSkj
 eHupe67/F/yvgMSRaYEt+aASJkTh62GvjRgF9w8CXa1QUvdyU63wicllbD7i91KwuJsx965oR0
 d1M8eaeb36T2m2gunZ4ifk8/qt/6TshJSIKExaIZWY39fecMYriF6mEopX0EpP56rAAAA
X-Change-ID: 20250524-gs101-cpuidle-cafc96dd849d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=GKoJGEPtGbWX3S6SDM1+Marr1BzItueAulEfS+IMNmo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoSU2kMagcpLknWWW7k11DizyPziU2/a8+js0Pu
 9KZxxegILKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaElNpAAKCRDO6LjWAjRy
 utAqD/40EU+hi1XmIgZg+0irXTE/wDqmf+2p7hDECqt8sXZCZ1fyVhtVKyn5Y2/s3cCxl7gRyYs
 pT+ZIR33kahPtdf42bQ77nuvZQcC9mFfnWp63DlEecZJbp3vA7nzubISj6HCT5DQuzognZrwWat
 hwvU/3bMBi1kEv8ps9F35MYRDcv8I+PKzd4PP6nABxCCQpq/W1KoAVCzV7fo9Z3eDi50p74DKKQ
 ARxuGIS5gix2ERxxD0q/7HtuQPeTZUOW8tg2dUQ/d5Kaxmyofy1KcHyxL5oLXQ+VW8U0cueBXSv
 OnSsFvRWSFI0EWenF6m2eXOWKhvWcmihRaOCY34ho7M4e+1rHPOT7y7tZIs6jm9Tb/wwaWXykfR
 RlSxd1Aua+24Y3tF0LMfYYVP4y3heeXi7B5xxaHlXi93JEbtTu4qPtxYBIAb8lfq4eUgf7BlsoX
 0N2mY1ZjS7fYz84IlktzuF2DGm3eOFPrtL45V9mivm1ZangwJsHSUTTig92G5rX5oL71S6CtCKm
 kM93dPK4eir4K5aYbXGB4VB3BjZ0mE9dxm0CRyivIE5aRyNaq94N8Pp8X/MXorkc/U8bS6JOHZb
 nab9eZuV+F6e0D7UaAeBklm6uFSdKdLQrarsHrsrFwXIzkkIdiSs7edhHt8sfUv8G+NZNCfoJga
 VsRqDK8JBJHyPPg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series adds support for CPU Idle on gs101. In particular it
achieves this by registerring a cpu pm notifier and programming
a ACPM hint to enter the c2 idle state. With the hint programmed
the system now enters c2 idle state.

Note: the driver patch has a runtime dependency on the device tree
change to add `local-timer-stop` DT property to the CPU nodes.
Without this DT patch the system will hang in early boot as the
local timer is shutdown. The DT patch was originally sent along
with Wills MCT series in [1] but it can be merged independently
of the rest of the MCT changes, so I've included it here to
(hopefully!) make things clearer and easier as it has a strong
dependency with this patch.

We can measure the impact of these changes upstream using the fuel
gauge series from Thomas Antoine [2]. With the ACPM hint now
programmed /sys/class/power_supply/max77759-fg/current_avg is a
postive number around 150000 microamps meaning we are charging the
battery (assuming it isn't already full).

Prior to programming the hint this would report a negative number
around -150000 microamps meaning the battery was discharing.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250402233407.2452429-5-willmcvicker@google.com/
[2] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
 * rebase onto next-20250610
 * Add #ifdef CONFIG_PM_SLEEP to avoid
   Fix warning: unused variable 'cpupm_pm_ops' [-Wunused-const-variable] (0-day)
- Link to v1: https://lore.kernel.org/r/20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org

---
Peter Griffin (1):
      soc: samsung: exynos-pmu: Enable CPU Idle for gs101

Will Deacon (1):
      arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

 arch/arm64/boot/dts/exynos/google/gs101.dtsi |   3 +
 drivers/soc/samsung/exynos-pmu.c             | 137 ++++++++++++++++++++++++++-
 2 files changed, 136 insertions(+), 4 deletions(-)
---
base-commit: b27cc623e01be9de1580eaa913508b237a7a9673
change-id: 20250524-gs101-cpuidle-cafc96dd849d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

