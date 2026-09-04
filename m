Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4B4F55B7;
	Fri,  4 Sep 2026 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535757; cv=none; b=szhsfiLL17x0KO1qsDCBxXI2UmgkV439EqCo+naGpURQ5hv8pka8iZXmkbn42yV/4V5dq8a/5fqRO19a0G5blR5jjOgj7BP7mXkYgbxjYLj4Ipy8b8ldGZu30sbnGQL7gOoE8fXI6/+caQyqEuvXOxlGNJ33m29T1qouKAR7vFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535757; c=relaxed/simple;
	bh=ZgNyb8DcUFpMd+YXtJ/4AxHEiMFzDlV/bbrSztcR5rU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I1gcdOXE+T8SckSh+b0hFiDeQ0cBS2kHKwwnFW2NsfuHxafAQ1nhlliJqR3rCi3FyLQ+2hVKkfyBC9GibU4egTPXyxBcFC0Rptz/mIJPYS12wI+8tFjo/zQDyXH+kYObtjR311CyVGjIXGFgdUrnwLUdg8S2yJjJUPPOF01jgws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKUKFYJC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKUKFYJC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABFC1F00A3D;
	Fri,  4 Sep 2026 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535755;
	bh=abuYFGYRia4+Xt7E3cIF1sCR80N8Mc2JgdPW0EpZKLc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=eKUKFYJC2waKW/sqOTEYfDoM0C9rSMc7L+keAX5bmUktCZ1LmheLpP1PsTodXCMDt
	 xhpGJrP++feZeN+29PeYUpOv4rNIWZI0jVQ7xOwBRV5sKyq52YwLHIBalBgOpQwV04
	 1cpTJaTUjaK+HtbqtSpi98tBWhzUKwCyLIpR07A5qLHOk3bvErIseFyIYYTOBv9qoV
	 RRnBwUtRagXCz0cooRabp1uhzhTq2WNqHp3ehRpnKr6Z702mwAbT9aUVELvgW6dEa1
	 CtnCroCz3riOk0N2/yHPxrgwVMDEstlf8wP/TbzSU9cBOH5ZKoQtEsZCKfDl2HeTFS
	 GGPS5Zwww/Vdw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260821083251.194341-1-thuth@redhat.com>
References: <20260821083251.194341-1-thuth@redhat.com>
Subject: Re: [PATCH] ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-Id: <178853575367.59617.1421796645468160415.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Fri, 21 Aug 2026 10:32:51 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> [...]

Applied, thanks!

[1/1] ARM: EXYNOS: Replace __ASSEMBLY__ with __ASSEMBLER__
      https://git.kernel.org/krzk/linux/c/80c92d1f1a4e3000e6eb351ad8af16267b1d4e63

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

