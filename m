Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604167;
	b=10xXFI4HOPvbYw7uR4lx0tgG+iamaKwUTFrPLgeHKiIbEHDBZPv2F5FP3ZH/pkCluTfA
	 8nsB97VwUKB57N9Pal7stOTtPKAL6p/uwnJGpymGeI9FeJI1sFY4DYw4G01WDT30vLb08
	 zNfTVNxRj/FGIBnqXTX5Qe3JUbfevi1sNQzFfBRoStZa5kw/O36EgenWQoAPH7lTipKlT
	 5bAEmIcDV3X+JHd0o/fGTzqNHWoLNJNvbt08axolRwEzTll2l0lfCn+/+7OQ+qJNm2PDH
	 ecdpUGq5MXA7dJamtxb4GlK5dV9xry3xY53bSnLmlue13MGdYhbFEYMCb4I5OWFiU8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/XWpc39jBynwI4nBXv0NNeAvE7u5mNOBsmUvCwWc94s=;
	b=IJgwm7irbivAFue+9wOm7INr+vVgzbcTK6ERcx1BlOQn8No6rDNnMBgLpwhKoxtvHmtN
	 u3bPt2YIxhFsspafqaBrra7ZrMX7wKr4f0xqmEvpy0ph8dyFvrF8TfT0MXaf2Nts/1XE4
	 m+MydsPROorzCaXRAkHIW19zrqBBECPoF5AAxqf1mEkgJ5XiJ/+8i9coWtNFPdWIByf4J
	 zEJhFywBxqnxD0Fr4kc7QVOFO/OoVaSIw4YPuEPzYhFk8TIaWD1SQw35TrbmY1Nxcg9yQ
	 YTzvIWZIc/SF6Dd7RtXH4gPfe4UzxafwptOZ8PyFPX/HDlDXj0Yg90DgnkjraD2wjcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLz0Y4MS;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B5606A33A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 21:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E53B5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLz0Y4MS
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso584014c88.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Nov 2026 13:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604166; x=1795208966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XWpc39jBynwI4nBXv0NNeAvE7u5mNOBsmUvCwWc94s=;
        b=aLz0Y4MS5HVFlOxmPqqFMPg0eifh1MyYKl/shV1TSg6AxCreEouIS+gfPiKcMe7L9e
         OJULCa6qggA7ACGjZYTTTAD8i4wnoNX4gtt2F8uaWmZybukSpX1dnjUmD89JcyNbtIoz
         4T+1uksvKL1Z2sg/crUlpSJThsjBU/GFWUcGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604166; x=1795208966;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XWpc39jBynwI4nBXv0NNeAvE7u5mNOBsmUvCwWc94s=;
        b=ECLG2OkFgz4Cbh9dkv+kMhy//XH6NH6ahH2ZAR6SI4dfhuGpGpMTuhmtGPccKswBOb
         cHYfL3tewYCWGf7XnKPX1sVALNdKFRgl2qFQGDk20MR52wC8HEsN/1zPKQ4vhoG6oe6x
         UWavPf3MCYOZkbYy1KP+88u40Yb7wwlHc9LiprT83Ep4Hrm/mDu5w4xBA2WdW9UGCGae
         lAMGzV4xe7UQ5M2uKxBbTlOQC6O5edYsiAxCz1J8IxbHnOj4lbYsEzKBnMe4DBvyCqqI
         vz1ww5fF9B0PPc+HY+feLSiS2v1cN2cps9fQ9HATF5lWv2phrRU1IFQGmHdwlB3F9vW8
         ydzA==
X-Forwarded-Encrypted: i=1; AL+hErHtYRGEAFZgrwWNRfqufzrD9SE+9wieDddSDtATIkgVYhnAQFqZDaAJvtdtOBdXvvMKIttHP7ekrPlTduMzn0u4vA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4zNwdK/Uf/oSqQaAfeo+qD3B6tOQSo6fpSekGmYU0tOrqj/XK
	6/ScYA5mRa16cIMEBo3dM81GjowBVGM9/XZAZVbL3oCHoByGGbywIqhFYZPEZriugw==
X-Gm-Gg: AYBFou3YcT1xRTsbNMgwBbDxY87Gvh5ZVHsVNTQSe1o10Bi2Zr+Q35JUQc6pFzM3I9D
	oIfqs5bH5PH55L+7drBhxfE2lZZvD/2Ps+INRTnKHD5BBYGG/1WVu27cRSlmeN4yo+i3gUunJ95
	nH1cd9wXh6sFRaLhk8PLdBmKwUjvCPs1wM45ya2S8FXMJn0HFDD3sw6RGeMtZpZfjtH6ntncbXJ
	yuAq6i/7T791xFypBEhTK4Nus7H2roYPFb3I8elN5vnibvsIR4XbEIIscFf9IUUiqXb98WrPQoE
	9VUhEfXAnhHkMA8q1jiXqudPna0kBnT/4NQ56jh8PojqHZb0znr+YzMxufj5Cpo+wo5H1vo3HG+
	tXrbb2nExXBZkPv7t2CNRzGfO1kmqPEeaF9e0YwKUVr4wK1Izk59WEyUEGBe6SCVLe/gdxe79jc
	DeMLot67F/pNhQn+r0SZ9azmIaQqR6xEAf2Fz3h30wQLVy+sqT5Z1WSUT4K2OW0pLd+qvVbXSlZ
	RCGAokCuPhFnWF9gA4Y3vmiGSp8v8H6lDtOnw//Q+7bjM/TSdqXtujztjAoHUbbTbtDxAOpbMTv
	hTBez5yt2FxzK9CaXghKGMGazuURttNlyZVqvTRnfN4E+wIwXXWvrYrr8T1aQQ239xAlzqDE6gx
	/ohlRsobK69QpAw==
