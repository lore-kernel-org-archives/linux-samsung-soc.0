Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66A11F76C2
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Apr 2025 23:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636893; cv=none; b=KCU498qeFzyytVA6aI8blTFe/eaAEKuHOoWpheAJvMKSWJouOlVWBi71KjkjPWUhSUgtJpfUpiwzTSNhf6moEo/1jwRTjhee1FE0gdynw5rjRK5JDpDiXXNDabIYOsG6NOkwoIzoRvM2GC7HjZ5pq/VdCIiTlZfWRg12BuruCMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636893; c=relaxed/simple;
	bh=KGOLMUoqhgT8o6lRGzM2BT8QYWSv9CekKOeXvgxXs90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JIUwF9TjzMf1DlyCkfaOnFoxKriEIaE9gSU+lljeNwxDW274WQYjkp6zrQfDzzONUlC1kCMq9tgo1ppN+27FRq40X69so7rZUF/mryQg9ikFjXRefdUqusM8V9pHuABUBcJBVRLEQGESHSIVL/0sA+QwIrG8pXFC40dM+O1CGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qZj/5GnI; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZj/5GnI"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so242918a91.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Apr 2025 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636891; x=1744241691; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=qZj/5GnInh0GgTNYDlKb2m0KK7/rDqyB+1B/5hXyaPLCb/ZDJ/QK5v2gotsKijJTv0
         s9qub8gB7K7vWPkMG6PZ66PB37ZOnMIhOiWzbdYSOZGF/JNqoz53uMmQXgHQnyXGd/AH
         RFczcp228DqsEYLQ5xOqRw1Aa+sQLzyc0Mo4IZ7gge01nwlEgwenSP4T16Uwj6GLaRJ8
         7C2QA9d4CXWyWwugh2xNfuJHtHOCfzIRoRdurQMxHmBsSP5gXcY3QHs6G5mCQGzPR9aK
         OA8em3la9dbRgxyfXS8DCOxxcfmoxH6EYY6w2NMpsd8S6x7KgzKFopgL53wLsVQ1cLxb
         Sj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636891; x=1744241691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=tkEsnKDJTlNFbkFHrJQtaSkjd4eMDAf/jTHOsZQVDMGIb5zfZpLplT23cfh7wAnXcO
         dAzn/FnAVq45JVLcJ5SDbmbSSB4C2mcEDa/cqFIza4ut6Aw71bWMSQQiUKGAmJ9CKwh+
         ZR1UopoxRmvAFpx5gDmWyNyjjZGdXNZIZ6N/Qzy/X4D99nQWe0IVROXeuOlGM8ZjbbMv
         47e35YzERKUKmA94LnCIenwH25Ryx4uLBmCp25JPdtUskgkGYExgYPckcFu4NKo4ODN0
         poNIuj9nPdyo4ZSu9g1QJcmP1jNbHK0FWmKFtLhhVaEy1u++bKlhpnfUrmNFcwIaD5gu
         yPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMDaoppaRRk2I5wBx2C1bVFRQcdkO0dhnJlRZcNCQBJ2ZE674ZaXJ1VrPyqZNQg40YNcJQsS8LVF4ZI0m0UdQDbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNe73MNO+8rg17Uxsv4N+n52Kf1yULHcIE9lA7eSz6ET9vwR7L
	f/zpo0b0JzGVRjVJ8aoWSxtehB0oxphrHSAM4ciINbWs3zdBuOQnzJWyHwC0eZRD4mhjmZQJBeO
	IBAgeSxYOS3jrrNHH9Yh8FW7e1g==
X-Google-Smtp-Source: AGHT+IEiKn3CQVmPMTLKprEJLyfSe5jv8B99g5wOxhodbCJvNHuufgRdp4KFjo2AWb/3XvYfkZ3bTBmaSOWf4m+NNUs=
X-Received: from pjbqn7.prod.google.com ([2002:a17:90b:3d47:b0:2e9:38ea:ca0f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2dcd:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-3057cbcf16amr864128a91.2.1743636891016;
 Wed, 02 Apr 2025 16:34:51 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:55 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-5-willmcvicker@google.com>
Subject: [PATCH v2 4/7] arm64: dts: exynos: gs101: Add 'local-timer-stop' to
 cpuidle nodes
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Will Deacon <willdeacon@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Will Deacon <willdeacon@google.com>

In preparation for switching to the architected timer as the primary
clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
property to indicate that an alternative clockevents device must be
used for waking up from the "c2" idle state.

Signed-off-by: Will Deacon <willdeacon@google.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 3de3a758f113..fd0badf24e6f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
@@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
@@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;
-- 
2.49.0.472.ge94155a9ec-goog

