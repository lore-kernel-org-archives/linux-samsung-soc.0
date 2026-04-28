Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416583CCFC4
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406860; cv=none; b=C0ULjjHDvc/HZz39FH8H+XUp1BpnfP6E1VwYTBZFLWHB+dK3QyO+nVQ62E0PRnuIDIxdmTVGjzRdUWAcNYslvYTX7tONBF7+Q0HvgfNsCAfHo8WJGigFbZ+sWDpxXQ63Azvqc7k7IT7qpwyk9YGlPgQIUvRxNXwoKizv7/iTPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406860; c=relaxed/simple;
	bh=pccXu/UZ0/UgmYrUTp8RKqR5INDSko9XT3nrfNvRcuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTwjX+4Kp1rVwrjalReDdHoRqCc2yPx5SH9DLJxr4dD817gflglbrxQNec7KgvOCpvstkxnSH7odk8+qoq9/ADnHOIUB+JwRjUT20HMs9nyNpqZxdv1mCtBuwyQaQRtB3hHcc0OHmuP7Jvgfo/8lzdAQUOAFIlVdbh0WFWfrB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YsZSCazp; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YsZSCazp"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c726f46baso15211952c88.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406858; x=1778011658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=YsZSCazpGJCwN1OHhygeQxjMvJ61gGu+mZ8LXay0+dPCXVw4xGB7j/uyrJVCh97r2D
         FMBgU3xmB49yHnGUh9bDt4ugHcJf1SNdc12w1J3iols17UMOBz1eWS0Vvuf5S8AoTjLW
         74dutQn67ErHSMv126frgLeUagzwt5H7UJ1rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406858; x=1778011658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=pJPgX9RaritQ4dB+1v3hw1azMADw6fDVZCIU2Vg6iko6jmTeofV8nGViKode4wrgDI
         RvuKF2WGy6dx8ZbSif1Mg/qVkc87i8v0kDLu/17MkLlTGfjOBACoV9AiNT+8Is2My8im
         BthyQBiZHvLxmYow358bvqJs2eGZCT4lkeTvvo+8/HVphVVzNT7RDN97sQc/syUNS6q+
         prjULoueCOfdSI66T8PUU1QW+JLko3Yt7QTj3d4a51Q87tBsbZ/MQFtJLVx7g3Li/3dh
         0doaEGw4esOCn/H+P/LnZ+m4EsA+tRLWj/GfBQ0ytZKhdNXIbEv+ThNtLhBdvVLHR54X
         wiJA==
X-Forwarded-Encrypted: i=1; AFNElJ/+ZkwId9sfYcO7pa5HcciUxXvJdkBZFrsdWid8SA1HBA8vCuvNa9DeSM3gPP+eIAHhMeQk9LHp1AgBEmoO4J1C4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvXUrnBN9F5IHiDhbVeaBJQjS7aac2G/wew9fwEPVQQG6lFI4
	Gur47+lpldVIXFtNExYbLGdEYbZRu0kX2rSYSKHq4Wtr7lbJu6m7LyV75jvK+iXjSA==
X-Gm-Gg: AeBDievR9eIyUnD4d2zkJl5f096n9DA5yqQ4uos1LMQWJRoGv3JmZ5f29FbcY3Jb2Wu
	KN/txagvhYL4uZDaWLDcCJ5Mn2GpbwU1LiCOR+tSkfa1NlDCtOeXr7s55TqUkSdYbXWHQpGXACY
	xUSH0IPOtWbYVcrYDOqdmIRRSJW5hcPhlfrKsY57T+C9nFSgTrb54O3NuWyEb/pvcG47s6AQo4w
	1jEa/sjxJ92W9KlY3+p+VM5aHnyayydPJMut6d8GM3rqoxIXRz2zFkQjqkEL9n1KdpH3B55fjN5
	gySN80QIWAYeYee0aOwg5bzKHBqqB1yhTbCDHiQVaZSbc+2LXlrmc/W05B60qScx58QAlbDolnE
	jaAGLfcnX8x5MtUv/AlJU2t7/VvGux0S4EC1j4r4juv2bbyQIyBHdDb0CbWINxkRzetKCWoeQfw
	lnb+nFOG91iICRj3Vfg6dQc7GIHEANaA4HJ7Fk5lvCdu+gqkMyeDDome5s50oDdaishAHQCNsM
X-Received: by 2002:a05:701b:2505:b0:12d:e126:b7c7 with SMTP id a92af1059eb24-12de126b941mr735154c88.14.1777406858194;
        Tue, 28 Apr 2026 13:07:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd933044sm2796623c88.5.2026.04.28.13.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:37 -0700 (PDT)
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
Subject: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:55 -0700
Message-ID: <20260428200712.2660635-4-briannorris@chromium.org>
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

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 974c76f007db..89a749cb8933 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -14,6 +14,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * Note that recent version of the device tree compiler (starting with
 	 * version 1.4.2) warn about this node containing a reg property, but
diff --git a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
index df98dc2a67b8..059ee6c5b13c 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
-- 
2.54.0.545.g6539524ca2-goog

