Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E441F5420
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 15:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966701; cv=none; b=lyys1oLfcSDW/lS035mFDkqYeU45NlCX082xkcZhxxFtKzzAqlfAJk+ILCxik+3iZ8qqd50ZcgpcLRpAFIp1WwDOSgdzPzYGvxkV1SFyg1WY9MaS2qXntsO3NG9m26IY3SsXNy+oZTGrHZ93kNjqycIUMlelDtn+LM8CIRmRUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966701; c=relaxed/simple;
	bh=HSyPEmJtBsHxDhCUULm5Dya2418jRqfFk0guvCilkbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+2IPreF4BCYhsVpjRXStHJ1Lg7vi0tozKSjOJnqOHXG//gpo4SaDHXx4w26Je3NIeZGvk42Rpl7U0waG5kHZwnNFuZpxW7EcJbTRQckyyhGG8r0OyLxpJHq5lztD9Xpcjh1ZjdLzcUfCJyofYct/UvrghcxpK7D8kBYOqUn7Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tvG5pOgc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tvG5pOgc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so21504245e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Mar 2025 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741966696; x=1742571496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ99iJ98td/B0zL57VABB7szu0CnieeOt84tDi+jGkE=;
        b=tvG5pOgcfe/r81tAPiVpE3WQr/uxysUpkxoK1ur9TDqCCCMR3nX+Jf0GVQkLb3UAG1
         eKHPtLkOHF50nhWOZ9HFaFTvJnt2qL9DRTY2bVsPZM0/HrWOdFuerkS+70Ph/R2QRwV5
         LprPQQX8ddlYNXtlIGAOl5ypU8keNWmYrVpQI1/58UhTlLCQmnjeIe9E7ocGbNRjynDL
         RTVJskTUxKzaBWO0SRKZllPH0+9DhFBgiCK0bYUZfelh90+iCVjE6aw0uMej7E32z6Pw
         k1h3q7PUqSiEETD3c/hKax6BcUec0dKg0RTWDxpRrpmivf5vB8vZPWuKbxG/A7i9jHX/
         7qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966696; x=1742571496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQ99iJ98td/B0zL57VABB7szu0CnieeOt84tDi+jGkE=;
        b=HxwTLsLnxClU4tGgAfkhOAMQUGuRzUnJAFqXo1/FyyJiPYVqAjqBfOA+jYHMwU4498
         oqp2E4FWf1UZRm2Bai6eTV1wygMgDc1Tcqxs+Sa5B0e1CY/GiKQErVWbW3KDE357liMV
         xaK2/UkUDaG5QVvO8TL/Uo4jtXBolVH6F5epH+PJObDYa/Y44LkELDkSp0ZMsgIYI7qf
         kjJUYZKe6e/I6KCMu9DFoTj7MDWh6WJOc3Ec1GHTg/odk+itWzPC3rrpcpBXn85yU+YM
         hCwgCorqFLX+9rdTYzMVh6LenCzBvm4aAzwSKT1RbjqsGGrLFwYWqTLghKY5tQcMoG81
         5AYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsnRdt3yOJIjGbCPuKPoj31pt3XCirwBYQnFfp0DKgqIvDtrU4ZF+3wqMkaMcwX7PfwPXGwH0GGyvLcyFGeAweLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEHU98SC8lFSwojXw2FjI8UdFrulH5sIxCqic5tkbuq1h60i+l
	F319CIA9e9WY7pOW+kdp2A/uVpHmHAQnCUyrIPavP4zSy06BbHWOv+aVPRyqhU0=
X-Gm-Gg: ASbGncvpX2v0ixvblqqALpABSX7wmDfDs8P9blGFWdljXzxu6ftb6K2UHm98q6iQ01t
	NMkjM+/8IKJBazD8AdhtX+AgaikCrCkzodoNESiKC95MPLzF2FSFmCcpXp16pNBbAHNlaZi/big
	COQltsNFB21K/oKC1YQt9i0mws4sNKLn4ULma6M28jRGCIxLmb6sR0QzRJIykP3K0sDFLaipKjA
	14TWjVYVjygm9VtoU2exeAsqZOLzn/EaRcT096v1P//dPBE5CXrgcIMoXhZN+ekIc9JL3I73UKO
	MfnPUhO/VNlW2unQAgw5rY6it9O86rO1rrzRMDnzIYk9MOOhhDIv9h6+YL5Bt2U7UxwWQdq1Uip
	t/o5ysW+j3oM=
