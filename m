Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0825392D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768227432; cv=none; b=iUHp3gW1MlDDKi+9j/vAE7Sj863xgNpOmA9gsmQR0X1fD7gXsax4iUO9sHq9Gn+Yw0V5mfKoTJ9E8HIM/mZOHkKFrVrqfHiR6p7GYp+fRPSK19WivLyY7K0Gycn5H8IRjajpMmh9F5GXp25ZdM1uHPtSLeAUc28UVjCz2/SpCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768227432; c=relaxed/simple;
	bh=TtRpDGPGpy/+0HSyLMeQr2ov6Bl/3yzopI+7aSfxFj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ax12tUskRYu7RKPc8gLJgKYJpH8pywAz95cX8ETr8vjHASikm3EHGQLTkJl0ob7kK9Tif5XxTOZFnNmTyNaskAbgEPIlFZH7pauZ+Ib3NwtaSg+cdPqc11S7097A3KbG/UOH9HDHv/5aUDN7azwSG01G9T5nj9D4AhjIRTPdHhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xf1J5GdR; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xf1J5GdR"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-432da746749so1530547f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Jan 2026 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227427; x=1768832227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/mVNh0N4oZBNRtG/tnUEWsskBYzPAI0h1SdKQuAkes=;
        b=xf1J5GdRHQgfiO9VaiDsd4CmDGPUrgLB8aEwTd/395JHRttHIPASoVWpfrjmerXOOC
         c46rkcuqmIr8sHR94LdyNmFS+eWzcd9oVLpmdty3EmkwrhhtLkieRJFfJkLd59QWfI5B
         dKgoD5tkFd0kiAhsycedB4ivtb6jZoTH3Quh3wyMkMoVFiNOQCZu8yU7mpFIlP2mLiah
         IOfTh3I6iAN+CcrfYtteKiCRxTg0EgiF5v8D1YEG9Mmh3qCazh3DmByP28y9mc6x5K+n
         vFr91fS/smsL5w1tkA7RrQdFbv2p8feM7gd7s8N5ujDE/o3UM/WEz7T1U8qcKfU6+ukA
         e+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227427; x=1768832227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/mVNh0N4oZBNRtG/tnUEWsskBYzPAI0h1SdKQuAkes=;
        b=vY+YKWfBZgxqTe1XF8jKJGiZ8fD47pZ/B1EFf9/YuUtJfvoRIO2F5v0wAgOBqLrEVk
         NyxDy3byXwt9Z1IgpzQ7h0/xcM8gEfdGfNIoTimYjo2LEM5SevXN1ihmYabOlLqVYBON
         orcNNIcbwqcWGl7AmVQl9g00Bx/67zBcCtVdqiuxZXUmjHwaSuOhEa1+fWzO/0NCpwJ3
         zyYP26NU3k6ErPpqAxHl7gZbUPxE/C6ojz0LRpWg5clQSuW3/BFHo9tMbHCYiXPIOtnD
         wLe+Ym577DvrcXQ0cQcq9mUY2YJhoXXa+vcHiTSuW62VhTF01Lh7Tl8ZR4NxJe3bPV5g
         FBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMgGq1u/Weozb5ExHp4VQQf5qihYsvZBOHAuzQmlCbE31czugs6hIw9C9RsR3Ar+eSD23tMzEeEtg9G/fuRCqMRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2co04TVrUVucMpdrg0sB65nt5YN9kb2u2I8Gv/Ms/0G+o7EZy
	yVM5dxZgxMxJWklGeFivcAcoSpvJWheXyhd0LZmuyvgXjYkI1pyJOFC0X+M1rawXKrI=
X-Gm-Gg: AY/fxX4geQCYJFv7feqdannljoHy9nZWHdEYkIPWkVpLwcvuNySrbIuCokzOD9T3PS4
	Hxpb0JqNKloDAR+WgPabop0R8Ie1cgR5GWLVqQOSWZrMSBEeWHVucWNUPRq3ecwYfSOUZT5hL9h
	jE3/AwmNMgdkKT0oCTyvyfj16n9nhU1CWmw3h5Av8LD/DbNkUsAxdaaPPAKi+HZejOUiLLfQcd/
	uBOHwS0D5q7YICb1IhNUlhZOEJrT3NXe+mOnV5826/byDU3F6SsMdL+wC2ChVLGufSdfL53qFpe
	xboDJcjyIMkZjlOvYrL6NjrRJbQSJovVOuJ1HgImgfRraH0e3VlwebO1CAqS8mMmOQGoPftXIsO
	wIRaLTZsg05/RIDDphnCIGQKXkp/SM/zCRWYh93Ndxpp3zz3lnXXo9M2xyxX8urIJ/h8OYCUi2q
	b6aFyj4TaBb4ORyXQCESwszxL1FuTmDNHpjHj9gt5y96vZ
