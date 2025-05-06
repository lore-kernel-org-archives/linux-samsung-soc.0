Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691004B1E7A
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 May 2025 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565061; cv=none; b=u+LzN+MW1MANWHY/TC3Ey5jZjbcs3uB6+2Z87nfIQX7zw9ZvZ27ADbZ3ofiCEr9eTyLtHl6ESqoLTIU1BwxiJYrBzCd7io0J3kV47gcIETvTLHZc3fM3J9TzRvtcvF8qd6q2Yz5kq/ktjFz3ryZ7MLrPi78GtzOsV9Sk40SaavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565061; c=relaxed/simple;
	bh=pyXy7Kv16xzChqAGMSwqlfI8ZzGLOqhZ2OlsFMalq1g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lMKzqaKbSrgPNcDtr80UJgom0tVoNzc4erMGMS2fyNXtr61ZhmddbQIAc0vgYRTOKT5XkVOXXaJoUzHf5ve70KEK5EO/xedx4zV3554+n4/18EawV8yRHXC1LjX2nFNkTQyFmSMdCsx68DAct3g7TZ91BnRr4XB6szPi6zf0hPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrnmScXq; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrnmScXq"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac56756f6so6884013f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2025 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565058; x=1747169858; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d3GDUlxVj2ccf8fygAExYdRMRYQk9xN/9FeFJL4KvNQ=;
        b=qrnmScXqgxC8ZYWyI/OAStuZhvy6B/r1ZDg8XUd77GMk//pLgAdwBT2Guq/HbczKoe
         cC3WovrBLLP8AuQOZYW3NqaOMkMmSuEfrGYjPlk/+IwQPiw7TmqBJcfyvcu1No8w2nxc
         T4zQsdOspaF5U13UDxStb8DcDOx3SdRPLpnpho0RM+uldcAfUtdQu27FcmwEd8pM3v4M
         Oa074Jwoja6EMJ6gtEq9reB8GJUPmee1pYGu0o6hyP3y2lMu4gPY/0xMGc6t9fK/lk4k
         VcFFg1P1CrNeuOrUeM1YDSYGFznEx/fTKh6/unJOjvj5b8fN/7CA+SFSJfPnTgrRZ8rj
         Fivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565058; x=1747169858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3GDUlxVj2ccf8fygAExYdRMRYQk9xN/9FeFJL4KvNQ=;
        b=D/Q5dsAmsvweairRQsp8gmGPL5W6UrewKPiZzcRT1Hc5OLeAOIBcI5OFyrpfxDn114
         RVA220zGdLlvPTWoWna1FI4zlU66dEkmahxjNwHVwAbzh881KrGrdo32c0d+5VoeCwjP
         VN0gke0kznQKsF+vzU4YjyZSCZo9lv+qh+mAaEkCs5zLS7eGjbGnkSuxr4O07+vLDBo7
         TW3fKsxMUoYrS2PEjbZs4HwqmXUFK/ssjccEpggeXWnZ1+fzaDSTWThImTMWjU20N8Vf
         takI0X9ev2qjY4JymPSGC+Fw7HanxiOWw6hFrojwtSWhFn0wLnyd8cL3QVkSxWSCkgX/
         DNYw==
X-Forwarded-Encrypted: i=1; AJvYcCU5sbNaGdbPXrTMvcxXwyHy5OXYzSCU07YNHShEbwxGQ5kl3OpfiQDbp5lvWD+Uq52Tyk6CsQJeGCV0HkpB+DlqTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycwoOdySS0tEumeMzYqyp94Iq3oByv9zQy+lXO+1g2g5MipbW2
	dTZONeGKtihizk5QLmhv4iqddaY4Wo60KTAaKZvjtFEBrN+3L4MHrbBCYRhzUhw=
