Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CC29114A;
	Wed, 30 Jul 2025 07:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753861383; cv=none; b=TArv27nXhhkrEii8VdnSLebOxz2ZVmv6b1kevIloD7ntoLKZxn2bEy6ZrSJobX2SL4615zte/ADZByyph8gXbfZE3tmm+6VfIAUGdswpAlyPOZ6p6wT4qT+m147bH9ZQ0EVA7cofVmwE9yUPll5qL7gE7FdabBE3oa8pFWBrTFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753861383; c=relaxed/simple;
	bh=Wd7Y7YNPuOwuqNdlMSiH7YdbVWZXReHGLAOutH5MURQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+U7ITptsxKpWUhNGGjFimHT6WtcS4IFQLVRKnm0z6HR/fCmP3sEPJNIghqWpZ07ZwNzOrY/TP/Qv1eUe24K4Gufcd3BuUcSn27FRAAkODTdB83d9wJuDm/pjACkq8z7/bQbUXF5X2PPvkz0Fd6lsqZr1zGtusH6IvUQdv9q3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzV111/G; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzV111/G"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so1316856f8f.3;
        Wed, 30 Jul 2025 00:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861380; x=1754466180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmNRahELJKfk7DGsqY94NUNj083rstNVN6mEe3rZUV0=;
        b=AzV111/G/dMkmDd5Qc+imEBYNlq2Cnj73sAeLJp0Ex6dNWvotFcXQsi8xg/RPtyiv9
         r/ynQpMsW7KgtKeNyqBiwjCBuQqqrE/iaWTQF6BkJroMuluxQHYBTkqzbvOzaR2FoYTq
         92BBmc+B28TvxLw5bnLaGvCV/edjc3BfcEhU5AlDyb9vuFf84xypr+h6xo3NKjCjr+2A
         7mTsaK+WjqhdEYN+cfzEGNZYcDCFA6NN0o3w4COjrUgdxb40SFcnleMxdXaInVYrrMuy
         hn7MXrF0TNumj8mjoZnVYy0zEiqqye8EpVJAXVJFMZpBNXOrru9aYNXzrDGRoEEV3dLo
         11XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861380; x=1754466180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmNRahELJKfk7DGsqY94NUNj083rstNVN6mEe3rZUV0=;
        b=hcPy5VufFTNpYh8VSbahtvT1rn+KEJwP0VdqUy/mx/CANjgGlLL204bfCxpKx4T22K
         2om/4txvVikbRlgaJtQ7xAI8HGyCRXBskQmbr3vU5mM+C1RKvavMYhsO2UXkbK5d3yA5
         xYEiLRDPoWWQvjtCmH+Rsm2TwfspTp4y+ooyGOhzOhP4h+oH+0ZCmY8D9VK8Y6Puk/6Y
         7EsITcpUl2I5PWq+QVEvSCV2NHEWgHJfwTZPFZEUsvPSjvRfQEaD2vg5w98VAusSqzn7
         44JFXiyEmkkxtYxk+lzwfjfsDIZMSqUqAW72K4J/YlJF+CcmMJ3PtOOsaGzEv82jepmC
         MWsw==
X-Forwarded-Encrypted: i=1; AJvYcCUviz5zHGUGvwZ0mZEF1lOXxaiTByDrk690Rh/YzI8UoqP+iQVVHHI+Hzv82WGQIyOfk4G4JsZotG0zYB9D@vger.kernel.org, AJvYcCV7vxlnvAWW+FZZx6iUjmhiZ0c9CAyOkijdpaiwoDs4C7ptuFvRGcFhiFc4zgoS8gUtyS0I5ZtPVliy@vger.kernel.org
X-Gm-Message-State: AOJu0YwUp4g+CQjhlSWfbd1l3d+3QOpVptvjIXV5c/Gss19Dm8N73Ayd
	46U/i5/ZXy1428pB/rpZofyMw+9x2ERNMeMrP3tnuBEiM3hzRwa7XPm7NP7h5w==
X-Gm-Gg: ASbGnctHUgmzLNM/ul3FbhDSs/S96Dzntr0o9nyREMrnTvI89CiDoqap2w/hs3kn1I1
	GVZqdRsOtOB0xTY4l4GLMXgIZZL2J6V1Fzf9dvmt/oEzmN6vRzTM8YDqLqKf7jAeer//+4Ry/Pm
	f9ac1vUTPTNEvyM9Wp39GiQSxn+oHk1MWpWifBitv5UnQU2In28KApA6rqadNdNc9cwRzyToL8Y
	6WpTn4hrNoxrPUBKYZtvemuxhE5uJOg0ur0VtTPvL6Hkl8diHpmHjkdWxbSPWy5rIf4q73YQII+
	KDFpzG36ZK40zuVYJroUPJhAarXMj/dWh+3/ZSfPQafzSiJ1JuykEo0C/RF7MNrL14JZH8jcJZW
	ZmbaZcAn98aas6vpAmWpZvO3it0tGTGPO9aKVh3AHLqpxLJtyRMPB6chmlYtR28psZwF1smfvEA
	==
X-Google-Smtp-Source: AGHT+IFB7pO5ICG2nBHV3T8aZx4gEhbOCX3xN4F7+jjWm+fkyHGaPOCgYrlo87wNUpQ+XfcovVmpeg==
X-Received: by 2002:a05:6000:18aa:b0:3b7:924a:998d with SMTP id ffacd0b85a97d-3b79500f77fmr1842762f8f.45.1753861380235;
        Wed, 30 Jul 2025 00:43:00 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:59 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
Date: Wed, 30 Jul 2025 10:42:51 +0300
Message-ID: <20250730074253.1884111-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some USI instances have swconfig offsets that reside over the currently
defined syscon ranges for peric1 and cmgp. Increase their sizes.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 943e83851..bab77b442 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -328,7 +328,7 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x10720000 0x2000>;
+			reg = <0x10720000 0x3000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
@@ -471,7 +471,7 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x14e20000 0x2000>;
+			reg = <0x14e20000 0x3000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
-- 
2.43.0

