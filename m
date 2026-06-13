Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E984322B9F;
	Sat, 13 Jun 2026 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781370728; cv=none; b=L4FOENiFcbzP8XjiEK2q67PymYkB4SQ/MJY1ByA2I/OCK0pgfVj0s4O9tFNEuQh9RPx5t4aZlPuT+JEBORGnazYbe+z9WB8JO9+6BXwgIjw2bHcCMoBRNsiPIFW4yDwu/KRgskWfMr6ZdRkwCCuECvX4az9MqjHE23v8RDsPTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781370728; c=relaxed/simple;
	bh=kZazbW3SWAnpIyQOqUnSdo1u52KSwTJ6swcwNHxwxkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcoY5kDJgZr77xjwwWMcMF9hImsyHy4cOqA4/bjluNUiK/CzC+p+30Q7gxefX+0sgtMvMmdgagNqlKwPCxRC+2y2ZAyychVQ6kdX3XS7MMxsth3p0OwGPCx3fseDjBtQ5Ob41dGnSUiB+xGXsvZUxWmld12BqbC8Jul6AWpbe+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gd2x321nbz9tph;
	Sat, 13 Jun 2026 19:11:51 +0200 (CEST)
Date: Sat, 13 Jun 2026 19:11:46 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH] ARM: dts: exynos: Add bluetooth support to manta
Message-ID: <ai2OYGlCx0x4NUs8@archstation>
References: <20260408-manta-bluetooth-v1-1-b7658e78359a@timmermann.space>
 <653b640e-8b61-4c60-a455-63a400b308e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <653b640e-8b61-4c60-a455-63a400b308e7@kernel.org>

#include <atomic>
On Mon, Apr 27, 2026 at 03:49:34PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2026 13:56, Lukas Timmermann wrote:
> > Enable the bcm4330-bt device for manta boards on serial0.
> > Also adds the necessary pin definitions and interrupt handling for
> > wakeup.
> > 
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > Co-developed-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> 
> Incomplete/incorrect DCO chain. Please do not reorder tags. Git does
> them correctly, so you HAD to change them manually.
> 
> You send the patch or you apply the patch so you must commit with sign off.
I developed the actual patch based on his findings. We both don't really
care about who is mentioned first or anything.

Sorry. Yes I rearranged stuff. So it should be:

co-dev: alex
sign-off: alex
co-dev: me
sign-off: me

Correct?
> 
> Best regards,
> Krzysztof
> 

Best regards,
Lukas
