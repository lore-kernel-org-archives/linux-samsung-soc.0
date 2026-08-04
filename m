Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1D331AABF;
	Tue,  4 Aug 2026 06:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823917; cv=none; b=lmhkLQQ87sAUUZhdGrLBqpdGu0Kf7rRZjLNR9IEZTuOI3OYJQzzq7CSkkYmBQGduvkd+vizSy3hIYL/NM5l0Hce2dAFZFoo0eQsnur7Iygn+r8V7fTc/Q+XYjpFDY9fSFYRJEgcgUqAa4U0UFNlxaIqx3/9v481APAnSGmwBZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823917; c=relaxed/simple;
	bh=HalyDjd/NT9SONmHp3RFFPNITjRfqQ5w0bx9uVifBGI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SKswpf4vxttLWb+vRpJdcNVmBq8UYOC7nfQxBeNaJvZO0kQLOxnNzRvfDqwC6yjrsk10KL2ncIEZp9TVLHdB85g0k8LiAXehmh9+GSvGu9TfpKwk5/PlrPADrDkDpuQWbrTzMPMWK+2os1Hfstrw272G0UdIZnEO6yC5/+BMpuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZpCSM3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZpCSM3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E004B1F000E9;
	Tue,  4 Aug 2026 06:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785823915;
	bh=PXSmEYs9TbtvGp/eM4EavpIH6gjJRcZp18E17KYaQ20=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=LZpCSM3RqZLgkfCU3TWvegvh/R7x1h7urJze+XOzns0XKzuNRnZNE+9ODkc50qZxD
	 FluRk1VqBz3CCawC4gviCbpkEyKSV52QaaqJcpJuO9APuHvw95Zog9faPEClMI0Jfz
	 3DdtQ9SCrbUWFEGvi2Vxo4cb5RQ8a5yHY2rWB1aj0iCaq7/cmssnCY5lICzmWRC2Ii
	 TKGw2efti4DhYvxeZ3MGi17W85MT2krtjUwb8JdAcakhByqzrqxmnFL/P/AAZc0sSk
	 9Cl3WtsvTThJzOhH5XC/AId3luPlIWj/aKA9i8aqlLsHSIciRjwsZ2zwE2gSpOb+r6
	 OZrGrJfx90u2Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210353.383880-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: exynos: Correct white-space style
Message-Id: <178582391140.12883.16293784037220851134.b4-ty@b4>
Date: Tue, 04 Aug 2026 08:11:51 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 01 Aug 2026 23:03:54 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.

Applied, thanks!

[1/1] arm64: dts: exynos: Correct white-space style
      https://git.kernel.org/krzk/linux/c/db23b4aab4252f793d9fa97dc5d6f8d99c5e8e4b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

