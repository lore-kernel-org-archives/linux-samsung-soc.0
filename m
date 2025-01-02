Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33D1B6CFE;
	Thu,  2 Jan 2025 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735850453; cv=none; b=TOtWCm268VIFwJ8/iUAo8d1ZMLewvlkqXhV/gha+qIqLxq9kBoSlMnDJNgaEgPyuWmOA+bhFxGwBDKurCq48db9ISz7j6kdePKRnmcH88BznW06SxEJCt0/2wu4vYtmiIZcSkjX4iLIHErCoHLPogpv0DpE34fzdqbohhYaXIMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735850453; c=relaxed/simple;
	bh=Hcdz1TvPhjV+5ifeC259kDMoFCsKGXHvGX9FErkyrPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=llNhxNsqGOsQ0IaLS4MRVtFdavGdcg3XIjqR5wcAdo1wioE84bM8N8BsTOzreFM9G+dpy/xBJtnXFkaG+gQou3Jm6g4d7rNu4kpcM+T/ulnJFKWuNMqlqp79OAu4AHF+GS3cwDIppt8AlofLUO8ReQxAYTKY7W6qURivb/R7LAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mr6VZmfH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mr6VZmfH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaec61d0f65so1844309466b.1;
        Thu, 02 Jan 2025 12:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850450; x=1736455250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeT/C/SSbJIZtC2cQMnIGXsMju3vNCxxjxClBuI7DfA=;
        b=Mr6VZmfHLNLi5vZS8KbKyaRbdaIGsxrjgpuf80V/3UYUbtJkCoA1BOfO57x1wMNQwt
         bVBtIzOFCqQM1D8S1OOCY+NpHKAn4aEBR+UCxOv3M2ODBmMph2c+DjPISpBZzRaDi7N/
         +3KkloX6fD9rWs0DAC49Qbo9sJU0APyjoXncx/yZrCfDKUVKCFhQ7WKS11hPqzy+uUNq
         zipZOKjjmAf3WwRJ0975CXMoVwxiKYcDHs9IabdS1vuRU41RVY4zipM9xyMr7i1Nte8O
         +2h/1f0DaSJ+5M0XRfLGePPaP93W/05uYR14rGwZhoEBz36oZspFYkislcbp1Ty1zRQ6
         V+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850450; x=1736455250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeT/C/SSbJIZtC2cQMnIGXsMju3vNCxxjxClBuI7DfA=;
        b=IC69gKlFGYbKw99q76GuM77WWYcwOZwOidOJhl7uFbF/Zmc4fO5cdgY1axMYdwHLF+
         f/xj3FrMYrvqTzlEaLB4tVE34J4BOx3wDqRBmpZ+rN4kTtwcQXnCj+8I/KHGPjJWLZQF
         hmutvuJqWA6hiX6nh2+Xlqx1UUvmPFTwPkJmIJ3STlbEbpn8YyfcvVPP5w5DrLNZL9rc
         TnNrewzyQPPZl2owFs0Gf0m4bVURR+Z2vnBoDwZlArEglsy/YvectHK7ma1FXj68Ro64
         /QvTbt1US2A2+ayKfiHzLOQvHZHlx4DpYMpZCe+hDxVNAQHTstauxgZRHAn6RWvp2WEN
         uU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9/bR6ToEebYR1tCOQng53WEyPufZHz0JktxVXgUubwlH1ymE4A3QhyFI9X5fkRI7gs3O0v9Ri7yXNPOxJf3du7rE=@vger.kernel.org, AJvYcCVGjKjqHuniiA3NfPBYdpfH3yBs+WYRrWVNIo+GAdYLFpn5Qy+3V8ngrUeHCysLK9FNWzMrkB73TebFqO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPbAqhGG/8YXVv4+gjEAzn/Fr4c+bTXrccJkf/5kwl4ROhD/ai
	6Nzx8PS/uG0HrlanqTYcnCqUpQAQfPTl18O/wtnvlQNUVr1sUHd5
X-Gm-Gg: ASbGncsqkZ9iCVGQTwkivEs+lKFv7rB9kQgZ1NiytyR8g/pmrtPuKIW7xdY0wmktuWu
	4ibMjo5AMY/i/FVaLY0YZZkZCToAPtwNCNijIuXI1txjDaggD/bYH3tUVoQZPCmLGWsgss7YIPr
	LlIqtMfh57/NxO0PUdulcSdBcPa1WyfPESJF/KtKy2/xEWMuXSgsPWlwiGxshXoiDoLqQcJlsIN
	Pfi8bCsDF9z+8TEwQMN64zt7DbGkWkVAdQx3//W0cqwd0YmoiIDKRFJcsqbTNK3QSVTw42rkHy7
	MlR/YRcAF9I=
X-Google-Smtp-Source: AGHT+IE16m/qv6YyZuy2UxiPuwTI+1RflvGC9DGeTDQtRWhwSzHOwjXiBbrxlDMRXRN3Nn/1oFYnGQ==
X-Received: by 2002:a17:907:3607:b0:aa6:88f5:5fef with SMTP id a640c23a62f3a-aac2c9948d6mr4725876966b.32.1735850449504;
        Thu, 02 Jan 2025 12:40:49 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:49 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895
Date: Thu,  2 Jan 2025 22:40:13 +0200
Message-ID: <20250102204015.222653-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos8895 has four different SYSREG controllers, add dedicated
compatibles for them to the documentation. They also require clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 3ca220582..a75aef240 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -21,6 +21,10 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
@@ -79,6 +83,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
     then:
       required:
         - clocks
-- 
2.43.0