X-Received: by 2002:a05:701b:4182:10b0:1b2:5128:df1b with SMTP id a92af1059eb24-1b5031b7dd3mr3390648c88.45.1794604165722;
        Fri, 13 Nov 2026 13:09:25 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:23 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rong Xu <xur@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [RFC PATCH v2 0/5] arm64: Add FIT configurations for sc7180-trogdor and google,lga
Date: Fri, 13 Nov 2026 13:09:09 -0800
Message-ID: <20261113210918.356261-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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
1. It uses a checked-in `.fitconfig` configuration file alongside the
   `.dts` files to select which DTBs belong in the FIT image and to
   associate metadata with each board's configuration in
   `scripts/make_fit.py` [1]. Other tools can parse this metadata in
   order to craft a package that the Pixel bootloader can understand.
2. It integrates a call to the new `fdtfactor` tool [2], which results
   in a "base dtb + board dtbo" that looks like what the bootloader
   needs, at least as long as all the boards have the same SoC.

What happens if everyone hates this series and it gets dropped on the
floor? Honestly, everything here could just go out of tree and it
would be "fine". IMO it's nice to have the Board ID / SoC ID
information for each devicetree stored in the same repository as the
devicetrees themselves are, but if this has to live somewhere else
then so be it.

NOTE: from reading the above, you might wonder why the sc7180-trogdor
`.fitconfig` configuration file is part of this series. The answer: it's
a board I was previously deeply involved in and it is a convenient way
for me to prove out that the Chromebook use case works well. I did hack
up some changes to the ChromeOS build system to use the provided FIT
image and it worked great, but since I'm not on the ChromeOS team these
days it's not something I personally plan to follow-up with. It sounds
plausible that Chen-Yu may follow-up with it or post a similar change
for some Mediatek Chromebooks.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66
[2] https://lore.kernel.org/r/20261101220224.1436242-1-dianders@chromium.org
v1: https://lore.kernel.org/r/20261020153652.2907186-1-dianders@chromium.org

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)
- Replace FIT_ITS + mkimage + fdtget/fdtput approach with FIT_CONFIG
  .fitconfig sidecar files handled directly by scripts/make_fit.py
  (Simon Glass)
- Support subnode properties (e.g. match-1/...) and u32 integer values
  for the proposed FIT configuration match subnode spec (Simon Glass)
- Document FIT_CONFIG in Documentation/kbuild/kbuild.rst and under
  image.fit in arm64 'make help' (Simon Glass)
- Update fdtfactor invocation for v2+ flags (-v -> -s, -f -> -F)
- Expand commit message and notes to explain why FIT_FACTOR_DTBS is
  needed, that fdtfactor is an external host dependency, and that
  compressed DTBs in the FIT are supported (Simon Glass)
- Document the optional fdtfactor dependency and FIT_FACTOR_DTBS /
  FDTFACTOR / FDTFACTOR_ARGS in Documentation/process/changes.rst,
  Documentation/kbuild/kbuild.rst, and arm64 'make help' (Simon Glass)
- Drop fdtget/fdtput sync and hostprog patches (patches 1-3 in v1) now
  that scripts/make_fit.py handles FIT configuration files directly
  (Simon Glass)
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)
- Replace 728-line sc7180-trogdor.its with a 49-line
  sc7180-trogdor.fitconfig sidecar file consumed by scripts/make_fit.py
  (Simon Glass)
- Move motivation for sc7180-trogdor from commit notes into the commit
  message body (Simon Glass)

Douglas Anderson (5):
  kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
  kbuild: fit: Support selecting DTBs and config properties from a file
  kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
  arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
  arm64: dts: qcom: sc7180: Add sc7180-trogdor.fitconfig FIT config file

 Documentation/kbuild/kbuild.rst               |  33 +++++
 Documentation/process/changes.rst             |  10 ++
 arch/arm64/Makefile                           |   2 +
 arch/arm64/boot/dts/google/lga.fitconfig      |  22 ++++
 .../boot/dts/qcom/sc7180-trogdor.fitconfig    |  49 ++++++++
 scripts/Makefile.dtbs                         |  17 +++
 scripts/Makefile.lib                          |  32 ++++-
 scripts/make_fit.py                           | 117 +++++++++++++++---
 8 files changed, 267 insertions(+), 15 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig

-- 
2.56.0.611.g1030f0b940-goog

