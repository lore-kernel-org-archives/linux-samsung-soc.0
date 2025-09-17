Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852372D660D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143068; cv=none; b=Q4r6zZEQtVvFDtLq8q0fImVFZeXBBIQRlh+LPF0Vz8/d1zWvpj9IuOdTAtWdgf4S+qnjf9otYqrXx68aAlcu0Mv+UtMar1Dvak2mJFNrk9M6kfB2YsRg+bsuSbBKM6Lv6tK8ZUYg2Mt9G3RIlwpKKylvgZV7eimN/2oWEIug/Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143068; c=relaxed/simple;
	bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUU8knRqinAA9X1rOy7TZHHy0dlMypGCrSF9Q6Qt/PsERkTlDo/yi3WwV8OvbrnFzaQNsEvJJfFi11bgSE1EJewpd5YDY9XspUPhaIcwWq75NzwbMT0vN+brtCqfPzx583Or8YSwsDRr9jlY8vCom+gI25mDaQsKfvnZgHEER/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1ArTGWy; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1ArTGWy"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-828690f9128so38917885a.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143065; x=1758747865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=W1ArTGWyRqnTYKGHAot0IDOpyvcbXHNa+7rvbJ6kql9ePdleQxEaZDykoy5jV4rLIq
         Svl7lEQo0XSUXIOog8ukKpuI/7wQKIWwBKGGnQLs81lbjAAWC3EGpb+1xfjCoDP7idx/
         OobJiqzhmACQ9xxNzQFJ1oQpfOwG1ZpM7TcWtk98bXxISTDMEpADEzLuTr2+IqFyi3WJ
         FRUQW5pf30e5hzjB9eOBGSp/VR5cEmUtvo4jd4KJ9dsVNdpQRFK7Y/j6TskLCXklLqgW
         KaMf8sLDPIkFdNxZwqf0j4X/3bAUsvADZZfkMLTEeNNPrg4lBmDCaQvQTZh9ZDs6N6hn
         wMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143065; x=1758747865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5a/ds1gx4KqC4K8yXIVPx/dn9m17Z3x/DqzQJWTDvYo=;
        b=aub0SSiiD446BUXt0+71ijRrWNpk5n6PUetqpwA+kDAzVv6hZ2Iw+w0Hyb/4C5OF3o
         PyyYfCw9Y6KzEXNcd6iL8axb8xRpBkvjTz+xGVd1+E1izkgTXdNiGTAK5gHkaIah3tQY
         Pqk7eypclLIusNXPqMjqYu6Dh9LeqNKQTIln9ldNqFZHfjzW3GfkgFK1alUw7+j1a43r
         xWMaa55cV1/+msuEaNZoIppiKoF0Y6MbbgXXz93E8SM1RPeJLgq5oUSD5RChoJMZPtTC
         NiXe0LSBgmmfBxWJ3k7M5z9mJd9NbHVSQaVyapYSwnyjZc5o00++ZiU6ELclnq3Jaekj
         RkKg==
X-Forwarded-Encrypted: i=1; AJvYcCXVad5fZPZeoLg7sq2s4nrk2IvqgnPko+aHOuSnO3yBSNkLHOnIL5WVdvUu8qXPgxv1KfOKYbtRmSYuV/kKKP/I0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB7/TbbTvofE3fnI8L5tZAiPBq4l0mflRngciMbl2a2C+FGpwd
	++leJZlh6p4jcdxMnYd2X3rK1HCR96JW6iJMcuG1ivQaej3jHHE3gtav
X-Gm-Gg: ASbGncvCsPZUyulkJ4Ym92m/nW+H8rV7fkNPrrUxPO9y1juyTrk6H7oH8/alPbU5lrG
	ploGR15GEEInOh2RljqR43AVmgqeIpCp9RYpc6NAdXgHrGKG8IWz307Lm6xU5IxxE3UXL8nC1JY
	k5RBxNVUF65i0IKcmtBibgKSDBu223gvSD0l2xLM7OXLFecBfpAigQewJMMThBncmTHh0EK6/H6
	Cz3h1+0gf1v7IgWE5uDC00BJANnAczU1cB54BcaRo4zKKEqy1c3S36UyT6qcwkAw838bSVG/jTz
	4GAoNPw3TO3u1S03qOuQNYoN4vml8vhHblzYoZQqu21yBzdB4lEqctls3VAnoCyUQUgVtTrydIL
	JHpQCb4uEPhrnY1VnW4jcdHcwBp3DvBoC1TfO8N55YBHZ
X-Google-Smtp-Source: AGHT+IEEobNY5mvQo9Hoc9jbKWSLBHZgY7wKDYM2glD4z7n+JJRlXvy4lKtWRJ8ymIPk5RgLmHss7w==
X-Received: by 2002:ad4:5763:0:b0:77e:aba2:c8a7 with SMTP id 6a1803df08f44-78ecc629010mr31219176d6.13.1758143065008;
        Wed, 17 Sep 2025 14:04:25 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:24 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:22 +0000
Subject: [PATCH v3 2/7] arm64: dts: exynos990: Add sysreg nodes for PERIC0
 and PERIC1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=1456;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=JVGWbht0AIun6Qjlh68teSGaROXZ9yv0IlF+VdPftK4=;
 b=6YOZaTcSHvbt6omPx/EzhlCOczx1Vt1JC6Z7lBiY+k+fv+DTJVQr5K5rJxYxFGWXUnLopLalN
 4qogKvi13NmDJL4ihOAbEtFSO5xBLAvVjPCxZuEzyirS5zMFPlakKAf
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add syscon nodes for PERIC0 and PERIC1 blocks.
These are required for configuring the USI, SPI and I2C controllers.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 7179109c49d0b0984c8d8eb2d24c0be1c6e015c3..f8e2a31b4b7519b83aa31deefbc40e5edbb8186a 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -260,6 +260,12 @@ cmu_peric0: clock-controller@10400000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10430000 0x1000>;
@@ -277,6 +283,12 @@ cmu_peric1: clock-controller@10700000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;

-- 
2.50.1

