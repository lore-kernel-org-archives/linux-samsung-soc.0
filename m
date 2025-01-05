Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7074EAF9;
	Sun,  5 Jan 2025 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736093034; cv=none; b=kDY3ynPuaCf7Db3R373lUghLYe6s2Z994rhlprOEPGcFFw4qm4TOfEb3QRI5WfqKOtJUds07sZmLPS/f+IjgcJSD1Zz4f2FcplfDy7AbAVozgawy2fqsVhvIdcUTOmuntuQQl1gaqlsRvyorNbJ3q3mLVvzrefYwckvbbRtxjAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736093034; c=relaxed/simple;
	bh=0J1C9lFRulSwhzD6h10ziliSSWEnlRk9LkblU2QtC5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6enG3a/tST0adnk+p7vCjUJhfF6pktadgv/n1qNeFftuh8Ab0CKbqq+6wvMVy1lw4aT1dZCPD3wwgUpsE1OgUBBzYgiQikzsAdI9ISgG3EJhk/QG4PuJq/u/xdFlqoC7EL9lEof1/jJdPcE9boeLIpEO3cS6ugyTg4FkZtlgLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpQ00gSY; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpQ00gSY"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385e06af753so6855225f8f.2;
        Sun, 05 Jan 2025 08:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093031; x=1736697831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxpBQHMVVAeu7IpQ4o3HFNNtsYdEjzOkw3t6mRR8+ds=;
        b=CpQ00gSY9czbvd4gWqLqOLPA/5iJ5D6Z1ffL1oqxDMPoj0OZUjH+O3HkJbsBsEAac3
         JmICzi0lSKlkD7fRYjQb9x9+ajJHnMYPB7VYC27jLfFDSQBHBNl6I1MXBPc8xPU7kGsg
         1RfKIf+R48H3nHUcJHK81uEhPnVuqKPTOLctt0RccnYdBtW790aWTsa1nPoKnZiKaeyy
         EMzuDOQz8+NfPNuZkBEzWl49jMRYKBrfdgi21AAy86cfzYX3Wkn8GnP6riJiFnPckXcn
         ffU5/EqJ+ndVfx2K23Q2+kQMt5I6mf9Dc2PtRHPSZRUc06u8Vb0RSUumYXugg3itgUPc
         KOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093031; x=1736697831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxpBQHMVVAeu7IpQ4o3HFNNtsYdEjzOkw3t6mRR8+ds=;
        b=xREN3TtcAGWwpGL235EezDEb4i7tGmPeBoqYs3e0Ttwm4Gl+7W/0bipoHV7fhcPnR7
         4HOAbiRzwfKS/3SmxCfjkvrC/TtHPUqQFcHBcDw9SUnB75QprzxCmkuXduNolHionVKD
         aCd2Z7FlFjBHl8J4eKYvn3cE9kNqd3+iAVHLpHwLhQl8TDJXib9jUuZdhp46/iZHx8E2
         eVvL+M00qmzysqqU/mJC3Eh9CwQQvjMHzJkJiVWIvpa2LmXu99gcSDEZm4efSysm62W9
         iVIr1rYMihC/mZDX7YjObn+NEpj+W/1XKP2AKJUaF4JQHhTszGru3yj0HgibkeDB/t3i
         rOcw==
X-Forwarded-Encrypted: i=1; AJvYcCUedW1+0DhSdaFJXrmeWNzgEyMWiu0kJB1gTLR1VXfxBsbT45kzvbOmQAwquREa2C/TLU75g2M1CPj2xT/jtVepXag=@vger.kernel.org, AJvYcCVida1diEQoMR8EpKoxQVlfAQa0GQ7hf/wEEjTMtVpsNc8UhdTzdFGcT86fosFQF+UKBhJQTKaIfI+5CQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOmp7G090JhQugRitJq34qZNqv4amBPFHVx6UOsozM2u8wzpe3
	9VaG6aaXE9326xkh/1iFI8S4oytKM5yo6BFPkC8RkpCszlAn4dCN
X-Gm-Gg: ASbGncuDmQ9T60179o7HK8+F2CUgbAa1rYIE0Jty27AIt+D+95JDKdefr70bjz0rr77
	WlCDhrRE3mmX68yNFtiqdIvmfNCxxW5InLsKnIRgflCoQ5isyILdxS1Zik/aMAJpPuK4jo3JncF
	+v4i16ZdQGhnMrbSCw1uMRVn5t+9D/qn7k/bfcMAvufH6JQngVihbL66RUwB7lox0hyVMz+4j3a
	cV9jcvxok6BDJvpv4LUxyyJD/gjZXRPaIhB54H5nVcciOIUeqygwM4HmlK/7aFvJ1zjuDE=
X-Google-Smtp-Source: AGHT+IGJBflGdaxt0JBE4erJyFzFCgFvWRqc6oNwoyTzVkgdyLbBhurZLdzmYjBfDWndtHNBB3/GQw==
X-Received: by 2002:a05:6000:1542:b0:385:e43a:4dd8 with SMTP id ffacd0b85a97d-38a221e1832mr40868935f8f.4.1736093030684;
        Sun, 05 Jan 2025 08:03:50 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm46031925f8f.44.2025.01.05.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:03:50 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: soc: samsung: usi: replace USI_V2 in constants with USI_MODE
Date: Sun,  5 Jan 2025 18:03:43 +0200
Message-ID: <20250105160346.418829-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105160346.418829-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the original bindings commit, protocol mode definitions were named
with the version of the supported USI (in this case, V2) with the idea of
leaving enough room in the future for other versions of this block. This,
however, is not how the modes should be modelled. The modes are not
version specific and you should not be able to tell USI which version of
a mode to use - that has to be handled in the driver - thus encoding this
information in the binding is meaningless. Only one constant per mode is
needed, so replace USI_V2_ with USI_MODE_ in all constants in the
bindings.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
I wasn't sure if it was appropriate to add a Suggested-by tag for
Krzysztof because I haven't asked for his permission, so I didn't, but
if he wants to add it before merging, please do so!

These changes are a bit tricky to approach. My guess was that this would
be the best way to put it out - one patch for fixing it in the bindings
and trees, then add exynos8895 to the bindings, fiddle with the driver
and finally rename the constants in device trees. This breaks
compilation if the whole series is not applied, because the driver, the
binding and the device trees use the dt-bindings header.

If anyone thinks of a better solution to organising the
patches, let me know.
---
 .../devicetree/bindings/soc/samsung/exynos-usi.yaml       | 2 +-
 include/dt-bindings/soc/samsung,exynos-usi.h              | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b046932f..cc92a06a3 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -144,7 +144,7 @@ examples:
         compatible = "samsung,exynos850-usi";
         reg = <0x138200c0 0x20>;
         samsung,sysreg = <&sysreg_peri 0x1010>;
-        samsung,mode = <USI_V2_UART>;
+        samsung,mode = <USI_MODE_UART>;
         samsung,clkreq-on; /* needed for UART mode */
         #address-cells = <1>;
         #size-cells = <1>;
diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
index a01af169d..b7c1406f3 100644
--- a/include/dt-bindings/soc/samsung,exynos-usi.h
+++ b/include/dt-bindings/soc/samsung,exynos-usi.h
@@ -9,9 +9,9 @@
 #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
 
-#define USI_V2_NONE		0
-#define USI_V2_UART		1
-#define USI_V2_SPI		2
-#define USI_V2_I2C		3
+#define USI_MODE_NONE		0
+#define USI_MODE_UART		1
+#define USI_MODE_SPI		2
+#define USI_MODE_I2C		3
 
 #endif /* __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H */
-- 
2.43.0

