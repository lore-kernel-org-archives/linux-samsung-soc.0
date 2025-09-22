Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E32E7F2D;
	Mon, 22 Sep 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555789; cv=none; b=i0WZJ+TvQFZUqchBE38CU0QynODlCI6cDtyWpIpkgxwE1t0PpHYFnqV17Aomr4FOwg29po/OD95ktVXJJDQVEQvLB0QllYHwRAKMHSidqyZAt7ViE9M3LTI77cM+2stlUKIyoMU3xnsvLG9ZKAFQut9YT55w768+Xj+wmpkvXh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555789; c=relaxed/simple;
	bh=Wg1EJ3SHV9/DAbJxBesxVWBP9MLRgk/GFLNrpDnYIyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky0GLjvG5vgrj0Qw6PsKREtn89WLCbH9HejH4Mgg1BuOX5W0gksx/4FKczVjRz0Njj3cgryj4DaBD4fryV8wPyD60Ork2ON749MvXVBfodaAQtOiXIbggpo2su5ixseS5mh/QeR8iURe7/dyZMZ8qKuZ1Ljutslk+59xice6YDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNLi4hyp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNLi4hyp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95D5C4CEF0;
	Mon, 22 Sep 2025 15:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555789;
	bh=Wg1EJ3SHV9/DAbJxBesxVWBP9MLRgk/GFLNrpDnYIyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LNLi4hypzskGlQOtpt4jZfwz4XHoN1tWGiT0PR/mwSJFm3L/hgIAkGjgfrox3x6R0
	 JQAuVRZxJdKfImwGSfFRuJ9SOCsh0xbcGxnvbozJlnMJlIXEh5rnNWZ7bc6ECpNbbN
	 1dTMOUU/BZmG3EYivkG/bqMfj1eyITR4RqIQFf8Q0f6dKomL8wWWOLc5xm5sJwjUl5
	 4x3Vw9S3gAALjWLJzWBckd/biRjswV3NiuoDom6C36UqSzFxSRd9UovyjJGFFvd5YT
	 o7HqdgmY2rLMFvEon8zZllSCn9938pl11IGRo+AeG0mAWsPZiGLWff5Lbmu3dsU7PB
	 txS5WIYwEjC6g==
Date: Mon, 22 Sep 2025 10:43:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos9610 compatible
Message-ID: <175855578574.38279.9654529189810333090.robh@kernel.org>
References: <20250914-exynos9610-chipid-v1-0-ade99e09a23c@chimac.ro>
 <20250914-exynos9610-chipid-v1-1-ade99e09a23c@chimac.ro>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-exynos9610-chipid-v1-1-ade99e09a23c@chimac.ro>


On Sun, 14 Sep 2025 19:50:28 +0000, Alexandru Chimac wrote:
> Add a compatible for the "samsung,exynos9610-chipid" node, used by
> Exynos9610 platforms.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

