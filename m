Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE972D7397
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 08:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762156998; cv=none; b=rpkKZyJL9uUy5xRsClwejlRbF/RCtdISwz4feATp1FAhEsVvEJdq60Ai5ZTq6Ha/hIONaOnn7MuygvdcAoS3kzxv7CDAf4OGNMwov9WYsYnUo9KxtADDrEtJp6QXvsEl3iPwMkuCWMz2vqoCQJNdHmXM+PpWmF9L+rKbOxANnPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762156998; c=relaxed/simple;
	bh=coLNq6UgBEJ54vtaDH5/Y+99RZcuZu3NnE6pznoVHXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bLiUWnvo8Fp2ZYVjs7fbVsi+tY4CbL3tNqcS/yIDXFedbvRdmm5k8MT/AIoz5vBTL3ByOFRzyoOBtPGKJiRnYvrx9xcLX8WNOaHFHMjn6dqDmlnXhknQaV+X6qkUJaiVfW+EuLveAi78Za/MexQjUBPIY5NTzencJe6N6P1xzZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSHbw1X2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSHbw1X2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475dc0ed8aeso27681155e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Nov 2025 00:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762156995; x=1762761795; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/IH8GWzke7o+9XH2ahN9Fgm4JRQMZZpkq9Zw8W23zk=;
        b=SSHbw1X2RtzkhYntcAWQDDguOO2al/S0gikOslZ4qGbgQiQGGNhHL3bor2Kl/5YL3M
         Csr8yCTqvMoYt12Rx+yOD8SBAJXSt45vxgfl1zRk+BGbi7in8/AKJijjobxFtSMpTr0S
         TEVXEVASRCReh/VrtgROhS4enVC18y0W3UWAoOaEScHWeN5bwUsLD9mlnOmkThUNX4uG
         KxTU2WW6MfwATmXeG0oeEz2M7SKmSnLAxjxgi7O7hEOu/OhZ1BcKIB/TwSpDfv8J4mg/
         WTle5l+rEv6dqQngfdL0+tt2a64qs/WkFa7fWgFn+7B7x04WqOLB+/ffDNnlLvIJZkhH
         dj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762156995; x=1762761795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/IH8GWzke7o+9XH2ahN9Fgm4JRQMZZpkq9Zw8W23zk=;
        b=cnHFPf/tnVzLegCagKeV62H24CwLM1BDf6tEpE/UB9QKBZkNmun7BW6WAzdvCbBnTX
         rEbvUiys7xWnyNIGp/xkfZaw4zB7ZDc5tHD1CrD+gCPfXgbBWA2mBgyqHc8OQj3u3dNe
         O0kZxrcYwHljYlSpgDB2VmVPhjgOcvSsktjHhK0kJS1YiZXePlC7O9VDYJmI6znCW1m5
         PW3LdpDp1hDV20viiX4FMOkVF2AJRsv26XTSrSu3PLgz3lH7tkehUQ3rUPaV7wX2TQNn
         I6434pMYlfcJEn1tuW+wt8PnVvzZJdiQ5KNJ9wp90Td4Lwu1fPajWYBWP09wDfRs+4Nw
         1IHg==
X-Forwarded-Encrypted: i=1; AJvYcCU2y5E33apVp5u/beGjtc7mtckN+5WOnCHJoL55HiMMCt16aJ8v5tmrRgbHsaSKt5A79XL2QGzFoY2IflBof7mohA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoXQe7PYcvJ8Y3Wilf9lr4yAkh9OX7km/NSeoUMBdDE2zu152F
	DVM/T3c9rFX3OgsrDkoN/6X6TANy29tiMeFTNOxJjcDpuLIdJqNrhhZMPvYiP3W7bc9Z75Z1Nb3
	UurJM4uw=
X-Gm-Gg: ASbGncv6QLjmLU3HGc5eN29ru9rl6ANI4WHBSGTUbl09jkm14ZDqAskKftr5+Zn+swK
	p3JPb481ezb0F8bJxOS2ephjNoB89X8Hd4j/ZIsU1h8Fd2NEgDcB6kces4+qoWNL832oRGi3MXp
	xn3NsbtSkCANl2HiFXt0IyynTtSI/Au6z4GbX6vgfGI253B8xlcFpD4lmsgwQcWJQQl54G6EKgB
	LQjJDgxiaXwRZPmNQec9tQEwJJHrs6ODr8XgxLhyAcpc31SCGVlP8bC5wYQaB5NmwR0JCOpSAJ1
	EqDOhddbrNPFHFCbnOZPJM3vUJpOOAMjqOwX4Zs/RK5p3gGzvWpWGIEixzNuzdBk7YIgnqc4Del
	CnCFLHNJY2DhDzvgCnIkUW6VBCKfkrIjhM0oqj6sCHbPF5ag93XvQCfTBJbczwfT+rwcwahbvm8
	1gcVCGRUFU8mDgkYXyQte2uYPcFanoibTY/F6ee6qbKA==