X-Google-Smtp-Source: AGHT+IFrBsfMSiMplrBBPh8qUuCeoTdCdDPt+sDIa3dty/7II6lHCVnL5PdVVGI/DhJcYTKl05dvUw==
X-Received: by 2002:a05:6000:4301:b0:432:84f9:8bf9 with SMTP id ffacd0b85a97d-432c37758b2mr23151513f8f.57.1768227426762;
        Mon, 12 Jan 2026 06:17:06 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:17:05 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:52 +0000
Subject: [PATCH v2 5/5] arm64: dts: exynos: gs101: add cmu_dpu and
 sysreg_dpu dt nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=TtRpDGPGpy/+0HSyLMeQr2ov6Bl/3yzopI+7aSfxFj4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJZjFN48vVWqUbIG+U37VQZOf/9gT4bcSvlq
 ckKiGZyCbWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCWQAKCRDO6LjWAjRy
 unirD/9Mha/fVtxUz74hDxmJSz/VqEgTSj/OJ6u+J9+JdyV7Lwqml+TGaesgzpsxtV+HfQRXJng
 j5Bfpj09IUytDIAVBnHUAEJE4GzXIR5Ce1GeTZhMYiSlgbW3ExrY2ZSAAEeN27s4dJJ2Y2g7OLG
 lJFI5Kv3l89I+rdxPa9i8seWQ+2dn3ziS06ifh+oqjJXqmO+kBCzbPE8YC81N9eRmUWA8LM3lLr
 lkleHD0VSpZEbevHvBb0p2K52mKQDvdZpF4kc8PFfwERWOADsNKerb5sNcufkq/LIUJo6UimYrj
 sl2P7RJneHmHdsiGVoZQxhpWLyVdPjE8oYyyKafk0Ofwgi4obHTVUbxQCV+zWdGLBNxCAhMAanT
 7QKVKmr6tnUzMPeeJ4Dx3Xd2sSNsURfMd3sEijJYXlqFAOwKoopcEVYb24wu3B338kAAi6FOw6f
 imcF9mKH4EmMS1897VNponb7JxFult2xk18Pv5LxmwrKATezwrj3QbfAOuOthqgWkwEA58FZIpY
 hNoUn4786K4qIpQUQylpNL+ZeysvOnXduehZMwVoqgRfMnaLUcXhTnOzl0z8Fh1MOnoKTalJjOy
 aUiZkmgIDx2pTssa36zCiT9H7H4rFck+aWfMcuZvpprPfPwSRWm8I7W3MXAmv+hZssWH3pJsKuO
 hfnOg+XpwVdfS+g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the cmu_dpu clock management unit. It feeds some of the display
IPs. Additionally add the sysreg_dpu node which contains the
BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
dynamic root clock gating of bus components.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48f3819590cf8c05d6bd7241cfed8720149c7db4..d085f9fb0f62ac2f57b104c20880e64d885d0bee 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1815,6 +1815,23 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			status = "disabled";
 		};
 
+		cmu_dpu: clock-controller@1c000000 {
+			compatible = "google,gs101-cmu-dpu";
+			reg = <0x1c000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_DPU_BUS>;
+			clock-names = "oscclk", "bus";
+			samsung,sysreg = <&sysreg_dpu>;
+		};
+
+		sysreg_dpu: syscon@1c020000 {
+			compatible = "google,gs101-dpu-sysreg", "syscon";
+			reg = <0x1c020000 0x10000>;
+			clocks = <&cmu_dpu CLK_GOUT_DPU_SYSREG_DPU_PCLK>;
+		};
+
 		cmu_top: clock-controller@1e080000 {
 			compatible = "google,gs101-cmu-top";
 			reg = <0x1e080000 0x10000>;

-- 
2.52.0.457.g6b5491de43-goog

