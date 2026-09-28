Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFDA37E5D4;
	Mon, 28 Sep 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582812; cv=none; b=IFenQMEmXW57cu4+gnJPTYY9n/abUxWxFwXG9QmpWOVhwgBs8zE4ITC3CXNtpWVDduwi0nr75L9zsG0u1i9A+gTZpShD+yfEus+Wfwq739fykhkbUb+/hKko/o3aTKTjBMzgLWuwSp0nULtJaBl0FchEaQ6b7ky1chJlw5aO3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582812; c=relaxed/simple;
	bh=4vwtqCyUiKV43egwYrfwH/FgklQDsPaRT2gJsJdKh5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNv5171tHBF5IfO5iNqkZQVwJkuYb1A89Fki4Y7HSKu6UvIa5xRw0K6YM+QpqWjkDT7aQrB073XnLC/zcJOLd4uKHQDW6fSqGO9M/re2u7ChP0VMPvquczutY+MD1vjjvvnzXY0MJ8iQza7AApgC/RJ3HY/VFcdypYb9O/bs6BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbeF3uiC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbeF3uiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D4E1F000FF;
	Mon, 28 Sep 2026 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790582810;
	bh=ZDcqyyxfoB2phhYAUptIB1AuIJCG0bYrwp8n7NiGAXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GbeF3uiC7F68XfE+smZpoGDufvzhVa7da72pazv7dSObq+MyMa/CFM9SEZTkq61Y/
	 DP6tUYx5aG/foBSuSWxS8Z7pPrgPpAcM3OgIre54/R6EkRTL8Tkr5mQ7M6brcFVGOx
	 0kPl4mXUbDw2bRJ2kQ3M94BXTAEYQJIXwg2Nen7qkPH7TGiUT5uDaP9cOsS9zIyVdG
	 liN7Xpb6J5Z7nw8r6pOQ7LXlI/j3yHUmq0lajyeJfuPin0Ndt4MS5h6MsEPM/CBaH4
	 kPlwqMj1z1g1tOPxzTK9VuvSxyBqmtX3hA9oKDbNNeQTVHgue2UfYxRLVcuwTSRuLE
	 5+kKZ2GAhBjfA==
Date: Mon, 28 Sep 2026 10:06:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: samsung: Require clocks for
 Exynos9610 pinctrl nodes
Message-ID: <20260928-dynamic-durable-rook-1be9bc@quoll>
References: <20260922-exynos9610-pinctrl-patch-v1-1-f6d816696591@chimac.ro>
 <d679c0e9-febe-4069-9c2f-a2173a5218aa@kernel.org>
 <1343593353.60484.1790180095661@app.mailbox.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1343593353.60484.1790180095661@app.mailbox.org>

On Wed, Sep 23, 2026 at 07:14:55PM +0300, Alexandru Chimac wrote:
> Hello!
> > On 09/23/2026 5:58 PM EEST Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > 
> >  
> > On 22/09/2026 14:15, Alexandru Chimac wrote:
> > > All Exynos9610 pin controllers (except PINCTRL_TOP) have clocks assigned
> > > to them, so force the nodes to have clocks assigned to them.
> > > 
> > > Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> > > ---
> > > Most Samsung Exynos9610 pin controllers (except TOP) have clocks
> > > designated for them, so allow the device tree node to include clock
> > 
> > I don't understand above. It's contradictory to commit msg which says
> > ALL. Here you say most.
> > 
> 
> On Exynos9610, only TOP pinctrl doesn't have a clock (as far as I'm
> aware; haven't found a clock for it), while the rest of the pin controller
> blocks do.

So how is it supposed to work if you require clock also for TOP pinctrl?

Best regards,
Krzysztof

