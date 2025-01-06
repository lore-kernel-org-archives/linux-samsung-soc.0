Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2763C14658D
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jan 2025 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175494; cv=none; b=eAc6QoC/vqIeo2aH366qfRzi9gVu67XCZvQj3wuh8KKNW0cU6TA3Jo+0qA9q1bKHZZdFzIMh7D8QwXPj3Y5WSUf0kdf3HvPh0BPdATP05JWXEQlGN8fkzDuZNbJ857vXRJEZ3ChoyIIbU5747icfHZqX0YW5aA2wsT0FrO+VnN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175494; c=relaxed/simple;
	bh=iTH+glL8K3yAvVrgROMwFpjc482sAa3ddUjNd79KEUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oAPpyrQyVJGHrvxHioQK9V8wWZfJopT5jNAu90dL32oPu/052e+MwjbTrLjpZKdSQU41Xl2lJqIBgSUpH8pfZ1RqrxTjklrhoPjGX6NloJscKoSw8J1jkakk379jSOIrUu6vBkQuzy3xP2kecaT/SC0UhYiwyvbycKWmR3nz5z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PCrcpDV1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PCrcpDV1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aab925654d9so2545907566b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2025 06:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736175490; x=1736780290; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6sD4irUn6sza7KpMORXxjiIv2gb1G9wQAnmFA2ALjk=;
        b=PCrcpDV1QzG77OuUpg4Z5CM6iVNDPrb3oactl0MVXHoearTlBX7HXdjPFfaZO/P4Nu
         Y4c/5hEpW1G5fZJe0ylVn+ltnv6ZVgw6Cx462r5n0OEWSXhO2sVO0cQZQNhvf/tvwFJc
         kUhtZLP7lBSv6wK+/ZePeLwaPZ+FSvSU4btl+XeZT/kxUt32F1ME3dGkq7Y/pWd9fJHm
         ISvwrVo8da+FJSCrg7tqCLW1KOIeiRrL4P2kjVmpxNKyg24GqTPwHzkvXpgCbgjbvO+q
         3Zsp408w8DVgh8iqx9313v7XAS6NEjXSsFmy1QEWUB5twEkyqmQ+RWbYBeosnNq4ooGg
         zcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175490; x=1736780290;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6sD4irUn6sza7KpMORXxjiIv2gb1G9wQAnmFA2ALjk=;
        b=NRrVnHpQKwgxsF2ge2akwrX8bIno1ClJmk493ynDNfhJkTmMIq/+ugC/GOY2TW+d5C
         rWYynx4eZh0m5PCtP65WX00vd5NA5iHufbQaskkH98ISl9ieDOkt/PzDUsk7xr7LjJSu
         TuS2fCunjhYklwWOscUW/52tPVYDsktIZLY4LTh02Qrm/NyqrNsAjghEVabdGeN6aOA/
         aaK+M9K7E9CqjVcx62+6tWS+5lHca3GXtAbhL7Y5DqBMnhEf/uLgsz7rgsUbsxgD9EWZ
         vxEYloAJMISYTzsTeGfksNiB/p5hGnncLUbiWJl27NyV0Gwucp7ZqhtQy6c8Uu9wwauj
         Q+gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqW7j5hmFKuUcojWWsRHD3/x2uaLmkhbW/pTssE/rUboUXTeTTzW/D8NX3MQ45x7xrpucth3vIZ7TUYh9HOPjnzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuDHAQNoGW/A9umVcNr+Prm89HJ+hiaArO3RtOAmQ8F6jRZtH
	qB/ye+f62Y9vUXa0TR3enSJlntikq7FmZxxSbmXOhkbvCvrNJKmVx/wineuYOzg=
X-Gm-Gg: ASbGncvPdKaf20TOLuy6y3K4RdByMLLOc2uhOI45LMLOnT5vw8fDR/6Fz+BWK7EmM+8
	GBVpIM9R/yvEr1rRb3dexpoRzQ3K6hIexu6hYO/A1L4M+Y+2b775gv4QKE/xjWVMgTZBsEll6D/
	2OyDoql5K7KMMqkLSU/D3NsuskWF4a0RGkMFa1yU+Hc6XlAReMDU/YI9whWuhCqIQe0sh14e5IR
	i2YDGJhbxSflQI+CLf7PlYKCzGFWeEpbwyFnSKP0dX/V/WKgz0KwN04FnN3hLhLsm2klMZ3UEE8
	ZPEJxcjNeyc=
