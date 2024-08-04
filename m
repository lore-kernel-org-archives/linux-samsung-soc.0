Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C9314A086;
	Sun,  4 Aug 2024 21:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808568; cv=none; b=E1HCPOE85Sqqq6tkRh+dn0Em+190jvRSeGiVB3yrcT4JZLHS+8MxREpdLgA4IQLXztSQJ2nnGCxjBzi7e+fUhP3nStDDhAvn/+1QLV2qPxuvTSqak7slMp2g2AuZ4jl5iiVw1dZWb+Pzqfv6zWfw9Zfzkh8LJJtWuBnLjMJRh/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808568; c=relaxed/simple;
	bh=8LA7AE9BvR15H1wTFdj1GOLr9RaQ00IiUNjBvvIk4oA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucxHFP+Qr3+xd9CmNr0shjV90rS7qfDNF8RFYvm1b5FinL+17hJQidKyR8KqBmSWmlPomdeg51Y8K8wBrVf4za5MKWbOB2L10TCOavJAvj7t/7atUOpWDbG4XDS1dAnXbKDUrCgPYpjiMrynFd9mkYXGiNuqy165E2qQc9DIRDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zmjv3utt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zmjv3utt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5af326eddb2so8070468a12.1;
        Sun, 04 Aug 2024 14:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808565; x=1723413365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nXQrtmAREhYSbuVOCkvwjMA8tJJtTb76+fEkB0V/M0=;
        b=Zmjv3uttDKZbs8ZNytmL0rrKA3XPiiM21pMXAVA3CPXeUe7+i2IVEE5aBRZ6fM+Rbi
         CNSLuzvVZwuntMukkGrvjzEKnw/OqpQyNVEshOAissL1KVsmDOZBfYB4U5G4IX8qs3VT
         T2bN5EhkCpVHmwsDev29Tgxs7WiaEGTxL/z7gdqi2rgiz7Ac0eDj19n24ceJ4M4x1YM1
         VSE7e6/Pv7LtZHYzloMSfWcqB3qIyFjmqfmE2xdQyAmisvMO/C0frJoRpbUI2bkbTxvv
         c7LKSWtidB5+8uyMwkb9BQy2NUk5GOlD5KSd64j4FlC+zi2Syk0rLLRRsROMYgdlqJO2
         3ftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808565; x=1723413365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nXQrtmAREhYSbuVOCkvwjMA8tJJtTb76+fEkB0V/M0=;
        b=H+AiQft4ZFOSU2HiCTJxxFHa3d3z/nqGB9/qexcWKzox5Ha67At/oUdAUTYPx94cS/
         d+Fi7wzmGzPdLOiq4rvzF/lMdCSvM8peCx5YKtQt2VZ5zJadokhf0LiIMCr4xVM37Bk4
         RhfLLvJUlEAz7hxRrkrbV+6CrsPU7fA2nf87DhxhCB9vMN/dffZaRBCAnnbSJlq1UUVV
         gQUs8TweCl5anf24Y/kP2xvtjJ637jQ6QXBXrJUaVqq2tJeIC12CIDqmVV56yWD+1Fn2
         DdIUQxI5YBWSE/ygY4eADcYjI6YeoUM7szbjuREpMv6HoUZZhG9bibWG00PiKxVoL3Ko
         s2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWR+JZUcRDhimgUOqMy6JrGytNVHqpsXvi5AI7hnRhB7uizceS8cae2Opl3rkRddkoo9kl83c8EX3edZT7aw714NGD+3hLbZlP47EwBQNndcAKRLSwNutRbvnp2fEpErxpATI8NcZEZXwTTReXBsEu6A1w3PB2lOkStrXYmZEFl0m2Tv8NhzHNr8HrPh0GLXkUMySPGkC5KtuPc3hvIS4uvVoQjsqrNHAu/vE1AfOjl8ceekLC+bhYiaJvWh1cUzUac
X-Gm-Message-State: AOJu0Ywt6SDv1pF/U3BdJ3dwZdvoDclXo0n0yb8TH+hCXvR4ibUzWO5r
	4H4AMy9pm7DewfCnKMJvr4Dp3sx/Gq4My0wngM8zm7kCUywQlrwy
X-Google-Smtp-Source: AGHT+IFLMViVMBNiStXLwb5mhAcR5sCxw4ogfYSqyoao7B0+bdKb5RDnNdmEhxeKRJdypvs3epTq+Q==
X-Received: by 2002:a17:907:5c7:b0:a72:7b17:5d68 with SMTP id a640c23a62f3a-a7dc5f6b5a0mr763569566b.3.1722808564860;
        Sun, 04 Aug 2024 14:56:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:56:04 -0700 (PDT)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	David Virag <virag.david003@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 12/13] arm64: dts: exynos: Enable USB in Exynos7885
Date: Sun,  4 Aug 2024 23:53:57 +0200
Message-ID: <20240804215458.404085-13-virag.david003@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240804215458.404085-1-virag.david003@gmail.com>
References: <20240804215458.404085-1-virag.david003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 008228fb319a..1352c64d132e 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -463,6 +463,41 @@ i2c_7: i2c@11cd0000 {
 			clock-names = "i2c";
 			status = "disabled";
 		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+				/*
+				 * SoC in theory supports SS but no device has it.
+				 * Actual capabilities unknown.
+				 */
+				maximum-speed = "high-speed";
+			};
+		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos7885-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.46.0

