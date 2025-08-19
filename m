Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D64A23
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605434; cv=none; b=LMCL5cWozOyFTi4YyfhOOctUyJWzl9pFIBv2imchlEiJP8/Jhvw5s/EpP1E0AaajxJFn3pnKua5TSKVRcddXdw2YUgW5albPpURNJ0kBIieMl9fntaYzQpVcNldjEq1kbRmMKwKQrd1b/8X7q8qjF4T0t81fsA3WbUUMMIVfrpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605434; c=relaxed/simple;
	bh=ea6fVOF/ZPzXpkLEtEhf8jo7+yKf1XzprUPMMimndVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdxiNVPTtCIEsRHkynGfFe5jOm04wkvZdjn5fKKFJ9+rcFRDuHCNLUqaTJ2HUfNqPY3l7+FoTC/fDccFAcHfooH6FafDFZ8LH+IJtgdZo8r9PXRfnXq4EmoLsw2dgy/cPVtyWwkSSF85fbqMs2t4jF4vd665vQZE9KP1bTDxutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jRYXn19Z; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jRYXn19Z"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9e413a219so4254200f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605431; x=1756210231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+5g381r0R3Gly5+53b/VNyTXs/xlV7IGrG5ZNJb+xs=;
        b=jRYXn19ZzlkV2bwhxXB8QX7ZNnQpTUjZ118y5dbac+8Nt5x+3NU4zBu+ifUNeBU253
         kY9GBf6OarjC025s4PnAhDBoV68XmHcZlCwXKkQUR/L9Q51CAmcUIWFidcwfBmhw1ErZ
         orcHCWvZl57f2xvnWp4PtHY5qV2j0JOSV7k1OpQeUUFDeX/OENmUiwuYMxFfNtJQNyyG
         KUvRd7lG4dkuXYHM1ybumPOcTvqYF7MSFwrxRxi4UptPPHTy1z3I1u780NczpNd8mVoe
         ld1fWFeaZkb8EzcbKq57l138VFouGs1b9YnDwsrqk5h5YEIM93MM2iWJSUcnN2xkjukH
         wcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605431; x=1756210231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+5g381r0R3Gly5+53b/VNyTXs/xlV7IGrG5ZNJb+xs=;
        b=wpjK0GRTyqIFzxbv/6YCAxsNjg9OYnalqc2nwYPXpz6AjQmKA+ueEIX1VnDl+4Vyn2
         0BtXTkpHJaUaMBGjuyAt7/I+Kl+Cauc6bi2N/jGJmtBs+GhTnPUIBOvW758CoE/2o1Xr
         QGxTvTLWeyShHvEX4iXF3y6snElf3a/ujnCa2QeEQAvdN7sWLgQu1j+jTQmHWhr/SLRe
         cOT0pQf8B04bSWWX44YLmHigMA5QNtl4JWRrQriy7JO1G68NQXXMwtRTKkkWBuD2aSyp
         fTkwmq9qDI9rzZ49mQgU9aTE27WuSoXrx8GR5Nq5UeqBhZYdAHePWPr6Y8sT2SFYyDNv
         3Wrw==
X-Forwarded-Encrypted: i=1; AJvYcCXt1fabYYpfwnCSknu2Z9aQdBejCbee81K2r4cWF/FoRfCJnenPN2uK3sUtNHVrSXsnI9tODmJM1wrYBiTeJNmtsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeDTXNaFjvJjEYGWZoxdlj224BWFPeyXxHZLaKh3UEPBlmV+XG
	NcSHep+Y2QiqMZjFgWMnQgD3b8Gj+brWKrRn8n654+3J0I8IRueCVLT1yRCuzn2Hxy4=
X-Gm-Gg: ASbGnctaOfYxHCL9B2VvG2dKpGb4I+hT2znGVepLL6Qu5r6xY1S30KixOcxSQmU/YZq
	FFQDnDpulVNoRyxTR+3iqxdhdarU0LYkFYnb6FdztlEq80/fB5Hl7skgki0alFldd38cZaAvp3A
	OxKC9YlaZ0PUCUvVu6c852zW+8auXHVa4owTpn4Gi5gzY3UVzUQYOmYvFlEigYYBbyC/DLLog1a
	ZxXmvXLBHneKl0xgmpxzCRG+H5hgrAobfNzImSWIJVnprUz4anpNdMmQ1lxkQ5bQn4Z2Z8cM0WK
	E2hu/pEwLfDvT/aIdRTq+DdJjQLosRcUNDDnRKFMFRNneI8LY47P6hu3QX6Z8UPASKDoIPHDzbs
	25p/4frPU1A9ry7tTrRZmZOrrYnGZGMqEX2jcuwQoAkf/heHfCa/gUJdxZc+WL1el7ncbPZnT9f
	IwsINStJgqo3vu
X-Google-Smtp-Source: AGHT+IFYmaZOIht6uOcy+7NKASZVqnp8ZAoXpwst8L2cyhAy9sor5s+Io2mLr0orWTwidMknZOnrlQ==
X-Received: by 2002:a05:6000:26cf:b0:3b9:10ed:e6eb with SMTP id ffacd0b85a97d-3c0ea3cf076mr1856861f8f.8.1755605430698;
        Tue, 19 Aug 2025 05:10:30 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:10:20 +0000
Subject: [PATCH 1/3] arm64: dts: exynos: gs101: add
 google,gs101-acpm-dvfs-clocks
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-dvfs-dt-v1-1-4e38b95408c4@linaro.org>
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
In-Reply-To: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=844;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=ea6fVOF/ZPzXpkLEtEhf8jo7+yKf1XzprUPMMimndVQ=;
 b=8NbHtnuer4XrqcxrU770zSH39wnsQWVoGXwzK2B/dmhKJyngAV87tT11N+xcYhCnrDVYTi6as
 xZEWhZ3g+nSDl9nwr+EDjC5c1libRfq5lZFXoXinj4P0CMBBy7et+BJ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define the clocks exposed by the ACPM interface.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c0f8c25861a9ddb5bbd256b62c66a645922ca74e..d010b8ffc4e09562519d6796691fe573c68b7ac7 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -204,6 +204,11 @@ acpm_ipc: power-management {
 			compatible = "google,gs101-acpm-ipc";
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
+
+			acpm_dvfs_clocks: clocks {
+				compatible = "google,gs101-acpm-dvfs-clocks";
+				#clock-cells = <1>;
+			};
 		};
 	};
 

-- 
2.51.0.rc1.167.g924127e9c0-goog

