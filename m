Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDC13CA93;
	Sun,  4 Aug 2024 21:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722808573; cv=none; b=Qm0ZyYIMW6sK7PwndQalIn6rr9P82qlCfu+RdxQvqXZIMaEjvFvxo9LG1K6XU8RadAF6Daqfdk1r4jBRlosstFMVygqTyDw9z9ZAjo+nF4xN2qn6KQXzf0Wmqw4Sa9xcLh2dkjFA+KUj4VA/XHACbPpasgBvGEFWJQ8En9ELJJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722808573; c=relaxed/simple;
	bh=TP7X/omtcHtBfHRPIrG0hq0mQdX8zrTcBzIFqmw3S6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMlUxopbjbk3p0aWyzJ11ryYKkF11Yhp5keCV7RbueMEOKoJUgDrBC4BrVvGXfRhqx6KPD53TZhMaYSZsRwf4l2fqGu7xQ02Dww93N2fvjahXCqMUBg3ZvEYfQ0sw/XQgVs9+LH0UltPjHNgzcDIoQ+aTptR6YQM0nZuy/2hf6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chCriVGo; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chCriVGo"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5ab2baf13d9so13522420a12.2;
        Sun, 04 Aug 2024 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722808570; x=1723413370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+/p7MgZYWM5kh+9ECMA6cWE3o9ZU9hqg6eDjlHC2ns=;
        b=chCriVGoctm521fo51edOl3ETgiVR5TgJhbkFHdxhdJgnYfcTpmkyzkXy76DfzqQf+
         KnAi9OTkeWQr3u1Y7E41GVFQBCw8OKrE8v0dVU263QgUrntCwUnF5vnpQipy+gmhV4Jm
         nktPlQ5UvQxLSAdBQiK4rd5eBmJcwpTpza29fNApl2kveMbTzL52m19U0I5WGlQQBHeX
         pMkWQZ0ZiFz2hLecDsDUZld81/BXHlIc7SNOnwAScnXmQ4O/4oZk0tNsMl6+VCAysgky
         YFwUeAbxS5IhUjeySxKi0bw6EH9g5dZlY2cLmz8SaiiskGguO2I1bppxL700xXwpiakm
         btNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722808570; x=1723413370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+/p7MgZYWM5kh+9ECMA6cWE3o9ZU9hqg6eDjlHC2ns=;
        b=uLhRJeIA7tDVyT6Tq3Mj1qPiqGiVGM44A5ZKMzeb2yep7qauJHrO6Tu4lQdsN1OsZH
         Gk3IpTcT3XMJ8xKauAxiLHycIWh5IsZhtHTYqnur5cb7eSk1XRbfY3C1mA+a0cwlP0wn
         +SzAJ7PRTfWjQXW0lTwxzQGjy9kOrVeav8pPlE0oQffaph3iZnRdKWlN9vDMS5hLi5MO
         ahnFl2uFNz6cTcFldqimqj9pR7Vok6zGZi/FwAQQQHt8u6mx1ihr6VKN5gYlEbZBD0md
         tzHH9MQWSbiduAR8EV3TwxHKDELvKDOA7NC1qG5f7WNmEpk9LRbSxldMhmRwYr/jFLbJ
         dqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2gfO43xkeQLeM+lRoV2RLk8+brwkn//BneP8jWvKnB9FuJeTy8j5MyW/sG3EGCvrhzVMY39A8NW4Uyiao6gheprPg7v/j17GVeIb/c0YGh6NZceiW+mlBa4PBtrQTcIAszTZsNoP0/T1AMAAUOnwj3TlmsNgilMUi48CZnzuA27sWYbjORuVRfeu8jk74myx4RoFcoPr8ft7YiHLiC9sRgj2RpMGRrtXg3zfs/bIGBQgYxXciiXvrnpnWwhQ+IrIM
X-Gm-Message-State: AOJu0YyKMOPYFqN1DmD0woDfmPCJqqVF+4cAoYuXUYF+eqZwe4mUop2v
	izZvkN3NIK5LlJfVRd8MoewOiP0XMcflZqSumWa+G0AT1DEg+ZKE
X-Google-Smtp-Source: AGHT+IH8zoNedZrAXYOj7WYBa3ZkPcxPBBxBMYkykvUuk74jILXSIRAvBgxRPdz930MQzYMKOYCdgA==
X-Received: by 2002:a17:907:3f13:b0:a77:cc6f:e791 with SMTP id a640c23a62f3a-a7dc4ff1addmr811525166b.38.1722808570071;
        Sun, 04 Aug 2024 14:56:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:3711:c80:e7a7:e025:f1a5:ef78])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9d45452sm370485066b.111.2024.08.04.14.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 14:56:09 -0700 (PDT)
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
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
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
Subject: [PATCH 13/13] arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support
Date: Sun,  4 Aug 2024 23:53:58 +0200
Message-ID: <20240804215458.404085-14-virag.david003@gmail.com>
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

The Samsung Galaxy A8 (2018) has an USB-C port capable of USB 2.0
speeds, used both as host and device, and is used for charging the
phone.

The physical port is directly connected to an S2MU004 IC, but until we
have support for it, we can still use the USB device funtionality.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
index 47a389d9ff7d..c1902d2f57cf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts
@@ -59,6 +59,12 @@ power-key {
 			wakeup-source;
 		};
 	};
+
+	/* TODO: Remove this once PMIC is implemented  */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
 };
 
 &mmc_0 {
@@ -111,3 +117,17 @@ key_power: key-power-pins {
 &serial_2 {
 	status = "okay";
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_dwc3 {
+	dr_mode = "peripheral"; /* Force to peripheral until we have Type-C working */
+};
+
+&usbdrd_phy {
+	status = "okay";
+};
-- 
2.46.0