X-Gm-Gg: ASbGncvT1itWGJWqMh/uPgx4Zjjv/XXxqAYyNeh6VMfa0cR6wew5HJVKa0ncYvW3yvt
	5UybVlkUR94n34fR1cEj2TXGz8CNzgJpsdfD0jQ/lrbRDVyrJcskXCrYlX8iPZj1VvBG42IP2O1
	+IZlU6LRmdyZ3FvUZgl9f+1EBTNnivHH5r/d2HFeEEcOzgfnbkZxOZ08y4cg1F9UerVlbyc42D3
	TCSmwsxHiIupbCSLVyBUhhKmjqY6AfxzpVxaV0s7wwQTcNqsrr3ijxPDWD/L6YoZb3L9r0IzpAq
	3egLu5OnDlHozMb8fY30SOwDmbwbwFMezIaYchUS4ypJNKhgB3dafyUly5z2tZrw3rfKJ0I=
X-Google-Smtp-Source: AGHT+IHSXoGm45WUpw3+gnrN3nF/nhYEgzhSmdR5h6fFyAHfRP8U4zc1Ueazfm9eTYC8whjoIsFoKQ==
X-Received: by 2002:a05:6000:1acc:b0:3a0:82d4:ba90 with SMTP id ffacd0b85a97d-3a0b4a1928fmr661708f8f.21.1746565057637;
        Tue, 06 May 2025 13:57:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v4 0/5] Fix gs101 CPU hotplug support
Date: Tue, 06 May 2025 21:57:26 +0100
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZ3GmgC/53NTWrDMBAF4KsErTNBM5LqOqveo2Qh68cWJJKQb
 JMSfPcqgUBLVynM5s2D791YdSW4yo67GytuDTWk2ILc75iZdBwdBNsyI04SCQWYFOcSBsgjmLz
 AlOZ8XkaoS80uWir6Aj5cXYUVAX2nrTRS9RxZE3Nxj66Bn6eWp1DnVL4e4yvev//bacfBdNR37
 /5NdCg+ziHqkg6pjOw+tNITV1ySeg2nhntUglvXWy3pDy5+4v1ruGg4DsZI6Qe0Sv3Ct237BmR
 ZIfyhAQAA
X-Change-ID: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4363;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=pyXy7Kv16xzChqAGMSwqlfI8ZzGLOqhZ2OlsFMalq1g=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne9SAiQrXdZ6vVyg3yJu7nL1zfrXgJ+sFa1d
 GcEK8FzesKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vQAKCRDO6LjWAjRy
 uvCVD/49M9qz+Y+rJVjuT9yEaySSWUKcLQaj0y4I6TMOJR81fQX5wcUmam4PbSXcM6wlbQTuLUh
 JYFutTFpsawztRifbISHDx+tyljoXFtNi2gih7IelYb0mdOt07vgd3+hi8wl/hWo0o1ETj3/V65
 VQBlS9ibUJZ7EiyMNKDXvRMzA5ERiC3sVLJkZcDGWbmhMS33OJ1bqw7YvmNOptGOzGORXtXJab7
 /M0EmzSSJJ/eFojq+Zu7LnBqBNf7RGEnoXHOeloIRtBM9DD4h0E4++ybTpt94+2XA8wGO2P417j
 zx/EFln19j4xaKtF6hrl8jfNIFHWpZWOs7vYiw2WVYJtxhamgA0b7zavPnjhls/uZU6nTJ9ucHJ
 Q4Y2/w1E72c6AIh4Ji+iMjNKQaRb5k6/Mlmy89M1uDLWa3jgAvfxZh476FLvzszaK4C0OVdObwW
 RHMaDeWE434MNSJ1BM51/+AeBRaTUyNLAMR6jFFKtMryIvc6V3rMHxdbiV8R19205fneiuKV3OA
 gUqQFKelyFlTw59sr0PkWc8cqr1Sd0nCoz/ZVdLI1qHiNcC8FczDDP997kN0OMoxdpURcr487xA
 cHtfO9/lo3GPkhFPGU6uPpVZtPHaEAS0c/Jlp6EUzBGuVC+15+6Qld5W9unPWj5Bh5pNlBiSlHd
 RjqRlEeCfHC+6tQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

