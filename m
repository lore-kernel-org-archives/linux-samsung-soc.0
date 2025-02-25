Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C0B17AE1D;
	Tue, 25 Feb 2025 18:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740507314; cv=none; b=c4hpOg8wDi2JZmQRZGfuE7gVPzHh/gm9Omgf21mVtEufoLiLo513QxU4sJnmxB33IRdhVmZPW4O9vKuXKiu0syKFMOCFJYVsH5P9FPcKj5rM2ygssT6UsyIEoBUS649lzRRDMN6EqhbmeVoSQ/URgUoDUtuzomASwrrfo6qVDYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740507314; c=relaxed/simple;
	bh=XHxdY81R8t+/RmvatRzuo6jUL/I2H2cPlYYvQNLa43k=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ENgMqwc4wsGenYTziU63UuPW04NP7OIuqHonXC2cO1SOv6pM8oxjGcCVXac/RkNVEFeWqq369kR576FmSxxoXd0hCsCaGmsL5B+mq5ipn8bNgZXJGZWUcUdlOmlcPqYeqXVnCCpjSWP6vQ94zVXhBidfBiPSMf9lyLq3nX4Gaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=P5OkpPjp; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="P5OkpPjp"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id BBD4F258EF;
	Tue, 25 Feb 2025 19:15:03 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mv2hwPv3ETNy; Tue, 25 Feb 2025 19:14:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740507282; bh=XHxdY81R8t+/RmvatRzuo6jUL/I2H2cPlYYvQNLa43k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P5OkpPjp9cgPggD/4AL6BT+aqzuGhKIkiM6xNYlh84BqmaR/9chNG2xEpoD6+8Pkb
	 nwuQ4vB9U+LKkGl/nw10aPCAPH/zuxBVHQEq2fpRn1HzG2JBDWAsKC3QyCQD/I11pr
	 DCKQQQ/p094atnD+I4uAwJgw2DqzUxMcQqJJgivniPsjNmp+yfEyukqyckiHPYqTfn
	 uZYXyO0fhHqagN+ypR7VjuOhFPv5J9a2bj/iRIFivvzNxOdpKu03hPxnZnbSFLFuYc
	 G6MO1WpKHNQhoGCzlr1LwkejeypdMC2nb11U5mpFwA8zUrEgC1yXfs9J6IK5N/1Hjn
	 5UKqBGH/tx4eg==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 23:44:41 +0530
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
 <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH v2 2/3] mfd: sec: add support for S2MPU05 PMIC
In-Reply-To: <07634537-0750-4616-9c88-800d1672dcfc@kernel.org>
References: <20250219-exynos7870-pmic-regulators-v2-0-1ea86fb332f7@disroot.org>
 <20250219-exynos7870-pmic-regulators-v2-2-1ea86fb332f7@disroot.org>
 <20250223-outrageous-bizarre-hedgehog-8a3bbd@krzk-bin>
 <11387d3d0478d7fa1899ee3d0409541b@disroot.org>
 <07634537-0750-4616-9c88-800d1672dcfc@kernel.org>
Message-ID: <69c58c0ba04ad85f0ddd3f379bcb8390@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2025-02-25 00:48, Krzysztof Kozlowski wrote:
> On 24/02/2025 18:37, Kaustabh Chakraborty wrote:
>> On 2025-02-23 16:10, Krzysztof Kozlowski wrote:
>>> Missing bindings.
>>
>> Bindings have been applied in v1.
> 
> Heh, I see email from Lee now but mainline does not have them, next from
> 19th Feb neither.

I see it in lee/mfd/for-mfd-next. [1]

> 
> BTW, what happened with all the review tags? Nothing in cover letter nor
> changelog explains dropping reviews.

Haven't explicitly mentioned dropping the tags, but I've changed the
macros a bit, among other things (which is mentioned in cover). I assume
that's the standard procedure.

> 
>> 
>>> BTW, don't combine independent patches from different subsystems into
>>> one patchset. It's not helping anyone especially without explaining
>>> dependencies/merging in the cover letter or here in changelog.
>> 
>> Alright I'm a bit lost here. The binding patch (the one you enquired
>> for above) referenced the regulator bindings, whereas the regulator
>> driver is including the S2MU005 PMIC header which defines the
>> register addresses, etc.
> 
> You have entire cover letter to explain dependencies and merging... If
> you target specific subsystem - write.

Okay, I do have that in there, but the wording is indeed quite vague.
Will try to improve it in v3.

Though the PMIC's dt-binding patch has been merged... so not really
sure what to assert now.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?h=for-mfd-next&id=d237e8037d524bc5683d27268086620c5df605ea
