Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622881;
	b=Gb2pvc7l2x670rrx+u6Emisa+KE+g6cYBi9eysF5QGTC7SLU2QiHFal8GG3f2lAMWVqH
	 AOSpZQfS4l5agy3enxadoepBkgbHia2mt3FJOk8Wl3s/Gcxu45jOYz17tj91evriLnnxm
	 1wLQQoBwqpWTPUO8kP/HJDDSttxlVRilqEZYNtk1G4WBXGu2VhTU/T8nqo67Cxl7z1JD5
	 08qoE9Cmf8pQu0yCintbrSwGcvUUGngfBjE4o82Qj7teDzrEEzmewtEE/Whm3kspw2ZuT
	 L80TsQW0F38T+qv0n1ElS8rdiAVbGUcBK65ETZBz5f+XaEW0n4PxsMVGdlMk7pcvmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622881;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=WVFMIfEzNIlWsd3sYa+l1EvhK3Y584ewRCIo3C9EUzE=;
	b=yhC8MyempJBK/Hp2r5K0CSnySKe0aGnCBzTfWScw2K2i/+DFry7KQsDXm6T/vscEoZOp
	 /heeMW/k6qNOQdEIcgCJ7lUr6Z0zRaV1zSFL7kxpjsabykvWf3fr2h19YO4ZO5ejasfBv
	 FRyXDPXdfVObKOFS5Ip3080tPW75c0CcPQnhCOU7aTAO5jTN4Fn6Qk4YTn+ZpcKSGCcxC
	 e/04aLrSTc6RaKY8wF+XBmhFJBVVb6NA/1UXm1OIlX1A76/EZPn551c0GjZfrYx2u5H+y
	 uxA8S9rx2FXV9Mx+ejbBU2CrF2qUPUOGr9yjhM1Eaibd2iPzivKGueCxIma/EhjRGiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N48CQp1j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC8F60A263F;
	Mon,  2 Nov 2026 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N48CQp1j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038C31F00A20;
	Mon,  2 Nov 2026 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622881;
	bh=WVFMIfEzNIlWsd3sYa+l1EvhK3Y584ewRCIo3C9EUzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=N48CQp1jW7QQcu+IIS8DJAN+T3gU2NTIZl8yED9zYyezGYk3KyOD+A4pUBvOBYaVu
	 eD3t9pEWMuabo0k9c+SBIHHea0jLx5hYKgsYbqJlS/AV0v8/Se/rHuoYyevb65DjlX
	 ky/Fs7wnBINMXqsIZEP4GscH9I+fQI28m5r/ckIfoR+/Zs/IpLgDxSrZZ7ZojKdKqY
	 8Y8duwgkBetD0ByPJACtuYPM1+tIfq4Lf++wQqhrKBstsrBmy5wSPx1GUK+8a4Z1w0
	 BaUVGs6ARrIk3XzCSpMddC9GB8lVoPPnK0YVcsrDW1Xl34Hz4ZdvOryl4OA1hmofGS
	 LleUOtvh4T1ZQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Henrik Grimler <henrik.grimler@axis.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	waqar.hameed@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/17] ARM: dts: samsung: cleanup Exynos 4210 dts'es
Date: Mon,  2 Nov 2026 13:34:08 +0100
Message-ID: <179362278572.150793.18432951593257094402.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006-exynos-arm-cleanup-v2-0-e8e86a3c8c1f@axis.com>
References: <20261006-exynos-arm-cleanup-v2-0-e8e86a3c8c1f@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230; i=krzk@kernel.org; h=from:subject:message-id; bh=NQ/cJlxAmJQ2enXPswiuU6lJ8pcQQRAdsxVsmIc20tI=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq6INAwVcyepTWxO+teRkUFtzMPvbTieXlrVhrD JKhosHvLQOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauiDQAAKCRDBN2bmhouD 15fID/0WVjOouIBVxzTiExhh9FQ7/xaIy5tNrF17ppkfFxJPKdSUVQPVI8Si1UjdzrxZ9bQL212 KeQwA5WdI/8DtVWlHPvNw5ZwBZH6ORwjZINDUlH3/lg0QwKvwY38JzwH3IYQcwAiD3QAStalZos rWa8RrGpl07N4hjGWmeZPUCiuAG4POAtPSiM5BqmFfkAfZx+xoWuUcYwHIINTyj2CJ/jpTvNsjf 6NvRTxEssWbHkJoPAQODUeOleLx5Zc4P6c6wnubM4aqd2VPF7eQfgN+0LUl7Ec5Sol3/2WbILea fRfomDY07RY1Cex7gsCoULt/fb3Mum/sEdUJO6VDp7qVQGYWoRqOWaMq9W5nlAKPKANpNw1cAEs gnfbVUUUTbEt0T0FhqdCBnEvvbjWPQOPCzlRguwrPDiuUMHNSEHzKGg/BZ6h1VrzdBtXeGAQXCn We8rNnt9gGjab0q1SSxbkNupcjfH9LS4bMxshGXYQV/ddKNmv5HzIS7utuA7rHKmzO4vEj3nTDK Cd3Jd9OtT9TVLYXrn+ePNA1YesmhqXDWKNn6zdjsDHGV6wqlcPXNOJNqG9/GN+VNGi4koRXPIMB NwZq4GwdlbB1VgztJE+WPgyudMqQ/SLgBEgVDKvq0NMw7NZoODy2JpqEkh3URn9lt1AuAnDYfmU rZsbC0oNbC2rT
 AQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Tue, 06 Oct 2026 13:57:14 +0200, Henrik Grimler wrote:
