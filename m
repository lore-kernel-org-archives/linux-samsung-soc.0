Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD63F1045;
	Thu, 10 Sep 2026 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033422; cv=none; b=KWv3HdR3k95r9te1OVntd/o0hzb4nKwtX0MYJYjYW7F4yUV5UH0tu/vXd/FrIaD/g9/nV+lbA4IzrlZT5aJDczuYgaexffTdTWvZ1XwNNhiHUAVICFJ9iYNhgEnfVqcIt51yVxeYJxeVSdNIDifCLof+/8PvdqNXqi3nLp7BjOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033422; c=relaxed/simple;
	bh=YaoGfQ84ks+iaR2dKeqY8M15G+lBDfndgtqit6O3r5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDghwMMfcF3sRVwIZg/95rBjZQUUueOslPXpX/ce2kVw8mJLA3QhRsGsX65QfdPtBo2JLAzBHxzTd7ZhdSNqGt4dggIXXHtM4UNCKHDfWnjaChtFRpAF1S9Elldy/cgH2rvlhrQu/5jAtif87j+63/6158d+RSGrjxNRrdyZDk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JU0pPDhQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JU0pPDhQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03DD1F00893;
	Thu, 10 Sep 2026 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789033411;
	bh=OYLEwdz7aP8UsgD+AaSdAYjyNHvX+ERbt9ZD4hVP2Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JU0pPDhQWLMlJankpgTKk/VMDFm6H3Hp5m4ZY6B607EaX3t95xdIL1zjBXlP/l0+z
	 09OxRYv34EgaxUJQnF65T6sWTQVntJT14aRkKCwG81eTqzq8dUMeifQtfCBUil14s+
	 wdk3UZB04f6H72qp/Mv+JCTpAKkvudu35GRS8IQNAC61WCVaqHqBm4VTF2wfdh1S/d
	 u+u6uyhruGS409IYYNbiwvjn8CoIOBByb2/1ttq0FjPARDUKkaQD59SD+dI2vjPoVe
	 +IBxM/eRfVLC3IcwpuYQNtus8GneyyYOrt/7oHkwvSHjpeowBgzUpFy+w8TbEhrbvX
	 7xbhovkh12ZqQ==
Date: Thu, 10 Sep 2026 10:43:26 +0100
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
Message-ID: <20260910094326.GP2133376@google.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
 <20260909161454.GF2133376@google.com>
 <20260909161710.GG2133376@google.com>
 <a05c4086-1681-44f4-88c6-de1073b0f5a6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a05c4086-1681-44f4-88c6-de1073b0f5a6@kernel.org>

On Thu, 10 Sep 2026, Krzysztof Kozlowski wrote:

> On 09/09/2026 18:17, Lee Jones wrote:
> > On Wed, 09 Sep 2026, Lee Jones wrote:
> > 
> >> On Tue, 08 Sep 2026, Krzysztof Kozlowski wrote:
> >>
> >>> On 05/09/2026 14:05, Botsz HUANG wrote:
> >>>> On Fri, Sep 04, 2026 at 05:58:28PM +0530, Hemanth Selam wrote:
> >>>>> 2.48.1
> >>>>>
> >>>>
> >>>> good job~
> >>>> Acked-by: Botsz HUANG <huang.botsz@gmail.com>
> >>>
> >>> I don't think this is real identity. It always comes with other
> >>> LLM-generated content - as in this case as well - from Nick Huang
> >>> <sef1548@gmail.com>.
> >>
> >> sef1548@gmail.com is Googleable and appears to be legit.
> >>
> >> They also have commits dating back to May last year.
> > 
> > Botsz Huang is also a real name [0].
> > 
> > Now, whether they should be Acked-by:ing patches is another issue entirely!
> 
> But:
> 1. The questionable account only acks when sef1548 acks
> 2. Even the style is exactly the same repeating the same mistake of not
> removing quoted text:
>  - big wall of text
> > LGTM
> > Acked-by: Nick Huang <sef1548@gmail.com>
> 
>  - big wall of text
> > good job~
> > Acked-by: Botsz HUANG <huang.botsz@gmail.com>

Suspect indeed.  Huangs anything to say?

-- 
Lee Jones
