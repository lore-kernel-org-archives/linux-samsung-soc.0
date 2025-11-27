Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A332E143;
	Thu, 27 Nov 2025 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244417; cv=none; b=FmytISwVLC6m8WMyUkor/dDj0+4726WakuqhY3VfkyjeEbMb9LgEMhvbzifHDqCYZnsVDx0mHcZoUPpO++lfEzbsdm5TGejp9v/Veoy+6oK5ilcWIPF3FJMBtH/8RXtRv0sWSOBf9kUPFuF4ra5NkNaXHH7XdH8Bdd7Hy+m0ZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244417; c=relaxed/simple;
	bh=xas5HHGro67/VkfWABye1PgK+vVdAKKy6nYv/DW/aG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIyTDTxYODXVoKBKwALCwMz7VAiLXpHUoZ50G/CgQIrygK/DRx4Qjp6CuZtUcw6WQd6sz0WHFt0LcvgvBcj3zOY+4HWoD6YzUt9HvokpETgxs+K7mKP5Ci7mPu5SD46YFrXJD2BbjQifTGZyGtE6fQtl6jFyxKFj4DD67X63X/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dHFF55Y2Mz9sxm;
	Thu, 27 Nov 2025 12:53:29 +0100 (CET)
Date: Thu, 27 Nov 2025 12:53:25 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v2 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <d5yeuok5pqn36arg2fxexhpspcjnsamczbbglarf7itt7wvefx@fjkexpoa4rfi>
References: <20251125-google-manta-v2-0-0f097cfff39c@timmermann.space>
 <20251125-google-manta-v2-3-0f097cfff39c@timmermann.space>
 <20251126-mysterious-pearl-cuckoo-b45d59@kuoka>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-mysterious-pearl-cuckoo-b45d59@kuoka>

On Wed, Nov 26, 2025 at 10:24:02AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 25, 2025 at 04:12:42PM +0100, Lukas Timmermann wrote:
> > From: Alexandre Marquet <tb@a-marquet.fr>
> > 
> > Add an exception to let the secondary CPU boot.
> 
> Please say here why.
> 
> > 
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> 
> Best regards,
> Krzysztof
> 
> 
Okay, I will fix that in v3. Thanks

Best regards,
Lukas Timmermann