> Fix most of the warnings that are reported by
> scripts/dtc/dt-check-style in strict mode with Krzysztof's recent
> fixes [1]). Waqar Hameed's dtfmt tool (described in [2]) has been used
> for some of the empty lines/whitespace fixes, to decrease the risk for
> human error in the process.
> 
> I have started with just once SOC to keep it small and make it easier
> to review. Sorting of all the nodes, and dealing with all properties
> using "discouraged style", are left for the future.
> 
> [...]

Applied, thanks!

[01/17] ARM: dts: samsung: exynos4: add or remove empty lines
        https://git.kernel.org/krzk/linux/c/86b6a44f1d1e7e3c55db27d67fbf518153a73ec3
[02/17] ARM: dts: samsung: exynos4: order *-names properties
        https://git.kernel.org/krzk/linux/c/463dcf0903b7063dba7bc834885f201cca68004d
[03/17] ARM: dts: samsung: exynos4: sort all properties
        https://git.kernel.org/krzk/linux/c/6845886de31bfe2e84820ba1155950beb1a9d252
[04/17] ARM: dts: samsung: exynos4-cpu-thermal: fix indentation and sort
        https://git.kernel.org/krzk/linux/c/fcfd852913ecdd6226f7445ac06772202f41a646
[05/17] ARM: dts: samsung: exynos4210: sort nodes by address
        https://git.kernel.org/krzk/linux/c/7e34053cc0ad0d9d4e4a7902dceed90e89c9bbba
[06/17] ARM: dts: samsung: exynos4210: add or remove empty lines
        https://git.kernel.org/krzk/linux/c/d539584cb8413ad10f5b05d4c1a688c07c77e47c
[07/17] ARM: dts: samsung: exynos4210: sort all properties
        https://git.kernel.org/krzk/linux/c/0a1fc2efbc4d395c713b6e306fbd5167979704b6
[08/17] ARM: dts: samsung: exynos4210: use operating-points-v2
        https://git.kernel.org/krzk/linux/c/bf469a22159df82df1cf6e8da42748c3c5b4739b
[09/17] ARM: dts: samsung: exynos4210: align all multiline properties
        https://git.kernel.org/krzk/linux/c/6d033e53417d700a2d28f67c2477f68e4e42bd84
[10/17] ARM: dts: samsung: exynos4210-pinctrl: align all continued lines
        https://git.kernel.org/krzk/linux/c/51ab1452794c891ee8cee8df57de9eb78eff946f
[11/17] ARM: dts: samsung: exynos4210-i9100: sort properties
        https://git.kernel.org/krzk/linux/c/54b2e002cb3bbe91ac326f684568484630348a84
[12/17] ARM: dts: samsung: exynos4210-trats: sort properties
        https://git.kernel.org/krzk/linux/c/c78295902a4332489dbdd9090502a720096dd224
[13/17] ARM: dts: samsung: exynos4210-origen: sort properties
        https://git.kernel.org/krzk/linux/c/ffdd5dab8ae4ac37c1dbb76f90d00bfb28c77051
[14/17] ARM: dts: samsung: exynos4210-universal_c210: sort properties
        https://git.kernel.org/krzk/linux/c/4a1729bc5e9f65a17e4f1b069ca368753a6bb537
[15/17] ARM: dts: samsung: exynos4210-smdkv310: sort properties
        https://git.kernel.org/krzk/linux/c/9e093323c506e3010a1ce26b5247ed0e16b558eb
[16/17] ARM: dts: samsung: exynos4210-smdkv310: sort child nodes
        https://git.kernel.org/krzk/linux/c/75a958d3a13fb901fc0955420d1fd6577b5e2852
[17/17] ARM: dts: samsung: exynos4210-universal_c210: fix alignments
        https://git.kernel.org/krzk/linux/c/85e607d08de014162319c8d4890f846e0460b504

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
