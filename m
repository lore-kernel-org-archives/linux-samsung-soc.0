Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660257EDBF;
	Wed,  9 Sep 2026 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970500; cv=none; b=ah/FAw9hUq/v19v6YcAFJNVFrVM7Z/ScSsKrVkJiwxm9Q8MVnUEHS9zn1Os/jys75f4YGjikjIAnzwVksbaN8ayV6y5F9B32EvGHAg9UTbKFCdHtdWD//Sc4+gAY+twua4T80mXkfBp+Gb/ykVorBWSnM7XoT1oGuHBpfyiQuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970500; c=relaxed/simple;
	bh=bVb53efP58jGI/V3nhDniw1yHrPQ7euBftyJehXesGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzSXXkU7hJWXNyvdcgcxoGCz+HiA3Xn8WxGGUVRLp0dKHtNAwkZcN9PfFQk0tcduoHGcChnEb6vWzHD5hSIym9536v+cxNU4YQKoIRUPzrwZoW183LDt19LXn05ssfHxFYcvqo/DOMtCFgsykc2YMYE2cwNSlE5dwCWKXF0HmDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAuwZ02V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAuwZ02V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199F11F000FF;
	Wed,  9 Sep 2026 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970499;
	bh=mWSZ6mwmEzhXUt/cX9iPROU0flirx2XjU8cSrXB2xs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IAuwZ02VEStcAOCvt2Ry916DoEd9qUC28EF46FkJUv3o8vIsmdZaGv1590m3wP9v5
	 PzR/HGyS12HLf+u2mj7rgLjJTBoCIqsp3PVyOzDdE/THeAuNh1Koojs3W6SvXywpxP
	 4YdYaj8wKLUEWWXjl0WK92lfAHogFLM5ClYUvFFGTMLdGeDIjxClbHNsznH8wiEl38
	 g7S5LNPlYpIEI7sxVLp6+qfKMW7bXVWXDyB7EJUU/v+5fVxoiBDX/5aJzRosKrK0BN
	 vBi8Z8XJHvtbATJsom54WnBsvqjTxQ/kPhkOxRl9woK4+HL0u63toxf0lIgxQUf4RV
	 l16iUDwqE1qmQ==
Date: Wed, 9 Sep 2026 17:14:54 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Botsz HUANG <huang.botsz@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
Message-ID: <20260909161454.GF2133376@google.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>

On Tue, 08 Sep 2026, Krzysztof Kozlowski wrote:

> On 05/09/2026 14:05, Botsz HUANG wrote:
> > On Fri, Sep 04, 2026 at 05:58:28PM +0530, Hemanth Selam wrote:
> >> 2.48.1
> >>
> > 
> > good job~
> > Acked-by: Botsz HUANG <huang.botsz@gmail.com>
> 
> I don't think this is real identity. It always comes with other
> LLM-generated content - as in this case as well - from Nick Huang
> <sef1548@gmail.com>.

sef1548@gmail.com is Googleable and appears to be legit.

They also have commits dating back to May last year.

-- 
Lee Jones
