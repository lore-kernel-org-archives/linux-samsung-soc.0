Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683D1AD3F8;
	Wed, 18 Sep 2024 17:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726679868; cv=none; b=fqbvZQ9fdysEOU0djvfVhRv26/BHLOZnvdrD1MjfiLh5IeKLhVsmPFO+J9iXu7RWJ6YgdHmY3Pj6r1TyunOj3JYfk8AhV3x2JM2apRMoSz/jYBzBkNHGJvV7tae4h8ztAltGaM5ZWAtFpPIfj1gzYwSzJ0azBJlP/hULnSPSGK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726679868; c=relaxed/simple;
	bh=rF59NlVc8RdVfJ1BvQvUzd07bfrQYtLfcHPmONHYpGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd/nBnS/O6LjYDA2kZ4BiY6JMik/bqpynBDfLsgb4Z7UwREt0bnuNJV3pSPZTqZ0P2umWhkR1Up4lftQEN6IOGezt2edXOCZQ0IebtS7wr27PvaZ/PGoNDiYFR0yKIPtFLH7oTuMJgjvqAoQhDJMgcpRrgHy/qXYMpZxrWQzEZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtoLPaq7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtoLPaq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F865C4CEC2;
	Wed, 18 Sep 2024 17:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726679867;
	bh=rF59NlVc8RdVfJ1BvQvUzd07bfrQYtLfcHPmONHYpGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RtoLPaq7qufGYckdBFCgTUn8u95FViuUhtLsCxwPFPZ1TgLZC2oNCakgAqqDMjqSL
	 EVhY8lL3ZqKHmR5f2i+tnkvH2ifmJl0PuuMStSsQic/whvK5SZf2skRuHV3iKA5Tfj
	 l6ABgqD/1McUwZMc1npsOs/C6k0pEDH9c9q7QiVrRq6FRNhlbSXDj7n6itCj/cEytS
	 z/JfeQ6WBM/TrZKUwWtZVKeIUOIktYwTmQCJxCft0ItDUCNWn3KkuIuMN6tLmQ1CXy
	 JLsM6d6l/yXwhT3+9h24SttkQzbFPJWrIMTo88Ot1GihYXr4re9kotTAfsdnnI5cqm
	 Am+7pAz5mcJtQ==
Date: Wed, 18 Sep 2024 12:17:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: linux-kernel@vger.kernel.org, alim.akhtar@samsung.com, krzk@kernel.org,
	conor+dt@kernel.org, sboyd@kernel.org,
	linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com,
	linux-clk@vger.kernel.org, cw00.choi@samsung.com,
	gost.dev@samsung.com, devicetree@vger.kernel.org,
	mturquette@baylibre.com, pankaj.dubey@samsung.com
Subject: Re: [PATCH 2/2] dt-bindings: clock: samsung: remove define with
 number of clocks for FSD
Message-ID: <172667986572.1820528.6558113024982582816.robh@kernel.org>
References: <20240917094355.37887-1-inbaraj.e@samsung.com>
 <CGME20240917094454epcas5p22a75e3bb5a09b12eb269f1dcde573741@epcas5p2.samsung.com>
 <20240917094355.37887-3-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917094355.37887-3-inbaraj.e@samsung.com>


On Tue, 17 Sep 2024 15:13:55 +0530, Inbaraj E wrote:
> Number of clocks supported by Linux drivers might vary - sometimes we
> add new clocks, not exposed previously.  Therefore these numbers of
> clocks should not be in the bindings, as that prevents changing them.
> Remove it entirely from the bindings, once Linux drivers stopped using
> them.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  include/dt-bindings/clock/fsd-clk.h | 7 -------
>  1 file changed, 7 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

