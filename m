Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA8156F45;
	Tue, 24 Feb 2026 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931352; cv=none; b=RYGc8L3EiPpiGz6vuXzXMQfHSheuKEaeG7L/cxHi+Da798wXzjP/F69K9qXhLNk8ySoQa0d21cXJw92KzTqOLCgkkK757v3Mr4v678EPTgm7jy0Yx5Hzb4Xpvd1z8SbB1j1dDrv6YK9tqLKY25PFxVwhah/HIrH8lHoKZG9epk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931352; c=relaxed/simple;
	bh=SBawp4kj1bHyOycQRY1GOb635H1p2bmugDN5LdacQPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YoXepyKtr2UWaFZIi80yXB1VsnLcD8yoUcsSslkPj3gmNRb8uPdb7cRNN8hE/sZlGnGBndJxIIZAWBZH+ttahwJD5UHsazkOm8TuDwJeN57RNJEKg/xMUEXU+g21gfgddGnFcPrnooTSHkrQ1Y/JXM7hUNge5p+kU+Ev2N5Alfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ad6Oz3+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ad6Oz3+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E6DC116D0;
	Tue, 24 Feb 2026 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771931351;
	bh=SBawp4kj1bHyOycQRY1GOb635H1p2bmugDN5LdacQPo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ad6Oz3+j6k4ivCyEIQHcYfOT3Os65gOfZkm9JyjMh/U33BQ0qGMlekD9/DUN5balT
	 fEA7TXoOZAivGH1dDPdxN6J8+PPymf0ih5Xd2+lAdAY1w1NKU/3w1f7U21DN82+3ca
	 7F48l/gL0sI5d7I9seo594gmIvBIN2R+M+7BeEnkmb8WM6q88cl10UuHI4Vj0U2dXC
	 DZRlxdNmRNJLbrdiEAhtQTvA/W6BOBstyagG8FDPsUvDB4AP2iT+6fquBC1wVZns2v
	 Nzpiq+I6mIWJ3Om83rIW8UlmwETMUgespB2CWhv3M1B0mD+kVHSiby26G4aAknooU5
	 DrWUd+uFj1vUw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
References: <20260219-firmare-acpm-counted-v2-0-e1f7389237d3@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] firmware: exynos-acpm: Use __counted_by()
Message-Id: <177193134878.50704.13669027037095531482.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:09:08 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 19 Feb 2026 12:27:09 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Add tags
> - Patch 2/3: typo, single ioread32 lines, merge the two if() for
>   txcnt/rxcnt checks
> - Link to v1: https://patch.msgid.link/20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com
> 
> Improve safety of the code by using __counted_by/__counted_by_ptr.
> 
> [...]

Applied, thanks!

[1/3] firmware: exynos-acpm: Use unsigned int for acpm_pmic_linux_errmap index
      https://git.kernel.org/krzk/linux/c/910e91a6496f7e0af80e945a6b850b589b90669e
[2/3] firmware: exynos-acpm: Count number of commands in acpm_xfer
      https://git.kernel.org/krzk/linux/c/00808ae2e679a97dccc5cf0ee4474ba1e2e8a21a
[3/3] firmware: exynos-acpm: Count acpm_xfer buffers with __counted_by_ptr
      https://git.kernel.org/krzk/linux/c/951b8eee0581bbf39e7b0464d679eee8cb9da3e0

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

