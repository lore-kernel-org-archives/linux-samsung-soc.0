Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2F207669;
	Fri,  6 Dec 2024 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733491695; cv=none; b=UX8+7CymCM+LhCqWuOmnrngtUSzlBsCWFPboRAQVRfzQdjieeQINY4HngI4tCzkx3CUTq328PebKaXyN0MnuWxmFAzXey7L39PTeZ4Xu1wN+Ri5AW8A/iDphBSwFtP7BEEs0VbmcJPXBnhS9C/qeQXQ0eUzHYA/XN3SnNUx1yvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733491695; c=relaxed/simple;
	bh=bFR90d84PsBBGdYbcFgonL3LS296ISMzvCAGR/chLOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YME/OzlB3kIYPKmVohvtQsDrNU+8+T4d3KjGn9gxYFpqv8sg7BiDRBU1G1z24LZNrC4ly3wUNYLyOYJ/UHrJJnbX/n9VyGfLRGH8OxHx/T1FzSazYzCkQ1nzFHFRfGGU4EfN3Dr/JfQt3vP8YBJbRQubOKUWKTHNpIvKj0t2LHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKMTKk5e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKMTKk5e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447E3C4CED1;
	Fri,  6 Dec 2024 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733491695;
	bh=bFR90d84PsBBGdYbcFgonL3LS296ISMzvCAGR/chLOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKMTKk5epQMKByKTi5i0KAnyrgICV7xyMkPuNJ1HKvOBLdN6en6rHhisvmkYUQFxG
	 /yCuucXQBisQYMa5fTTVRje9QUUshvMsVCFHbdtPJWpptmcdW/IpBmxIEmyigot+zM
	 JG9IHN1Glun/YJ/A8iR91QY6cYeyZOIGLsH+NFZ5gkLXv2g/jePI2NP9RICzlyMMfi
	 vSoOk4rktxp9t0NwMZPn0cUBrPlVLwriECqXAvwcArt8xS/xxHSaSnyYEwR34ez0XB
	 algZN18bS6LhiOYuOOO9uOUy6+IS5OvmdGf0BG1yA0sOWiOpGDu9qHrYWvViRXESbB
	 rAMN47dO6+xdA==
Date: Fri, 6 Dec 2024 14:28:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, kernel-team@android.com, 
	willmcvicker@google.com, peter.griffin@linaro.org, javierm@redhat.com, 
	tzimmermann@suse.de, vincent.guittot@linaro.org, ulf.hansson@linaro.org, 
	arnd@arndb.de
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Message-ID: <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>

On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config EXYNOS_ACPM_PROTOCOL
> > +	tristate "Exynos Alive Clock and Power Manager (ACPM) Message Protocol"
> 
> Given the importance of this driver where a lot of PM services rely on, does
> it really make sense to allow it as a module ?
> 
> Some PM services may be needed very early in the boot process
> 

If it works as module e.g. on Android, it is beneficial. I think the
platform was booting fine without it, at least to some shell, so I can
imagine this can be loaded a bit later.

Best regards,
Krzysztof

