Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEAF3FE64A;
	Mon, 29 Jun 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727792; cv=none; b=iOzO3a0/z8GwUksWDftbgOGnpPD7S4Kf3SsRFFm7+urlJPnIcu+udV739Rp/3gL/tlIzsIysAFdAlmB/gQ2uG+jGNrKG414AmJBj4xcfWotOnomEiBtOe3wjtDS3mlFbu0AGnt54K8/VJCr/njjAOPY7rce09gXLQdWbek5FLdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727792; c=relaxed/simple;
	bh=ogC/4VKELELtTYA4BbhsUzWxha9GqFFBBwPcjd7CtGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UxG8BD/0X3p2j4SG5pNcn1lGBE7j+rMcFqHb50ug+J6mKx9vB5VxIq8wT4HtkQ2BpMr87LrBD2SVSV9HI+Gjc9LGMZDELe2mq1nO5ac0GoaHHvnPhQ/OQHzU0N5yYXEBa3HH6J2aFTcc5ddO4NgCR8brkh8aK7k/gDwWvybJNuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgLUVKR3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgLUVKR3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B531F000E9;
	Mon, 29 Jun 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727789;
	bh=Kubpm4xnqh0a39pb6Q6Bm7VmLGuw6CnmA3P5cLUgdSA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NgLUVKR3BAKMusaPcrQtz0TKcOl74oftK36KTrMYSEjl1XdEKnsHKQqXbPFO2Nxtg
	 G0mMzPwY2tbASv+FrRNH59ZlNDERPB7koDK26pnBjDnTI3WXHaCSmfcmeOtbvcC9WS
	 1OpSeq26g+vSUVkSjQ/NCQ9Mb/g9oCw7E9EDhIDLBrF6JFLxiUsp/5MwtoboQAihb2
	 +WFV/1WAlQe0bQIS2X8WY+1tKWKwuPRgaAYoc4I8GjCfM/BwUlOj8xy3DSvH4ZjWHv
	 ryitwd2u0iUlmvbZSYcbjqooIyRPp7a6xikR70f1K3/lIKJT1h/0x/SZvZFInY+R0w
	 8uQzddWgzE+Ig==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Thomas Huth <thuth@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
In-Reply-To: <20260619125827.215977-1-thuth@redhat.com>
References: <20260619125827.215977-1-thuth@redhat.com>
Subject: Re: [PATCH] ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
Message-Id: <178272778707.113362.4140243522437005166.b4-ty@b4>
Date: Mon, 29 Jun 2026 12:09:47 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 19 Jun 2026 14:58:27 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
      https://git.kernel.org/krzk/linux/c/7b06ff772080919fdb194c95af6b1e3acb079b71

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

