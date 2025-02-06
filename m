Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968222E402
	for <linux-samsung-soc@vger.kernel.org>; Thu,  6 Feb 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847305; cv=none; b=TdJMkmXDU1523tpUmixg/23eu1mxeVyoqUituB28dRKA+NNMEBXm8m7zAnxedVFDGAY41XU83Gsa9begOfKz8x4LX/CQ4/iFoQdHfLDHDRxoBfh5Eo2OvF15aVKzrzCiFASizkxMHqLAcV2GND1ivl1/8lZm2A4KWrAhMzTv70s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847305; c=relaxed/simple;
	bh=d6foee+YIiHorPvDAYRgPRpXKIHz6BSRVOLUmX7ZVN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsnIvdsfcadDv+04ZN3RAHWoerj9z5vWt8F8tAab7peLwI/1Dpb+vCinvy3xs+89hbwmZg5hZAHUiRpNVRo+AZSAVFJxuVIOdAR51wvlMS0ue1VIIO9044zsPI3i1fifT3MqOnaqlrmz/wiP0srUsfWVy9DJomb63PP9T/GMSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AtCOG30l; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AtCOG30l"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so1903601a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Feb 2025 05:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847301; x=1739452101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEWiMUNEqLClrTF3KdKFb4oug1HLJiE4dMnSAetMkog=;
        b=AtCOG30lr3zVIkgB3as3/2EN9HHpWNTWTOlDPokC+DLcpSlL48EkHHRWcPiP0mZCJX
         T5bV2/KOW1SqXw9SvboytIXZXnTdFxVMXYKpNX56jFPDH+cChXhGaaM44XSTogClyyzI
         D6a82V7joZgjyQV6YbG4AKQgkHTAPUk7vK9P0fVN+VelgdS2irjRbaCKJAeZgJGO4wFN
         2vt5igPYzPABMvMdppv+317KTrbft4lJImcYYfH/UgyeRqjq4CoPr0U2YYew9pvoUeC3
         zRGk8F4dVGpj0JpH5tkyXYaR+ByqFGlPpVqJMzSOYXnzm9WUl4Zf37Vf7kL7UVFyrnzQ
         LrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847301; x=1739452101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEWiMUNEqLClrTF3KdKFb4oug1HLJiE4dMnSAetMkog=;
        b=uvVQxgMjkgm0zSedKtlz36MBdgxZBL6hmY2Snf7XXXesVOIzL9/9BA3umCUNaO+8XS
         EXdGaZm7lY81Gwg5lfnRnRJd2gT1TmSjMPMbNA+m6ewOI5/RD5jt7PVCFBiwbo515UOe
         1yaNw62d0vXcZqjYK1RRVNs1c6+FKBLghZiLc05q/Ap4m8bcNd7oGUTA4/kFKxenot5k
         6kRs9xPbwvdeQYM56JyL2cAjuVXo04De/0D7W9vcD9vWBdl6VghRcF1WcE0NM+lboJ+7
         Yl7R1kqTibXpqpg7KbGJlieYrAGiG4NxvtSUPcJr9f6opV3fr1yvrMBIiQu/ovzUNzeO
         5ikQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrlNat2a9nK4a1ys/9xlMU4FY0N2DTOhorqY/6r7ggwCbDwbEYVh0qp7mbOdv5Vr/w/0UltMUyRzGRfQsOzdGCfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgQos1H5RJ/zs9wH8IZM/HXlLmD8WpvjzXhEd9U8JZMQexOLHr
	jMpEQLCgDfVOZ5f1h1Id4vW56IlU1XgegSShU58u40F5qbxFeeKKr5L1IGJHUs4=
X-Gm-Gg: ASbGncsjagEBb+vthdhyLoz85nB1lD+v+6byIkTJ5zwVHdKEVsMeziJ+BESsPylMPPf
	FfwVXoAPkdQawCVwmUIhSidK9GKqqfjrWqkETJn+ADeXaiOMFAPWP7USdbzqA2e3egrav/mp5Dk
	7dJNWu5DPAoBV2eRf0uTJK6lCrG6DPzxMfHd582s613X5cA1htP3UscX1YTPiQFeh+Rt8avtOji
	3/SbQWGg1qpnNBjCcrWT2P5n2tm7A40XLTyaYnSfjh13rn+GE9VOO8yL46rNRDhrRUFCmIqLOoE
	YMp8UlwesNRF26ftNdLRRn6PaMkFzZjrzaoXpuAHvjNljE2n5vzb574NHgg+RmF1z/bmzlIXV3g
	=
X-Google-Smtp-Source: AGHT+IFeO9gqDBs4A+ukV7FG2tWykoGpIb5Yum5uOgYOlnokRh3L3ZP9VDrs1qPmq6hH48wtb1DiLw==
X-Received: by 2002:a05:6402:845:b0:5d3:e766:6143 with SMTP id 4fb4d7f45d1cf-5dcdb77fba0mr7904791a12.30.1738847301240;
        Thu, 06 Feb 2025 05:08:21 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:20 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 06 Feb 2025 13:08:20 +0000
Subject: [PATCH 3/3] arm64: dts: exynos: gs101: add reboot-mode support
 (SYSIP_DAT0)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250206-gs101-renppt-dts-v1-3-cdfe993fb3c5@linaro.org>
References: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
In-Reply-To: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

syscon-reboot-mode can be used to indicate the reboot mode for the
bootloader.

While not sufficient for all boot modes, the boot loader does use
SYSIP_DAT0 (PMU + 0x0810) to determine some of the actions it should
take. This change helps it deciding what to do in those cases.

For complete support, we'll also have to write the boot mode to an
NVMEM storage location, but we have no upstream driver for that yet.
Nevertheless, this patch is a step towards full support for the boot
mode.

Note1: Android also uses 'shutdown,thermal' and
shutdown,thermal,battery', but that can not be described in DT as ','
is used to denote vendor prefixes. I've left them out from here for
that reason.

Note2: downstream / bootloader recognizes one more mode: 'dm-verity
device corrupted' with value 0x50, but we can not describe that in DT
using a property name due to the space, so it's been left out from here
as well. This string appears to come from drivers/md/dm-verity-target.c
and should probably be changed there in a follow-up patch, so that it
can be used in reboot-mode nodes like this one here.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 4f45bfeb33c0..f4c098ca9fd2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1410,6 +1410,19 @@ reboot: syscon-reboot {
 				offset = <0x3a00>; /* SYSTEM_CONFIGURATION */
 				value = <0x2>; /* reset value */
 			};
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x0810>; /* EXYNOS_PMU_SYSIP_DAT0 */
+				mode-bootloader = <0xfc>;
+				mode-charge = <0x0a>;
+				mode-fastboot = <0xfa>;
+				mode-reboot-ab-update = <0x52>;
+				mode-recovery = <0xff>;
+				mode-rescue = <0xf9>;
+				mode-shutdown-thermal = <0x51>;
+				mode-shutdown-thermal-battery = <0x51>;
+			};
 		};
 
 		pinctrl_gpio_alive: pinctrl@174d0000 {

-- 
2.48.1.362.g079036d154-goog

