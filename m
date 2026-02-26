Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A946AF25;
	Thu, 26 Feb 2026 21:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772140389; cv=none; b=mSfj8tjKe6ZP3OhDc1EZFfUtrhEFOXRbydL0JRqR8zQ5qysTrfmrjlpJyS1B+VHFY0FSncu5YBolRiNqxpnIreL44keyhA6t3qtAgUEehQQ+hyM24bG/xPvqqEaIKZvW7K8zR4BuIL65CHHXA8uPIRQ3x7j+IkIuKijdAl2swmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772140389; c=relaxed/simple;
	bh=/rAVJCFfsQkvrRdgutCJT5HOojDDScsTy8KhEKFIjJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oQ2SZBTrATMVoDCYorjqhlxGdRcXfIobJXEjZRxoT5s41fNlPiQYkLdouAjpaOj4DoZW8nVAVVlK379VsscQDmSyJnCOXpoKKn2dHgHF7NvZxgkd96kqa2OKls9Ql0hhgZyIWvlzd+q17nSnRpDZuUJhU1TTbNHJvHkVP94THFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vGXn5u/J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGXn5u/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD08C19423;
	Thu, 26 Feb 2026 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772140389;
	bh=/rAVJCFfsQkvrRdgutCJT5HOojDDScsTy8KhEKFIjJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vGXn5u/J304XW4PR0Lx/1Hf7o0M0kmHoP1R6/LShOXfbdH83FaLtbhauldgOIa8hP
	 hzdfGGLUw3KCXgi++LTqXcioxDKgLIu+vxwggoLItz/slZYUWPUdLjcdfkSiJo54Sa
	 6Rmgu3RK8OqpB/cm49jxQmUeatTKvm98TKnmGfpgsNNOspwWAWLobwSNFnJT2IjUW1
	 Tx9tK0s6NQdUCg1MLGvAiDuhzWESVh4VVL/A09NUSKyLFoP1wKlPr2vc34X5p+mebQ
	 6noDRAtYK3BG0hY+aklFAUGapUt0CHPHBlFg4siet0sXpLUYfpzAYpci+Rk+hTeOt/
	 4pSlcmsE7lnow==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Lukas Timmermann <linux@timmermann.space>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>, 
 Henrik Grimler <henrik@grimler.se>
In-Reply-To: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
References: <20260127-lat3st-staging-v4-0-797469aaaf9d@timmermann.space>
Subject: Re: (subset) [PATCH v4 0/3] Add support for exynos5250-manta
 (Google Nexus 10)
Message-Id: <177214038655.341086.4114348823043257597.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 22:13:06 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 27 Jan 2026 21:40:55 +0100, Lukas Timmermann wrote:
> This patch series adds initial support for the google-manta board, known
> as Google Nexus 10 to users. The device is powered by
> the Exynos 5250 SoC. The bindings for the notification led are already
> in the linux-next tree and can be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/leds/ams,as3668.yaml
> 
> The first two patches add the necessary device tree files and
> bindings, while the last patch makes a small modification to
> allow CPU1 to boot, as it requires a call to it's underlying firmware.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: ARM: samsung: Add Google Manta (Nexus 10)
      https://git.kernel.org/krzk/linux/c/1e7e6c6301d529fac07554fbdb215c70c8510f7b
[2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
      https://git.kernel.org/krzk/linux/c/16319efc63cb41abd29337dc0dcfbef723ec1dea

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

