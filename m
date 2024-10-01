Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED93209
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Oct 2024 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727784106; cv=none; b=UoxBy7mvIAKeT5jACgVNNc4kvPwrVlsB4uAJyGgq8jTvWGCC+f/tn3vA5oS0j/SOYw5GzxSGcLV9oqfuwOFeiyBZikRrh+9/g6yd3S+OFyVhBaGLXIDh0TqJgBY3RG+cLLvlnYsF6x8dnAuB1JuRtUgEqHuyOnLqQp2ImbZqbH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727784106; c=relaxed/simple;
	bh=SkOxWm6ReG3IPYn8lSA0splI8H2tiKzYKUtZE+6cs6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+bBWDIj9hWd1NHQvzIUZ0K9UhCkavUdoMXg0L5BC3hKYlu/CW7vzSjNzV/7UjjE0n7YZTDOsTmB8CyqnjdphIIjEYnIBgBjokIGnKNeaccqZ4SDyG4ouKc+JfBpcwsP0AIQpHfarpPkXYSTueeI6dgXwbQLEXmIgnLmpvwKRDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=eXz8DlTr; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="eXz8DlTr"
Date: Tue, 1 Oct 2024 14:01:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1727784098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ntydCrZl+XdM2sqE9wMyHuSTewyBR5mR615aEY77HLw=;
	b=eXz8DlTrdnqc9gyiilMAcTyKSfNDnJN0G97g4+B4y8tWgXeIvyBHETsX/rcnR3HaBnKgDS
	qNMxcqc2LYKorgeFMSEEewOetI7gGuFz0u9sH/uMLR89pGhvIDsxuPvRuyc/4zH4vaEAQO
	WjmG+DALz6YVSQw9Gb+7pJ4qPV+fkqs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: rbredhat <rbredhat@pm.me>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
	markuss.broks@gmail.com
Subject: Re: Exynos 9810 and Galaxy S9 (starlte)
Message-ID: <20241001120130.GA6468@samsung-a5>
References: <ox4aoUGD6zuhCHC7_mLpi2rzRKjicwSSI-S2L3fhvgVT-es-WoXTm2bYukU7QuWqmGjCO6Xn7rDZtafsHu-SW2OHaPhB8Y91gxEkLcK25nk=@pm.me>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ox4aoUGD6zuhCHC7_mLpi2rzRKjicwSSI-S2L3fhvgVT-es-WoXTm2bYukU7QuWqmGjCO6Xn7rDZtafsHu-SW2OHaPhB8Y91gxEkLcK25nk=@pm.me>
X-Migadu-Flow: FLOW_OUT

Hi rbredhat,

On Mon, Sep 30, 2024 at 06:24:16PM +0000, rbredhat wrote:
> Hi,
> 
> As a Galaxy S9 (G960F, starlte) owner I'm glad to see the progress on adding the Exynos SoC to the mainstream. Is there any chance that the Exynos 9810 will be added as well? There are a huge number of devices based on this SoC:

To my knowledge no one (individual or company) is actively working on Exynos 9810.

> I am able to build a kernel from source code, but the 4.9 branch is no longer supported. My attempts to use a fresh version of the kernel failed due to my lack of programming experience. I have created a document listing the components of some of the devices, perhaps it will be useful. I can send the ods file if needed.
> 
> https://kdrive.infomaniak.com/app/share/1019122/185f83dd-e5f7-4224-bc76-ebc3e7ccb821
> 
> Some device versions have Qualcomm SDM845 SoC and are already supported in mainstream. It might make it easier to add support for Exynos 9810 based devices. For example,
> https://lore.kernel.org/all/20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com/

Indeed, thanks to the great work by Linaro, Google and individuals
like Dzmitry some of the core SOC support and drivers that your device
needs are already supported.  I think your best bet of getting starlte
support in mainline linux would be to find others interested in this
SOC and work together to add it.  PostmarketOS [1] provides a great
community for this, and its starlte wiki page [2] lists a few device
owners, and even links to a WIP mainline tree.

I have added SOC maintainers and the WIP tree author to CC, as people
tend to not monitor the list.

[1] https://postmarketos.org/
[2] https://wiki.postmarketos.org/wiki/Samsung_Galaxy_S9_(samsung-starlte)

Best regards,
Henrik Grimler
