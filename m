Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8BC34C821
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915377; cv=none; b=KBuPSXR68bb7WrpnuE/PFhN8ZjrZRhy0cVqoVCDVDmyDK5xXMeCdR0P6bsiK7wtr/01JCZ74H4nbMu5XOMal3MC3dQLukae6G9598JM1OIRSFFYl1SzZTkxX3wKYiZRjBV0KEH/OnqLKBw6XrhXrxC+5Z46wsQW4S+w6ZBLF5H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915377; c=relaxed/simple;
	bh=6z7Q0cvkHq4tbrD8eYT1HprLcsjew57f94vW5406IBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O9qVciNYup2jw8INDISoyj3a+ejEkE2rHGj2X9EqhSh/zjRRYD+2feRkCw4OIyW7rK8v9q2qkNe0T6Rph3ePB+99reHTBBBgCD+RQ3oWItAjVHI2inOzUeZA0SKcpqfdBs3waMP2GR0umO6uUAQoMMtkneyOfdt+O5MFXXR/ryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kkrpuh+m; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kkrpuh+m"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso29205565e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915372; x=1762520172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pb2pqqKjiQQF/REmK83pr0aP945mNb4ceVK9gk57rPM=;
        b=Kkrpuh+mCAiuLEikgkQ09AEby3RFHS/bua6DrVqlOOVvJN/g2GFlh7RzKbxUO1X4QI
         6s5DtKD8pwnxh4TE+3/wLW7xjwfWU9kFXJgdkgzwSx5gx0gsEM1+cQp4rgvH275u63n+
         YOye8KkBZqw14djlWQ/jADCR2zbQU8nfO9sq5UoaUVV58+s9F3Q9R/7f+dqLEM/L1I+m
         iOTzAgMMrhKqxG0c2cYJbZVPd+qLoFbgsJ8jCFr4D815jqRaJH4lfq/72HsyJ5RrWCUB
         spy8Bv53/Ycqi/Awf8/Zq5GJgBfxYr0N5NXAHeoe9rJIoflYf0a7E5+LgZWsnL/EF9LJ
         gXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915372; x=1762520172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pb2pqqKjiQQF/REmK83pr0aP945mNb4ceVK9gk57rPM=;
        b=qRuu6psJcB6YQvA+Gl9gFmuvsRaQiIWfvv2alrNEdV4XnT3CrCDd7Mggd9epEzFu4S
         Tqpquz1Aptq23ZlomeR1F7Tn/wKiER2K109u//CtmgJrb7hgBOHH6D6svr7ep9pcD1wO
         cKU6jaF+pc2xRTynaZywezJMkjYSdJenXLEe9mp9jDOKRI83MXA32SjD5MIICVzasv5L
         4wW8L+BipeqSZR2oXvdFXnyPwbm9ypoB+GYcpbSTGi6S/h07F8o9rap/YY196wyYL5d0
         VrXEcqw9fSuOEWU8pFFkXkutd5nRyeDjASazdjAaxpJVavL2maPt2jUNMCYIIirV04xE
         maZg==
X-Forwarded-Encrypted: i=1; AJvYcCWR/5y8923GQfGXN6OZxb6Zxg4BJJK2vMDsyLQwBPQIZTlZyti38ikIkK0Fls062mWFTltK86ZPp9M/KyJ/1kuGcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGuqG6EyQkXRcZyoB1jonvQL/tXxgTfg3B7vCRGbuv9XGY2G4z
	haCB5HM1rCVAancW4NHpDUShREnieYS1g/xV9PZviyeCeObtv2srZE72MHCNuG9YcZ/DOanGPgW
	s1u5CBoY=
X-Gm-Gg: ASbGncu2F3kjAhlMiAiUso2QOE0tjuAitsVqMs/TYzhOR011LB388/3hKGsITUHLEmH
	pdUjQt2cVOk7iKt3pKghiy/JFp6JkinSS5s2yaH+v8kSDuiHPxG5593BFUrYcJy6pm/f4HcZpzt
	IOacTh588OrMck110FsnkyOR0R7qfIQ5jbk4AujcpfjCHzy6rSjs2mVAlhtJECDKzkzW6vqoKy0
	r0pdwbUnhMLXujWAv92pEHGs4no8pMPDmGlA+fh2H7oxq68sUXPxfQWDZw5u85xrRiXG9jAB9BY
	Jx3iTVHvl3KMQ7LJ0CFUG5MJjiJESD7ahhc4cmsgd0ICpYPJr7tZdJ9DFknvaduGjXuKdyK4FEr
	hO8PkyAPXHuHW6yyCA8sY+47b/Jzj0RMHR4QNxuGmi5Rg6nopDQz1SU+7rpXcL47mg2vjJIKXlD
	R/4yP7YkKKR+1q2g7MG7CAs5rFFMrqm6ult95IUT2zLp2fQtWfdilJEVRJZyPy+uY=
X-Google-Smtp-Source: AGHT+IFe9Oi7mS4HMXpo7MbmxHbms/ri8FM7ao6gprXy7xsckpCCyc1QnNO/QiFb7+3HO3HyI8NMYg==
X-Received: by 2002:a05:600c:530f:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4773082d988mr30938645e9.9.1761915371964;
        Fri, 31 Oct 2025 05:56:11 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:11 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:09 +0000
Subject: [PATCH 10/11] arm64: dts: exynos: gs101: add the chipid node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-10-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=805;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6z7Q0cvkHq4tbrD8eYT1HprLcsjew57f94vW5406IBU=;
 b=yYQOtlOsyfkQ+MckjcC3btLUJDkAj1qpgBndKzNfjoyKIYZHO8SXE786LHd7AVTIyfk2xLLcu
 xQlA5cf1F31D9ReKrE2i5sQrvXX/xPObullG3soA9LrWoUzwPegkidt
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the chipid node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..11622da2d46ff257b447a3dfdc98abdf29a45b9a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -467,6 +467,12 @@ opp-2802000000 {
 		};
 	};
 
+	chipid {
+		compatible = "google,gs101-chipid";
+		nvmem-cells = <&product_id>, <&chip_id>;
+		nvmem-cell-names = "product-id", "chip-id";
+	};
+
 	/* ect node is required to be present by bootloader */
 	ect {
 	};

-- 
2.51.1.930.gacf6e81ea2-goog

