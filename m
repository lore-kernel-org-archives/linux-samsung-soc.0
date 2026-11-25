Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616550;
	b=Y3TXSjskWstyS7GzXhDkYAoYNuWjBdsxPXxwsZzr63pSIWQkfGahMA58roCSz6IZYthj
	 5Iv6P2WgwCbnVK+1TexxbDx9+eH/ADQX4gci8ywwVbqxmK2CbyiLRoifeu8zDPnUYMzgv
	 PnE8mS2rbdM9dEOydhCz3z3Gi99THmRbsYhfTQYL5GWYSCqsgEp2Nlcjb+CSr47NtQkp2
	 KP7LEsNnr1NPAQTs2GBg9PUjPbkQystttxvY0dOpmRbjmWRKUMdmcO+dCqerxdOUEjmbx
	 geEBR7pSDEKTYDqb0N8a3eI/UMcJb+soeUBxqpPXd6rfcz4zdbFS25U4x7cAkaeTqzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
	b=ysyQurGVsydPhJboyirPX/iqnwmHW/P3oSuXcQQYcSHIlRVgfcu3xvXP9+LBfuUbY6Co
	 QAhK4HbqoWSEQYaYuSvi/U5ffayTsJI2qRWpNyN+NRp9Yvs+bDwUelA+LxN0UTHcWjcWu
	 J+5xIs9if6WOi/iLrGTHS9mcbTX5/Ibse+O1e9bgFiR9VGKGuAgLmxPnfVw64iwogPdEr
	 dGVRZ1fZNDvfV+WHBC1Pd5EWW4TsvAR/bTdWXPUIV5roF2EuWlEHnoiTMzl4Bw+bnS1Yr
	 SNeBKw5theB1iyW1KBj8nDfGGWyCwiaGnmRBnYO4TxfLYWILY1Ib2eT0XHib/8TGaWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JBqiJyHV;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F6B606A33C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14F6B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JBqiJyHV
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so7333722a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616548; x=1796221348; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
        b=JBqiJyHVxbIaJhvX7CSXxgauJzThYhz2o9o5ZBtO+G/porJf6N7RAEpkZpWIShdHQu
         KM5Qra5i5l6Xg9/rWu121XMDeXmc7077dP75qwmvB9/5YolJvMThPptG7jwOsn0RrPkm
         2pkDiCST7wizNNkVZUmCTB/s9yx3Lp02qDRDvfIOLUIO1XZqv9zq2EB/LhDW2Sbd9AaP
         J28Q3+TK3OTHI4giiyG1ZQyMJhl8fT1siMF/vfD66fvfHb5/61HXRGGFhlBahGPZDylB
         xahKpqaEPYeghWRoUN7I3krrMItEuh+quY9s+/PaSzra/cDgjEG9yVRJU1Ad31w6LNOU
         e74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616548; x=1796221348;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
        b=zytoiSoL7wu8/xpmnZPdMmiHUwdpKwyt0Pgmy58YZmsKpI7/B6rz6YNOpXE2jUbX7B
         TERcGIoRFyyS9kfIvaM2zCOLbZ1SgvWAek6bCLn+qvaOGhCqvAHPLW+E/fKpx6HF1ptU
         Jr/tjsNTtgqqlUbFHb6kaHGxjYX2g6CRMEcRGBcMAPj9BsFEEtlcj0MgydIwkDgVAWWl
         eK4D/SHRkkswhiDfHpJliAdQtBbudtVpzxy1fD9E2RU1rcjUzqBpFa5tV9HDH/Zxrbsg
         855SkvLc2vknH5bi0T8FPxneNB6EbT7jx2W1knH9oRasrgd1eNPe7syvXFSQK02dlZ19
         xYvg==
X-Forwarded-Encrypted: i=1; AL+hErGTg5WOolsm08hjmK8QJNNyD/9tbulJtlGqFlMRi1ts3bqzcXWvcAcbRkps+0GKwdK25xlIt9CSlH4ecL0K6E5lqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95Z1L0KVpS2/5f7DLBeFwCgTw0uW2syZeHI6X1ObiKIAXi0tjT
	PvV6/D8t/cL3+kfA4bBISryZ4PathRK2usgjix7VYCBuxqydMUmd9H198DGfAh8uF5w=