X-Google-Smtp-Source: AGHT+IFRjFd1+Nt8YGyLxt1NzKlQHb+mqjSKJiXkaCf2qGD/U15D7dEyH+i1RGInpgWlzwlThJF29Q==
X-Received: by 2002:a17:907:3f1f:b0:aa6:6885:e2fa with SMTP id a640c23a62f3a-aac2adc43demr5147987666b.14.1736175490453;
        Mon, 06 Jan 2025 06:58:10 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06542fsm2244307766b.176.2025.01.06.06.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:58:10 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 06 Jan 2025 14:57:46 +0000
Subject: [PATCH] arm64: dts: exynos: gs101: disable pinctrl_gsacore node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-contrib-pg-pinctrl_gsacore_disable-v1-1-d3fc88a48aed@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGnve2cC/x3N0QrCMAxA0V8ZeTawdhXRXxEZbZbVwGhLMkQY+
 3eLj+fl3gOMVdjgMRyg/BGTWjrcZQB6x5IZZekGP/rgvJuQatlVEraMTQrtus3ZIlXleRGLaWO
 cwvVG9+DTuDL0UFNe5fufPF/n+QNep9VudAAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=iTH+glL8K3yAvVrgROMwFpjc482sAa3ddUjNd79KEUY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBne++Ayfv+DgCfSMMhGTSVWQwjtT9Z5GStmctK2
 QFOzFqRLUGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ3vvgAAKCRDO6LjWAjRy
 umC6D/9x2/8qLa7E6Cz5xYryQFkBzBayGVFkwIiFZSMO1+c94kaw0HYoXUTGlZ1RDNCgYeoP1g5
 eHbZG6eP8MUDJwFo79Q6Tq3yAnhjCbGaJO0jYleXBd8+pmASLeG+hgegtGkpRcF0SYPvDvQLykN
 IRBmAN0i2Ym13U68AcvRPXXcm/DOJxrnBhe14xC7qCztd+34dsVhcBvtsaNcVY/CEFAJo/fD7/P
 PNL92kmpmJ/g4LXwiCCLBrOq7HfDA4cfAtF1SG7ltI5X0mwRniCThqYh4Emeq44TBZtQSahxc6Z
 wOP2k3P+r1y9tCMjsIt5y81bPmm+yd6ZmFqAucraNRLLuA42tIzOKiHKu06FQ8TSmkxKr1ZkhE9
 Y16fGKXFep/gAnccy1j+u7dgXkARiIZavBNEqMhKNdMlkDiSwGjpZK1Ygx9DTEPY9GUnI19OuGZ
 /XxqndN0geGf6dqUKQeHIw4keC/MX/LjXu2SIEIn7PZDq/RjAdBgGXXQR1DrUx4e2VLCOPK0MV1
 r+Wi+GarJFRFAevKM0ydYpgQdaypuRBMxbQKhQi4+KVo4CJXHhJSIj8/p9kizqMO42R1TpvnHb6
 nvu5vxbT9fGGM0jI6P7msEN+PgW8TxupxkmTUiL/mTxvUMBy35cqybgVziwhmja41u10geT+fJY
 tPCcQxdhgVc4MhQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gsacore registers are not accessible from normal world.

Disable this node, so that the suspend/resume callbacks
in the pinctrl driver don't cause a Serror attempting to
access the registers.

Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: tudor.ambarus@linaro.org
Cc: andre.draszik@linaro.org
Cc: kernel-team@android.com
Cc: willmcvicker@google.com
Cc: stable@vger.kernel.org
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..b8f8255f840b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1451,6 +1451,7 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			/* TODO: update once support for this CMU exists */
 			clocks = <0>;
 			clock-names = "pclk";
+			status = "disabled";
 		};
 
 		cmu_top: clock-controller@1e080000 {

---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241213-contrib-pg-pinctrl_gsacore_disable-3457c942b0fe

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

