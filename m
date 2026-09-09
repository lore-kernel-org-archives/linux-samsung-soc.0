Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C3157C70B;
	Wed,  9 Sep 2026 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970636; cv=none; b=WraWpUMbABNls7hN2pOSIuWymkDioaraRA0lNE95znRxzYYQGJ8LxI3TStCqHsTQho1NF1YMqjtcRT1zDR1rdvVEDFMYTOa2E0fXDbktDqtolVmg/tWhrk1Dhv/0F/o9mxOBqiQ7bi8A2eRbxxuMQYESYpkG0qr5T6G+tU4w/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970636; c=relaxed/simple;
	bh=xUlvInYsRpNgi1OjmmyJHdbF3tITIDBgAvg7yd7zKeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMEPq+bXEMVWNYqVsGo9UjD3I/kRfVhseJfJsghYff4KvCpRokPFO1IS/USwYuQwL44yr+qVJUilowBtbp2Y5OOuQfcHXCBaSKKit4PmJ4bYCg65d4g7cRsncFYzmmkuP+/pAnHbHD4NKvILpGlFeos2xMI9NMf2dx8EJA8Y2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F50EqytV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F50EqytV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2274E1F00893;
	Wed,  9 Sep 2026 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970635;
	bh=8H0vZzAbbS9XRMCpvUFIC2Ym7zgrUw6qI/eijIEjT8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F50EqytV1ddfMvPCmG+31Pa1trdohpLepudoNCmMch473GbB6PNksI331ufTfSYZD
	 EaanFuKUFuE1FZC4cXZS/v7PPOywl4ojcnIRDSbRSkqzrdgPfg4E+Fp1EVfYD5d8Ot
	 IuTR4v0KsfjrJbHOKSQeTCFeSqdSbIw+RbMML5q9swZi+oAAWTnV3MnBulVJLJQUim
	 OtFjtV75vaYX7Z5UxdD/PrBuL1CysWWxmrYtxBNoX3cnhXfc6DOWPwx6C5BNkLBjZC
	 2uJXOZ5iwsPAXGQvrwaY41ptNJyDFARfAGDJNXudd+EurB6hZdUDPLJ67kQTRJhlIA
	 4xPoiFjt1soiw==
Date: Wed, 9 Sep 2026 17:17:10 +0100
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
Message-ID: <20260909161710.GG2133376@google.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
 <20260909161454.GF2133376@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909161454.GF2133376@google.com>

On Wed, 09 Sep 2026, Lee Jones wrote:

> On Tue, 08 Sep 2026, Krzysztof Kozlowski wrote:
> 
> > On 05/09/2026 14:05, Botsz HUANG wrote:
> > > On Fri, Sep 04, 2026 at 05:58:28PM +0530, Hemanth Selam wrote:
> > >> 2.48.1
> > >>
> > > 
> > > good job~
> > > Acked-by: Botsz HUANG <huang.botsz@gmail.com>
> > 
> > I don't think this is real identity. It always comes with other
> > LLM-generated content - as in this case as well - from Nick Huang
> > <sef1548@gmail.com>.
> 
> sef1548@gmail.com is Googleable and appears to be legit.
> 
> They also have commits dating back to May last year.

Botsz Huang is also a real name [0].

Now, whether they should be Acked-by:ing patches is another issue entirely!

[0] https://www.researchgate.net/profile/Botsz-Huang

-- 
Lee Jones
