Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082152D9EF2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 13:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030978; cv=none; b=kxuh+769nmYae+3YdwsI9v9SHIilLHPKO3D30oHF1yPZ17gO1v39xIEV0VjcA03iPRKYFdObr6x5JrIkIpu9WiE9KmYHcBoAT/XHhqt5cru4AQ1mDOKMZd+2mVQ6gxIG6NE9ewIBn4v4CKPtmFcNHup6l6m+DsQHE1xvIf8Xj5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030978; c=relaxed/simple;
	bh=c52L8F3youBOHwKUZLMi0OEdi/l/vlphIPQtPA1vy1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdjwlMDxt5Hd4+daKZj03D7769Q2NOdbdjxsyQiy83v6o7NEBeK6zA5Evbl2Uj4XkfhHopQo/7XLuWLVVehmcghe4HK+jh9ih3bF1dbIWrHU19rHrbgGzCTIGft2XJVh1Tkx3Wz6HRKARa28l9bLFfxq4KWProXG7lauvnLIUso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHWPnCeU; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHWPnCeU"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so3912982a12.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751030974; x=1751635774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq5LNL/kSi3uBykeBQ3vsMgUAnWMOb379Wxg3VYtEFQ=;
        b=mHWPnCeUqMgyeOscdwSspLDqet4Yy81Mi5GNtQqjcLMKGfB+uxLJONy0IdvS1Awp9g
         mdJt3/gyA2z6uG5VhlXMjGFYfaZsRXdi3JsvEFTbSpdW6FCmscFgHgWuwuomSTRNbecw
         AuoJjvGDIRGZr4f78tmSr3ciX6E/9tU+zi/59NSoDB3Fjr5RGXzNm7VW+h1zQm4ZgwnU
         Zewo09HqT6nFfzUdNrsP/ojXo+5j+IMCUbR9Y9YN5PUeBIdeJJM+cVQqf1lnN8yldu2C
         QDqRraeowF3hJvvqDNXrgN3cO0af7aNXYj2T2TGX5lU5/VtB7fKr554PImsBnE2ogY4t
         xjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030974; x=1751635774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kq5LNL/kSi3uBykeBQ3vsMgUAnWMOb379Wxg3VYtEFQ=;
        b=l6NIRfy1N6UbU1NGD/4RsnQdtN0zzbnJ3DJTprCdmJ16sujGnwMwvBO2zNzsGN3vRL
         cD9vJHO9+8+Cs2JFgLTghbXa+zkrSgLd21ZMYownK7RRP6DaHYhyU79szxGcUbm+ygCB
         ttf8+mUlZ1L7HTKlBoJgDPVfponuIFKusYTUc6fUJMT9FcZQYIMJusv4Cz+kyE7yNArL
         SmrGCOBnREwmx1dkN8j8CCNGe3yyCa8b2hxEuYONSKmT0FieH2cR367j5NoJBy5sca2e
         8o9/IjRs+3V6AZJyDaPLtEbJFnc5cmT6j8J6I1guOxm6agl0fANKGu5RbORXazKX7JUu
         g8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXZEU/RTjAv1mPxW051mq2PbtgDCQlBAhHdqNH4VAoyDjGzDqoKEzywOrpD/BNaSM92Da/jS+3UC8ACMW2B9DXzxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxtCZ4p3GuMNih5DyUUgRCs1PvMRswKhT3Q6drfxQiP/Yi+Uui
	8QKXMF1tOvetRlUEWek6TfcU8N0vEEV6PqQv3Brs6AbrTUj4Uh2c8ndMQt4Gn2PfKw8=
X-Gm-Gg: ASbGncud52LBxtAqK59jcuDc1taKcrhMKqF+w7MVi7bLiOEZ0lsmhHmGitOXeyh3oyH
	7OdQQ8spif7t6XyX9wibmDDIFstAncLpk4/gjzoiYIPnTC8EjRCjWTeDkg0VcfjO3MkCIWPnhMA
	nsi93t6XLnZzIvqBB2ivce9Tu68qNgeFk2xO1on22gbc0/ABLPJyk0LyUsrn+39hHMbuvGfxsJ7
	2J1XZ9qkfqIqbqBs18D5Bxc9UZ3v3oLEiGJdAa6JiGQd9HhFERqIGnbc3s1PkN2d/WZTJg7o+wE
	F+1yEypRqQN7HwSYL91VNieZ/0L3hZBYnmqMkujaCRlEj51MbNrbPXpjFXeIEDSGNCMYLaHoDKj
	l/ytU5YwiMzXV40xd0n2g3f0pFbI5RE3SttBcXSQ8XVwLzg==
X-Google-Smtp-Source: AGHT+IGd2c4uK8qXV/NnRe/7QQfP8S5dEOVPWCDF2KTWWSLjQcHtuBqYQ3SI9sPGJlwdlQ6x9htklg==
X-Received: by 2002:a05:6402:2101:b0:607:116e:108d with SMTP id 4fb4d7f45d1cf-60c88e72f3bmr2327472a12.21.1751030974100;
        Fri, 27 Jun 2025 06:29:34 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c82908297sm1462702a12.26.2025.06.27.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:29:33 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Jun 2025 14:29:32 +0100
Subject: [PATCH 3/3] arm64: dts: exynos: gs101: switch to gs101 specific
 reboot
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-gs101-reboot3-v1-3-c3ae49657b1f@linaro.org>
References: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
In-Reply-To: <20250627-gs101-reboot3-v1-0-c3ae49657b1f@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

gs101 (Google Pixel 6 and Pixel 6 Pro) supports cold- and warm-reboot.
Cold-reset is useful because it is more secure, e.g. wiping all RAM
contents, while the warm-reboot allows RAM contents to be retained
across the reboot, e.g. to collect potential crash information.

Add the required DT changes to switch to the gs101-specific reboot
method, which knows how to issue either reset as requested by the OS.

The PMIC plays a role in this as well, so mark it as
'system-power-controller', which in this case ensures that the device
will wake up again after a cold-reboot, ensuring the full power-cycle
is successful.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi              | 5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index c1b51f4cfb8c174852b44690f84ed1aa0b4057c2..84ff3e047d3b31b5f96d4d6c78ec933bb05f3e6b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -106,6 +106,7 @@ pmic {
 		interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int>;
+		system-power-controller;
 		wakeup-source;
 
 		regulators {
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 7fc3d803de39e654c1e8102b5e0f68995c3ab8e2..79a15fe7d336af3dcd9104d286bea525bb73e9e9 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1418,10 +1418,7 @@ poweroff: syscon-poweroff {
 			};
 
 			reboot: syscon-reboot {
-				compatible = "syscon-reboot";
-				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
-				mask = <0x2>; /* SWRESET_SYSTEM */
-				value = <0x2>; /* reset value */
+				compatible = "google,gs101-reboot";
 			};
 
 			reboot-mode {

-- 
2.50.0.727.gbf7dc18ff4-goog

