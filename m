Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425833;
	b=tTfA4ql7CUqSBhHKmWEVxDzZ1DMCjpGP+FcIqayi/xUuiLjeqVIsjITUlpOHHed8mDMl
	 z6rCIph+YCYAtZtfFqBluduGcUKW0DwlxzERUFBXPHCbWvS0BGDDuuZnxAjnvitkM+bQD
	 9Dykoevi3d1m2msyLVG9vqexT/1JfSxpkEpf4f3wkq4UhcsqwRi/dhyb2ZyIT5PEFVTk3
	 78QXeoldSXMwdLjoA6o2NEIPqYR0SvT9+WF7TNdEI87OB/eVJV0B5vRwyEb/5hBZ7ZtMz
	 S7+TsWeyGQfhh13pG7iFYqhOQ/FddOPh//G47c/PZPR1SKXn96jNZO2pEMod3C0jQag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
	b=Lpwa0IV2RIi/FqcJ71t62hglciSK3t41jXP5VgIpIdg70RylLeirRpZuNdufiTFwz1SY
	 7wpmt71Lya8kQJRntkkW846R83+SL39jd3ydUPKmtilL+hdzO48XCr8N5+X0+g9PSUpRy
	 1RM/n+tzgXvcfAw1Irj1xhtc2P8FrkniO2WmHMwtEs5IctqMQtAL5CUf+eiPZW+99Z+LF
	 f9/F/LLeO3Eb06NUXG1H5cwt7hsJH1hTYmp1G5189Uwz+KVPAInP5Vjfhf59a4xitH0+5
	 2181gqTWhW3Or3j3J8lcoNfDPYEih11eZWP0NiH2ftonZJxolANQE9piMjbOz6A/z/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/LZQ7kX";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1266606A695
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 09:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1266606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/LZQ7kX
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1851650f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 01:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425830; x=1796030630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=e/LZQ7kXPiQooHLAgyHKV7edFi8YVHtSFrT4dN5NfrCLdlmwE27ntYV79oKPxmGTFy
         MMxE7oOFvYDfbzH1HgCCf6MOf05aewMXjiXILlwAJy/t72RfjxUp/0/iIgcEbVcF4ck3
         qGtYlw0wvf/adDw12V9VwGYAsMOESarpH1mrhw3fog8iwXSC0oWgnnJnX03UsIGyoQQu
         UJDWWzIoggI4Tb9VIjlzQCPTA/Bn53pPiX1W3Jq196oH3VwArIMQhMcRBJr1pwUmDyoI
         tAF/2AbW9oT1pKNIkvxlN4hhc5KBWnf/scogxU1GB9Pzvaf92uxDZLSiH/BnaCKbzpQv
         qU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425830; x=1796030630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBEZ1Ox/BmdNOLwypVnEWy5Q296hGUAvyFtNqCvGnJU=;
        b=o0jwwSAsNDovn/6dCiGbmh7EzSsx8ufZ98HihduQYwvfQh8TO6cIP9zIC30YSS8wPS
         QIkQ0HEoN63UC6DpEiHnf1TQ4v4okgbWWUo8EPBT9juUQXtOjWXNgjP2/DNOQJFDWSoG
         rJy7X+bial0LSf1dt736JZUtIiuICBbt/2m3+QXfXr/xOhhfRkx9nJsm1FQus5duJlO5
         Hvg7kKoFZOV1IcXGFUOhraRXDycR3r4RalfQrIVbGTnyVqoZjs3ZByItiHF++jV6/Bbj
         0876s8YUQ9/INucIeuvf+y/1rDlKM/IWbQfpGY6TwEGPbrRcdYLAZ5hAbwFY0CNOQ5dh
         hyaQ==
X-Forwarded-Encrypted: i=1; AL+hErGCEBZpCooWqtbWATYljZ3Si82RvCLqDXBX17Yu7X1wlE2uP805FPJHPq5QjUgCOlxaaFaKxeuiiObe4v2elIniJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/esE5XS0ajoYjxZXx6SXOAdmBz5EBzNIGfRi+KZ7js66rSGSTL
	Aio16LHVkMjWwGaspR3AfoNxh6AEFjFlv9stkC8f/9+V/o5vgzQPRW30
X-Gm-Gg: AZFdTZeDHzjl5x/JcfKpxkt4MnbP4nPrb6hSHQBwoRqnHUDkHnB6YRlmNd94jTmOHPo
	qo9S1rb0Xdx8sVIcprH6FXOVGyOTS6pI7Zy3ENU7GozWMyRYYVH1sCI3Huwy8VBe0tXwhqzgbLx
	M0MOL9/RU6/EsKfnIR8FUZgRYvoiysFIOmgypLu499AkHyw+AcXUbTTjPHmTheSM6qILuD5MDc7
	vnEoZh3yHBlXkg5TQGnqoVBia0mJmZFYDJZltNioWO24dg6DzV7mWkUdjPJeWdNvhPNeWkmRH30
	i/623UADcEEb4EqyV9WUVTb3usWHknGW5brfVx7LfiaBladl5Jhy73d8Oa9nxVmKyJZhGvfw+Dv
	oCpqVo0AUStlreTSExJFVQoLNP73tD8LgMoKwxygnA5agzyUYnlbOfsWyCKWshZzLvRbP8RXJtn
	Cx6cgdwM73Yo9WEfjFHlysAhnmFt6aSMiSZIK1Ompsxq1vtz02X4gYJw19uJlxM8ldqmZGkmDTI
	wc4c2STqPy6YoqEQb7HHOmDwEBNBRuiCdhg1pNwOO9rg04IgHEnovN7Bcho9mPnnpiXEAUEL4H+
	Ow62Ihl7YTtDOd7KhYC/g4uNvxEkJ8oDvHXU/x1qEOdRJoD+Mb1BQ8niiityCpuvrw15tDTWrMu
	nYhMJihNk8idGGEDNp9DnMaBGXE45R1IHVtK9G29VqpZog/Ipop5gumQ=
X-Received: by 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr21423643f8f.12.1795425830233;
        Mon, 23 Nov 2026 01:23:50 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:49 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Mon, 23 Nov 2026 10:22:41 +0100
Message-ID: <20261123092244.1792040-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
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
Changes in v2:
 - Keep dt nodes ordered by unit address.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..8dd8d666b9bf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,42 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
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
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
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
 	};
 };
 
-- 
2.56.1

