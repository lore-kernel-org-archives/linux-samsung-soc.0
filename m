Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425827;
	b=sgSN+UqBbjLy9tmtbsRwj3eWctULUSJeDrv4/4aSfMcLf4om0kdBqW8F/ttMm6e4SW14
	 22mU6G508eKeJvYhZXgclV7RbsLh0ExGVnC1KQ1QHy1pA4796lAq6FA6W5nAwxeX3Vi2f
	 3u4yYZg3A3iJ16bGV8qKJaNFx3fXY45SNV+JkdmQMqbAON75shFXp1wbsDGTI9Yf2s9uZ
	 9Fhe3MxZdPylvqgPJgRhcxJT20e5GQqhU3GrOowFKHzbZrfCKfs6PALM5adnf6oNQeFYy
	 A3SjTRfi5S3A0AD/bwu9Nps5UzSkVVz0Z22fuySEe5Y2BT5kFQRi0LA9eDiytyBMiZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
	b=sUffPclQtrHbyIvnAhC6AuHKxu5rbYSgutGxDWoQvQMIZhd/QWV+f9OzDVjOyc78tLbu
	 0BgrUsFYVO92A8lq6Btfbq7jSsqgPzJ4mIfwWhSn1RCpkcjPlE2fMZm6CVE3lyWk/eVeF
	 67wt9472tno/0A/RvaNfsgjysskWy1PNTADSLk+/CFD6FyXAs1KCjqThtu1ixgx34pbQu
	 RIBM9YFV3JbZSskz97zgzzVDyouCpVctCDzVUzHxwhveA1KR0OEs4/oRH3kCeGZjL466c
	 Q/GFLWDzG5WUMvi17zBPQ2jrtqWkDjg0+JNi/qi1Aj5i96McuS9NjlG46RqPZ7jdDPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C234606A32E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 09:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C234606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so22566615e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425825; x=1796030625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=vT3U33Gm26/ZBgMRRlulxFYfcmGhlmydeqlDpIYjryTLrt+9HHB5QzPpvbD1JGiCKA
         G3t7XUa+ZBfUsfjF+OGv7+OZSpuia+iqVVIEpK4rk44oA2JeubiWqm7/XlnkGzH9qF7K
         Ib/6d95d/k2swjHCQnuJ0Ss1R9Wl2uGAqJ0mn2A3mVlWrT1XNk4EUDcRKEpbjPomOpCk
         03fZ/EdBRbTduuTsgO0g3lk47+jPVtLcFj8g1fv86fKaHHmOw5D7lvWrypXoyxbVTW+u
         3ZgSB0n7cmcclWhWJ+hR8Pc6IQFzJdhRw3czAOogo8CtbKEoJVoa0yzjbVZbgd0MYB0X
         0q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425825; x=1796030625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=IA16uOxgj4CdwfQ1Un8+9NU7QQQqAYgTLjmpXdkB13G9CLx22wBktysJnbZ2NK8esH
         3MNJrtuRCVjqXcWYra9ve7BtnMNE0cw66IJjDM3B+Jp0eZycOEdlcwr88TP0SyDxc0NQ
         c9re1uGCtbvv3uk4vIWJssSRNY6NIEdrxS0mDPFsllq2jfCbIwh4jLhpivcCzIa4csuv
         YRiP/C5f53XTO2DnkBsZoWfPHLzFK+fkSO9JmwAU+ziRMerPCP61dvwU8NlN8uCB/w2o
         Q00tq3P5gtinvGxwhKBaTFi/aw1CropdmOlzAbZ80sqZCFt3xQsqw8HnUyV/52F93xw2
         g+jQ==
X-Forwarded-Encrypted: i=1; AL+hErE4ZA+fW3uMruHxexopgfcLgVjGOBCJWmIAC6zkzYM5pNoHCvsOem+finG9hGxF1j8kwOUxTfZ+w93cTGDA6k/fgQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y8j9rQcjIuT3OKn3NoJIom4K6k0i5WI0R2koicPxAaDB+kq0F
	HmGr3AAgHq6T9ydIkbG4eUpTKihL8M/ifVzDwigaZYBnF/eLvO81S4WD
X-Gm-Gg: AZFdTZcFrMAmPoVRa9bAgV+joC2zWEUhG6z+HolRg9Czt9IdGjv46ylRgQlHANAg26S
	wtj4mJXp0gPxDDFMKrmj8j6qs49kU6QiGmNVcdZcEDrPD+3XMt/hdEWJWJ+kBgRGoFAxiinkmfh
	5cimRaur8MWbY2+Gu2klT9vMikIwYxYhGl9sAaZ/KI5+9q0nrvIpD2VZvSqZPXx1KdVzmsVLzPI
	/HdOM+hvQFVoZa5sJZPSDUy7e+IN25kjNIwBUOrvqrKFAQV5wCtsfHJeqqmdUL23jczNkE6ljAr
	Q8lLrxDh1nOzAp916h8tGbgtq5+ORzHv4EK9qNyceN1SDOIF+JgqUT3ig+jf41/BjQOX0bJSKNv
	7dmWB26PQMFWSrP1+aLrIl3QOxWFhgZ9v3mxAZ58JwqkB2iOSRaZ75eEawr9MufvdOJMCavopWy
	sO/7Bhc+7SSNbdmTtL52wjV2+13H5rVZ9jE2U0oTRekEsjSbLYmBaBuRYAYeO2CV+dZtFlWE2Ec
	3Yy79+UzvJiM/UDmOfjlPJpM+uNtDoj1EMrf3dwTpN2P/aMN6wZS1TxHZSqk+NqUoedtv1XHjX/
	GJYYuV6pwfQAxEBwU+bwa3b3KqwSBlmcLydpo76GgC7KeBHVXLgSLt6M4JNvVY8OkO6iH6moB6F
	uj0UIS2/JZzvTk2/1hu+ugZWnOdDb3TNJnqk=
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr276942035e9.15.1795425825278;
        Mon, 23 Nov 2026 01:23:45 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:44 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v2 0/5] Add USB support to Exynos7885
Date: Mon, 23 Nov 2026 10:22:37 +0100
Message-ID: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This set of patches adds support for USB on the Exynos7885 SoC.
 
The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

This is a v2 of a previous set [1], which was split into a clk patchset
I did submit back in 2024 and eventually it got applied, and this set,
which I never ended up submitting until now.

This version fixes some things noted by Krzysztof Kozlowski, and also
contains a change made by Umer Uddin, as he recently tried to resubmit
my old patches from github [2], fixing some things up, but missing the
previous remarks.

[1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 90 insertions(+)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1

