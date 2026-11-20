Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185426;
	b=Fw8+MT5FY5EBA8vXDz0XYajak6lu5c9sEnjPMP8twueieHhW9kfJzVE95JzoxeZuOgL/
	 4ipVuH7M50HMfN3fumCaq879cF4bFSBdpjL6IO7stTQQOs3/7/6+kSKBfosV1JND70rAx
	 1mJhgaAkms658CNCuBtEQGVTgh0PZnnPuHU474jMFpuJ51TcJdViwfJF++0QOJ6MqGTjr
	 NxRv6RVBk7aZB71OBS0dN33K2s4UvMWOfH9EkYzgbPWQU2DxfDagTtfkbdoVKilzRvXh0
	 qZ2UgsAZpRozXPFRTFSKzx1bJWR6N6CbyjiY+wZo72aQku4b3XgC4Y+XUyHGK+U9JeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185426;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=x54vwkGJvh84znXoJKgRSdPvks6XuVGgKq/gJmPTfQE=;
	b=Z9cyhNERa4HApJhk1KFrvFSbT6YE3gels/FiTCmLdaev1ZYIo9e4oSYxyz0uwwJlZSoi
	 erUK1Wi3ChYi3eLhLGTpxsCOho2NMCFZhtnzWtUfkWQoVf7njXwZWd8pT4gwoz+cta+ym
	 S+j4nPHvq03mngTDGkq9CknS9m+DCoo5dUqI9p40MikNwsB7U/ewAyy0eZ7bqKDBtZFgV
	 x2q8QhdJ5r6ssFm1pf8upRz3OAf8jpy2tKhmE0Q8zhb5a5uG/o5A00+hx8czH1MfAmy7P
	 uWd5XZ4gtAYlqTr6XUyVZuW8SQ4JmWQ72Xw8DBbxadm6KS/7h8+DmvfJICQ/GEx1fIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zk5fViLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D21606A320;
	Fri, 20 Nov 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zk5fViLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81A31F000C0;
	Fri, 20 Nov 2026 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185425;
	bh=x54vwkGJvh84znXoJKgRSdPvks6XuVGgKq/gJmPTfQE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zk5fViLSIEPPjIhstwdcljs1mhbKQbngrYvTCsgddI719IHlwxGN7Pq161/T3IClb
	 4AuSD63fjJVLZ3dHl8E4Xraq0eJMJUTk2BhYYF72f6hI9VW7rXShkFqFSfRDyA8f8l
	 GK0GJeKScktiQ8GuTc3uF82I98/w8+OP+J5JZ3u79GUZBPrs+qAsFCuNC3nJJRkVun
	 DH9Kw4Zz2Dh7f3eDQ2EmiDEJpgQQFNnw+4LEIMGHt9PexnDHmAMZJG5czSNEjPFLf/
	 pj3RZNODT7nk5aUjlcrkKRFpW2crlu9yUxP4hpqHeOooTKwBVHKyIg13VDBWbxVN5D
	 iHWMFfgw1MfoQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
In-Reply-To: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
References: <b1477db70b5a068c7ed3276cac906836031214db.1795096443.git.geert+renesas@glider.be>
Subject: Re: [PATCH v4] arm64: dts: exynos: gs101: Drop CPU masks from
 GICv3 PPI interrupts
Message-Id: <179518541714.24590.13840055240522607419.b4-ty@b4>
Date: Fri, 20 Nov 2026 15:36:57 +0100
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=376; i=krzk@kernel.org;
 h=from:subject:message-id; bh=u7FKdVi4iwFQV3UicTf2xfX6Ejre3/Bp3Tj21sO7nvg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAFsKig/ws+ZeUZlxD/tQYesOJHYiRTvZ727g+
 6ryO65dMR+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawBbCgAKCRDBN2bmhouD
 15JND/9LcLiYB00Y5FXKJjesB0i5tqx0mhcB3NhM7QBkwc1/KJZZ0RfHDcOi5a4V62U7/5g0NmU
 DAe+IMo3ZyiPM8Kc0JM5O4gR0yQG5Y/z5GWr+cjH3+v85hZ5QiYXUbu05onKqQUR823d2/kFOi+
 gIF32D7jeaXJU2szZAE7Ai7YIUQorM1jGeqUsiubzAsdilHhhFsYrLT1K1PJXVV5Ira/+WAt3xs
 xrTSOM3CuvzV2DT/gFHDWrmgHxtiJtEzSuBnyoFDBGNw6+kUARFzhSYZ4SOcbTomMMXyN0K3/6J
 BZHddHc5YVFHhO8oePnCnD/wuLp0qys3wGu9tpyna4NTL6S5mSbqJqGj3lj49yFVbSjcuaCxbTd
 2g7yhu5p8jTvvssw1CekJcbQwzCIvNedqalR9XWePONVYq6lSqqgOtvX59sJQAAR6aPvjhqS+Zv
 uurTZaRPnzhiL2rn9FR1mA7ppbh3nM8PHs9RHjrLFY3r6hWFjD7mOz5dPjiFegTVF1s12M11qvr
 FUcv9nimh47lvhYFVJn2f+IvaJClO4e1FH8Jfp0Sy3ZmNkykXIWtMIdfypp+c7PT/2rtzPlKrL3
 p1LXUNeGf9dao8ieUjXjLsaPZZs4/2+UIUqhvkIO3wmpwOds/Wuqychb633idDn4v/C0iPe9ObL
 3b5qa7uVQ/kMV3Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B


On Thu, 19 Nov 2026 14:54:56 +0100, Geert Uytterhoeven wrote:
> arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts

Applied, thanks!

[1/1] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/krzk/linux/c/306301ca9340a6c7ceb14d735abb9cc380933a7a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

