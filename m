Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C121F956
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714138713; cv=none; b=Rl6OEvx5XDDCD991EPT+guCxW0D1+Ew5Q3qvGOyeUFwC0qBeY3j8Gojy4xYUF+Pj2FadL929AloVmHs4RwfPMPcO7K/bWuz2mpyhBYE9ehkv0uyhZ2KH8BThuUAavBfmYlVRcOG6EosMK6lRVcK0oSqlDw6M/eZ5B5wwA126Vb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714138713; c=relaxed/simple;
	bh=AzKadiMtfHqdAG266HCUiFv6+4SI83p7vXUWY/qWvBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Be9ruXnrDL8Bm6tyDMuSX1PYUDmK0tz+odSdZVU9om/O1xUxqV5JBeUIysuv7xocw8gHUblzZn4Ji4ZHGuHShIjCNlIRpduC5GcAmbFcLqV5DmDZsV0p1eyGDI99aUINVTVk5ynrsmZVRMpGi+bKWwXXaLNHUgpj+36Ryek3ja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YgpWyIL+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YgpWyIL+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5196c755e82so2742718e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138709; x=1714743509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmhYySeejf/ihUbi209BAjrxfIOqVeN+Ztttj0X9Sck=;
        b=YgpWyIL+nBXxiDfsd2y7F12qoHEUXl6FmaMBxmf4AgdHoCVCSerVK9PV8nQjps5nUh
         2ZWo8ISANjGHMWK3o6iuLWqOcezfnX7R+KMEYst10ETqFNYqPrUhzewYQZOyk5YccACD
         j+e22Oofv8JKOJYFwnO5PYXtEASYUexw//G6sHQMtM80IurCr6bz7lTkz7OI5Y20wtbI
         1/ktnSJdwAXt43jddcwdfkTa0yeFW4mhwLlP2pzdaal1kkfbNl9Br7SVWdB885cL9gwM
         T3Iy+T8nxxkZwEcTvofFIr/wIP4YjHjienHOrGSn1ThwPCRMFp7OkQFPYwP5mOqDTRl1
         Frag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138709; x=1714743509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmhYySeejf/ihUbi209BAjrxfIOqVeN+Ztttj0X9Sck=;
        b=dKVp6sjsWhj93sVQ7NNBIkDgiEvZ8K3oNWpa2NkbtlbirNAGX+Tooqe9Jq3/mJOr83
         EFtoxAl4RgZCtuLi569umLgRo8JMDW0MqmmLjYVW3QbwKVaOxBu9Z3y1byu2zdsFHDef
         c5i9Pss4rc715bCTO8+kjZyTptwe8lCZB+RBYlptwcaehQd+52FptFSWt7GKwL6YE4EJ
         lAJD86jBxtE9DNOyAjTJhFJv3XFg9CcDy9B6waqKFljxjxCfThuCXzkHOdGBSDCWX2Do
         Ei2dlJtoWL/7zDomBuQx9PdIH0cVRwV5rwwNF1Q1vejnDYQ0bWbC7Sy3ga4CPcGyEoTO
         R1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3fBag0S49dDx/rL1cTrZ20uvtIzaakwz2RXLPFawE4zfB+oduwZSrwqYM7Hsa03EjqMTs9w8et8S8Hcnn4+gWab9F0UnA7uGzbv7v9mbp+AI=
X-Gm-Message-State: AOJu0YxNmsLrGKi0yLjpbGkgq+MxHE6yXBgbSWIchfgqvQjztp3QIleO
	W0UNruN29RN76lj+7LG9HFo/QuYrA3r7ZPQQ/4jkaSAYrFd0G5HGenj3d0aTF+0=
X-Google-Smtp-Source: AGHT+IEBlyeIfqwTkd49PlMJ+dTzBx3Cbtoy7wXEyW8do4RAz6sYCgo8L4SVxgjt1m6zuVtXPyZSng==
X-Received: by 2002:ac2:4e03:0:b0:516:cf0a:9799 with SMTP id e3-20020ac24e03000000b00516cf0a9799mr2017166lfr.64.1714138708176;
        Fri, 26 Apr 2024 06:38:28 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:63cc:9bae:f542:50e4])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm22327689wru.36.2024.04.26.06.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:38:27 -0700 (PDT)
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
Subject: [PATCH v3 0/4] Enable UFS on gs101 / Pixel 6 (Oriole)
Date: Fri, 26 Apr 2024 14:38:20 +0100
Message-ID: <20240426133824.2283144-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

This series contains the dts, dtsi and sysreg bindings that enables UFS
on Pixel 6 (Oriole). For v3 it has been split into separate series to
as you requested.

Along with the various driver code UFS is now functional, the SKhynix
HN8T05BZGKX015 can be enumerated, partitions mounted etc.

UFS bindings in this series are proposed:
https://lore.kernel.org/linux-arm-kernel/20240426122004.2249178-1-peter.griffin@linaro.org/

Clock cmu_hsi2 bindings are proposed:
https://lore.kernel.org/r/20240426-hsi0-gs101-v2-0-2157da8b63e3@linaro.org

UFS phy bindings used here are already queued by Vinod

kind regards,

Peter.

lore v2: https://lore.kernel.org/linux-kernel/20240423205006.1785138-1-peter.griffin@linaro.org/
lore v1: https://lore.kernel.org/linux-clk/20240404122559.898930-1-peter.griffin@linaro.org/

Changes since v2:
 - Split into separate subsystem series
 - Split dts and dtsi patches (Krzysztof)

Changes since v1:
 - Collect up tags
 - fix google,gs101-hsi2-sysreg size (0x10000 not 0x1000) (Andre)
 - use GPIO defines in DT and add TODO pmic comment (Krzysztof)
 - Add sysreg clock to ufs node (Andre)

Peter Griffin (4):
  dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg
    compatible
  arm64: dts: exynos: gs101: Add the hsi2 sysreg node
  arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes
  arm64: dts: exynos: gs101: enable ufs, phy on oriole & define ufs
    regulator

 .../soc/samsung/samsung,exynos-sysreg.yaml    |  2 +
 .../boot/dts/exynos/google/gs101-oriole.dts   | 18 ++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  | 42 +++++++++++++++++++
 3 files changed, 62 insertions(+)

-- 
2.44.0.769.g3c40516874-goog

