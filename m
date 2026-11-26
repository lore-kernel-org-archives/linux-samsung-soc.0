Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678123;
	b=UrSzJyBNxiCJenLnEgRE28sZmKtsDAqSaXGwLFk5+E+Ke43GRlWWHH9qaSvZeH38H9ew
	 a6vw7coiC9dZVk+5nyEhCNzmq787z60NBydcyPq2tBVI+UtoYK3Jryq72O7KV9sk9ZhTO
	 SOzaKXIcYCgF58OnQ21CnI7BQHbx4UtZxHfhSrxP7mSLZTNRKm56ZDNvhhz7VBQRO/LtK
	 cxTXNzewOZ08W6GOQz5gYTLa3nsY8DCaVra4lgMTHR7vUC1NdL8jZr+vgSU/BG9emRqoW
	 lwICUdIX4pf+fuYYYJRm4Qyg8yvqa4RoiwRVhpDnzT7xB+P9fD0UWHy31iMruItZEtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678123;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=/hgw7tjKpgv1YJDPyvW4tYdNQTPf9bMIu7JnD7fWCjA=;
	b=epAO6vk/6rjTvXkoGKunx0+4OZV2aE0dIHHcWLYfgIUkAwzRdfcfFd/ZOBt6rwtyW0av
	 W2ubtwAevpYwcU9nAkCdfPrNGlVsMT9N3ezG4OxpEpoLMVljPvHYJ7RewbOSsFdefChpF
	 18lVUgNm+hPFmJ1++bAJYpMvBqlFpOQVZ57dMMTJLX4MztzhBeqsC9x9cljpktwhFFAM6
	 f6tw7T3MnKUan7ZijU83K7YGqKygDu8MocC5djwU0d8R5MPNIRmA/Axnz49BswgI415BA
	 E/mLOVPyUlagQSng9QQt/VhAM/tJ9N04MJ+fIUDWMBCSBD/FjuZObZUAHDEhqKbyeAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2i7LgE2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D30A606A31E;
	Thu, 26 Nov 2026 07:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2i7LgE2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391831F000CA;
	Thu, 26 Nov 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678122;
	bh=/hgw7tjKpgv1YJDPyvW4tYdNQTPf9bMIu7JnD7fWCjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Q2i7LgE20zc81PKTDp1D9IwqFFIW6OSd23jMOGREKM+Zi3IVA8PsEG/QSCDMpPBfG
	 RrH5Kkr8sx0WPrEa26g01mHiUQl/2nIE7iTxkhCNLvaXfgbk2vTzXFlqVghn4tWKTF
	 g7ySACqclAhNttxpYD/VaQzK2++nVqR6qA+6sdkPMPX95cBb+ViUUbRqDio//0RQv6
	 tThbWdSVwjr32KuT/xGQ5D88SG2rpbXimpyAxbL8JdPC1Ix/W+GrGjjCY9c1X2jz2K
	 kBw1eUaPX2QHMhXAa6spoLsM+DRP+CZnClV2m/13pDyTGZ3XzGZxQUhHqfxjxT51He
	 tVBUXd3JBsOHQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 =?utf-8?q?Tr=E1=BA=A7n_Trung_Nh=C3=A2n?= <nhan.094.vn@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for Samsung Galaxy Note8 (SM-N950N)
Message-Id: <179567811849.20062.4408545807765392596.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:28:38 +0100
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
X-Mailer: b4 0.17-dev


On Wed, 18 Nov 2026 15:42:58 +0700, Trần Trung Nhân wrote:
> Add support for Samsung Galaxy Note8 (SM-N950N)
> 
> Hi,
> 
> This series adds initial support for the Samsung Galaxy Note8
> (SM-N950N), codenamed greatlte. It uses the same Exynos 8895 SoC as the
> Galaxy S8 (dreamlte), which is already supported.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: samsung: Document greatlte board binding
      https://git.kernel.org/krzk/linux/c/ee06453ba8b860816e9061d53cf6a6427a247df6
[2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
      https://git.kernel.org/krzk/linux/c/e59848c714e58153671eca08c85a9bed09fb4b48

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