X-Gm-Gg: AZFdTZeN5Ns3Q3/CttmWWjEoDdaQmAivDHsVvcV//GTsYveA7NSEFp8bm7lysgAucaY
	jfdkqFm0RcNT14fthg7L/Hp41o/vbb1qfpBj0PCQFglkzG/CX09wTY2RKgYGAPURoPIVwrq2NVD
	lCih2cuyzFKkx+UxNkPm8pYv4ev65w01S/0xqIPlsaLjNriRPsNN+jDyyOD2vRRgPi1hdAdwYXq
	kZiiAxCxLzgfO6QJwn3VZ3/Pyh882vqBNgu6FbQHsAjlDMTQ0y6VdnRZ4mM8iKcIgE0oPYPm5PH
	UFtKksZoOFtkgXgjJr6KgLA8JVt1WqkLlcTtynJDVSg5mLWT+E9Nl0AVTeQLXk4vIOX8rxeXHdF
	gehzTTfHyR5gYP+0629BNKa19LJ3sueU6qNj90zbquPVhqN7AfNL4IdSPA3Swi69byQqMHrhwkw
	lI4VZwRAG8osmeB84sOGGKsP8j0O759Ic+/tRu6/P3IAouZ62PPqLgit891dkWk6iWpNvfXmruu
	/VqzcvNIEKHw2QhFIbhNmLeGfdy54ofIrVLRcaLuC8vo/bW40/Y8xmFRxSmw0PIuZKmPE7ORaCX
	qP36JI1eIdlPGKvFoLn9cQFKVH/rxngyOTb+iNJYqf54t+DnGUkr8tHLKWRsD9QEoku7jefP8SQ
	HR/zdO9EKrbZfAgMbuw==
X-Received: by 2002:a05:6402:1e92:b0:6b7:d55:87e4 with SMTP id 4fb4d7f45d1cf-6ba37e831demr13309656a12.25.1795616548357;
        Wed, 25 Nov 2026 06:22:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm8315989a12.23.2026.11.25.06.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:22:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 14:22:26 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add BC1.2
 completion time
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-gs101-bc12-completion-time-v1-1-8fed7a3a7f43@linaro.org>
X-B4-Tracking: v=1; b=H4sIACHvBmsC/x3MywqAIBBA0V+JWTfgSA/oV6KF6WgDvdCIIPz3p
 OVZ3PtC4iicYKheiHxLkmMvoLoCu5g9MIorBq10R6RbDIkU4WxJoz22c+WrFHjJxmjZ+X42piF
 voAzOyF6efz5OOX/us8bmbAAAAA==
X-Change-ID: 20261125-gs101-bc12-completion-time-cedf7baa41fa
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

On hot-plug to a non-PD Rp-default charging port, TCPM can query the
BC1.2 current limit before the MAX77759 TCPC finishes BC1.2 detection
and read 0 mA.

TCPM reads the Rp-default current limit upon entering SNK_DISCOVERY,
and the gs101-pixel-common USB-C connector node currently omits
sink-bc12-completion-time-ms, so TCPM does not wait for BC1.2
detection to complete before entering SNK_DISCOVERY.

Add sink-bc12-completion-time-ms = <500> to the USB-C connector node so
TCPM delays entering SNK_DISCOVERY until BC1.2 detection finishes. Note
that this adds a 500 ms delay to every sink attach, including PD.

Verified on Pixel 6 with SDP, CDP, and DCP hot-plug and USB-C PD
attach.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index dc908dd7e1c6..13cc8a90a3b3 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -668,6 +668,7 @@ connector {
 			cc-debounce-time-ms = <170>;
 			ps-source-off-time-ms = <870>;
 			sink-wait-cap-time-ms = <450>;
+			sink-bc12-completion-time-ms = <500>;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
 			 * source up to 1.5A while extboost can only do ~1A.

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-gs101-bc12-completion-time-cedf7baa41fa

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