As part of an effort to make suspend to RAM functional upstream on
Pixel 6 I noticed that CPU hotplug leads to a system hang.

After debugging and comparing with downstream drivers it became clear
that some extra register writes are required to make CPU hotplug
functional on these older devices which use a el3mon firmware.

This series adds support for that programming the CPU_INFORM register
hint required by the firmware and also adds support for the pmu-intr-gen
register region which is now modelled as it's own syscon. With these
changes CPU hotplug is now functional.

It can be tested with commands such as

echo 0 > /sys/devices/system/cpu/cpu6/online
echo 1 > /sys/devices/system/cpu/cpu6/online
[   15.880597][    T0] Detected PIPT I-cache on CPU6
[   15.880638][    T0] GICv3: CPU6: found redistributor 600 region 0:0x0000000010500000
[   15.880685][    T0] CPU6: Booted secondary processor 0x0000000600 [0x411fd440]

This would (prior to this series) hang the system.

As more of a stress test, I ran a script hotplugging CPUs 1 to 7 in a
loop 200 times which also completed suucessfully. In addition using the
recent fuel gauge series from Thomas we can also verify that the power
reduces once the CPU's are offlined.

Note 1: It is highly likely that similar changes are required for other
Exynos based SoCs using el3mon. For anyone following along who is
accustomed to looking at downstream Exynos based drivers this replaces
register writes defined in

drivers/soc/<google|samsung>/cal-if/<socname>/flexpmu_cal_cpu_<socname>.h

Which are used by files in the cal-if folder and exynos-cpupm.c driver.

For the moment I've used the GS101 CPU inform register offsets directly
but these can be moved to driver data once we've established other SoCs
benefit from this.

Note 2: To ensure older DTs which don't specify google,pmu-intr-gen-syscon
phandle still work. The driver only issues a warning if the syscon can't
be obtained, and the behaviour remains the same as today (system boots, but
CPU hotplug will not be functional).

Note 3: I've added the bindings doc google,gs101-pmu-intr-gen.yaml in a new
google folder as it seemed odd to have it in the soc/samsung directory, but
it's likely this may be re-used by other Exynos SoCs that use APM/ACPM.

kind regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Add trailers
- Fix typo with GS101_GRP1_INTR_BID_CLEAR in gs101_cpuhp_pmu_offline() (Peter)
- Link to v3: https://lore.kernel.org/r/20250429-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v3-0-1bcc44fb1d55@linaro.org

Changes in v3:
- Fix  $id, relative path/filename doesn't match actual path or filename (Robs patch bot)
- Link to v2: https://lore.kernel.org/r/20250425-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v2-0-f1530de9da42@linaro.org

Changes in v2:
* Use BIT macro (Kryzstof)
* Use gs101_ prefix for cpuhp functions (Kryzstof)
* Model pmu-intr-gen SFR region as it's own syscon (Kryzstof)
* Use regmap_update_bits() API (Kryzstof)
* Program hint on current processor (Peter)
- Link to v1: https://lore.kernel.org/r/20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org

---
Peter Griffin (5):
      dt-bindings: soc: google: Add gs101-pmu-intr-gen binding documentation
      dt-bindings: soc: samsung: exynos-pmu: gs101: add google,pmu-intr-gen phandle
      MAINTAINERS: Add google,gs101-pmu-intr-gen.yaml binding file
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node
      soc: samsung: exynos-pmu: enable CPU hotplug support for gs101

 .../soc/google/google,gs101-pmu-intr-gen.yaml      | 35 ++++++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 15 ++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  6 ++
 drivers/soc/samsung/exynos-pmu.c                   | 80 +++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h                   |  1 +
 include/linux/soc/samsung/exynos-regs-pmu.h        | 11 +++
 7 files changed, 148 insertions(+), 1 deletion(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-1f7ad4c45901

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

