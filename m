Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E8739A80E;
	Sat,  1 Aug 2026 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785597170; cv=none; b=n4wwGTU1DCLd0LzFNsE68BgBa6PUEIa6im136PH/AtA8aO+eFqAIbo650KpLu+fpLxcVe6Ok1TUh1jrAjmyoeqkDOHLcanLiB4xgRWqSEjcQtkDAHHTvEoURZ8G6xHbmS9202o8HwxN1aNYQqvU6Fk5aSVwe0Kd82nu3/NJrmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785597170; c=relaxed/simple;
	bh=RhbEpOkjUTlE99reMfXKm3rVtK9DYTgnhjY3XmKZtz0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l7UQTn6nNyojDhplUWfi5F4ZURIQR5S6kH2JFpXl2LpWgKO6z119pGwBWD+dbYkODSOy3kMMJ2hXisqGbQkp7lFumwecdSZ22gsxXI+ggIyw2mektL3SrTitXJbYrZFB3sZFL6PRpUmbUmwZiqk0zRCSOQkp6ICojVXVwNzwXnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/ZBUik5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/ZBUik5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EBA1F00ACA;
	Sat,  1 Aug 2026 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785597169;
	bh=3TUxPEWrqAyYmq7zFGTqdRtbt1fv1bsVlvA2fjtBvgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=C/ZBUik52fHm3Orq7L/Xpkfe8YUXMlFUYG/n3vEHsqXqjY3vTpSGdfPUMsjpUc6Q+
	 5p/GxryYxWmGJygkGLHCgW9n8svLdPRt8R1/3F4hh7DsK5fBVxPW7SdxpU7aE3QEv8
	 E6CH69J6WfRvNcXFMdAjU9EvWIpiBkdF3g26GZqpPTQdLXTlnbPdtJQKU57EBEJxDB
	 InJnwkJf0Iz/j7FibM3j0t5zNaiz9VQFA7nwqEPxwQdSe32j94zZt7JTac/nVu6OYD
	 DOyHRNKlvQwgaEfiObso2+9cR2oLIB/rkeNZb9qEpJuqq7Cn2QSsD7zeQaSxA0kpug
	 1N9NuoVQKKOew==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-fsd@tesla.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] arm64: dts: exynos/google/fsd: Trivial
 white-space changes to adjust to DTS coding style
Message-Id: <178559716446.66839.1421213254356516336.b4-ty@b4>
Date: Sat, 01 Aug 2026 17:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 01 Aug 2026 17:06:55 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Fix stray blank line
> - Collect tags
> 
> Fix a few obvious dt-check-style strict warnings.  No functional impact.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: exynos: Move 'status' to the end to match coding style
      https://git.kernel.org/krzk/linux/c/bf1aee1ad1c087ffda617207890dc92042a28c96
[2/8] arm64: dts: exynos: Align continued properties and add missing blank lines
      https://git.kernel.org/krzk/linux/c/873fa6bd9a4f735575cd46a2824e0f0a454d8779
[3/8] arm64: dts: exynos5433: Override thermal zones by phandle
      https://git.kernel.org/krzk/linux/c/b9014d9fb72b890254ff99b6b1d1c8a0f31ad9cb
[4/8] arm64: dts: exynos: Re-order clocks and align continued properties
      https://git.kernel.org/krzk/linux/c/5128b3fbfbcabd55ca7a53f8a6182683287e28aa
[5/8] arm64: dts: google: Move 'status' to the end to match coding style
      https://git.kernel.org/krzk/linux/c/56bca5626deb478ecb8d3981f415737557701327
[6/8] arm64: dts: google: Align continued properties and add missing blank lines
      https://git.kernel.org/krzk/linux/c/483e4332596477e3f4b6032a6f1fc2d2db668890
[7/8] arm64: dts: fsd: Move 'status' to the end to match coding style
      https://git.kernel.org/krzk/linux/c/8356e0bc0e0b1f9c889dbcdd57f241b61c394fc3
[8/8] arm64: dts: fsd: Align continued properties and add missing blank lines
      https://git.kernel.org/krzk/linux/c/302937941c38b0e46c61ff5c77dd26d1ecaed524

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