X-Google-Smtp-Source: AGHT+IH7++KO6U3/Ls5QrCBpzBE8hSy6ZKSBdIjCMesbwEWDqmyH8LmW+4NNaM1O/LoeImomGS20uw==
X-Received: by 2002:a5d:47a1:0:b0:391:2a9a:478c with SMTP id ffacd0b85a97d-3971d70c23bmr4277553f8f.23.1741966696382;
        Fri, 14 Mar 2025 08:38:16 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb40cdafsm5944388f8f.62.2025.03.14.08.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:38:16 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Mar 2025 15:38:02 +0000
Subject: [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent
 property
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
In-Reply-To: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, kernel-team@android.com, 
 willmcvicker@google.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=HSyPEmJtBsHxDhCUULm5Dya2418jRqfFk0guvCilkbQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn1E1kYCQBmCyj5ZPX4kgCPL0qUhJeVs8SYMUGs
 jG0pHfrOVeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9RNZAAKCRDO6LjWAjRy
 ukfOD/9qIbmRkrjri21mRCY4ydKJb92uYxQTmLzBqS9EoQqKw3ypCrcUPmvcJfpaXhH+DpWLSSy
 a2IioXKB+tQuqZRLgTsSzAmFr8d1n3q67OAnvPh1Lbf81/vs1hKRH8pfjjl6cuRfZLpo7J98uwD
 rXzds9tzH/JHEJMWfqNXb5PL0x8yDubYQPlrg7FM74C9YYnE9gVYi8CPuXyYuPIeq7wzPaZfcYk
 NC4fLOfTgMXIscvqeUd+ybPUSz4iJQTqn9r1yKZikyXqyr7zdY3vHR5jhgV1TkvyKA56I6wA7Cg
 9mvSJgXSeglXhnLEnf7QqASjQxHkzcXPgQcsCmkfUsPWYuzil2U55RH2SI1Q33PhdjKsK4Vi9P+
 leUhppTQRotRB3f38/g8gyh45DP3VdfDFAL4y0Hm0hZWnRFmSBzPBgjhLoayKeln75j7B1vgRgH
 /8znc1PSTMKIe9EcT7LNnGe8+kSwHMOSuKyawIBFRQI/gGgiFOYvnWMZej9B2ZTa3uQp0WSbV+3
 /mxOVssXI9mS1r2sfTuMeV4BXfo8wPxsE7Bf10tVpbljxq17THjVCyjaD4qYpjWYBAYJ+NI6IZV
 vRqX3vpHKVMoL6e1KTNUEVHCDqmvnUCLNqOjia0oLpF/tAfqujQFEoig5Ck2h2ULDvvIB3trQ9k
 W+zbPT/ONn7vy5g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

ufs-exynos driver configures the sysreg shareability as
cacheable for gs101 so we need to set the dma-coherent
property so the descriptors are also allocated cacheable.

This fixes the UFS stability issues we have seen with
the upstream UFS driver on gs101.

Fixes: 4c65d7054b4c ("arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes")
Cc: stable@vger.kernel.org
Suggested-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c5335dd59dfe9fcf8c64d66a466799600f8447b0..cf30128ef004568f01b1c7150c5585ba267d64bc 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1360,6 +1360,7 @@ ufs_0: ufs@14700000 {
 				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
 			clock-names = "core_clk", "sclk_unipro_main", "fmp",
 				      "aclk", "pclk", "sysreg";
+			dma-coherent;
 			freq-table-hz = <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			pinctrl-names = "default";

-- 
2.49.0.rc1.451.g8f38331e32-goog

