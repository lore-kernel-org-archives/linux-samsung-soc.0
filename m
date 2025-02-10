Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F05221D85
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 12:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191926; cv=none; b=u7+JOGubOrqasl4ix8x7DOwQs/+5aLLBnN7Ou8qkbTsML6rmaQoWfZgLYIYLhafPoR4a2Oecmp6XQgmKYJeCk8RV1G2P7j6gKshougXJRSe9Sh4VFEhreIDJ/qcDjfm/eSyPUMWCSgLstgLiIIjjUF58tNOSvNevrYRTURYqEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191926; c=relaxed/simple;
	bh=Lpe/i5C+5b5vZQpv9IAlGMgPvHSa+dmXip2VQoCAS0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFHS3nD8rRz1NIqyBn47rwZQ984Dhro0JSxgPY0a5cbXKyYOhCnZAQjCxl+HOj1s+hGHUhGTyM/MxGBz8csb05qri6ax1DlR1Mmxdsw6lECbPAkYYkczEobdPB6PDniZIk43LzMtkIPvL4PKJwrUze3hIMIVw+HFa1t3BItQNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8ae7rQr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8ae7rQr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7c81b8681so114956266b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Feb 2025 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191923; x=1739796723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYPmCXNJ61WHCfUsNhpxuN9G44+VJ9mze8mbSqmqrmI=;
        b=P8ae7rQrhLXqSrf+iW4zq87i+o6WOmdPeQUQyzn2Kmi0c4pZQ8tUg825eDvI8nUHrP
         K9M58f0LLqn8tVgrXyHdYpBvnxGZoYBhu5H2nXUHKKngjqMGJQa3Xyb0edp89TYmKliX
         JSqRvxxCLaJSYnqq2p8Tp+WXGedkJQbeLMGcJRKJV5vpNvIIJmFhvmc3vqP9iA0BbYr4
         iEPQIZvs0BIfoi5XpBbS6Fw2B0m697IZ4aZRQlDL68lMmnhdbudKjUViDG4n3GvQVdUS
         If5a98F8eUtiW5mhm0AySPpD7Kpv2RIFVOOwYKUsPVT76JeIBhxuLahMNWl9hBTl6NaX
         nGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191923; x=1739796723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYPmCXNJ61WHCfUsNhpxuN9G44+VJ9mze8mbSqmqrmI=;
        b=ERrOjesgwicH1Hdv2G+BcmQ3ooEsuj4zrvNivZNvWOiugSRV8uIMW7KjxwUyKPeM1U
         iunTsgnjyGyTCmnF+D2rtHgi+ZRQ2PATLJYskXLI54iGWkFCppdL3j/yPIi3oqx+ZlFg
         cR1P/j1Pg5CHPVPZg2gIOBDLOuu2MXc3TNlKykNc1sEDwCCTjo6kU3be4N3ZEmmzHAlc
         1P08OE+0TcM9v+sCPdDqYN0bxwWqFIZ+Uosdw+eMUrgtnoQjOZlHMoz6ZY4qBJv8+1/r
         +NkErTpaSEX5sQ//9bVx/zj4JWbjP+FSOjvpRvK3omcurevmSe3pII6v+wRNz2d/uV45
         JDaA==
X-Forwarded-Encrypted: i=1; AJvYcCWG5xAknzOBehFB9Bo2knTfEIlkxz69fE7r9lbW/GzidOCOGD5yD19hB18CsdHiLMUACvU9pcGZ6RjcC/mLkCdHGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qcc+QIW21mxxaTWrvuzKghjGbrik8VgucCflY+caqVLv/WyO
	QAw/AXaGEieM8IoeMfP8ATag54qKM+A/l5djER2RsqimvcFFnWkdEV/+rT77djI=
X-Gm-Gg: ASbGncvaieX127xj/hITCuJB8OJ+0AaS3gpKI/A70KmMP1CbJTxE1UrnZifFCZU+BVn
	X4IbeO1xFUBxmhu8Ny9fjnqH0flTc5DXCTOR3IK82sXkvq8LXnGprdl5wgk13TWLKCRHcPh43N6
	Gdsby6MO5BE+KSrUmWNoDAzjJWAuHcNi3a0/zWNFbnfQvRnxl/4wAVxsNSN59DNHRCH8uyCaXFc
	/08GpJpZBk3TlutBlDLcnnZatAPfZQuKstGui49RPiomCC8SlCEiArQCJmrO/LhOcaJQeXo3Pv/
	QZ6OM1qHEfhpS4FgYIGy/Ko9Oz4FHoSWKBlf9yxldCUb+pwiJKdLFIYEHqsmEfjaN2WKcC6TK4c
	=
X-Google-Smtp-Source: AGHT+IH+NgzE2gbAq1itQhugXDlHXIYig8ArxGegZBDP7bul7fijUmgra+TzZrMkLOQO6b5p+6Fjqw==
X-Received: by 2002:a17:907:6d23:b0:ab7:5fcd:d4de with SMTP id a640c23a62f3a-ab789c50af4mr1427309466b.50.1739191923425;
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 10 Feb 2025 12:52:02 +0000
Subject: [PATCH v2 1/3] arm64: dts: exynos: gs101: drop explicit regmap
 from reboot nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-gs101-renppt-dts-v2-1-fb33fda6fc4b@linaro.org>
References: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
In-Reply-To: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

The regmap property for syscon-poweroff and syscon-reboot is unneeded
here because the poweroff and reboot nodes are children of syscon
already. It also is deprecated.

We can just drop it to simplify the DT.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 813f96089578..e78dcd506a5c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1400,14 +1400,12 @@ pmu_system_controller: system-controller@17460000 {
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3e9c>; /* PAD_CTRL_PWR_HOLD */
 				mask = <0x100>; /* reset value */
 			};
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-				regmap = <&pmu_system_controller>;
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				mask = <0x2>; /* SWRESET_SYSTEM */
 				value = <0x2>; /* reset value */

-- 
2.48.1.502.g6dc24dfdaf-goog

