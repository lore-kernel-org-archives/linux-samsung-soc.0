Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F983C9EF1
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406859; cv=none; b=YYGhkO2IbZnEyR7aMVmDUbwL5yXbcmn6j/joV6BiJQI1Q29I/0RJ5vAq6ADbBLJ1JSK1wUhqFvxXhlU/Prq5F58Ojgob/OdwP9zqFspFHYX3flaNzgKE5Km43OW7ByWY0UWLC/EmG36FSifXW8X41eIPx3QmmbfnRVSojua/GJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406859; c=relaxed/simple;
	bh=XO1A/HibqZZptlBWN5BCzJBPBBT6OtgGPpR1fmvJiA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAPlcfBsi4vkNky2AQBJQrXqQtrkJ6cLDvlFDgbj8hyEF28iE10cJSoN0wrWfFdFM30Hp3tHYA9wZcPkUrcEYURBMV6hQnDDU/W1j+v1izknxLvC35TM8ABOOJ7iOwkWLxAWWjGoRQAkp0cL9Ckd1nT1EYtk1iQhskHJesY4mxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lgoFIlx5; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lgoFIlx5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2de831d2b20so4561187eec.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406855; x=1778011655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=lgoFIlx5tLNJIADdHllLhe2CgooduUbz4JdRKVvEGiRC6/BorZMWXqS3GvbBGZqWtm
         b0OsNU5naFbwnHe0Rwn4QgHD9vWZAGcEwN5AIK/KqQoQgjkIqssTJ8Ldmhh71JUY0vRC
         ZcmLlxLpVf0PWsG1Qf++1bgkRLrhUL1oiva6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406855; x=1778011655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=aFLGnmtR4neRhBE/t6UKfkUPQbHtaXH/TV5cxR6xzpKycrOrhP+lxppKenEJEsI0le
         DVeKhUJrwsiIM3L7e3mKs2LSle3DvVYX0aNpmMomTUHklCFTgRntbWfqyLct64k3Hjh+
         8w0FZhNZfeAKmHnc973OZ1U/HD8dVp2JaygodKEDIt7KiLYifVaMC5dbWHqQnWPUvfj2
         VLiN5m8sKIDkTKa5bMkav8mEik5hA+dD762LR9SgyjYy/qhCfkj2PTvJJPspi1lQ3tuH
         CV7rztCs4JRTXCoXnwP0jULAc3smixnDya7FnFXklRf2g7blLcIjzmE2FOSvcx4ZJkqI
         Dp2w==
X-Forwarded-Encrypted: i=1; AFNElJ884PyXaLPOdH2ICgGY7Jz+lvx5xW7AwUeP7a6xZ109XoypHnXQRkXOkbmBGlIiGzct0dffZ0aviUuSRTQAUsNIOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4FoBWXRbK7CoW079wlEW+8oHWZxmza7BPffW0Z1+3cTNCnfzD
	oHx5kNQ7Wx/Mz7yAZYkFJGr1fIJhDhYiDjCh2LlEuVIWjB/EsaPZRO0xDvF5X55Afw==
X-Gm-Gg: AeBDiev/+v5ZUxLtVEt6jghnZyG+9q9uQdzkwO80YtpE1vPNFrgQr0fDBNNQsxUtWhi
	IE7ImYBZi+tl6nnay6e0pbo/BTzeWQAcfByiBMj4hmUQk+7LRWNzhmfC5sNzGQC3byveS38Lkm9
	QvZJik1JKYBfjdqrbjMKtt+nm0Zj2kuw6JUvnCHJE/u166Ms951DjngeMBdlp3nN8hJ7RA0Tdo0
	jFlYYoqF04gdnUnR8m0DM68FgMUbx7rNZLaQ0VkvfHQsBlb+XgCvMh4I2t8ooPA/gNChP5tioeT
	VgKSXbhbNG6fiOaejW8IoD/M0W0kjK/ByBiginORrPLhcet6y5aYfUGp2pCU4Z4rwLdS+3JBm1D
	SdcQ0nAUtKdy7JvQVyTdo25lNDYKSJNfE2NheF0ceeYOPD0FxjDun+w73zTjEaRP1o/AliwC28t
	5ekHnN6SACKlnfaEtK5Pix2SMlbEaRFfm2WfT5DQES+MZYvtEdtDBTiRJhdT1mxw70mWtrll1RB
	ORfQClY/mo=
X-Received: by 2002:a05:7300:5707:b0:2ed:e15:c924 with SMTP id 5a478bee46e88-2ed0e15ce32mr1940281eec.32.1777406854721;
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed09fb6b8asm3015155eec.8.2026.04.28.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:54 -0700
Message-ID: <20260428200712.2660635-3-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
	firmware {
		ranges;

		coreboot {
			compatible = "coreboot";
			reg = <...>;
			...;
		};
	};
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
index 2d6cf08d00f9..ca8e8e735078 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * The default coreboot on veyron devices ignores memory@0 nodes
 	 * and would instead create another memory node.
-- 
2.54.0.545.g6539524ca2-goog

