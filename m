Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90A289804
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2025 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754005535; cv=none; b=RC2qqWVAUxm8ltjS0GWJvOlEvFaiQX5MH7PZsy9dfLEAoQLB737+N5/kKe5aCFu4tL6z+U0O7pI4NN1omKSzal/ZucF7eCdohDxxVi5cqtq5B68IQQOnOWlw5IBmZ5if1QjhtTGzgTB76xsrDIpyGPt2aI2m0/kXdG/bd/oK4r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754005535; c=relaxed/simple;
	bh=2gt6Nxed+AFerebrJU3TYDHkF7LsDAD0OfwSV1lcaH0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T1c9JbKf8SQrYfFx7MACuO0fnF7YNBr03Jt9ih7jLY8QWxbce8lV3oDQs6w3PylwOyn+XTB1iX4X3xOUtFYXAyLVY6IF0S8WWq3GNPn77oRZ8YdMSM+SFmE3jDltvM1HBBICH+yi5EgJFKXgT0L0yShm46xX5N67p+CpW3jbRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vAIALMc9; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vAIALMc9"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6196da3f479so151425eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Jul 2025 16:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754005533; x=1754610333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5aj5vUWJXyfqyhprLvdwVUEl/uN3d7BC1IvykTif/4=;
        b=vAIALMc9cvDdQUpfHCK3eqpWjTikpAvTOsGZ+naGN3sJbFs73TobHywPpbzhpdOZNK
         zXKsOuJhniq89roybImciL06q8G0SOfj0NRTT6AkF8c4S7L3dE01/c6yl3HKiNBxtaQ5
         U/sMUfJNfjsgnM7t1zeJqd9xQcmtU6NGjo/o8E6CxuUjLyQWhxfd5EjyuSL0rYjFsxQr
         CFdzR6HJHaXFmFOq0Z0D0Jpku/Upx/LAsjWhi0EdShL4+0Bf09PewGPyNncqDOuFWgs2
         ib9B7pxPsxk4FA5DytchSBZwQuQceBaJbw2rDbypduCpUJ3NeH2moNulu3cT5EGBGuWd
         dcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754005533; x=1754610333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5aj5vUWJXyfqyhprLvdwVUEl/uN3d7BC1IvykTif/4=;
        b=ZBxJEA9h57Hhr0CPywGbvuvalKM8xExnEZvpMJo2bheiSWRQp3FUeDTcQlOiuc9hiE
         uykQN8ii6UP8kYcgok5iOZKY37/ppgQ6cU59faNzNw6wq0EFp4MukBcsMTvtxds8pDx0
         J5GQ2wVa+WfSCy+rfRRh8vCj+xNYlAUgSeB4sfClcpHCsTEyT3+DKGk4uVFjV9UYZ/S2
         HI8L1HhVQIWWOqemk2stHHEo3MjDOM5Nz4b8IZX7DUE0mOx9prGa+U9d7rjbLMUTSjHJ
         ziTeeseFFOGVeV1lD82BChMn5XXFKqrb8Vz8pQa+k7/oj4Y0kRXSbx5MUkVAzmrgt2LG
         QmFA==
X-Forwarded-Encrypted: i=1; AJvYcCWdJrix1miZ+o9nzKA3fmRmMkkd7TfHwOi60wWagbEN01IBdtH/20QhFiiyx5VKLnRiJ4UOa5cbnoZJWmulj3mHFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr98wmM4TQ61pJFxNIfvZ8PIMyOGd2PS8t/3MMSAVB7LB3mPue
	WFgW46Nd2vRg69nCOjIWJkatpJqQqK75vncxQrqNMW5nH0MP/wQrWvkDmx9AmGXF6Gk=
X-Gm-Gg: ASbGnctagvv0+1H27GzfImzeH+4Ij8cm0/qWuzr1ON5ahV5AwtaixoS22dAj2O11VUp
	eTNFMhf2uUcPqntcce4SPdRyNLx2lzZhtg7g+oXHj80wz992VQfoGIrI7q9A41I0c05H4v961SQ
	CHiD1cECbHBxH1szI3ppductm4D7/zUAYW9NV/ZjNeIr9uX2yGhNCe+Y/fvf1OEnenJ7vrIhGal
	th+MIttMcGwvw+E0CHjsIDKEbSC0tmG17NAxCwFwLQYERv34jdc9Eh0SYJTb+auUnsNiVSgIMqW
	Wc2CqISJUtgoRPuFWMQMYXkibkp/25zpvuzg0NHszVq3LgCkjAbnAEzLzdGO47mfhOT0//mouIa
	TwKDC5WJYHbsxVEXe83E47L6wnQ==
X-Google-Smtp-Source: AGHT+IFuo3EccWt2eqaswL/GXTzhTAtiWo9RPTumIYwjblTx1Ehjy9OmBX7qt65iTSqVmlJ1VnsAJQ==
X-Received: by 2002:a05:6820:6682:b0:619:7ffe:b0af with SMTP id 006d021491bc7-6197ffec3b4mr712572eaf.8.1754005532733;
        Thu, 31 Jul 2025 16:45:32 -0700 (PDT)
Received: from localhost ([136.49.61.16])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-619704e167bsm373502eaf.4.2025.07.31.16.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:45:32 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Add Ethernet node for E850-96 board
Date: Thu, 31 Jul 2025 18:45:32 -0500
Message-Id: <20250731234532.12903-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The E850-96 board has a hard-wired LAN9514 chip which acts as a USB hub
and Ethernet bridge. It's being discovered dynamically when the USB bus
gets enumerated, but the corresponding Ethernet device tree node is
still needed for the bootloader to pass the MAC address through. Add
LAN9514 nodes as described in [1]. 'local-mac-address' property (in the
'ethernet' node) is used for MAC address handover from the bootloader to
Linux.

[1] Documentation/devicetree/bindings/net/microchip,lan95xx.yaml

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
index 7d70a32e75b2..ab076d326a49 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
+++ b/arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
@@ -21,6 +21,7 @@ / {
 	compatible = "winlink,e850-96", "samsung,exynos850";
 
 	aliases {
+		ethernet0 = &ethernet;
 		mmc0 = &mmc_0;
 		serial0 = &serial_0;
 	};
@@ -241,10 +242,24 @@ &usbdrd {
 };
 
 &usbdrd_dwc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	dr_mode = "otg";
 	usb-role-switch;
 	role-switch-default-mode = "host";
 
+	hub@1 {
+		compatible = "usb424,9514";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet: ethernet@1 {
+			compatible = "usb424,ec00";
+			reg = <1>;
+		};
+	};
+
 	port {
 		usb1_drd_sw: endpoint {
 			remote-endpoint = <&usb_dr_connector>;
-- 
2.39.5

