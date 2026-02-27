Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E94322C77
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772181602; cv=none; b=SY36p4/mdaqWUP6hTKPfE1YCHuEvRFIAmScgsu526iNPJQ3pEyMqq1wySdtPncejfJTMK85EyZ9Av0weckjZm9TzE3LNokk69VdNsaQGZfzHCnATNDPLaEbFHvfnJpU9SiNes39vf0GssArC3IPgSin980ZyVe84Nydez49t9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772181602; c=relaxed/simple;
	bh=NbLtPWDPx0lJhzQfbcf147KsaPcuuT6CSyua6Mp0zqw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RpTxM98I/Shfvp7k7wGveD07br41ea6qoKfeaH+7W6B9oFiOD0C5JQpLGUEtqg+mwtXzOLRdhYd7JFCBpvKJatzaLd5VeBkcSx/s9Hjq1GpttU5D3ItPZ4S6T7LcHjavNy9PWysHURIPYdHDU2pjkePBON0dSJebad/qmlvVhfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I1uD1S3A; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I1uD1S3A"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-12733603eb5so36725237c88.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 00:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772181600; x=1772786400; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lhND4v1aUy9aSZclAOzKSGnysjiQszdyXIZxCYh0ppo=;
        b=I1uD1S3AJ6oTN7/OSvUmtMSUZdpWw1KKClM6i42hJ7m1x6HSC+5PtutDC7yj9R13MR
         IMvWORyGiVqp+u06ikR/gqtVOM5W4SPypBGm4cULDhfN2ApEYHwz4XM0E9iqcpixJt2Z
         HSCB79RqlwK7T7gmVaVoGF1SZLRgLbnqafu3zWXJUHea+hjoelJq9+p48NnMXI1t0RXg
         Yk62j0Bteho9gpD1jHUgt+61ggGCAxcWHWHSJ8HU/qXkj844BhSL4DapnBCa/1Vo47FC
         pLZd8fEFzDtHlNf1SJDnil3ESP6SlMc319y2Ux9huPvsdTJT2G+QcNfZoLzLgKm2p8cD
         0qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772181600; x=1772786400;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhND4v1aUy9aSZclAOzKSGnysjiQszdyXIZxCYh0ppo=;
        b=afYg3TKKIuEq+mgkYN3HDg7zwD+WCekM28YNyVd92sKtMTNIBcjAvBiXObjl76LqNP
         pU/R7Xv+Ko1BIPKYvRxSH3e4VQvcU0TxUc9T4GouIZdhN9OltSc/M+mftF6MFsqACAy8
         zIEazRWnSxKOareB/aAbgrVAIzBCMKrmL13C/D4H7cUGhgay2oQRbiuE7+qQzf1NEdOj
         ORkA4gP0Fzaq3a3rHCV7cV6GvAuGhU3Cub1adjHjFNrRo0XoH6ALAyi6Cpm0wVCzu70h
         jD8COmhuuG1OGaUiEdc3aJq+vRBk8D8EYbv2DoccTKf82mVlQnxkLd95p95WJzm0SAlH
         d6cw==
X-Forwarded-Encrypted: i=1; AJvYcCW4ZxT6Ti5kAWNQa5sYAF3JJkl9FCGE3g73P7Mfnv8/dXhddoIqLHJQmtrCaibA+ooatKa/+GPooVKGuLYgXElBBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9noZH46vc6kUFO6D30RoY8C2rxXISkujbHG0O2HQqF5WfQpnY
	e6HkqnzfINy5am2g1PctUqodbKBT/95d5Ci+8GS2lLI9NG4eB362KQrfEYeZvMb3nthb3YT1sd7
	MEp5Qaw==
X-Received: from dlg18.prod.google.com ([2002:a05:7022:792:b0:127:93b2:e6d4])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4590:b0:11b:c4ee:66b
 with SMTP id a92af1059eb24-1278fd6e09bmr954659c88.37.1772181599531; Fri, 27
 Feb 2026 00:39:59 -0800 (PST)
Date: Fri, 27 Feb 2026 08:39:54 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260227083954.3529857-1-badhri@google.com>
Subject: [PATCH v2] arm64: dts: exynos: gs101: Enable AVS APDO
From: Badhri Jagan Sridharan <badhri@google.com>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, amitsd@google.com, 
	Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"

Enable USB PD SPR AVS for gs101 by adding SPR AVS APDO to the sink caps
pusblished by gs101.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Depends-on: https://lore.kernel.org/lkml/20260226055311.2591357-2-badhri@google.com/

Changes since v1:
- Fixed Depends-on
- Patch rebased on top of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
- Link to v1: https://lore.kernel.org/lkml/20260226061053.2596167-1-badhri@google.com/ 
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 93892adaa679..5a689be61432 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -174,6 +174,7 @@ connector {
 						| PDO_FIXED_HIGHER_CAP
 						| PDO_FIXED_DUAL_ROLE))
 				     PDO_FIXED(9000, 2200, 0)
+				     PDO_SPR_AVS_SNK_APDO(3000, 3000)
 				     PDO_PPS_APDO(5000, 11000, 3000)>;
 			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
 					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)

base-commit: 5d692f20de6311fa507c952adc3487c641edee00
-- 
2.53.0.473.g4a7958ca14-goog

