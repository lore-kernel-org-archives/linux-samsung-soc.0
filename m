Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC91C6BFB0;
	Fri, 16 Aug 2024 07:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794669; cv=none; b=FU8kmmqDYbGz1u65bEo3p12eWRYCQk+ax9OcWyTu5VwUd2fFfdSdMz59P16NYfKMJs4WzsrJoQZ8nz//3qvI/UE0OEQLgZknl92k1LM4wiQ6JLGdfVuRaN2O0ogLHjvezNt3+VrvOkVAajcDgFpXTxhz78irEZi8d5qRAGcZ+y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794669; c=relaxed/simple;
	bh=m21UR2Li9R6gN31puzH6uj0MqV+URXqK3uxeXiT+fVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PQOiazYAAW+xUIlI72q8bziZkrXjTyqAcnKHbGT63MZaWhEAv36sZbvkXfZsqX+cfRzozIvqA7K9twwK9vUgZDoLWVe97QrfShSc0ghBcn49II1W2qAQbMUib/GzZDKt4c1KIUB0gxtiUUcSmhArwSkLGIEu6Xt/SA4IsPWANWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hB90ZRZV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hB90ZRZV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37182eee02dso818603f8f.1;
        Fri, 16 Aug 2024 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723794666; x=1724399466; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYCkaTEvTDSyuZcCjBDH4ThgdC9LaZkN69s/l2hUZCI=;
        b=hB90ZRZVOn+je6JydVNkXJLUNaIAQ2lNDJqlZ/Yw2y6OYJjZgniEjlBgPcf/lzO5Ko
         +DuEom3r/tf+gW6ldOVUydZPCMIx+Sqq4pbHvMoVnChj1C8pzsFVzKNdXEIXTAQPcWPn
         ntqcoA6eBtURqgzVISM2WnBiRDqphQVxV0vYze1gERDPKeEznD57AivB1X3Knmjbf7W5
         6/7Mdnk5pXzioTJVNbHLB5h8Bvsm9dMFnBjZhNPyDdgEDoi2qZyzlQOcQ6VVYJ/OKm+/
         9gURv5OiMBXLLS/yOaa03wBx7YHTpEmh806b/cEluWNIxWMPO2kHZOIujMlTaNJ/WkQS
         R2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794666; x=1724399466;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYCkaTEvTDSyuZcCjBDH4ThgdC9LaZkN69s/l2hUZCI=;
        b=M53lqk26qrPLrjPhUVMrTUDSFZHOwle3oizGMDGOe94ef+JKnZmjJPhbMr4ZX4tlPr
         APNhp/tBikSKBs53Ej2AnGme8IGWvBPyczXSSWKnwYJksgITfwcUYaRiZJuJjQyua51U
         XpgwMGlGUPrpMbcJFM6oq3sb8i7a4ZNpQNcuTVSIO6w0J9LUPeprpzlL1WThMHd4hIn0
         LomnxO2DIQiQTXcRFXT3aBKDxLcoymHb3LV30yvxl7xLrriWt7pbLPW9p+2aGoQeajkM
         GjcMVOHR+/YjFB6JE4SxEWimsMUzy50V9vMe9ItSnCPy1wGXDO/Mk3r8dDXY2K/bLy/I
         f5dg==
X-Forwarded-Encrypted: i=1; AJvYcCXOm14ggar8/H+1AEzZxsOcWxtdFvsoIVhONIDfbxngn71XUSG6NvJT+zPb6hIyzC3jrfH36PRFvrcxLRa2VBpkkG5JzyVtNVcpYlGIOv8vi3jLA4/M3M+bXGT0g6x+gC36vTo5ATfKtS/+MI5Jl1WqIHuKi3leE6m5Llf0ppcHxKx89prxc5DVh5MOBw==
X-Gm-Message-State: AOJu0YwA8PFfsZQEHzyusuAl1dKLF7SLsAZaeVEIi7KGaYVQD3RMk+u5
	jBeN4C9McBPKGwt+zYKkOoxBR6ulr7X67ODOOkhtm3REGkAUxcAC
