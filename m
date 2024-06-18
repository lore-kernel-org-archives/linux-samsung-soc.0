Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1527415380B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718701298; cv=none; b=TXOtelZRS9GyesmcCSKykv2TIVrLe7c/lMDr6C2Q3AwEG4omILOnAumm7m+3wka72q2F8S93B4jqEWVJVYBdl+pEJRRBRwKps2T8EDNtPDBUrfj2+vlrHans75YnxXMg0xEXmcdUXfeMrKomcsYtOq1CHM7mrx2Gm6zNXEkjEOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718701298; c=relaxed/simple;
	bh=1ERlM9xbe+p9Wi478V8mqPsP/ZS3bIAAbT6Tpz8s6+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BQWsljuWZROFP4d9QLwy/LVkQ9QRx4uPA2U3zttoTaPgN4z/KlAi9uAf2iKlDuDq/LXYGNviFnp0OY3HhyUogqd8LgsoeEhRkaJhAsVp6gOJSiM7Em9v8Pb5hbF+Cump4rLmevRJw1aKvWLuOoG9Lx8mC8X4KeyroqLrXZAU3xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l8CvjjAJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l8CvjjAJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57a44c2ce80so6175240a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718701295; x=1719306095; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TY5XZJXNokRJfFdx27EQvsooJR1M7d0Z/bZec752EIc=;
        b=l8CvjjAJYGg4o1HIuP6sM6Qj0j0DGc9P2C/OR+nqgUq9+9VoHfPDtUHDrpvB4a4Ri3
         4/OEO6GuDYrKKX9VPEFD/DC2IkbHphuXvTkPEc1WB7w3PKKgr0kzfXE5dKIU8doQoyKK
         4N95N2oubUy3DbpMd+X5MWMce+ZwljQJKmoDYKIUqXikqo/vVEdC2NP5Nf/h6kdRM2xN
         Utnu+NNrUBFAse0KDBXpk50pdsz4b0xcTCYqHRUyshOOMgUpiBSuYS+hg0eTNVhXQYrU
         YxAcUzcI1L39cA4GOk72fJx8Wxvcz+QSel7TmSNgbxmE6w0JQkO20PMr055ZzIEkWe6R
         Wl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718701295; x=1719306095;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TY5XZJXNokRJfFdx27EQvsooJR1M7d0Z/bZec752EIc=;
        b=QxYmMpPIGshuKy3e2qBtgDJMkr0/IVhkk9DcN1QcHkeqj9GQACFkmEhLFTvwJun8iW
         1ddFGkwA4UsH70iUNOJBFbh1/JYwEUo0f+JJpgSYEbgrUjYFk9EpNFPQ7zomDW2Z1k+y
         qfXa9B81QfwYmW9xJ2zbMR9Kx4Ziq0FsRmwsBuUD0wIpjqfhSt4SMET9EcgDnSC1Jtqn
         McWwwbMdulA2ZKLlZwxnsAZdbaBhU9XPDp6i8jFhM2NU985PQJd1VcbpdT514h4QRGBv
         VpeXGpXImMYV7CNEhzkGIRx2P1LRHD6+eIxc0V0wXEgKL5JqA5TFFxP6XNV+4U1E+rGE
         iy2A==
X-Forwarded-Encrypted: i=1; AJvYcCWC3TO4p8GPWmqPGB/2PDvkBE/YDlm+TTTusUUXAF4rUD530P5i0emNuTVFzrBt0w8gNXCLU16pGqWbSyN2KR/vB3664CjGRS89s/uyGQ4G9pU=
X-Gm-Message-State: AOJu0Yza4N4s+l8BwPNL980s2BoU9/qWzUFGhSfMsumHGfGTmyAwzREj
	wZtApyLESlLh7tqV7iCwEXVkQiQEGPFGDq+n1gLyYFD4FgCyfIOHy1PIsXs+gW0=
X-Google-Smtp-Source: AGHT+IEMfNh1NAwANZa+CTASxafBgLpH8LEwjMP1KkmOFsQGGuf85H4JncEgCzIOFHv4XwbkvI/p4Q==
X-Received: by 2002:a17:906:4a4f:b0:a6f:38:6968 with SMTP id a640c23a62f3a-a6f60d2bd3dmr727559366b.32.1718701294701;
        Tue, 18 Jun 2024 02:01:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f8cc20663sm146355966b.190.2024.06.18.02.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 02:01:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 18 Jun 2024 10:01:33 +0100
Subject: [PATCH v3] arm64: dts: exynos: gs101-oriole: add placeholder
 regulators for USB phy
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240618-gs101-usb-regulators-in-dt-v3-1-6a749207052e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOxMcWYC/43NQQ6CMBCF4auQrh3TDhTRlfcwLloYShPSmhYaD
 eHuFla6MS7/l8k3C4sULEV2KRYWKNlovctRHgrWDsoZAtvlZsix4rU4gYmCC5ijhkBmHtXkQwT
 roJtAd1q3pFD2dGYZeATq7XPHb/fcg435+rX/SmJb/2KTAAGEWKGssJWiuY7WqeCPPhi2uQk/r
 eanhdlqZF0ir8/Ihf6y1nV9A9jfodoRAQAA
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The USB phy requires various power supplies to work.

While we don't have a PMIC driver yet, the supplies should still be
added to the DT.

Add some placeholders, which will be replaced with the real ones once
we implement PMIC.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Note that this patch depends on the updated DT binding from
https://lore.kernel.org/r/20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org
---
Changes in v3:
- fix typo in commit message
- Link to v2: https://lore.kernel.org/r/20240618-gs101-usb-regulators-in-dt-v2-1-85632069201b@linaro.org

Changes in v2:
- update commit message to clarify that the regulators added here are
  temporary placeholders only (Krzysztof)
- use fixed placeholder regulators, not <0> (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240617-gs101-usb-regulators-in-dt-v1-1-e2242542c518@linaro.org
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 5e8ffe065081..dec2c6d9619b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -145,6 +145,13 @@ &usbdrd31_dwc3 {
 };
 
 &usbdrd31_phy {
+	/* TODO: Update these once PMIC is implemented */
+	pll-supply = <&reg_placeholder>;
+	dvdd-usb20-supply = <&reg_placeholder>;
+	vddh-usb20-supply = <&reg_placeholder>;
+	vdd33-usb20-supply = <&reg_placeholder>;
+	vdda-usbdp-supply = <&reg_placeholder>;
+	vddh-usbdp-supply = <&reg_placeholder>;
 	status = "okay";
 };
 

---
base-commit: 6906a84c482f098d31486df8dc98cead21cce2d0
change-id: 20240617-gs101-usb-regulators-in-dt-bdbbcea25fe9

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

