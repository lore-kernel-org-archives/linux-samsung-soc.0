Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795117763;
	b=oHSg1QMDso3fpmMmgHqq2Weyc68+mYlg3O8TQP6cFd+1SYPuDEw0Qn7iw9Tpay3EIeHm
	 fxjgNwc+YJcZgKy9OAu/Bf3LHp14HyucbEdpftMlskgkImW74Ii2k/EGo3GP/rBY7gb1h
	 ZSNLd5SD+MJBMyk9wNgzPaKxztgKFwRF9SqO/qP26jPeqMrMql0FQqGLxhkNfqsrfUJ9S
	 /8QO1EthFrYcxP+HVsBjFnxDOKmIeHHv5FwrhsYLSwW0/2YT/YB+rkR/sjOQ/TtDqSOfW
	 I3peL9b5W96wj0zaj1tzOPHt0XbKuVSp2Iav+sRpksAsxg7wK09X+R1GaOvhSJwSH7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117763;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HIj3JFwDNWtHJg2RgayCFkAiLzjNl+HWCEg2ZyUVwPU=;
	b=wYUvmdcdIKAWXmigJbcDMHOOnevFXsIo61bgc5MEz9m9WSdbicD3Vo4gADurK5vdFhhf
	 4e0sWfyGPX26ttKclp0r24VJhfvw3sliBsK/ZLt542mpePXxfgyVrHZAv1+Q9gRpGbH59
	 A/M+lvx7DW6szSj5CuSuxCgcuGhjwfuTqpT2pJ3V1OGixo7D8tDwKODUlsJcwzHRokoB/
	 k4reA29BZS4n4D00jhTAHDb0jQbq3LFwFrs6hn9RL5n3CiagMxtrn4j0ExxwPY5uBxV1o
	 waUfbnuI6as5aK0L70bDsCrT03CLEEiLM41SdpSe9HESoRGe8FYdzG9ROGSq9TF8ejQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2xYmbCf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CABE60A2614;
	Thu, 19 Nov 2026 19:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2xYmbCf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795117763;
	b=tFLj40yJUCEgx/QyGH74ro75npx3YbXa2ZElEbErH7Rdx4t6Uc8q1xKQA4BDgIc1O8fe
	 jPYwuNCK8GFVVV57QOTggQsn94Hx14k47YBnHvGg4UK5UKIHOss3cwV4y1s6b/G3yngkc
	 vvZf950XPBdUhbrk4PQA+Zbkbr6vdMpcAZzfgEaiwdWUBczHC96ajMwEKEkNWUK7nEx87
	 0vM+8zD67HNHx2NkE4o9stzA6KIcGbAdAcOQd9ECNAPVA3bSfN2K0iz/jrJ//dbMeSbLb
	 IIDI2B32Ak52UHBP7InDE2AmPzTnBLsE3yHqUwMBIcvmRPF5F/uSMfev6LAcjf38MzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117763;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=HIj3JFwDNWtHJg2RgayCFkAiLzjNl+HWCEg2ZyUVwPU=;
	b=BeG2Vvgj+U4z1pcWQkhaZZpZvf5XEt4dZNJYRy5rQQpTCfRfq9QOftLrq3jKIN9s0cxl
	 7eaqyGjtOZ3cG/eJ2f8yWWtQzTm/a6je+v/CyOMmOABgGff3F6Xszs1+j9VFRf6HBZeyt
	 UbKMLKy2FsUNHUvoUxnbuZcaXuj2gtSEoY0vcxOBsHScRPvO8yOChhQNp7sqwX4oXBfzN
	 xTIaO8Cwu1xMKdiMLFs4KP6NTyNQrQFG7IR7gfuR9sVIejPTpu1VoLZiJXWraPPWZzRom
	 4zXLM87Wzi2ojqRJZLZdvAWMtQgUxgxNnM7y6CALAX8wj7LkOXUG/bvdHf+AOouTyEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF8D01F000CA;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117763;
	bh=HIj3JFwDNWtHJg2RgayCFkAiLzjNl+HWCEg2ZyUVwPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j2xYmbCf/XqXLCZxO9ekPK++qDxnRX6ST3Pz4/GmoV4fLuvqd4yFR2rLA2gNifi6t
	 QNWaEvLbDBSc0qc5HIGyyuWyIxZVutj6DukroOf8cVDd8Uh7mmSAoerKTSwLm8POgT
	 hDOyxAKsiDFYGBPg7Cr0RxhghxNcg53FZ6vRYJhIYBFCO2w5kLLLjDyYV/uY0XtUKX
	 14FToOIHPZSK6qDYu2lVCxErKOmizZsH7/+TkwSntv1XRLUROHfTzswlhSkbWaznC6
	 y2kQSJ8iB8k22lTnwV+sQr+xoFEjozFyOKohYypxiPTPWQanRfh4dUIGvhTOr1036K
	 410KmzogxALPw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A7F14B40C;
	Thu, 19 Nov 2026 19:49:21 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Date: Thu, 19 Nov 2026 19:49:20 +0000
Subject: [PATCH 4/6] arm64: dts: exynos: Enable USB in Exynos7885
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gta3xllte-usb-battery-v1-4-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795117759; l=2109;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=Z90I+ZgSvTHKtQhv8fIplgrzwo46zX8M8n1SBbl4siw=;
 b=3uCw2rXhAwhlB/yoGbbyMLAd57ifkF6WctONIGReP8/YmugqWx5fu4psFBPq3Bx8x5tOarECl
 a+5rCl4oaMmCTLelMQ+e1AUcZ92OorKL2QuSVSdNSETRD7DIDGAUU8f
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Reply-To: umer.uddin@mentallysanemainliners.org

From: David Virag <virag.david003@gmail.com>

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI.

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
[Umer Uddin: Rebased onto krzk for-next branch]
Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..142542245cb1 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,49 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+
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
+			#phy-cells = <1>;
+
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+
+			samsung,pmu-syscon = <&pmu_system_controller>;
+
+			status = "disabled";
+		};
 	};
 };
 

-- 
2.56.1


