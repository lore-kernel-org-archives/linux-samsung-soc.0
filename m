Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7F844D696
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 20:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406871; cv=none; b=HvpeZuwt7tWuGoEYR+sXGPl56BetKfi4nTqJQ8RSu8IqNG/AblbROsMmOWFJnKjOiDcuovQ/zLu8HaVHwHjIgSIwMnisK4UnAW6aa3ZcoQBMlrjMHueEu+XgfG9hMHb+5YPLdBUZhh16eOa5DZ82Wiet8vSUbr9NEKmpguuT52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406871; c=relaxed/simple;
	bh=5qSEGoSFEbZ9Aw2s104tTg8FW55x+SU2f7LQRnzdTp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EN/uwQkjon4LUzzUoCdD5xKhr6Lx6sKithZN7Fl4ACJ7oyPO+P/gq9Z8NWWXtNHKxsZxERrsk/6+1QtiZlhRucpK55EcHQIn9tqhpaJxurclYadkZ7+A8hi2MMl+sxvAt+yndEUFatZgqEYtFnOmf8svlwDlHwnSDO15vGno1Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EkLyTgPA; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EkLyTgPA"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so4432255eec.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406869; x=1778011669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=EkLyTgPAJVV8g7Dhrp0Xta6ycX7glzqwHLsIyM6rYiAoTSnxQkf84NcjPg1g8ZAYGB
         02u+JNwGAhNaeLrHDLXiCx4LKuKoEMGzXKh2lkj9FS0A2Xbb2HcuWWJVt0ROLOzGswlr
         DF24gepVJO8mgt5r7T8MULcNYgs65wQMv1h94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406869; x=1778011669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=qe+xvuQO8+f7gWdpJdSR62jIP/h3Hkcs5S40xH5vN/ex3YlmExHI2++4m7+69UJfnO
         Enzh0LFbgnC0L2HAfjaV+uYnmoMtOThRt3dPzYQPF6Qj0JsOHRWOFOvHQAs+0nJz+Biv
         IcH7XBkHF2HcYEbX7budEFPrY4/MwRI2Gr9x4R1/QsVo9ZFz7gUmXZbEwUg2sHnvJ0DA
         F2xH1vqVvOukHPzh3WBVC5GAnVhSy/Dq52yvZWxM8XwVtPXeayBxd8BAtHMrVSDyY7aU
         462PwJNQ7qGC83iESEJPtP1VYo8wfWj/DMzWxa6YwTvKjZ6SzvNPHBLjZBlxzmd93RFb
         f6hw==
X-Forwarded-Encrypted: i=1; AFNElJ8IegmZHiPSwxedAan8mYZK9hPvBUp6YCK66uikSrtzNzBQ7mkDVhghfXNrqea+nXOC6KhvdTkq0uzXD3fSz6H4/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCmuQ7l9kQPX25jm/w5IjRmiv/JUHhv+HYDrvH4CItsvlv9AXx
	6lgm7A0T1WBA9ZK3pZY7cYFfTp52t9ZoaXfz5tqqSpW4FVFT4uLwlIGe2OG9WCIZwA==
X-Gm-Gg: AeBDievwXaiC70IPOTi3efh2Xu7lB6VMnvUFQKEtitlg/an8P5gGRPHYGq11WtoLoMN
	gnwF8DqXD2wUh5Lb3D0cpK9RaF4nU+9OGzAftEYlMp4aLb41OwTC4AEeGttVHFfLF6KAM0/sl+s
	YISOMvLfuZghr1UPV+bI73dNzuRRk3Ryi0phxF2TG7WQW3hvLms7S5YGhFT+QbiyNRIL7Ymnv9Y
	n/WlRLxzYJFCOZBH0jTSJFfTBRP+ORqwbZb23u/59J/7ISZAPHVu9IoEGD9zOJ3IrdY/ufl59rb
	KT9rvPYMZLkteDPevSpdrlarwvHaO9zr9QQ4p1IQC2BaYjAU1yyDWXHvpR0g6vr2uyPB707GeYs
	NYIg2snDNH0Wk6fNojGcRWa3Znb0VCusZWv2nlZRoY2A1AwF7sARA+ES4iDXyPJaTBJCTOJlj1z
	5DarsaN58Ux+rd/PXbVCsKrGpAekFg26TesFgvZIGg980yQYI/jMxsQ4eTVsiaKWFJ9Nj0hh/i
X-Received: by 2002:a05:7300:7255:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2ed1991b2a9mr467588eec.33.1777406869213;
        Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a0ce761sm3064459eec.15.2026.04.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:48 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:58 -0700
Message-ID: <20260428200712.2660635-7-briannorris@chromium.org>
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

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 683ac124523b..1f5222d43e62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..a6d31650245d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
-- 
2.54.0.545.g6539524ca2-goog

