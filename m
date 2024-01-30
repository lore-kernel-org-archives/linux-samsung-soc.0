Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE9D79950
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706657857; cv=none; b=azmBWA8hAaMjjOLevhmoNe/iDDlf7m8KzHTmi6s3y9aH9E3bhxLvXL8QBWCRJATNox5Gfm2Rbi0Gp+d12jmRXiThDNEYxN/9AlrNPH9KdOxxcAaatiR+LRbZ6Ph7Gw3jxQy19+s6AvVxAaFAcR2GA0D/SRueHmhoDlfnsj3KZl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706657857; c=relaxed/simple;
	bh=1s19bgggjYqjahoc37BYPQjaNkY0EJv/JXA/THdndYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j5H/KtUuu3UVuGWK8AG4qf//0P8sOu90FqhpR9sYuZkLxcYAhRLtI3iqqOACju31lUz1bnaHnrDEtaFafe8Y3nnwOG4Ga7iDhZJCRIdbHB8t8iTFO40s74lh4djj8nf9O3UXsz3qrrEa45nzgsDEhDa/v62SkJx0oukKHD5PCSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tMZlGmcD; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tMZlGmcD"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a36597a3104so54210766b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 15:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706657853; x=1707262653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gsxL/I99xpEvCIDVwY097FiG8G++5DelyKefubwrp9s=;
        b=tMZlGmcDEvVipqDGLA8Baj+4Fx+MHVV7OYXcTinPrBr/k0MX9ZWMwPRQOwehx67pn/
         jHA2pv7mcXWWYc31xN309oWRKS1wcpYRR24OpFmzyVWM0PqXGb3FVxoXLaPX8dU7uGzR
         vyElFZCUZLo+odsJ7sSjvPFMDb3sBYVt4UuVwm21VrE1EToXIXXQeBmGI9OtfHMhYAPr
         5/8v0cBhNhKxqsm6hXjkwvfCjaDI2opyBdpk88EkmjS9Ug61BlriY79RBsnOOA6JOg79
         Qw3RWNfPla1+PvTA4cxrvY1gJqMc91fqYkdEWomKNEjAa1OTbtO47zHQB23dn+EwBOAb
         8eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706657853; x=1707262653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsxL/I99xpEvCIDVwY097FiG8G++5DelyKefubwrp9s=;
        b=DGvgGy5KyL6iGV/ze1AOtKgXI5Xzx7f6VgTnj+FE9sN6GZ9V+HweN0lZqZg1kyIKfD
         b8Vv2Ptg88CRwf4Sw6fSK9J/ubp4qhBuR+ucA2znqo6D9ENzxULTxNYmoEHyYv04ucA9
         SKhe8TJwqdvrkyp5qM6lyTWI1ShQ89rhqk1x1ZJzXIGzxvYo5v/2uoaUEbRk4VMmYWuu
         YyLdGQVTA/ypvrS859ii+u3Q5YEpRyVXliklcPOW1mWy6/aOmvtJuEJKxoKex+Jnrm7z
         gHBkRV4XPglBp7zq1khmGHRFiSTVx3d2Wfsaw4mOF75YbjaXTXlkYpWJlLJl+NGFENof
         WqxA==
X-Gm-Message-State: AOJu0YxhpN9x4ZSVEUxNr1dpBCBDrqVhdT+3KKxIfLYFtNSVTPHsCA+z
	Boz0VV/BDjkN5cMubHYQ7teeyy9cuHvBf4iA3anOWwHBvVllNc4X4zFiIBVSfQ4=
X-Google-Smtp-Source: AGHT+IExlGe+3KAgx9wd47PjYqPJmrXUI3Bi+ipxi1Or9XP82qWolc5r13mu2jTYPFQBAHAN37+EiA==
X-Received: by 2002:a17:907:10db:b0:a31:8a51:67df with SMTP id rv27-20020a17090710db00b00a318a5167dfmr7027211ejb.9.1706657852290;
        Tue, 30 Jan 2024 15:37:32 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id hw18-20020a170907a0d200b00a3600d7c2fbsm1676507ejc.176.2024.01.30.15.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 15:37:31 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH] arm64: dts: exynos: gs101: add stable i2c aliases for gs101-oriole
Date: Tue, 30 Jan 2024 23:37:00 +0000
Message-ID: <20240130233700.2287442-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we have more than i2c interface, add aliases to ensure
deterministic bus number assignment.

So as to keep compatibility with existing Pixel userspace builds, use
the same bus numbers for hsi2c_8 and hsi2c_12 as the downstream
drivers with the intention to eventually add all the earlier busses as
well.

Suggested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note, this patch should only be applied after series
"[PATCH v3 0/7] gs101 oriole: peripheral block 1 (peric1) and i2c12 support"
https://lore.kernel.org/all/20240129174703.1175426-1-andre.draszik@linaro.org/
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 6ccade2c8cb4..23314ed78c96 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -18,6 +18,8 @@ / {
 	compatible = "google,gs101-oriole", "google,gs101";
 
 	aliases {
+		i2c7 = &hsi2c_8;
+		i2c8 = &hsi2c_12;
 		serial0 = &serial_0;
 	};
 
-- 
2.43.0.429.g432eaa2c6b-goog