X-Google-Smtp-Source: AGHT+IGf8FprKiceTcAmoHl4lyE4EQQ5TlVhvUvXojybRS2uhW7KNViG04Z0+gGZmusIfvKr8HVIYw==
X-Received: by 2002:a5d:4151:0:b0:360:70e3:ef2b with SMTP id ffacd0b85a97d-37194c33ecfmr904375f8f.26.1723794665665;
        Fri, 16 Aug 2024 00:51:05 -0700 (PDT)
Received: from tablet.my.domain ([37.30.8.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a6c4sm3026201f8f.52.2024.08.16.00.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:51:05 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH RESEND v2 0/6] ASoC: samsung: midas_wm1811: Separate
 compatible for tab3 + fixes
Date: Fri, 16 Aug 2024 09:50:57 +0200
Message-Id: <20240816-midas-audio-tab3-v2-0-48ee7f2293b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=m21UR2Li9R6gN31puzH6uj0MqV+URXqK3uxeXiT+fVU=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmvwTmCdk8f9QXetNRmS+DG/W5SUNNJGTL4k2sv
 P//UEJ6zN+JAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZr8E5gAKCRCzu/ihE6BR
 aJEyEACCwIk5Qyci+QC6bXuRGQT/mjI7xtBXvRACaTqc43qhT6lf8C9FgmG4kgTchsOdwR0P8wf
 Aez9MLZkD3YQmzgbDfzcKvl2DSMBHHlT/PAIw8nSvVjYkwSGgmwi+v0J/DB+w/AEdB+GO4Gq926
 3IaUKbjKTWXqTa3/815ioWSfLyppiadRvPKXKylQk6tiDwtWdN9xts6EDZ5mdsJA9S0XruRoehP
 EQGwCRXa3vmSIcWNVqhuADwUdVVoiY/SudJ8NIzxmvexmYmHxp14wSR/uZTj46JzAcHifYxm2zr
 fZ2e69+/II9TsKd++yrYQpfSJaO0UyvspXFETTZy2XvPoOxEXTijnO1MJ6O2Bpv4VpUvc3KqxJk
 0ZI5U0Q9ueWC04crIK+/X1vPyo9CYPy1GizA2dRCY6xgrM6X+xdE1ARvV2Uvsgh/hulYfpPB0G4
 TF1z23ew0Ig5olC6Lo6/x75POsHUD0u3gm3pt5Q99cTqszJp7DjUIZEroQMa9kvMl1NIIhzEnyQ
 MUX+lGfMeY2MnlCBekpd0m2UajOWbywd29aAdcj8VeqCHanzTmkwCorWS3ik5s82x5Ggfe3QGlh
 v7P3FFjyyWo8KB4mxjwXqsRWxT7NzX0BaNGcm6nAp29R9xJr9QXyunkJQy/DDd3aGXy6rBym9yY
 AS25eQBdyZLouTA==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

This is a follow-up to "ASoC: samsung: midas-audio: Add GPIO-based
headset jack detection"[1]; it appears to have been silently merged
except for the DTS parts, this patchset is a resend of the DTS patches.

Besides the DTS changes necessary to enable headset jack detection
for the Samsung Galaxy Tab 3 8.0, it also adds a new compatible for
the Tab 3 (samsung,tab3-audio). This is done so that we can set up
different requirements in DT binding (Tab 3 does not have main/sub
bias regulators), and drop the main/sub mic bias dummy regulators
from the Tab 3 DTSI.

[1] https://lore.kernel.org/all/20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com/

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Addressed review comments from Krzysztof (anyOf instead of oneOf in
  if: statement, fixed earmic_bias_reg node name to correct number,
  reorganized patches to move headset-mic-bias-supply property next to
  other headset properties in DTS)
- Link to v1: https://lore.kernel.org/r/20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com

---
Artur Weber (6):
      ASoC: dt-bindings: midas-audio: Declare required properties for GPIO jack det
      ASoC: dt-bindings: midas-audio: Add separate compatible for tab3 audio
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec
      ARM: dts: samsung: exynos4212-tab3: Drop dummy mic bias regulators

 .../bindings/sound/samsung,midas-audio.yaml        | 59 +++++++++++++++++++---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     | 39 ++++++++------
 2 files changed, 76 insertions(+), 22 deletions(-)
---
base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
change-id: 20240715-midas-audio-tab3-174716e45618

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

