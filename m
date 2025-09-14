Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4688824E00F
	for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 11:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757849392; cv=none; b=K+byPjTFBUCHohO96CS0IhetjdgmUE0Ikz65t5qBGK7XRldGtTH0cLbhVLkKDM37EyFije6sPfoPEFI8Ikz1+aFdckgtHrnAWP7e8BkmehyKmRmY4K6VfyO1YeYcJ7xJ67D71/K/EAmsIVCu36db9OuUZWMQ3h2oXLPYQqtthDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757849392; c=relaxed/simple;
	bh=S4TZwGLBK6/RB3hgr9c0AxbOfgqQiu+TmlFevlAFLfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cw21rzAVR5P/G2BLPZeUPvdR9RCB1NHF1XdtdDwDSaJqA4BkdJiJPPV0pBhD9RJYhOo3OKEROk+UF/PHGl+s8EVICV8D0RUJ5o4JlD3AHcX0YIt1KbbnZzB1NPpFX4rxsmgEkZVCUjkVfjweuRvcq+UNGRSDox0Sykz9x5l76MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1jkpTdU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1jkpTdU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3df35a67434so1984651f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Sep 2025 04:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757849389; x=1758454189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YA6BwGFWueG+QJIiZVBMUSc9d4T3IHUstOE/1clnUIw=;
        b=L1jkpTdUunUksFJrSotZiAdDM33TF0D7UsEQkdbbgtXoyrX1XM3EZ9i6yT+C1FEnv9
         ASOOKcP3KMCBjzBvudhHmbAuAnNn79XJ1uNryxn1+oYyx3hz3AlV2fGgvea+EFKHoRGQ
         UI3uqt47rzxp8INB5hJyoWHFYyhSuO3aRZ0o9yxigEloYs8KEVWr9AkNADTR/KHQTehL
         M/HX/rFm0203X9xAoHOqBOBUGLqB0A92zep52OCwcXrYckwvpjytC7eK1+vwa1jRul1Y
         HA+I1/nSBvQRIHlApGM26XoTsXS9L7KjMzAm0a663z7iMCt9UZyYPY9Izhi/NWA6YoB9
         +jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757849389; x=1758454189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YA6BwGFWueG+QJIiZVBMUSc9d4T3IHUstOE/1clnUIw=;
        b=sVhb53Fp4PBwYlz2KrtvuYkhF3ovBQnw3b/TplVVWumciVGD6UZmVLSt6bPENPkaQ/
         qzOUB+a0iwhCBRh5rrSb87KWrcnHcrN44daGCWQDbX8zo8yXHVc6vHedvMm6c5BNH7X0
         9dWSozipO4LphXkK1rJJZUKtP+b3BbhYszS+yWunuz94JEApWx+UcWwtiPPuzO6qgdQA
         LJH+y93KxltFXRWJmnSHxAcfBNl54LeH53+5YD4cRbPLth5ZLwUvRjPsr/b0lSxC0crM
         u7icu1rVfJoNDROw6U922+UQz45Ndk4Vt1JAv5qNGre3u427KEjfU9eYkfPv4ZA44D2e
         JtGg==
X-Gm-Message-State: AOJu0YxItwUDufBFF5+ejHE0GiB/12KzhT6HId5nrxrgafXbhnbV+fsF
	Xd4n8741Sukz8X6C19lf6tIBSzzHgCnP84XfPbYzYGPS2oUbLF10FlSbJvocrQ==
X-Gm-Gg: ASbGncvBBv0gXJoLr+aoKVBnAfmUL/V2M95iJ7hsbZxkW6KQK/16R8C12cmeySQDBT6
	dXOMyXhe+TNqBc5cC8AVl0rxUyjIcmPZbvfcYCdnVyNYSKwEK/7NbVQMa8yUkzK29rrK3mC2mZS
	R0+0VSv7yL7LCn8ZpuHBUVWses6EQbTjLx/CPI5U/+ceNlOzfYVzpvyy+ASEMTIrTwiNv06mxVo
	R6yFo7wX98O4WSWvqYzHVnyDqTxNv/S2ZUnpctaaX9dMaZyiKzKxA7zPg+E/ZoqTrwfXt0JxYWd
	0lUm65cwsFwtSUXH06yoSptyM9ucCmLEtQe+2UDS7ftyCOtxnQ1vOl8SAiNjdrwqeoML/Tllx2Y
	BAd7IHI7bJsNIa2blMqrDqP7Z05aSJ9MsXzbYtaYco5wvJRgdbYavFPy5orAXiMAG4n5HsSqFbw
	==
X-Google-Smtp-Source: AGHT+IGyHDRZhIKdaCEmBZILWIecKug4YvVS1K+HM/kKk2Om/qzHCs838upA5zAOAAg9via+3MJt1A==
X-Received: by 2002:a05:6000:25c3:b0:3cb:3490:6ba5 with SMTP id ffacd0b85a97d-3e765594a4emr6092807f8f.9.1757849388568;
        Sun, 14 Sep 2025 04:29:48 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8346defd3sm6591268f8f.1.2025.09.14.04.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:29:48 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8890-chipid compatible
Date: Sun, 14 Sep 2025 14:29:41 +0300
Message-ID: <20250914112942.2604194-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the samsung,exynos8890-chipid compatible. The registers are
entirely compatible with "samsung,exynos4210-chipid".

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 383020450..30162e55a 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -20,6 +20,7 @@ properties:
               - samsung,exynos5433-chipid
               - samsung,exynos7-chipid
               - samsung,exynos7870-chipid
+              - samsung,exynos8890-chipid
           - const: samsung,exynos4210-chipid
       - items:
           - enum:
-- 
2.43.0

