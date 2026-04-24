Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B71327C18;
	Fri, 24 Apr 2026 04:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777003289; cv=none; b=p6R40SE3J+U+W9DlTuuG5//PfrIDtApMya1PaIzVPV69b/RruRX5kdqLOfySILDoFG8qweWC/GN4z0lzurt+Y0ia1Ip6jdzo2pUmgtA27kPwcMbsWxLqSwtbx7/UuIevJg9655wmlD+F70SC3GyziR092v6fBbEX47Bqb825Pbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777003289; c=relaxed/simple;
	bh=jTGmrbwqIKW5nu0OCfYcOjchlKqqoPMGuMCIVccoibs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lv6xHkDMngijzWkYc69V4cRAYtdK5CUFSep8dOL57yl3m5F7XzEiAt+Kua0rTShVmrNmsDrrfk4LJO+DsajBz3BrOECqygWXzkAgSxOrZEXtU6EGtaHfV6yLLX/dVTACTnxySynjpO0jSPJATL9K4FYxQVtwgSkD7Wx13uCND8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KsYxnd6f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KsYxnd6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75697C2BCC4;
	Fri, 24 Apr 2026 04:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777003288;
	bh=jTGmrbwqIKW5nu0OCfYcOjchlKqqoPMGuMCIVccoibs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsYxnd6fiWPw60g7LxXi06hJmnhBCMnXHwd7AERquIqjzGgFuv4Bp1r0EQTZpXYEv
	 GuuDzhMWToXKcCNukxIFXGp92fsmbG4Vx5VJFCIew+YFSiTl4ZF8ZGYJ/cmO0IfmFE
	 ETsa9VqAgopxKNCtmaEdPfKVeUr5SmaL5pr5iqtA=
Date: Fri, 24 Apr 2026 06:01:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saifuddin Kaijar <mailtokaijar@gmail.com>
Cc: security@kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [SECURITY] Samsung Exynos SROM: Out-of-bounds write via
 unchecked device tree bank parameter
Message-ID: <2026042436-unnoticed-barracuda-56e4@gregkh>
References: <CAD7tK9b8VFPan6tMmOv+_juaYc1Ycfy6t4DoioKDeLGE7ECqeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD7tK9b8VFPan6tMmOv+_juaYc1Ycfy6t4DoioKDeLGE7ECqeg@mail.gmail.com>

On Fri, Apr 24, 2026 at 04:40:47AM +0530, Saifuddin Kaijar wrote:
> Dear Linux Kernel Security Team,
> 
> I am reporting a security vulnerability in the Samsung Exynos SROM driver.
> 
> SUMMARY:
> Out-of-bounds MMIO write due to missing validation of device tree bank
> parameter.
> 
> COMPONENT:
> File: drivers/memory/samsung/exynos-srom.c
> Function: exynos_srom_configure_bank()
> Lines: 74-100
> 
> AFFECTED VERSIONS:
> All kernels since 3.15 (2015) up to current mainline (6.12.1)
> 
> SEVERITY:
> HIGH (CVSS 7.8: CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H)
> CWE-787: Out-of-bounds Write
> 
> DESCRIPTION:
> The driver reads 'bank' parameter from device tree without validation,
> then uses it as an offset for MMIO register writes:

device tree is trusted, so this isn't a valid security issue, or
probably even a bug at all, sorry.

If you wish to fix this, please just send a patch to the developer and
mailing list.

thanks,

greg k-h
