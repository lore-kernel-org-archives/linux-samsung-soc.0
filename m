Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3582F6168
	for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 20:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388716; cv=none; b=kzh52mwhmBspTJs9mI6qS9KOt9jyXW/g+Cyud2eDh6GDweFD9HS7w3dLlqRuMJ8fJXCczQJW8TrFV/AybBOmo2odvjw8n6JVi/dkhO9sQrd3h9k8YlY/miaF1MhbBDVSn/O3wLx8ce68yU1j35wEPhOjXsnjGfD0ry6wLTwU0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388716; c=relaxed/simple;
	bh=bAE97azgYQAhmWtKU8+8+yqGEn7f2/ot1bZbtYrS+Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvabFtkFn+jZ/v6smf5ZhhX9i5yUDg6EVJmBicGF1behE4FuPVX28+BpDHvR2cN0IH3jVnM/VHH4wDrJEuYzwO0LPq0qXqP8Rt2BFE+as7tBI8dtORMn6BTfMkUgqIY85oJuSTRnl926SPEciVzUxZhsZM6XAoK87cmwVSCulvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuslfJAi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuslfJAi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so4146923f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388713; x=1760993513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLZVAB4akpL6sbRD9sjMqso66AN9VFCmtPd/UP8H+kQ=;
        b=QuslfJAiTDiIflB7ozjJtPEJErVDBya/Bf4Bn1HBoaDM68DLBYhXlvN3S7lreb24gY
         ask0yngAJ7+Pn5CE2lsnIly8Wq+U8ne1LdOFJ01fAeGs6od18+k3iSzAt3SbmsE/ix62
         hadf7skNtofVfoQSyr3HQifbfMpaHK6/Xb7hfHmS9oyojYEZTt+9mF7GU9rLbNxGvWXI
         KaxQwdm55oB4uGs/wfmfoEzi3nNUzaJqPSkJspDvgDY+DoufhFzNK+Lu14P3DkE3WM/2
         wZqD58Bu8ofab545hV/C2m0asXDYJlvZg8AJdWDnW9pxxw/iWZQXBKKjEPcBEILaP6+K
         Iw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388713; x=1760993513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLZVAB4akpL6sbRD9sjMqso66AN9VFCmtPd/UP8H+kQ=;
        b=GAbUyjrYkwlXLVOr6FvgBFB0aM2t90s68IveW/jHfL5Yz9WcZhOIgIAN/Mywv8M/ld
         kRBA5fEiHZf1ChjCiljoDsHrQ7F5NJVIxMb6ObTIrVhkGkTwoEQqT2WPE3YN3cV8QRVM
         MFXn2EcdxkJfAIPM/5meg7vvopZHhdDHE/4Q9QGKRsueibjJJBJcqd94csNgoagWSXJE
         oeyjVeghc4rlW/s8PXcyRdL8D4Jr0J7TXEc3DKL9vUddGoGZqTLn5lcfcs88JvbcNL1o
         faQoUMCnm13KWTqW9ghAVlNIW3+kbRwWVc8r8Hh+lACaP396lgDzCPgpSqqhK3L+RP36
         8+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqK8CIiZAo/bw880TowEJTYaamRci0h4PzPgtNY9DxTT01Dz25BpdAmPwaZngdpSwtX80fL7r58bQqZEPI8saAYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzli8DHE4FQ7lZBLTqitiOiwaAc8Bro1SH5AiG3rKxndFTBXr33
	Sz+P3BEGQ11o4Ytfq6R73HP6BcxNx0Gsey8syaImu+mDiLw84vr0obN6AvuTlXJBtlQ=
