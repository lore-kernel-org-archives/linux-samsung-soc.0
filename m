Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510647;
	b=mfQt67ORf+UdMvRsVnydxRpFDA9vW3gfSsSo76eNSSTUfJ4BSof+rwpwXNUv+1gP1STL
	 dIfOCVhV2Zzun+ySDMhDxjGaEkifCTyrQbVpeMZfaiRljSrcHbuDC2kVJL4XoWB4iL5Eb
	 Z+Yuiw9tx7L8U2cDhUjfKBBXS/lcWI9iYl+rm3lpVRlIYBRCnv0O9QYTodh5L7D6Gni1p
	 rFAdM2AFzLyzAADeR8adiaWcQ6FP2qlnvtIK4UQGTKpGwxpslnIVA4gXn9g9XecLCFBSt
	 pXs30wCBR03GHDy3na1hPtTc70FEU/O/u8r9yRcMw4AwFb3ciir4tQsAnn4OwThhGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
	b=pHMZingIPVzR5BRBZPJDm9B/KmmgbnYhme3+0R50vbA/t/YPhO3H4ENU5e/pFohgxAxN
	 WJPNQMArP4jDgQc0eN1aNv4fekKnCwIU/n5onj5FqRiAmzviiwPG1IyX9UUz/C4/F/RX6
	 kp1KJPrN+YogNSQPC3BbnSRh0KsLaOnnkEmQdkxbG4AMV8YFFh1yFYxeN/KcPU2f6Nk+E
	 GQgWZgQvfUiUDAu1bg74SspIXQyTUQWGrPAetdkEgbYe8JFHS92MWXKz1Zq/QK09pIlJe
	 gB2L0h4WCjdQBY9zy72dM9zqfpDULRsRFzF3smvlr/TdpxtyYRPOf0YHzI0vF4KggyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Q/M4ohUy";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44695606A330
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 15:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44695606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q/M4ohUy
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so4650654eec.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510646; x=1793115446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=Q/M4ohUyAJ7ROEDRnEfif5lqm8SVj4WkJkIxKL1p4bokHsZuMxcjvvMPhVRNkEPoiR
         j5yWwuiinUbY4oNVulXzeJxLzeXkFBbS4H4E5rlSdZ/O/Z6nTiJi5PNyn3Vb6ayxyQLe
         DZha0CltkU3t+XeU2wkG4TuszL7LlwU10IXic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510646; x=1793115446;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=onuv3LbOXTFLlKplpUvgbq6qxVnNeUnUHrYw4k956eTtejJo+/8inST90/m5+Mye0c
         iGxx3f/g26sIv+MUuVxLPab6IMEEwZJDU7q6AvaC51NjBi75OfSjIjp94AYHMe4uu8V2
         vKk6UmCU2uAP+EXeFtqgDXVbKRR5Q/RTQpoaT0UTURZjxL4nhpFSJtbnZGmp8BpUoY+x
         7smh5EfyU+WbPCNs0PT1X7yXpHakowDiIXtYJgB2sRLi7TiwbmzeJM4sKPp/SnoDY/eP
         ldyvpmZzNA+1iRztWzCf762fHkN2qUiofVPD3MwkBgX9SdXL/465Cn7wOdhqzCF4RUlW
         4o/A==
X-Forwarded-Encrypted: i=1; AKwUvBzeIycrlyeeav3OVagwQgt9HVfTmDgyUe6RFXo3k4LqHI9Vxf9C+BCKeF7o22OSRI0nE6oDLTSfXdRct5WQTIW+Ng==@vger.kernel.org
X-Gm-Message-State: AFq9FYK72/ba+t60bjsAAEMq8KNHJxrSFpgZF1Vls8u84cch0iTQLr6v
	3tviU+7TzhzPV4mlAqHe3HCgXTgs1wF1RtFvv7Rn2KSMa+HeXY9G8EwKgU1sNe9HdA==
