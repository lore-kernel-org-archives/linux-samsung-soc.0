Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189208;
	b=wk/lzOnZM+dNVfrKbh/IWB1mwYJAyvZncZpZ/cFR3vVVB8VN/6C0Ya9lOmV87FzeM+7g
	 BXy5QylrbC1tqenLqbXqmQAwHJgPQQWMm2b0EdVmNlFsaUwWV14dWdIDa8dKxOYZt5koW
	 RiuuzDlyq8wv90ELLUQhnC/6B2XTVJuWC5s+rlstaNYw85NVKRYPP2e7FfD0eYh3J03xf
	 lea537b9otxR3P/V7FpK7S5EZB5IDPVUdclaOXYkfGUeiWbHfWsYukp87hY8RMhy0yVin
	 VR3KMOS++7mIsS8JwMa3NuxId0ElByCUpUxGqvxEUCICCSeEFG4+vmLPN+m1CJN85pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189208;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YQSzvWS6zTIzZooEFJ+S8ptQRwzh8qMt46ZAoG1Bp1Y=;
	b=EnuKWCfmzX6jO+s8br+mFNdFoBoJGWA86nrNRuXWY1ymxo5kVXoCmrMtmWaNOGFX0Pxm
	 N8VSr/Lal5aU2gjTu2/pzm5rpXR0QF5/WysCIj+tHn5nT8RkfdJArYIItcJG3UW5DB4Hg
	 edJXQH7y5CT9zg/+NSHtxBiSD4mfq6vbcYz6UwFBmtPTKrzkL60C2X/Q2JKJrJiksuhQM
	 K9n0pDlPBGHWzfXfVgZw9jgN3crxVYEgdbZUqcDuPlN4mXc8m4lMSSaoszBDHVAsi3gLV
	 FTlfUQEC7kAdT49Y9rZbXS4VMmmkG/RHLtWet/maCYMV4Fll4gP/UXmZLnDT7bauNfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFVe0dVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03D8606A320;
	Fri, 20 Nov 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QFVe0dVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844551F000CA;
	Fri, 20 Nov 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189208;
	bh=YQSzvWS6zTIzZooEFJ+S8ptQRwzh8qMt46ZAoG1Bp1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QFVe0dVvt28ckDj3/OIL7wv4gs/JUQa26NW8VweXiO/SpTUAQQWaLRY5L6OvvwglY
	 6MuTGBeOztmo/7lRW0inDtz4DS9fALbhKq9RNjRQwvMrC8F7zTA4Z1oSMhMjs3EnXo
	 ImQx5A596R8IdhwmZI1rlBbqUqtq5AIW5jEphDKhA8OLOY8p32yUCwPL1znHB7oGl9
	 8JOT8nTguNx457UgpDqz9VeJe/D5rVebMEZatthQA8sSrjOmGtrbyyBPo8VLo03liv
	 vEio5EfGkCGadpl/THgS4NAH7hmFr/ObTHDHpzJVi72m2vA6KL5H2N6ywjD1/3+PXg
	 8V8vgB9Dmy6jQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
In-Reply-To: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
References: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
Subject: Re: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add
 pd-disable and typec-power-opmode"
Message-Id: <179518919681.24590.11128258727258522327.b4-ty@b4>
Date: Fri, 20 Nov 2026 16:39:56 +0100
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=398; i=krzk@kernel.org;
 h=from:subject:message-id; bh=D3iMpGd3fm5tODFg2yXaCae/ehKfns6CoB1TUYmGPtg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAGnQaiLKqmL20GqvAU/RpZWsec9j616hpASOH
 1EQFiJvyuWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBp0AAKCRDBN2bmhouD
 13XED/9uUAyms9A/DvwZLGqEukpX34vbGC7oEtKYV/+/YuSrqywvM8Vo6Sb1xaMNer+3O+/pv65
 MsO0xuJzSb9tma4WI50YInMkaAfrrsMLF3mJhD0Aw8wGvCZeaiMnIK6B1Qt3gGPHUhI5u/YzIGs
 joSn7qCisruHsr8GoykWpmygPj6dRINyWeiP22TwKDphcpxSypjsgGbCrS5PWIoh1MQYYPVMyx+
 08owfJm+ca9JPW/b2yRlBmWwcqmXyFrYIu14v9rVKqdpfSPmjmIQDVBLas11NtzrHlNbcFoZX21
 yrwOwNcSo+pQWB/cJ4WDTafoWr7oXG4DmDm4L7d6YZOrqnAzBoGoU19nBhRWMZTolSMoiJ2CFyI
 esdKvYSmCZ0drx0/he+rfdd749iOIYTsF568ss68e1ryNUTy1z9lmyW6SZMlWTPgj7toEGRznP6
 SLDQC0jbXg0GCGPH/coy1pS/us8W4xZRxBKPaW6dmYCeij2rRCPKSnfe9GSXmdOIem7J3q/UCD5
 wyOqJf+FiN/EpRh2EpKU6CvMoVVvv2nBWekE94oNEA5Jwdx2lUm5awpTbwZzH2oCj188D/C46W0
 yF0qT777FryqCg567PSVZgMFU8MBXU+Yie/FD6+curtOuJwxDl8/7kJCfvXOQRhAlJ/GDFiqPfq
 6vseTVE59bbnZFg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B


On Thu, 05 Nov 2026 16:44:29 +0000, André Draszik wrote:
> Revert "arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode"

Applied, thanks!

[1/1] Revert "arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode"
      https://git.kernel.org/krzk/linux/c/49298fd7c685adf0d33aaeb92cab7c95400d2570

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

