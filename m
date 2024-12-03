Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00B19F113;
	Tue,  3 Dec 2024 21:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260564; cv=none; b=E2nnCjjZjm8hOaVhhyU9xkyXH0ca6yKm7Yeeau4Io7+1IF5Rz4/o3wTaGhnba+tRLNxG0+oIPs8zwNsKrW3fUFfp7Q5NHR8SvdJ+DrhaXIU2NwON5W2ZXTSjkDEgfHxzLPNsdQvclKk1OCcD1kXfb2VBGk4KUy1bEKy6SHmDjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260564; c=relaxed/simple;
	bh=Ndjf1g+BU+5UelJoyYqUccW642JOsDzZXgrOdY312Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPqf9iuvt2fdIVKHViIgiDjqKnznpiL3scHyf6aMmtByAV+lAa6Mol6Yczv0qx19P6+e0ZY0F5vZhMgttx8HoC2lSyvFTanFsE7FY01orFliNqzuzAkUZF+GIV4KAlZvNPUWj0Chf8jg5rrtGj6yTdqVmb/ffJqiBX8Wi5vjQVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=EieSj4Oo; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="EieSj4Oo"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y2tjh2Yl0zGp8j;
	Tue, 03 Dec 2024 21:15:52 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y2tjY0mVvz2x9G;
	Tue,  3 Dec 2024 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733260547;
	bh=Ndjf1g+BU+5UelJoyYqUccW642JOsDzZXgrOdY312Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EieSj4OoT0eXeNH81LYbtt5zuDETVUdrhB+f4TdGvNzCH2nmm3a5InJ/eUAGsq64V
	 9XULMX8CuHGQWW0sVc0hTla6rN6SPvYf++RI33WNhoeK3GVyt5jS8Ic7O8A9Lpx/PS
	 SVl+dDswf2lrAgS7uSmXxzDAkQptZNeXCcpiGWR9s3ZEoY2PaqiU63308+MmbYx+6x
	 vgkXthV6fWiBwZtAjCwuFm71q2PPd3YknsEk8fSXU7RYi9Rg9CZGDW/PXt+9GYbJX6
	 9NmjdwEgQGK4Pn2pyuDMlA8uAAjy/hJMgo7yIOI+KGTq+/WrITm2lZcTilm1t6OtEk
	 qqv9oyiNdm2zg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu compatible
Date: Tue,  3 Dec 2024 22:13:43 +0100
Message-ID: <20241203211344.515431-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
References: <20241203211344.515431-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dt-binding compatible for the exynos990-pmu.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 6cdfe7e059a3..8e6d051d8c97 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -55,6 +55,7 @@ properties:
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
+              - samsung,exynos990-pmu
               - samsung,exynosautov9-pmu
               - samsung,exynosautov920-pmu
               - tesla,fsd-pmu
-- 
2.45.2

