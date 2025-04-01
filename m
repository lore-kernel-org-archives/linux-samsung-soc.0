Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506101876;
	Tue,  1 Apr 2025 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743474641; cv=none; b=cBQZnFeHdwD+GYCgHO0Y3Z+qxKoedHeuC6i37dS0N1MCU+M6aZKySmMr9nHvtpRZ2d6aNqv7l3SizoZqpcKqNCqmllPhb3a0nMW599NEm8qf6i5udXPuPkKaAydImKaVIr5/tBWxCs3RUPTxvtmB8cOEPvBuGCqQst6o0SxmL6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743474641; c=relaxed/simple;
	bh=p2TwAjP6YBio/E8zuVpxFk/YSNRC4E66gdnvXPCCDzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2/JTspbb1a6a9lFzCnbLYowyUPakyKlqJhaHHsyjidPEoyvC36vne5kveSr2mRjCQht/+cQ/jwJlEu0u601oM4TsMGuoWb7TRXsFxxWjrT8rfQBo4+uyxXbbfWkRvtTTFW6UKjQDRI1wHIev39D//XReexPCvxQDmtSh7WzepQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNOCYLgr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNOCYLgr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955F4C4CEE3;
	Tue,  1 Apr 2025 02:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743474640;
	bh=p2TwAjP6YBio/E8zuVpxFk/YSNRC4E66gdnvXPCCDzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNOCYLgrWJtrFjh0l0sjaRLQF0bz+xVAsFdavEWssL3k24wvvjNVDh4ZcaXQrAb8X
	 VacPD/WnOGL+aqmuBJvac7trV4860Hqw+IXKlronVwHkIG9xmScTpAQ2zu2BcTKjr9
	 qj3W0d7zDu+/P4faJ9tJ2HA/qB/mipRDiuBUVK/e5vdHKp7MEIweE8qr4AnvtnTFOz
	 UfnbsTm5HzeQZwf1cnwkmfwVcRxwU+kA9jDJFDSw9MaLVOhuDVzoTC370LW7Jlnupw
	 bVDPkMRPA43wa1RNWKC0S2crqZvYAwwfVlDum5le5FfVz8Kfuij8vSXvEk4Bv41m42
	 VuR2VhpRxqkwA==
Date: Mon, 31 Mar 2025 21:30:39 -0500
From: Rob Herring <robh@kernel.org>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/6] of/irq: Export of_irq_count for modules
Message-ID: <20250401023039.GB3186122-robh@kernel.org>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-2-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331230034.806124-2-willmcvicker@google.com>

On Mon, Mar 31, 2025 at 04:00:23PM -0700, Will McVicker wrote:
> Need to export `of_irq_count` in preparation for modularizing the Exynos
> MCT driver which uses this API for setting up the timer IRQs.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  drivers/of/irq.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
