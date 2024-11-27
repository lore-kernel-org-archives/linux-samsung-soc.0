Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316D1EC008
	for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705306; cv=none; b=BxU4AgVx+eZ2NdXMe3fljL1kCE4UveYWlWStW557rCxrUxXHHPPUFKncivtgqOIfGbNMun3HQXI71l/nQy+tAdR7CO3p4eFk+ACiQVhRgkrg4i/CITFVycUtRQsAxOTtlncbimLqyYodGNZMO325fx/1Kyvy32pflOKBa8ODzBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705306; c=relaxed/simple;
	bh=wuW9dlmQHK3i/Jcfb0eJR/IK57A7oEJMFzUPWXw07Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MI5PMscf+OE9FoxGr+LoBlDXGO3uINwpFPfb+g6gslrHw/EUw2JlU0oewaRDbk/W4hWcTlWuLXtnJP8g973+HF/4D9azccWGHca1ZJMF3e51LSD3AGzaTPA4DsTrLyA/jHBi9edqJy8HUiRm2XV3WWK2DcQivMPyfgIA2J4P1rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XvkDYawG; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XvkDYawG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cfd2978f95so9196959a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Nov 2024 03:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705302; x=1733310102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=XvkDYawGO4rLrHjuOYqc9USC/olOKHS/kuwzL+WCClMn0MJZNMsdLdBV9UsdlpJ+VR
         k7Y/yiMQSafgLrRjR6TY9QSkcPoPbg1Xh6/kEW+CpusbIvHPPvo5FfuzQLGsBTjyQWw2
         8J1v5O8qutOM1weFjrexJNNAwTsr+WpmPydiQJmoqlKExoqHzTiP+yTvUiU+2qWUJQAQ
         p0Mn3lMQABa8ds7dgIpAQoCSNmnEPWtnKdEC2YaIOGU+unIW9wsYEWR6+/ftyBXzhylo
         5wNgj9vv6Mfy7YYGU4OGXmvRSPqpoxFG/ILn82gJwazAuHJPZExOoG4p2+hjqFmBtggK
         h7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705302; x=1733310102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFCCGNoly/ihHw+f0V0Z4F6JNgdV9f0RgxXs1v/pmwo=;
        b=RYfzsZtH2v+sN/yX5T6wsTsIT8Ks9iQji2BkoomE1GlLzaL4j7wsbhPXPNit0DPODG
         jZjWCTA+8jAPk3ZgcMu7xS+ZmarJycaHQk6tlsQnc78QjC6XMxYueeJfc3RXAKx3oU9s
         opy6a5a3jCBjTi4kiK9HRwBjOxNEEt6w0AnIrqdBRlLQYw5PeSlmjXSvlPqlMIO8Q21q
         kKUwK2GyowlTxxnqYJi8OpxIzcbSz5zMPThlOD66y+3b482bpNj1jO982ZI1l2u3QeyJ
         r9u/1VtTZ1qKw/upGRyVTk6DwRw28Xe0Tpxfn1xjQB6Szcf8APrVYPLvm+lFJJQ1C0xJ
         X2zA==
X-Forwarded-Encrypted: i=1; AJvYcCUlZP/qOlHsE1MVKlQN/pvHTSI858tjY6sJ0W2kD9VE6G4WKEw8O91d/yhiqBRTGE57bdsXZkOPgNiOSQ9Q+PKbVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznz9Myb0Huh6qVYj7F0xvi+3bE51Vx8H5FTu5PBjTtc3IVbmNM
	R6SOMSjGMUGdZNj9WEftWTwkHOIVvSKwyk3FCA0Oo8KmsfTdo/Jw6p61M5TGvpA=
X-Gm-Gg: ASbGncv6PcUPeBMSAcPjiW5NXlPLrGpGl6gFjsGWGQwscIsoDtVHTfrcPy69ZDmM1tu
	UcB1IwqXpRft2fCugd5igmz+JwO4wtFJmqMLviqV9JWCYIU+KJRrjTL3j4ptwOXQdZuDx5Isd8m
	4C07KInVPO90de1WeVoHgJlrzDTnkbC2wscb6SjQFIJWjazzUOQiDsFZR+hoRUgNJfYlYW77QGy
	Ug3tgDPZL1NdEZWVjEMhKGrDU0VwRqEvB5iH+Xb5zpDxVxO9NG7bc25DFbzGJRV1/ao8rCgLPH/
	+DZ+Bn+OEi6uqAvPbifrc8/S3FR9i1EPww==
X-Google-Smtp-Source: AGHT+IGf8PRBbpu00lqdlanskxanZwbdL0mBeUOVNbWHJwrX3n9oj1hwGayugKGWxCGG58SnT8c/lQ==
X-Received: by 2002:a05:6402:2807:b0:5cf:4687:b816 with SMTP id 4fb4d7f45d1cf-5d080c64a93mr2444477a12.31.1732705302188;
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:41 +0000
Subject: [PATCH 3/6] arm64: dts: exynos: gs101: phy region for
 exynos5-usbdrd is larger
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-3-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Turns out there are some additional registers in the phy region, update
the DT accordingly.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..18d4e7852a1a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1267,7 +1267,7 @@ cmu_hsi0: clock-controller@11000000 {
 
 		usbdrd31_phy: phy@11100000 {
 			compatible = "google,gs101-usb31drd-phy";
-			reg = <0x11100000 0x0100>,
+			reg = <0x11100000 0x0200>,
 			      <0x110f0000 0x0800>,
 			      <0x110e0000 0x2800>;
 			reg-names = "phy", "pcs", "pma";

-- 
2.47.0.338.g60cca15819-goog

