Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116B286416;
	Mon,  5 Jan 2026 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599745; cv=none; b=uUuzt3N6FZH7itzEeV3wLNlzT2yqUdyXoLa9Usmt7ZcEo0VYy3iOKjX57aFMkxsY/gYq9+KuVE0pffq+GrTH34tOizI4cVWCr+77ZBglu4MUWR4+hHHZhESKw1ZrRpj1F2pRx8Kzs3ioq5ZBa/phmWGdCacI+qWx/t4AyZ/4SpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599745; c=relaxed/simple;
	bh=egTyVvYfwf14ijcZfGgVQuVyGcHIfmNUWLP9o5rocq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QqsvsgvDOLGPK7unErsr6FllF3OuhVIjLgMKSjpIlCZdyTXA7Mkdfynmi2eBmALMBVxD/sVR68jJGNDdMVFlALLH2n/kyTgBoq97V7W/rVZf2iXIJzkRbQ/GZvyyG1QXxQZdAIGv9IudxNsdNlWszLcsNwi835NTWneyYHbx0hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOAyElvo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOAyElvo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4CDC116D0;
	Mon,  5 Jan 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599745;
	bh=egTyVvYfwf14ijcZfGgVQuVyGcHIfmNUWLP9o5rocq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bOAyElvod6hsBagCdn70ZeYXTyQOJvhfUlpF4n+WKmCulfFGSVj37ZGq4MDirooKx
	 Jw/YZJHI+KbMIngK0odEQ6pLi06BjHKP9hzAixZ4aZdjyMwaR2F+d45ArKQnm3LJCI
	 lVT69qHVaFIdP0VV+nVTAOikD0sUVFVnWrMI+A/qBmuB1nX2GjRv8/NzaknOQgjw3a
	 Cb9WIKQnkGr1X+KnjPvcb8ePBeyHBj9LksFSknVAePIUU2Y4rwKgpYK/qSn0w07HIK
	 yviX3KotkB10mB+YkTLZNsh8jMTXlqHPPu7ZFUHzZISW2yCJM9SpCHNafpBGTmAXSj
	 escS6wDYCMhEw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Alexandru Chimac <alex@chimac.ro>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
References: <20260102-exynos9610-pinctrl-v3-0-3f21f2cfb651@chimac.ro>
Subject: Re: [PATCH v3 0/3] pinctrl: samsung: add Exynos9610 pinctrl
 support
Message-Id: <176759974254.17011.15262742954028365380.b4-ty@kernel.org>
Date: Mon, 05 Jan 2026 08:55:42 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 02 Jan 2026 11:29:30 +0000, Alexandru Chimac wrote:
> This patchset adds support for the pin controller found on Exynos9610.
> 
> 

Applied, thanks!

[1/3] dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      https://git.kernel.org/pinctrl/samsung/c/2432700e9c927d3c4ba1219db24fb2634282f45d
[2/3] dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      https://git.kernel.org/pinctrl/samsung/c/891eb0543f203cea0a85a4878258eefa9d3f84b0
[3/3] pinctrl: samsung: Add Exynos9610 pinctrl configuration
      https://git.kernel.org/pinctrl/samsung/c/9ce17ff1881f5be272ec016e108ae68be4b73646

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

