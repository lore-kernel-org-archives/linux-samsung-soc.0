Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60BF4DAF96;
	Wed, 16 Sep 2026 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577822; cv=none; b=XJ/IgPB+m8OMm64PiKPV/Z9lteo6F9Y1QvWSjGSSnSZAwK0otEoeDtCACCNFl6I4QFcXo9dHFWOWHHOo2cefuDLYTMMtXSbB2PWies5Re1o0ww1QKwAG3MoIXh5zJO7Ht+tcoieAsW56MTomjo2hBcxkp7AcLbEKJTygGvcR1S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577822; c=relaxed/simple;
	bh=YlqlMRGnzNGAZC4lPPA3j9bZiU9QS/U3iz/3ecJji9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c0rKK13NQdpgmTEfko4tOCrRjdU4L7Ez5MdPLn4dWmKXCl5PN0/CS8ofmsKyP/nnma/D/8Dg0sToplZiB2MCi3oDjX9kA+jXTJygfXLX8rQx21zKUuExRKerfMfm4TjjbT4bpfnetS/wfNdQKYQkcZJyP4sMGH+OJgjH+X9trAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnx239Or; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnx239Or"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC3A1F00899;
	Wed, 16 Sep 2026 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789577807;
	bh=opghePY1FwxuGa4eTmW6PxG2+LzGY5JdFT48BB1gByg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lnx239Or0VM2t/CQsULRftCM+5HryO5ORO3P5reJLRYCr6p+1izEpOlwsemLRXhfp
	 yBxzWQYacMB6IqUJC+06IpfoqAtdYmNCVWTnLEgw3ciHKoF8TPjmmD8KTnm1P6SVwE
	 fBw3LtMENdeQ20cnNYeeStYFc5bntuGKou7l7C87BBGb4PcYFrFL5Mjh4/ivpxP0sH
	 sE/WjEsTcD16BF5cGndwuBS/jrO/g7tAD88LJUMYMeP9WLg20rGJcPIKO3V4E5I6IS
	 7q5GkmoHLln7Ab1XNOwWIdEy6TbytbOukvHBc5pMHTURSGG0mgcJa7lTluRAngn4E6
	 bxnFR+Ypwajcw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/10] arm64: dts: exynos: Few strict
 dt-style-check cleanups
Message-Id: <178957780169.215106.2751361288260052803.b4-ty@b4>
Date: Wed, 16 Sep 2026 18:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 11 Sep 2026 12:19:08 +0200, Krzysztof Kozlowski wrote:
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
> 
> Best regards,
> Krzysztof

Applied, thanks!

[01/10] arm64: dts: exynos: axis: Re-order nodes to match coding style
        https://git.kernel.org/krzk/linux/c/6c864d06e81e325dccbdb06960cc697f763400df
[02/10] arm64: dts: exynos: axis: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/f145a6ce3746694a58229e828e3186a89dc43eeb
[03/10] arm64: dts: exynos: gs101: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/ae54981c41677b5d3b0479d9d01a663dcb2b0cd2
[04/10] arm64: dts: exynos: gs101: Re-order nodes to match coding style
        https://git.kernel.org/krzk/linux/c/a4479cbc18bc61c6f49a4fd79ccf41ee2481b0e6
[05/10] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
        https://git.kernel.org/krzk/linux/c/7d7b0a58aa23a90a71beba9841c8149456f28fd3
[06/10] arm64: dts: exynos2200-g0s: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/f19b5942fc98932f1016a7e8f0e7d87b83b81ebb
[07/10] arm64: dts: exynos2200: Drop redundant blank lines
        https://git.kernel.org/krzk/linux/c/835875acbfd58fe6330c4755f17f5c02d85c43c3
[10/10] arm64: dts: exynos7870: Re-order properties to match coding style
        https://git.kernel.org/krzk/linux/c/6b68ca6fe0c855971b6dfefcbb287cc530f4774d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

