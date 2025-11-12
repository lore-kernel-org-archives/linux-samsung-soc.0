Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E62F12CA
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762936157; cv=none; b=CbcOQ9BS+e9OjeeN5T7FoEnTewSfbiD1nBC//0z8xqYtjbwin3L8t2ZihpOx4nnRcQxnDeqKYmnb6zVoHwySE2EsI7KA2SMT8+d0UoodMxNiPw7R9yK79XriSn5wlcdkbWiL61UPkbmGbFppt8Kvhld9RIR9ZasewtGJ1zngQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762936157; c=relaxed/simple;
	bh=op3wShXUu6uL2mvqV81fg417E/SMxbfH5zAglzBCAiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lsMhpM5ESTWJUU/Ee3g43/OhEVOIkakjh5xYt8vMLTCXa/ubSYeJQ3KuGJ3v7R4jKq8TewauAeRY5Z/NW52gLN7wQ6AVl+QLyQuS287SXVPybmKKKIf3Ty3iKlZuB1geQkzrTD2ZzWyC4/aezAW+45IfkeU+6rw+shaDrRjKnIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a5Qp7bjd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a5Qp7bjd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so340519f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Nov 2025 00:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936154; x=1763540954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6H4fhzWNfAOw3fABnsgj+mVJVVC5fU8/bSjCOymm/4=;
        b=a5Qp7bjd6d3LbF02EUzX6kvKWXXKRQ/grn2elmm1P2cUYhfbfYAN16zH/VnFHsUupx
         evCOtH+LXAl4KXk3XRZwyYT5C15VPzlDphmwMytp/cziyde+iitzJVkE+GysDIldfFtI
         hA6qv63qp0iZ9VJM/N0jPktVWycaAf52JUS63Ig4ezMhgtBoWVLQPN57+f2/yqThGe4q
         DwrXn598wcG6KCSgOo79VtJF39h/7MB0eNkuMiCuzBA+0TvBxW/ri15v3G/i9y2XfH9b
         O3Nnrh81ZRZI+EXIS8Smjvz8HYh65zYz4NcZ2p2Qln6qk9PoezhkdRgh4AGT8z8jvMFQ
         wV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936154; x=1763540954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6H4fhzWNfAOw3fABnsgj+mVJVVC5fU8/bSjCOymm/4=;
        b=j6eQw1PlRmoTKBBc7Y9+rixWd+qEQ58yAkElXo/+AyFfOFiCgqMhTClvFwNCyEiyxU
         E6sG1NEnTe6aw3RQfrmyJ3zjs7dWgRdAs/7BhPXEzrMmNB+t9zUbds2xlupc6bhw5oYF
         Rc6TOYNqPk3aP5JCEm52jBo1/JKK8quFNtldRHyagClkOrdN63muzBdJrMusMCQiAa4G
         bKAKE1UOUkrJUSDEQ/5ttnIrOdmRN7f9hDvgA3ZZwUf/EMB8mUm6NYQNGtc+8UkaAEwg
         KZbDb3JxXpNHZbXST1cBwwBLkcyN3SfvF3NTBDiBmQGROMzrcwzXl2/suaHgCpa62yO0
         T7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXfzNh57hmLTBHNOrmemZ3FWyq8PUYdQqiYqCVw9zZB7kiOeNJzQ0uHSX6LgpOw3ulKYNkxVLD1+DfG75AmGuTSZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRtpHGYsFCWxq3OIulv5pRPhLW9bqwKW24fI9YOiYxBGcNr7C
	pq6G3TICSBfOreQqWH/Nd08OpjhkxZMkDK0dJSNqYoqkcX2ckk2PZ24VjG0xQcA4/Kw=
