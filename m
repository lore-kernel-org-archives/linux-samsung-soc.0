Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27071BF6DF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714486494; cv=none; b=HzaEGLybU6DCcVJEqrK8nDOI4UsQb4GTmYupz3KSb5sjk6KdSuddsOHF+MKcxNa+mlVxadwkTDoZk/AALJ8VRlFEnoVAKHZbkIboxW8bKYFjcdXQ3xZG2mETzmor28l828X6NMlWfPWS/CdW6QszkTD4OujuUhgWJp89wb6PGzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714486494; c=relaxed/simple;
	bh=BMB+z9c1zfhOZlvqXHvsg89v/QWq0s4HCgmAlwaHots=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dj/fAqhOX1HWmFKuXTuG0yFga7i5nD7w7VyS+ufY4FcvwVa8UieZeU1oLv+IaxmutUkIBcPVbbDiHCclMy93jxu1VVEW+WzNMGc4ngG6pN2DSmHMkGej01/tLVyN23fjbxypyOY+QCu1hfMzS3cON0OeXzEgnS4uBMAVI1uzfv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fv4aWUaK; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fv4aWUaK"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e0933d3b5fso23614651fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714486491; x=1715091291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUVDGtf9QkAcRfngS/o++38b1IM12LgCsv7+0IqjJHk=;
        b=Fv4aWUaKbK+khIng1+xQxP2uyhPASQEP4Iq6ih9A6OEcSEtvplA4v+ColSVpky0QPj
         mtEhSs0Wlp/h2kaWM1psFA5xsjsLbMlY4gN+HRfl6z9nWgsnv2uhwgwE5d1tkd8BYnLr
         Vd8mZA1Ip0W1b9gKDS3R4SYWJ0JhpoQjG2R2aYLZaAfxJtajFThAoMLvFCVMTD99TI2j
         KwpSIMEdlp6c7KwCMbmmHFJCZ5EZhhkY15zQ2zNVCAXxHKQqm55lEDX3HmdvDQinMO+C
         1pCVdjbyv3OCntJCxekEVuSoak6l4QFvFScV7PSP6fdP29Z0HdGXInRwiE6z2tpcgfi/
         Quug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486491; x=1715091291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUVDGtf9QkAcRfngS/o++38b1IM12LgCsv7+0IqjJHk=;
        b=pCElpRVugnw8dCTLP/nCWlwH9jMPIjE3gIUfJYLdsgWxBroJcX+6KTd18kfNnvjua3
         V6Npm8je+4ss+xtoQv801ILrqqr8TRG/+A0pIwva/tYsPSPxINP1M7rt2f/3N8r9nU6h
         p/AQ2n0WlT31CYa2yKHaK4SfYRIaD9YRT8hSjI1R9AVRonKU8nBQV+e3FYptB52eLXf+
         aPog32a+GYdQryAKgkUDIVrb1Rqlw/xVRomUc0XWMxXGYDwqy7wAcW0Rq8kvLHVbLq7Q
         tb/tAliA9RqMEBXTvPOklkNVZBKzjpG81JqGUn2UH36LuwR99IBWVDyIQWkuVRBdkgIr
         VnJg==
X-Forwarded-Encrypted: i=1; AJvYcCV04knQcXHwRi3zK+uqW97sGlrOMVNqOOMk4LTAtEPe76w3BQ1h0x0JJBrgCUTCzgbCZHJE5Gm6fPdNdiE5ySla1yUciBSTpFLuP1B41xqilJk=
X-Gm-Message-State: AOJu0YzOmFSZmipeBuIeCpvMJTiKFc04jP7fcNeRb9Ai+Z3x19A4dcMH
	31+6FwYCTCpEW3TDoQxQwv7Z2ClKUi+sU64QcMxVYYnRaL6GZ2lFm9nFXXnmJuc=
X-Google-Smtp-Source: AGHT+IFH+e1i2EkTrM5iUSZe3Re0sq92AVs5C4352oNgc8DcuUMjfPoN4eshBnWIIyKpbwdQMVCK8w==
X-Received: by 2002:a2e:780d:0:b0:2e0:b7d6:eaa5 with SMTP id t13-20020a2e780d000000b002e0b7d6eaa5mr2877492ljc.40.1714486490613;
        Tue, 30 Apr 2024 07:14:50 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:f162:7aca:a805:2c2f])
        by smtp.gmail.com with ESMTPSA id r10-20020a05600c458a00b0041bf3a716b9sm11593517wmo.34.2024.04.30.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:14:50 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 0/3] Enable UFS on gs101 / Pixel 6 (Oriole)
Date: Tue, 30 Apr 2024 15:14:42 +0100
Message-ID: <20240430141445.2688499-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

This series contains the dts, dtsi that enables UFS on Pixel 6 (Oriole).
From v3 onwards it has been split into separate series as you requested.
v5 has been rebased on next-20240430, to avoid the conflicts with Andre's
USB enablement work that was recently queued.

Along with the various driver code UFS is now functional, the SKhynix
HN8T05BZGKX015 can be enumerated, partitions mounted etc.

UFS bindings in this series are proposed:
https://lore.kernel.org/linux-arm-kernel/20240426122004.2249178-1-peter.griffin@linaro.org/

* Clock cmu_hsi2 bindings used here are already queued by you
* UFS phy bindings used here are already queued by Vinod

kind regards,

Peter.

lore v4: https://lore.kernel.org/linux-kernel/20240429111537.2369227-4-peter.griffin@linaro.org/T/
lore v3: https://lore.kernel.org/lkml/20240426122004.2249178-1-peter.griffin@linaro.org/
lore v2: https://lore.kernel.org/linux-kernel/20240423205006.1785138-1-peter.griffin@linaro.org/
lore v1: https://lore.kernel.org/linux-clk/20240404122559.898930-1-peter.griffin@linaro.org/

Changes since v4:
 - Rebase on next-20240430
 - Drop '0x' from unit address (Krzysztof)

Changes since v3:
 - Fix unit address ordering in gs101.dtsi (Krzysztof)

Changes since v2:
 - Split into separate subsystem series
 - Split dts and dtsi patches (Krzysztof)

Changes since v1:
 - Collect up tags
 - fix google,gs101-hsi2-sysreg size (0x10000 not 0x1000) (Andre)
 - use GPIO defines in DT and add TODO pmic comment (Krzysztof)
 - Add sysreg clock to ufs node (Andre)

Peter Griffin (3):
  arm64: dts: exynos: gs101: Add the hsi2 sysreg node
  arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
  arm64: dts: exynos: gs101: enable ufs, phy on oriole & define ufs
    regulator

 .../boot/dts/exynos/google/gs101-oriole.dts   | 18 ++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  | 42 +++++++++++++++++++
 2 files changed, 60 insertions(+)

-- 
2.45.0.rc0.197.gbae5840b3b-goog

