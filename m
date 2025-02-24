Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E6261396;
	Mon, 24 Feb 2025 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418664; cv=none; b=CXaaxZgDp57jbC83RTBIz4vnuqRwAaSSapF6nPNQyxgePI5eT2NxI4iR0nbyrbM4cvuGHzKMWYM74SxoxIG054TkuXQ21fn3qA0JzptFFOJOwCM3mrSrbgGsMxxSABEHdrmZV9iSB/RU2iI13uFjhSmnf/zZwGx5Ozx16QMTk9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418664; c=relaxed/simple;
	bh=nodYjlJOefZx0xse0NeSGd6wU+b2GLk9EMABfMjnX98=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=tcIzvySBJOocYHAJvQPCCEV55CJHE18+CzzbMFbbxxpwqCGtx+QY/PuM5ZpeG192LzuT2i7WYYKYuKzQNnxbgRSWa6wW7WTzJrJXDR3EBwhPZrHABzIdEsShDeVPHK3nTxpVNQ7GBgzBUcS0s0kGrpuYRsze08uJGWCXVDB2NzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=NPzDdLQn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="NPzDdLQn"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0EEFE25941;
	Mon, 24 Feb 2025 18:37:40 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieNECv90bMLG; Mon, 24 Feb 2025 18:37:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740418655; bh=nodYjlJOefZx0xse0NeSGd6wU+b2GLk9EMABfMjnX98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NPzDdLQnXaXlNl329oKdVR6IJNfJoMVWQUa+Pp+K9vpaUlKed7G9Cxe0Lo4HunRZr
	 te+41HH3oobV1F8fKTb8GXJwHqIO7WGrnL/JehtUAnAIMZaphQV2OdAcsidiFd/Sr4
	 dTO2Gsn1r96UcR9oQIAeJtB2m4AW0zLNZFd9hTew7pxfCb39Fb0ZFpQ/s+5nJH1k9F
	 vs3mo+VckaOkG77lDgJI3KH5z8hJGfvMAYLZJ7YZmw83du5rSpqUiH8albuVhnLsk8
	 ld3MWSI5KgID9zkHwWWm1Z2/4brxu0yYmE38aBRcyb3J3d90Dgq/z8dLfFlbksBw2l
	 se+0/4Ev8/eGw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 24 Feb 2025 23:07:35 +0530
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v2 2/3] mfd: sec: add support for S2MPU05 PMIC
In-Reply-To: <20250223-outrageous-bizarre-hedgehog-8a3bbd@krzk-bin>
References: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
 <20250219-exynos7870-pmic-regulators-v2-2-1ea86fb332f7@disroot.org>
 <20250223-outrageous-bizarre-hedgehog-8a3bbd@krzk-bin>
Message-ID: <11387d3d0478d7fa1899ee3d0409541b@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-23 16:10, Krzysztof Kozlowski wrote:
> Please run scripts/checkpatch.pl and fix reported warnings. After that,
> run also 'scripts/checkpatch.pl --strict' and (probably) fix more
> warnings. Some warnings can be ignored, especially from --strict run,
> but the code here looks like it needs a fix. Feel free to get in touch
> if the warning is not clear.
> 
> Missing bindings.

Bindings have been applied in v1.

> BTW, don't combine independent patches from different subsystems into
> one patchset. It's not helping anyone especially without explaining
> dependencies/merging in the cover letter or here in changelog.

Alright I'm a bit lost here. The binding patch (the one you enquired
for above) referenced the regulator bindings, whereas the regulator
driver is including the S2MU005 PMIC header which defines the
register addresses, etc.

So it seems like patches from both subsystems are inter-dependent
on each other, and hence both are put together in a single series.

What should I do then? Should I explicitly mention this in the cover
letter? Or split into two? Or...?