X-Google-Smtp-Source: AGHT+IGE6c8H6wBz5xIqW//ZckvXkI1XYLT8wk/cpBvfubK8j7fG5RuGuBsFSian/icYU+pzc/KE6w==
X-Received: by 2002:a05:600c:630e:b0:471:11a3:a6a9 with SMTP id 5b1f17b1804b1-477308acfe4mr107228955e9.37.1762156994866;
        Mon, 03 Nov 2025 00:03:14 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm142336215e9.8.2025.11.03.00.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 00:03:14 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Remove syscon compatible from google,gs101-pmu node
Date: Mon, 03 Nov 2025 08:03:09 +0000
Message-Id: <20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1hCGkC/x3MOw6DMBBF0a2gqTMStkyRbCWiMOZBpvBHHoKIE
 HuPRXmKe09SVIHSqzupYheVnBrMo6Pw8WkFy9xMtreDMb3liph3cIlf1p+GnDjkWPzG8zQF97T
 eAZ5aXioWOe71e7yuP+t3HbtqAAAA
X-Change-ID: 20251102-remove-pmu-syscon-compat-dbbc492a4eea
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dan.carpenter@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 dan.carpenter@linaro.org, arnd@arndb.de, robh@kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=coLNq6UgBEJ54vtaDH5/Y+99RZcuZu3NnE6pznoVHXw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpCGHA6lXimYaS+RG+z/Z/H8ogsAabnPPFrp2CX
 MJNuVr+FpyJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQhhwAAKCRDO6LjWAjRy
 umxNEACX503fKhg2AMKQRDibcYgVMIKHsDkrNclZQSBFNFA7K4CQBm51QUnarXNgC1NXNhqPlF/
 RL634e3JtP3iRMQFBRP/CMwebcUNX6cdYPjczSwB1fmekHQN4RGOWsoDilTyFLS+UyC6Nyrmx7e
 8Lhsb/UkQnr5i+P/plM1hQ4J4bK+whwURLEJdWDQU/j4gCFQh7PwEfhRCTy2KTv9vvkebYbXGSf
 Abz5lHMcPnXLH2k6i5wYJxvmdMJXjt6TN7nymfu78Ijqtk8xw9wtv7ual4qkskjjIIG3L+b1gui
 qOq8lVi3LVDMoztzyjfY/8UFg8p9XfEPF0rjYmbTnVVXyxtTHaYVY4hgN/o8fvjxYZ8T5Le4/U0
 D0zz7f5isA80epzaimEssF9zKMZ6o1dcUmV/Bz3HBNvN6MzFA67tJLmi+ugxsO07pN2CPTCqkPw
 ReIEC958wlTLWcIHJFRiPAnFrQSC0p2QlDO43eTKasr8DOwHs7rJlqlnQASpT5YQHDONAN8XfsU
 5rOG/t5r6ix9Ej+83KS0vL5jLrxWtFjD2Bk9N69hzJXoxTr4plOhY+/fvoP/QCoquV/dVeSGE2W
 BtQwSERkicsEdIEyPibIgTxzDKNrXxChqi7c91O3YStuxyeMslAOCOlcoPLd2PmTq+FUKojLRDV
 Drq/8JU7jm6VIHg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series removes the syscon compatible from the pmu_system_controller
node, by updating both yaml bindings and device tree.

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

As noted in that commit, it isn't really correct to claim we are compatible
with syscon, as a MMIO regmap created by syscon driver won't work on gs101.
Removing the syscon compatible means the syscon driver won't ever attempt
to create a mmio regmap.

Currently we rely on exynos-pmu running and registering its regmap at a
very early initcall level, so no mmio created regmap is returned. For
pinctrl driver that runs at the same initcall level as exynos-pmu today we
have a custom exynos_get_pmu_regmap_by_phandle() API that supports
-EPROBE_DEFER.

However with the changes proposed in [1] -EPROBE_DEFER will become
supported in the syscon driver directly making this whole approach more
robust especially in a highly modularized system with other drivers at the
same initcall level. We should also be able to remove the custom API
referenced above.

Technically this is a ABI break but no other platforms are affected. With
an old DT we will have the behaviour of today (rely on early initcall
levels). But once [1] is merged, with a new DT we will benefit from
-EPROBE_DEFER.

regards,

Peter

Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (2):
      dt-bindings: soc: samsung: exynos-pmu: remove syscon for google,gs101-pmu
      arm64: dts: exynos: gs101: remove syscon compatible from pmu node

 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251102-remove-pmu-syscon-compat-dbbc492a4eea

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

