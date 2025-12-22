Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB473321B1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766421040; cv=none; b=T28I/tHopPqDWIrlUEhLi8GlkyO1mTKqncNMS8YKonGMFxTfMVEEG2wKxAtxZCbJx2ud0Vy7K7Gbi/g2dQbjAzHcxBymKoTbT+CMMfwFIjiVC3RFx1lh55tOhBKZRfr73W9eFRIMuj8dD8xkUfjCn4GIsLbP82IVgCaDmD4anzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766421040; c=relaxed/simple;
	bh=gIK455PpaZxVuvfXEfRmg3pjfE8OD78NBBkTr9I0h8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A53sca/hsIACqjuq/Qv2+jCcV1ERZZvVNQ+6qXiyI4RdleoLpyQrl/p+aOGv6GGGnT0lJm8Ahr8DJXX8BNum2MdEoq/4+GXZpiE6LgztqEJa8nZwbee6+NToe4cKAmGzXQGOzVcwdVM4Sf6whiH54mIBCj3HpraBkRJjP4Ua3nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzxGsBaq; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzxGsBaq"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so23160595e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Dec 2025 08:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766421037; x=1767025837; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XQM+4zgvXw282DuJseaia2aL/kiD6COjiN6mT8vpSk=;
        b=pzxGsBaqITxWx11xZOF8gGFErKWexFpbKRI/nMbKYQPZfBzTaY9CmbFwk4RlkSipaj
         ds+dA2pxV24R0vx8X1eAD4mOeHRfL5NdisGITp8C3glyg/+zuPdRA2NSG713JL78Clbc
         5vspDGeM2Hx2JY+FbI6SYFhxuIm+Voi0HhhYzzl9PmT+emHmrsmiL6ERAyr0KPEMDpJB
         pzE3nzMzwCsgNuoqxuYNwPLtkvHh5Uloze4rPWGdxnreWfwIYAHGE9IAqd4PpeXignJy
         J0K2VSJJRr20+HYNwbbv4nBEOGd/BkJ/U3hCWkGMc9xKyxzmIlxrAGHxVEhe9qA90qIP
         hmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421037; x=1767025837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3XQM+4zgvXw282DuJseaia2aL/kiD6COjiN6mT8vpSk=;
        b=RVYpGkP0hHh43F/OFHxCGbcxbNaNkss2yHcsxnAUl4ldFudRS4StxlB1PLAAyEltmQ
         bjQIVrg37wlAkw3+Njwrzw+frlAJyZI+ra/fquhTwvXHA3IHL8wcjB9pUG6DFhJhTEoA
         +KJQM404x0AsHxI17qsBRnFAquwSnUVTH1NaYxtuP/oL4ZDHo7WufNPylQ+qvhsZmItp
         xlX9doicFfX4RXtdlBlCk62prjrolwmpc9M6vcw0ulb8FKH8WeavKrgO7XcyhooFb79c
         R820LywG0HWPIWmVcBvXkUxr7xaz5uuZUXdwF1HXpgmVwXipK98YyjS/UsxpDPEdIRBs
         Sq1A==
X-Forwarded-Encrypted: i=1; AJvYcCVJJWZOaNTwXT5jeUUiDRwid7oIicbfXY5tqRDjVaFjrRP1vVOg/5XzPUwAsjWaRHHnFOVCI0AiMBVpw7P3iVAJRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6b9n9Y7W0HE+Tawf9jfQbrJw96cYatzTkA47PEZa0d06PKOEJ
	iYeaIAvan7AjwKgQ/FKwWoPDIy4ck599bBhLwgcVdEBjzG6SGgYugJrEP3dTSNHA94o=
X-Gm-Gg: AY/fxX63/Grkdwzr14TDq8+6eplGl99PQ4MP8nxij71s8/oDpnns1lk+0sNi+8YZ7Wy
	+yaEBCaeWADdof7lrMUiFwiN6MN+LKGJz9lT0FZDq7dLi1pw2xMTlx/NxIsV00n5BdyxvAy7xjM
	GyFCI+Jty3IzRT9S39Agf2JiHGdRpmZsVT3znL949TDw0J502IczsW2IyKpoF1ZKFzlFoHXa25n
	Kp/tVG9yojBNZdIkKQ/FbFoW0AvUGP84jwf6tRKxRlu8VufdwgmsOCgngNDY9K6b2RalV35RXjN
	H4GDrch7Y+hfBNtU7Wnhfu5G369ucwsJ5bXI4Y6gyaK7tNwLwVPhMK5ydJ0oVd5G0CP/6SUlpqL
	E0/Qzqz9wRzHxmFbzugB9URf/sck5z+umNdWELQHw7IDBPXHW8kM2vsCa0Oqc91Y/YFbiAzLR/H
	/SzJYSNg+4lDBZzLLyu/y4QvAQh3BoBaSitoAdz6jz3k4cDHgB3v7tQpr/tx1AXuGnNauJjFi3C
	ZM=
X-Google-Smtp-Source: AGHT+IHvRDRIoHQjA1rZCLMaSDTKsCyWp+0hB7b+F+L1wF0MQiyzngVj5PEvlpySW13JHDQ1ncylpg==
X-Received: by 2002:a05:600c:3b87:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47d1953b7b0mr130487085e9.8.1766421036654;
        Mon, 22 Dec 2025 08:30:36 -0800 (PST)
Received: from ta2.c.googlers.com (62.221.76.34.bc.googleusercontent.com. [34.76.221.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm23071258f8f.37.2025.12.22.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:30:36 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 22 Dec 2025 16:30:09 +0000
Subject: [PATCH v4 5/5] arm64: dts: exynos: gs101: add OTP node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-gs101-chipid-v4-5-aa8e20ce7bb3@linaro.org>
References: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
In-Reply-To: <20251222-gs101-chipid-v4-0-aa8e20ce7bb3@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766421032; l=992;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=gIK455PpaZxVuvfXEfRmg3pjfE8OD78NBBkTr9I0h8k=;
 b=Q9f7t/RCDmUJ75u/2IeLiK62QNaGafJ83CtoJmOgrtY4/ERxZXfJ3qSw/mnSIdVKgntbdJN2k
 VlgZHF4bS6DBaN5xNMz0xRTYlAR8/L3MPQHerwTH77W0JbgdWIwFRme
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the OTP controller node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9b38c2248016aa65293c0abf9ccaf20857d89693..e078344c9e3e558aa5d58845d0fa2849832b857b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -571,6 +571,14 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		efuse@10000000 {
+			compatible = "google,gs101-otp";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
 			reg = <0x10010000 0x10000>;

-- 
2.52.0.322.g1dd061c0dc-goog