X-Gm-Gg: ASbGncu0cWTHGNO/+pPm7l/4Koy7jFtI7z0KTzv//ENLk3WBrd5RSmjFxjxvbsZTj9N
	zVWYo+FbtHJGfBu/KP6GvE3Zm0btaTm6e454SdjJ8+RWmalUt4DvLOp8v63UhVoZLiRb/uJtG8P
	OAmA77Wyf4pFgOD0Y0Jk8impEucpyRnjO6qfgUNX/g24xBXwNyJgubcDYsbHvni12nGcfAUkq4r
	YUc+isUyGNquVEnyoTMCOX0fb6CRo+49DIsZUcH1bSEZNSYrvLifRVhIuGc+9+zb5VJm+Rbn7tn
	75VWgX5V8jXhRFcZwUCkRCRQ6II80CyvbEjBMmbv+q2xMufz9S9peBbqCLXM6OY79eTtg07bYre
	naVz+hcpzVcK9theyB/XPVrrPNnLytOZ1d9o2Kx/dh7IUB3NAkfUFdHL8yTxmf1ODiGywGbE0ju
	4=
X-Google-Smtp-Source: AGHT+IGLquRNwbSBxeaKtRQn+InjdLBSfDT/oRT91BBW3oh43qrtNPuOuXBni/cQqnsMwhMF64WhSg==
X-Received: by 2002:a05:6000:18a9:b0:3e8:9e32:38f8 with SMTP id ffacd0b85a97d-4266726dceemr15446311f8f.14.1760388713482;
        Mon, 13 Oct 2025 13:51:53 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:53 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:34 +0100
Subject: [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg property
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=bAE97azgYQAhmWtKU8+8+yqGEn7f2/ot1bZbtYrS+Pk=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZYYmJZ8YONtySkBG/HUNTVydzl5bgMRMGRr
 qWszbbZnViJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWAAKCRDO6LjWAjRy
 umR9EACMEsA8OD7G3hLHFLspQRD/IOXCZ5eytSYfOI2ddJChBcnhWKTACe/Vbpqvez6XcyYt81X
 GmrTlyWhQbunFVspRlSPeILc4GYLllyGdXrUBXVbN58apbf7W3NZ1EBB7gmonHVrjSypCIONXLd
 b27BLp2UkuvwHcx7aD+ODzdbNbgvIN9HmlbDMtrpcF9ubfIK3HZmBwxLxe5/o7mcfZbIAAqKpBa
 i1dq9gfOe9INP/BYlYNjkEj6CJPuLFNWDxwc0NufLc2NfeqmeOIx873p0kqTZcZBePWy0KV6CoN
 TdccbhoutOiJKVYdYdev4D9m/u7vijeb5dXnh9LbXslbF3g88wEgfYu9DdMU+5OpBFRni1RC+Ji
 sv0AfCYhg3mheB4+0K29PBo/MogbPdBtzu85fITfiGOkDg4Xn1bEy15JGXFchaxbl4BtGyDzb4w
 1Qt0VWA8BDBrbpm+lW+WUJNpo3dYNFA3yJFyY5X31mHIqnAWQmhGMJqLf1ERzWLG6nZU81iOibw
 nuxAgb66x1aVneQVYA/3kILxbTkd9AOUICwK+fazWWP3V8rBKJuNeyzJHwzl2cPSqY0dMQNKJfh
 WRlShcCYi+UvirrOt1URjnBvTRDctgCGnmKk6FwCNmEc7G9vcFgn954ZQ6/ySUSs0LrrV3fLfOz
 JEA739XWyEP617w==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Both the start address and size are incorrect for the apm_sysreg DT
node. Update to match the TRM (rather than how it was defined downstream).

Fixes: ea89fdf24fd9 ("arm64: dts: exynos: google: Add initial Google gs101 SoC support")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 1ae965e456665bf05aa1b08269b5dd66b46d200b..ab66c055e0ac157f89a0e034f15bbe84e20a7e82 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1414,9 +1414,9 @@ cmu_apm: clock-controller@17400000 {
 			clock-names = "oscclk";
 		};
 
-		sysreg_apm: syscon@174204e0 {
+		sysreg_apm: syscon@17420000 {
 			compatible = "google,gs101-apm-sysreg", "syscon";
-			reg = <0x174204e0 0x1000>;
+			reg = <0x17420000 0x10000>;
 		};
 
 		pmu_system_controller: system-controller@17460000 {

-- 
2.51.0.760.g7b8bcc2412-goog

