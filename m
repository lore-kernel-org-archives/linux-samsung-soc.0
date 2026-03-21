Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B441231836;
	Sat, 21 Mar 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774089989; cv=none; b=JeT3CrVkhIDQXUXZ/y0vwMM48AXQsqPvm0UZULLK6l6EyqrvW/hZ2ESOuCQGlgDIPucbYwwuw9smakmpFqt702LygCcDHy1jgbWLXiOgtHklIipVTOwlquqpN9ALvCKIFApJ5sgwH4LPiuGKXBcffoPYSFy3hPpDePyax7UchZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774089989; c=relaxed/simple;
	bh=Wykzu+6xT93IcxOk/c/OYiUHQuODHm7jFyIJmovcjM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e46Y/G0YdjF90IIpX+eCf/SFIvo3ScHA1aO8FH3k8kQQs3pJH7Wv2WC0vzXFwZQzvqPxHHk++bGVs4G4npC4rWbIHG79liXX24kcpDxcwEZI9SB84PSCF3hBFW0pFcvUGk+tq9iC0nyW7TY0ZAPeTuWSIDQhIx2KtYaSKAlsg7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3NjxvTu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3NjxvTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7520CC19421;
	Sat, 21 Mar 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774089988;
	bh=Wykzu+6xT93IcxOk/c/OYiUHQuODHm7jFyIJmovcjM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3NjxvTueCzmrpQrkmbYHtcpthJO5rlzzz7hFft+4t7szbJFtaO/FNqo3MjelNDuw
	 aWoqj37nG+5y+2ip5jRLQddvY9PhqeVhGu1Yeb3QbH0dO49uDIYnt4tV9otvDyysHp
	 m3BHn6kHja+lrTHxQx6KYbYmz8/Od5JLHGApthOLOHoRG9YO45bG2qae6Lpd/ihB89
	 T+/SCDn3hAhl1O7YgrigF8GdYYNnV9I+mExF3r+RQRx7rwJPZRJ3KXCpwpD3dug3Cv
	 esouKziMDg38lO4DIK9l+7EWqXG0d/QrdxotbXxZMUERTt2SbSW+4+ud6EVzSqhro9
	 FGL2f3uDYGdHQ==
Date: Sat, 21 Mar 2026 11:46:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Message-ID: <20260321-first-exuberant-angelfish-bd9ca8@quoll>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
 <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>

On Fri, Mar 20, 2026 at 09:15:15PM +0000, Alexey Klimov wrote:
> Document support for a mailbox present on Exynos850-based platforms.

Here you explain the hardware, e.g. that they are not compatible.

> While at this, convert the compatibles selection to enum.

This part is redundant and obvious, can you do it without any sort of
conversion? Not really.

Best regards,
Krzysztof

