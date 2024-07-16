Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730FE1A2C1A;
	Tue, 16 Jul 2024 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158579; cv=none; b=EjZ+vwuCjOC5e0NS60izgVRc4b+PlctDH+3OHo0TumG5jcfaUrDBdP3gxdieRcGOT+FEoFMrPsZvq69G1YreAGa7qNftPNZyfKBLQETvnmmm6L++Un5GE0hqKJhkt9EcVHZcAT/jCgOG/HvZiS2gV+FcGnlxgwiXWLONyOS+fGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158579; c=relaxed/simple;
	bh=N2DvZ5I45eO8ikO9Ku1+P7EbOTZjolEg9CSVgTKrfaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbKiumul2EQBNYnGsrhfWn+vDxuvco895NK8xUFtMSU21aCKZLpsLwKq43+m32YTAaK/ZBsjaD+YNuxR4vTIiZGlzZwenf3s4EydztupBQ+u6a09y86EdKQF0aG7Xbv6K9lYC2JP+Z5fr2/4khyGHHb8gYt3EJ1NaRHJoxHMDJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnDu+Ypk; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnDu+Ypk"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e96d4986bso6191644e87.3;
        Tue, 16 Jul 2024 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721158575; x=1721763375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mogjG3EDlIBNEcm/9zv9N0YSBYqFWdSHi6LjzhdXzg=;
        b=CnDu+YpkQRDhKZWkNFCywGzVQRWy5GmmYTEUWrTlXcDATvPAjKxi7ls+D9eUd3pfXk
         6cyRmRrYfw9ECXLvrCERwX5G3fz1gaaHOKhFCF8AQ7P7/wGtEBHbYzXuyXeL3PL0IwSy
         Eq/O3pHkl4kRFXnj2j/3+LXfSgH4n4bXFLyU1Qe60yb5xgBdcroUs1z3lUF1i7odukrj
         PK3o47iFfQuIU0qCzeibFjWbPPEIa5sbpAvmNen1hDg4t4k0ac1KG/QjiCJ13P0b9XvP
         AzW8/nNtABkHF/u0zDvTn2ev8OHbFa9DmhTRB5EyPy4PtcFaMsBPyFBAQGaDvlHhPUAY
         LT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158576; x=1721763376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mogjG3EDlIBNEcm/9zv9N0YSBYqFWdSHi6LjzhdXzg=;
        b=ZsJEPopehcu3Any5FvMAiJcL0Ky+Y5t2GN8GBcLjufjlfSlgawPBI4z1jPO690ziQe
         7rXvKp8wYxgNgkTQsN2ddgvKkRPOXvoHoNWSTgGt9ozWcWFdxkVvmv3l8nfb/VTE/IJy
         49HQpqj9dJXsRk1fxqQEYqy/3kJ8ILEVTkCCSwkjWJkYta2kvStpuFzWQbycnsenkCCt
         2cCfgazCCTK9YMeDEdsUcak9UGkRyGWeUpcdrChdRgmg38vkqPsSC/Jc0opw1S/Q9ZlP
         7Xy+QYag5NUzvuj0xwSkIOjC2o2+Zi5IJMRVpz5Ac/csjo+/qbE1YNKOYhRf0/DJrVyA
         Izuw==
X-Forwarded-Encrypted: i=1; AJvYcCVw+OuVNAEgjbzB9YIWVstHuff1gQCPDvgBKwDOodAxAYmTmn7dE3uyOVrGgtQ34TxbEAF3XDD+qHJsCaYgzn2P7RO3Qzbl27/H4QwrZgIuL3If5rbDXbm1pMNbS7GIjXl1pSSCQCYibtSxtx62J9bZsfUwDytEJxVgzmOhEKqOuS67TNXPg2S335rHVQ==
X-Gm-Message-State: AOJu0Yyu8BXXweI34imgGEG9RCMpjdy8HMeOT7hYtj0zU+uyjD2wtT93
	ZgP+oC9W1btVAk3e2IFeQ3YTYgJ53eVXhF8ZelhFdSljfHEW8m0S19tIh5pG
X-Google-Smtp-Source: AGHT+IE8xCW2u8yY29+39YQ/+7HEcMfohUoAmAIdXLjpSez37FgmkSxJIomGZotSCDC/mJtUQBdcTg==
X-Received: by 2002:a05:6512:1087:b0:52c:de3a:839f with SMTP id 2adb3069b0e04-52edef1ea83mr2326681e87.20.1721158575394;
        Tue, 16 Jul 2024 12:36:15 -0700 (PDT)
