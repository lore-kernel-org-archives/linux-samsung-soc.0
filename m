Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4883D4BEE37;
	Tue, 15 Sep 2026 11:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471058; cv=none; b=iUWBp/RdidhljzXKMybEk2r2KL5KrmrHCkkgvzqTto7jCqCgu7n7bxuDfh7YF9NnWeBEpzIxEwHIFx72YV+cEunuxlgvu5WpBZNShhwpZ0L1id92VaPA9X7zoQbJ81Xk9Rub/keiqKl+vD89VT+ENRC5yRtDqmkO9cEB2C10KxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471058; c=relaxed/simple;
	bh=Sq2dAMWk35UlnHbAjs6DOgC3a01jZ+p412P/mXUtNUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okF/AIF6XCi/n22E6XuGWk5r+bcPSqPbKelpxZG07+zHyawVu0OjnxHrn656CaB9lXVBf57Sub/J47JtxhicnFXKC+FBfZW9Kjop01lm3vMO6azCuB1+iEALO3rufFImTTP9z2YFb2oV0x8t2A3PIWy4FCzFD0GLv2bXygFqNRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAxUSozN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAxUSozN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95A01F000FF;
	Tue, 15 Sep 2026 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789471056;
	bh=LqesHCdz1vYxxthz4R+v+8kgtFKIUCV8OeivnqTGwxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nAxUSozNM0UETv7hjFFho+8mQdtMf2xefcIafjgv5DPToG9eBHuvnoreZia5222Nh
	 rBo2uzz1ChOHZStckLzc4f5LZNpWqI+23xiyyjuPB7/IiufTJjTurbRHriOGXZzl96
	 yIyW/AuyJ6yWjbZQ+ocPj3DAG7epy+fKsNq4V69xQC92SnztOiAIDl4Hk4YBy+vPBs
	 rDcn+1elZRQuE7xHK9copzKCj73yJJN6WusQOuX8y3J0vOnKOk/KNHyuSIi0Wt0RZe
	 NQYVa2D0IrYYqB4x/TzrRk+dC30JhJf6eKNwlsh5PptGhthOJg1qNSA/uQ+Qkwemr6
	 CXk1IDSS2rcgg==
Date: Tue, 15 Sep 2026 12:17:32 +0100
From: Lee Jones <lee@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Botsz HUANG <huang.botsz@gmail.com>, Nick Huang <sef1548@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
Message-ID: <20260915111732.GF11487@google.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
 <20260909161454.GF2133376@google.com>
 <20260909161710.GG2133376@google.com>
 <a05c4086-1681-44f4-88c6-de1073b0f5a6@kernel.org>
 <20260910094326.GP2133376@google.com>
 <178911667044.715443.13795127169435157424@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178911667044.715443.13795127169435157424@gmail.com>

On Fri, 11 Sep 2026, Hemanth Selam wrote:

> On Thu, 10 Sep 2026, Lee Jones wrote:
> > > Now, whether they should be Acked-by:ing patches is another issue
> > > entirely!
> 
> I am the one who carried those two tags into v3, so let me take that part
> off your hands.
> 
> I collected them the way b4 does, without knowing anything about either
> person beyond the mail on the list, and I am in no position to vouch for
> them.  I should not have respun the patch just to add them, which is what
> v3 says it is for.
> 
> If it is useful I will send a v4 with both Acked-by trailers dropped,
> keeping only Matti's Reviewed-by, which he gave after asking for the
> "wainting" fix that v3 includes.  That way the patch does not depend on
> how the wider question is settled.  Say the word and I will send it; or
> if you would rather just apply v3 and strip the two trailers at commit
> time, that works too and saves a round trip.
> 
> I will also drop the Assisted-by trailer naming the model while I am at
> it, as has been asked of me elsewhere.

Yes, v4 with them dropped would be helpful, thanks.

-- 
Lee Jones