X-Gm-Gg: AYBFou3U+VCgw3hXDS6+e5PDQVbjgmrbeLrlSx4NSExVDpI+arC8d5pW0hKIY22XPqN
	jx9UHieL3Q0q3pMNEJUf9Qlth3EKTd08nR7MCq7Ol/Nk0t2Ej9OvXtN+wEQ93pUtY0XO+716DvI
	jUZTq6gooJfV6dcQqN2ZB0Vp0Gwsl25/NTL3bDE5oUW/ncmlOJnG58hlGFpX/gTXhYnA6VjeDCQ
	M58dqKChnwAxF0/daBa+wHqg9dFPO+lM0rIYGs1vAXShe/F2TRmaPjXWCMC80vOAR9a6eQlut9T
	oXNUQhgjiH9dIPcrYTJX7NF2TVWyQVbZdJTi2JHnvNWXe6g3ufrFqfNkKpDjsml3tmvw28eFJ5I
	1UEyI3fVNPIzo+ZQSZcz80hNSOo0VXrLsA0h8Xp2xu49Ea/sDZs+GycQtB35B0DwsAhMdpKDppF
	LhB213b4dxvWp57baZSfH0GVPZVDt+WKxukwd7yUODMjJuk0Nm368CyWqPJcdysT+BagO9keOEd
	Zxh+hiL5agQdl+lH6ELC4IFwfGPNb7An/MDZTLzHe++uJPjPK0+dOGrT9s=
X-Received: by 2002:a05:7300:d409:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-361a1f5019bmr16718087eec.23.1792510646054;
        Tue, 20 Oct 2026 08:37:26 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	David Sterba <dsterba@suse.com>,
	Gary Guo <gary@garyguo.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
Date: Tue, 20 Oct 2026 08:35:18 -0700
Message-ID: <20261020153652.2907186-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The end goal of this series is to move forward on producing a
"universal" Pixel 10 boot image that can boot on a variety of Pixel
10 devices (frankel, blazer, and mustang and eventually multiple
revisions of each). At the moment, this is impossible since the Pixel
10 bootloader:
* Picks the base devicetree based on SoC ID information.
* Picks an overlay devicetree based on Board ID information.
* Needs metadata associated with each overlay to match it up.

Since we don't have per-board overlays and don't have per-board
metadata, that means that today you need to pick exactly one revision
of one board and build a boot image just for that.

How does this series help us?
1. It uses a checked-in .its script to associate metadata with each
   board's devicetree. Other tools can parse this metadata in order to
   craft a package that the Pixel bootloader can understand.
2. It integrates a call to the new `fdtfactor` tool [1], which results
   in a "base dtb + board dtbo" that looks like what the bootloader
   needs, at least as long as all the boards have the same SoC.

What happens if everyone hates this series and it gets dropped on the
floor? Honestly, everything here could just go out of tree and it
would be "fine". IMO it's nice to have the Board ID / SoC ID
information for each devicetree stored in the same repository as the
devicetrees themselves are, but if this has to live somewhere else
then so be it.

NOTE: from reading the above, you might wonder why the sc7180-trogdor
.its script is part of this series. The answer: it's a board I was
previously deeply involved in and it is a convenient way for me to
prove out that the Chromebook use case works well. I did hack up some
changes to the ChromeOS build system to use the provided FIT image and
it worked great, but since I'm not on the ChromeOS team these days
it's not something I personally plan to follow-up with. It sounds
plausible that Chen-Yu may follow-up with it or post a similar change
for some Mediatek Chromebooks.

[1] http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org


Douglas Anderson (7):
  scripts/dtc: Add fdtget.c and fdtput.c to sync script
  scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
  scripts/dtc: Build fdtget and fdtput host tools
  arm64: boot: Support building image.fit from a specified FIT_ITS
    script
  kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
  arm64: dts: google: lga: Add lga.its FIT image script
  arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script

 Makefile                                    |   2 +-
 arch/arm64/Makefile                         |   3 +
 arch/arm64/boot/Makefile                    |   9 +-
 arch/arm64/boot/dts/google/lga.its          |  68 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
 scripts/Makefile.dtbs                       |  51 +-
 scripts/Makefile.lib                        |  67 +-
 scripts/dtc/.gitignore                      |   2 +
 scripts/dtc/Makefile                        |   6 +-
 scripts/dtc/checks.c                        |   2 +-
 scripts/dtc/fdtget.c                        | 207 +++---
 scripts/dtc/fdtput.c                        | 280 ++++++--
 scripts/dtc/libfdt/fdt_ro.c                 |   2 +
 scripts/dtc/libfdt/fdt_rw.c                 |  41 +-
 scripts/dtc/libfdt/fdt_sw.c                 |   3 +-
 scripts/dtc/libfdt/libfdt.h                 |  70 +-
 scripts/dtc/livetree.c                      |   2 +-
 scripts/dtc/update-dtc-source.sh            |   4 +-
 scripts/dtc/version_gen.h                   |   2 +-
 19 files changed, 1322 insertions(+), 227 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/lga.its
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its

-- 
2.56.0.212.g129ede20d9-goog