Received: from tablet.my.domain (ip-37-248-155-75.multi.internet.cyfrowypolsat.pl. [37.248.155.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff888sm351179866b.159.2024.07.16.12.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:36:15 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 16 Jul 2024 21:36:07 +0200
Subject: [PATCH 3/6] ARM: dts: samsung: exynos4212-tab3: Fix headset mic,
 add jack detection
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240716-midas-audio-tab3-v1-3-a53ea075af5a@gmail.com>
References: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
In-Reply-To: <20240716-midas-audio-tab3-v1-0-a53ea075af5a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=N2DvZ5I45eO8ikO9Ku1+P7EbOTZjolEg9CSVgTKrfaI=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBmlsumFhqU/Rad67zcuS2/E4tySG9Nc6jH1HZho
 TiaX3UhT2iJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCZpbLpgAKCRCzu/ihE6BR
 aAiwD/9NxMwgwl7QhfwCEwL3RxHqE/Ql9zh0qfbGxDYHk4VQ0mqVZlcDRp76PD1jg8aQddn05v+
 IPaAA5yushqeYMFhU0EboOG9u4ghKL5s+5THNgeJ6UhtRtaY7dMgKGjisB18yHsDtjhxAkfMN0A
 jIMfkU7QobtEtXM95QN1GUuqNa3Ix4bA+AJXoG2vpvAyN0X+vvryw7+QaZGBrkwpgBN5GIV6IhA
 B174/I3ygSWIVurBXtiSJZzgx+yXtalFVR2/yBuTJQGZVoQ4QYsFY1VRb2V3ZClqU+wZMuBq+dX
 bmRiZDoyYZMqQxyThLKy9KU8/mcodItJV1H0j6sywyhTmrwz3jHUFpD08sgJloLQnGK9XhkaCT1
 zjQjM623D+0UAEQLUGbRRQ8kq9+uq/XMrjlIrFObS1VmTc5KSsc420Yty1LpiyY0H6Je7bLOWo5
 9In6LU+ggp6Qdfy53CCyiUwRQT6y/blS64wis3pZEMii0Q0VI8+An5PVxQtoizqeFLHGpJq/gK3
 W2SLuxVxqUp1l4bttgLRFydQ0iPUw+Ip1FGNjPIXYnUo9/A+CZflVbzHHtCP4bh8//MiQfC2C5w
 4tVwckl2ejNz7Spd94Mowlj6TAe0T4tT5WABlhxP4lZUtxwDk3Baw5mNZfeTNArO8d1hH+prrh3
 FRovuEDYHuQXmuQ==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

Set up headset mic bias regulator and add the necessary properties to
the samsung,midas-audio node to allow for headset jack detection.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
index 9bc05961577d..45003967406a 100644
--- a/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
@@ -300,11 +300,30 @@ submic_bias_reg: voltage-regulator-5 {
 		regulator-max-microvolt = <2800000>;
 	};
 
+	earmic_bias_reg: voltage-regulator-6 {
+		compatible = "regulator-fixed";
+		regulator-name = "EAR_MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound: sound {
 		compatible = "samsung,midas-audio";
 		model = "TAB3";
 		mic-bias-supply = <&mic_bias_reg>;
 		submic-bias-supply = <&submic_bias_reg>;
+		headset-mic-bias-supply = <&earmic_bias_reg>;
+
+		lineout-sel-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
+
+		headset-detect-gpios = <&gpx0 4 GPIO_ACTIVE_LOW>;
+		headset-key-gpios = <&gpx3 6 GPIO_ACTIVE_LOW>;
+		samsung,headset-4pole-threshold-microvolt = <710 2000>;
+		samsung,headset-button-threshold-microvolt = <0 130 260>;
+		io-channel-names = "headset-detect";
+		io-channels = <&adc 0>;
 
 		audio-routing = "HP", "HPOUT1L",
 				"HP", "HPOUT1R",
@@ -351,6 +370,11 @@ wlan_pwrseq: sdhci3-pwrseq {
 	};
 };
 
+&adc {
+	vdd-supply = <&ldo3_reg>;
+	status = "okay";
+};
+
 &bus_acp {
 	devfreq = <&bus_dmc>;
 	status = "okay";

-- 
2.45.2