X-Gm-Gg: ASbGncuYwgUABx4kvjJJN3nSP/zkq1WBa64dLIhhsDx0TZgBAUcD1QFStKEYMpaGcus
	C3jtPMQY7IpuVlmMgTi7jHo6xu7zTITXqxLHyUm0IQ2Czh2eqBKUxMf0ncWCRvNykZx+ffyrjQL
	iWil4eJp23iwXiK7eawPl8/olu6Pd+P9oNpXYzOHqVWxZ8UwTSo9eY3Rs3YBrgUT12M6P5T6pbM
	33objRa9aAsf5OmVxACOtXB9vPQXF7n2X9JZdYcqRLmGIkizc6V+v+LxsEA0LMPiC+su3CBq9K9
	PeFSuz8lBy8nHpFpRcOtxg47kPh0RLGBnBmSOdDRRPPFv4WE6njst4F8ie9Jjl6hFOknBlICsy1
	taFuzDR0Wcl+RMyMHHKg07TeS7sIUtW3oVzK/iSBFKUiiiCVaqwlEL0bvL1eYTwMlVNYouet+IG
	cKPU77XymTnE/VswfrV6wZRgvIUakBZSmb8wm7OCqlSBdLos7hGBw+4NPGoZ6vyPTbP9Q=
X-Google-Smtp-Source: AGHT+IFyADtGKTaC4hHQ7wRzm9vozoNXIQX3r0eJ6FRrtFXk82uJWL1huXSvsvBDb2sySH4eSjmtqw==
X-Received: by 2002:a05:6000:2010:b0:42b:30f9:79c9 with SMTP id ffacd0b85a97d-42b4bdaed56mr1411001f8f.37.1762936154240;
        Wed, 12 Nov 2025 00:29:14 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:13 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/5] nvmem: add Samsung Exynos OTP support
Date: Wed, 12 Nov 2025 08:29:04 +0000
Message-Id: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBFFGkC/23MSwrCMBSF4a2UOzaSVx925D6kg6TepBekKUkJS
 snejR07/A+H74CEkTDB2BwQMVOisNaQlwbmxaweGT1rg+SyFVwJ5pPggoV9Y9KpAQerbX9TUP9
 bREfv03pMtRdKe4ifk87it/5TsmCcSdNq180ae9vdX7SaGK4hephKKV8ZD8GdowAAAA==
X-Change-ID: 20251031-gs101-otp-2f38e8b4b793
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=2360;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=op3wShXUu6uL2mvqV81fg417E/SMxbfH5zAglzBCAiM=;
 b=/v1HWFyFoDLMFLrxpFMsj5XvuEdMXTb7Bt0vA9rXW3tVkGbR6OsfxxFh71dqUk9ijNk/Jh5ju
 al1QkneDVcwDXa7k8uFqOIndACFX0Cn5p7qAkf1BFlUE5DacK2eX6Qi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Dependency
==========
Typical dependency of the DT patch depending on the bindings patch,
thus the bindings patch could go via the Samsung SoC tree with
Srinivas's ack.

Description
===========
Add initial support for the Samsung Exynos OTP controller. Read the
product and chip IDs from the OTP controller registers space and
register the SoC info to the SoC interface.

The driver can be extended to empower the controller become nvmem
provider. This is not in the scope of this patch because it seems the
OTP memory space is not yet used by any consumer, even downstream.

Testing
=======
root@google-gs:~# cat /sys/devices/soc0/family
Samsung Exynos
root@google-gs:~# cat /sys/devices/soc0/machine
Oriole
root@google-gs:~# cat /sys/devices/soc0/revision
11
root@google-gs:~# cat /sys/devices/soc0/soc_id
GS101

Cheers,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- bindings:
  - drop dependency on nvmem-deprecated-cells.yaml
  - drop clock-names, otp label, child nodes
  - add interrupts prop, make it required and add it in the example
- driver:
  - no longer a nvmem provider, register just to the soc interface
  - update comment about the module name in Kconfig
- dts: add interrupts, drop child nodes, drop otp label
- Link to v1: https://lore.kernel.org/r/20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: nvmem: add google,gs101-otp
      nvmem: add Samsung Exynos OTP support
      arm64: dts: exynos: gs101: add OTP node
      arm64: defconfig: enable Samsung Exynos OTP controller
      MAINTAINERS: add entry for the Samsung Exynos OTP controller driver

 .../bindings/nvmem/google,gs101-otp.yaml           |  56 ++++++++
 MAINTAINERS                                        |   8 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/exynos-otp.c                         | 160 +++++++++++++++++++++
 7 files changed, 244 insertions(+)
---
base-commit: 4b67e4c65c1e0740ac12bd0d790eb5a9d0091aaa
change-id: 20251031-gs101-otp-2f38e8b4b793

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

