Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB17C2D46DA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 23:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760745136; cv=none; b=dNVlUXyQzdEb6N0JwnEV+mzsfM+17TvfzdfGFzOU3AUYviNB4Kp/6Y2mnKVa9T3kimQ5z6hVd8D5b2I+y6OXqc5AlfXKVaky1ZUSFXrgVM+kxpHu1x2bhyE8QleY40QY1sQOJMFB9LL86G1HJEn8QaEs8A0ggZ/4eECql78zovg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760745136; c=relaxed/simple;
	bh=GI0Yx7Ksjta8jleO59PgIKVTnn0otko41CMsmxM7N9g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RegOAj1TYtFBrDyV/GVuAGQYZxxQgwKB5Nix5eBkVWjIsYOwAb4yBbVnrwXNj4eim9ntZFB+P5sQ75HHd1juBBlRXHG7jsMfgQjL7fHgIyYnVeXlu5eOmrPSJZ0HOMJpcDktbvbXQPGVB1KfjUz3rElmp6DzrOQIxfrozAR9sdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EL1P7Z8a; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EL1P7Z8a"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-290ab8f5af6so19732665ad.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Oct 2025 16:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760745131; x=1761349931; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=epoAusswG5dO23h2QFaAnAg30xN4jI6h3Smw2Tdo/d0=;
        b=EL1P7Z8a9GQWKD8nTVXh9124UOonKMoTjvenbiOrRn1uPyidvF8/mc9Ni14uJ3MpT8
         ZmT3HfynG8R9OYm3WAU3ou971E0avPgOOibjVhrRQvfXMUgniUfxeV+1pB+tR00xzzh3
         d/P0VnMOwD+/vPK4IzMpOfWfFxcGKeqR/H0l8P2lBfymW12aX73uceXatGaMzbUqeX6Q
         4e+ynJkDuSekbyWAwpqH62XbsuNb+4ZcV8kKrSPv0wqvjsCSjfkebTsauhTL7KkVJBzI
         ft3V2K5MT547mQXVG42wUFeAnv8Y9xtAUo5JD1FoGfQXAhSpydFaf+LyWna8mh8socj2
         atzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760745131; x=1761349931;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=epoAusswG5dO23h2QFaAnAg30xN4jI6h3Smw2Tdo/d0=;
        b=JrNXSwgHzfKwOlWCbayAe2I47zmwWE3bEck0oO+sHgXI1VcjuxVO0sAsk5FsZcr3xd
         J2sirFecjHLGZX3O5VQt3MnljbsgOxanhlg7Tu1T5OOUkaOxH8nEhXCN/wRyU1bzLLDL
         bzHHKbtO20/rC5k/7fHQvS8MAfhM09CDdijnKLPeRu8pcT6hdovgyFigk4ZhNAaV3DKL
         MxEbRTUfemKiX67Uo/+80tf8Rgu2CEKAEVvhg0RwWXGY/m6eSnQa+oCmIpDvZEEZEcRI
         DACFYU5rGOeoh8+xJUSCxPWZy5126LLIuEcaIzobghfl5moytxsvVNABS6hnyBgbmHUy
         W4PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrZwa+J+VDaDCFgUNsO7JcD45O8q15XZQ8aOJ9Scl166ndlmV3OOlF35boJ0UODvzPsl2NDblqrbZ6IyyGVY4Vmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT6DenXfH9Rr0h6ASh2qgnT44ISwpm7DK6ufnC3NTxfGoFlALF
	xJcZzF1VoZuNxiMnVxdfMxNPD7U0IK6/nLowShKPRYbf39igPSTJ950bIX7SogvNEwq6hGDr11F
	W1XLKbA==
X-Google-Smtp-Source: AGHT+IFpvneIuRadcbPDmZxphSwx/I7IpPbqWA7MW5ybUCSkZbjENPhFaSSItQAT3k9kMr4I9sKjw9HCWMA=
X-Received: from pjbds19.prod.google.com ([2002:a17:90b:8d3:b0:33b:51fe:1a84])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea03:b0:26c:3e5d:43b6
 with SMTP id d9443c01a7336-290ca217ac9mr72880525ad.32.1760745131078; Fri, 17
 Oct 2025 16:52:11 -0700 (PDT)
Date: Fri, 17 Oct 2025 23:51:57 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017235159.2417576-1-royluo@google.com>
Subject: [PATCH v4 0/2] Add Google Tensor SoC USB PHY support
From: Roy Luo <royluo@google.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series introduces USB PHY support for the Google Tensor G5
SoC (codename: Laguna), a new generation of Google silicon first
launched with Pixel 10 devices.

The Tensor G5 represents a significant architectural overhaul compared
to previous Tensor generations (e.g., gs101), which were based on Samsung
Exynos IP. Although the G5 still utilizes Synopsys IP for the USB
components, the custom top-level integration introduces a completely new
design for clock, reset scheme, register interfaces and programming
sequence, necessitating new drivers and device tree bindings.

The USB subsystem on Tensor G5 integrates a Synopsys DWC3 USB 3.1
DRD-Single Port controller with hibernation support, and a custom PHY
block comprising Synopsys eUSB2 and USB 3.2/DP combo PHYs. The controller
support is sent as a separate patch series.

Co-developed-by: Joy Chakraborty <joychakr@google.com>
Signed-off-by: Joy Chakraborty <joychakr@google.com>
Co-developed-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Naveen Kumar <mnkumar@google.com>
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes in v4:
- Separate controller and phy changes into two distinct patch series.
- Remove usb2only mode configuration and the corresponding usb_top_cfg
  reg (moved to controller)
- Add more descriptions to dp_top reg to indicate it's not DP specific.
- Add u2phy_apb clk/reset
Link to v3: https://lore.kernel.org/linux-usb/20251010201607.1190967-1-royluo@google.com

Changes in v3:
- Align binding file name with the compatible string
- Simplify the compatible property in binding to a single const value.
- Add descriptive comments and use item list in binding.
- Rename binding entries for clarity and brevity.
Link to v2: https://lore.kernel.org/linux-usb/20251008060000.3136021-1-royluo@google.com

Changes in v2:
- Reorder patches to present bindings first.
- Update dt binding compatible strings to be SoC-specific (google,gs5-*).
- Better describe the hardware in dt binding commit messages and
  descriptions.
- Adjust PHY driver commit subjects to use correct prefixes ("phy:").
- Move PHY driver from a subdirectory to drivers/phy/.
Link to v1: https://lore.kernel.org/linux-usb/20251006232125.1833979-1-royluo@google.com/
---
Roy Luo (2):
  dt-bindings: phy: google: Add Google Tensor G5 USB PHY
  phy: Add Google Tensor SoC USB PHY driver

 .../bindings/phy/google,gs5-usb-phy.yaml      | 104 +++++++
 drivers/phy/Kconfig                           |  13 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-google-usb.c                  | 271 ++++++++++++++++++
 4 files changed, 389 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/google,gs5-usb-phy.yaml
 create mode 100644 drivers/phy/phy-google-usb.c


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
2.51.0.858.gf9c4a03a3a-goog

