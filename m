Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D591B0F30
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 21:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739827970; cv=none; b=L4DkwW/cf55UCSo14qC71ICS56kg6qVPw1AhWRWyCUTAci5E+gvagIpWPzwuwTSZaQLkhCk8FqMvIqFxWjKKrVRyuXivqwoccZrVingFlopcRtKCjnp7X+AdYAlTyw6qZ0i4QOioEskEJnt+LTMaWhivRKV8O3Xv8bp4UE4rU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739827970; c=relaxed/simple;
	bh=clxVsQKkrnR9wv8DKul25lTsvvLat2HJc7+oSMFkZlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H6iXAmO0JfEWZDQcvEj5t3uUoUE7frynvkuTgE+ACKBi2QDybWgNz6GRNQkiCnwCZDtoQHNp7eiotUX82pbKiRXJABLX3rZX+td6S/u6eOGzgVyuwN/ulfbGZhzwA8YCCBl/Htb1MwKftfXpwF0cevbj9nQe9Y+l+7sF1Uu/F54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=j7/+O/5n; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="j7/+O/5n"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=j7/+O/5nqqeQgi/p0ZhWmPZ7zn5c9yJ9wKwo2TxqoEMCK0dguCmRLK7Xq/jvqF7+YWdVE+pxea//4kc0PXgm8ebfMhxF/heIYofG9ZytZ+6IXkm+sw+4kjehiubzw6eTLcaQYhk0bjotn2AoKJOM1kN91T9mpo9VkokCijCzGfJ6H/cZYEBvCXLW7lw20hfHDlxoof9vfDLtK97ENeE9uhHfpSJpui20jT/c6iT/2Ld24O56TFAG1F3Z9d7sNNL80inBaLHRF+XyHKNGtBPuq6Z2uMovtThbBKA7GqhPPeUCxbE3QYIvA7wAEwRFOPmIjWnTZuI3k27F73XXAcGnVw==; s=purelymail3; d=purelymail.com; v=1; bh=clxVsQKkrnR9wv8DKul25lTsvvLat2HJc7+oSMFkZlk=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 42194286;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 21:32:38 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 22:32:06 +0100
Subject: [PATCH 4/5] arm64: dts: exynos990-c1s: Enable USB
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-dt-changes-febuary-v1-4-99935218cbf4@mentallysanemainliners.org>
References: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-dt-changes-febuary-v1-0-99935218cbf4@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739827951; l=1236;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=clxVsQKkrnR9wv8DKul25lTsvvLat2HJc7+oSMFkZlk=;
 b=uNx9dfyurKSRBPBfpd7A/W/zAnInNW/LtKIaEL9s1jozxXoP3wXPTiR89w7OjX2iqQ2wNgAHD
 7FxQ6mhRpR3Ap6S3sTjUaM5xHNcjOeOMj04hwZlwg4C06M8FidBvUrG
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Enable both the USB PHY as well as the DWC3 controller nodes.

Since we do not have any PMIC for USB implemented yet, use dummy
regulators until we do.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990-c1s.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
index 36a6f1377e92b40716c606cceb752f642ae603e3..9f0ad4f9673a87b4d75f3c7d208c8c37bb51fe2d 100644
--- a/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
+++ b/arch/arm64/boot/dts/exynos/exynos990-c1s.dts
@@ -44,6 +44,12 @@ memory@80000000 {
 		      <0x8 0x80000000 0x1 0x7ec00000>;
 	};
 
+	/* TODO: Remove this once PMIC is implemented */
+	reg_dummy: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "dummy_reg";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -113,3 +119,13 @@ key_volup: key-volup-pins {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
 };
+
+&usbdrd {
+	status = "okay";
+	vdd10-supply = <&reg_dummy>;
+	vdd33-supply = <&reg_dummy>;
+};
+
+&usbdrd_phy {
+	status = "okay";
+};

-- 
2.47.2

