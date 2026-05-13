Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEDB427A15
	for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675846; cv=none; b=obaKUCEcCuOlkFXJAZeXP+wTGFG7U7e2JmVrRj6+kyuf4LmN86vurlxJW9Zd/LeHQ2PGohdGix0ZHAny+kOGy9kpkr02x2/+dAc/41ITzBA0AOBs2u+ZO4YbKW9g3Xg4BfCvvppfkUaVEEXt3HaKWnFlVbtKdApaZ7LsftYK/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675846; c=relaxed/simple;
	bh=o4lBBDo9eAjT/ZPpvEx+fz0ZaY5RNu9o+ne5xMIM/Xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IunZa2Jm9W4GQsLpxkFvvMkw5RN26FsM/Mo9JPWpf9JynnblJZiTAOjviCK6BsWRcMAAlBjlzdDWjaGDijYVM5FvQdwVJ8b4Q9cFz+krdmKtJCQVRIE2RgnFfno111yiXZov7UcAhn3yQUWOmHFqAaOuPMfVXLJctGLjk29xwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TL4Qkhcj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TL4Qkhcj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-449de065cb3so6135598f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 May 2026 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778675843; x=1779280643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=TL4Qkhcj6viuZzD40MbFb+ZFpagp6gVjqZtvHLOYDKmguHnDbSgNNmSBjYtXhd28gf
         6JH7/UNJHVcdiIvB/GrO4RAhr31dVdI7ZTkDohXElSp5KYAvTZuARSWGa/dmH3D7Dul2
         EdXnC4Qd1bQZywsBEmcbQkAcGdWBBjYJs+39r3MEPnkruVtxi7nsOZ19D7BYl5kZaJHF
         FotCWjVdMKBKy6vDY7+DgMZqv7UxgHMJNKH1AN0SB2O31zHnUf7AdQSNcYIwU51YEvGG
         R/GLipBiAywLpwR1ZRtfOCbMaMRpTXPqW/BTIzw4/yofwJIwbm7J8YZ5qojwa7jzChRt
         nv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675843; x=1779280643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LO818/ID+4f5iFNHp7OoRCd/tE5378VXxX0IuTr0NL0=;
        b=Mrx7wnmiIzjSCwElLXBwvOzht05AgFNbOAeFt4tqs6jxVUAK+iDsGra7t5kObsk4vb
         9DJLvil8eNHOJCI3qZv1o8tKfW+LZGj0FTANrbjPXYjvM+NbeHENOpJJZsm5/1z2orWM
         TGlvofSNSSqnuKluomN7pZnY6iUtivUx/htsCsxqkD8HfT8cGYA2HaDJkOA+DVwKbuPA
         dCDStI0Rh3CXhhWqgXRebec+Gjiheg3OffdeIusw90EUCfXJMWAgGVjrxL86U9wuTSHq
         OW8mqbomlo8amXI1fEy0ZTJ7RAYxIww9m66EEb8sKd1SpGFblP9HbKce5iPFbauUJ6BV
         cdNw==
X-Forwarded-Encrypted: i=1; AFNElJ9rHwj55gDXpBZA9NvqduFhHABZl1rA09E4+timL3JIQL9c8+ikHskRCXpd9nrJVrLkUAcVMWCSxWaZrCjjiiN2nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGx1PK5zyGLhlhk7SIRU0xIiPxPMV1w2wZ5rMkabZ9cOrA+Tj
	E0hmO9nGkkeWv9HI85Vf3tKnpBtVeahnSkaVI234oVj6eJ6S1+PANdikkLTs8TTnsvc=
X-Gm-Gg: Acq92OEdPYPLw10mJ9dVnmqnsr3nfG+IekvAydl0wNjI+8NMxcdmWs52YJFRXC1V7+U
	4t3si9cCiuYfqkQZf+HPLQAeCkBnNulX4mqgYzmYnJ9okFIA/AWdWnqE1u9bSOVEfkc+P782xN6
	QbMxXp1fYSfJacqIE5HRBTvYa3gj6EYK4U+S4iZ3fx9tN1efk1uRAkNTo8bCLjY7JkYZgw+VyXH
	rKvl6MHARJI26C79hthVz9NwnVknlsqtotZKpoepCNPzupWi5xR3Qbrj1G90yu5NtLACNiG1wUf
	04TTedxRZ9T/0oFqYnvhT1/4eQKawsI5TyXGt7pNvOQ/urCR6z/AuEaXRZ3SaKT2ZPe6g0s4Ur4
	HysFPyuefpWprknxcNfMcwTfvITYW/1ayVSV3/noCfNyemXl0F4dpURo0GlqxumdgElyJgTwdQh
	bTy0nsgSqfWS6vdELLgB/bNwgxHfV21nBryK3aPrAq8/x+fyxTNhL3CG62njwp30LGoAls3LEv9
	afOjiT6FHh/K8DPxP++DaSuz0E=
X-Received: by 2002:a05:6000:1787:b0:45b:d891:56bb with SMTP id ffacd0b85a97d-45c7b769981mr4290870f8f.38.1778675843450;
        Wed, 13 May 2026 05:37:23 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e4bb87bsm38899725f8f.2.2026.05.13.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:37:22 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 13:37:18 +0100
Subject: [PATCH v4 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-cpuhotplug-v4-6-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Grimler <henrik@grimler.se>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..04662b1c5458 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -231,6 +232,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0

