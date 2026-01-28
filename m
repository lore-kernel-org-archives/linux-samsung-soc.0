Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBC3225390;
	Wed, 28 Jan 2026 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620678; cv=none; b=LDWgCLmKZTQpp9q7UMdSrT4AVj3WZ1m78TTna50q/W8g/wUmk4RmP0Mk+8muZidf5AoyVmmlZ6REOAl9/hxFeEO3qdWhEWmcFQilh0D+SacUlNc8cYRSGRd4ot//9AT2ITJShFWa5k8w5tdC+iHa09dUEoUJUzyVfUmUHylc/OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620678; c=relaxed/simple;
	bh=2CMFkKWYqAiPJqedGOMih8yrSq49djeQXlILBKYzmzI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DKv7vj/kIbcuab4cZk1g7EgYybw2Kwq2Pomaa2LNzVzQkG4DJC2O5jdvf7YDW0c0xEOC1P4nCOtbWhUywQHCV6u36M3+dioqiJv10xRKRLHOs6S1oHpnsJd2CO4KWV7927Psr+ycsdPK9FgYLxfn6OsSprt+iXE3W4ONmpHwg0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=FnH6M/LE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="FnH6M/LE"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EAF64279C4;
	Wed, 28 Jan 2026 18:17:47 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JSSomJ4dRYpG; Wed, 28 Jan 2026 18:17:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1769620667; bh=2CMFkKWYqAiPJqedGOMih8yrSq49djeQXlILBKYzmzI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=FnH6M/LE6xRvSd3BCxukBrBdzw9jV5ENDKtDMtHsNFgtczSxak0z1Vgj2MIXluCJ2
	 DfnsSqIXb5Fvbcdr9BB++GU84i466rHHEkJ7A5G0234h7xBsfIBEIXQCZIA87ctQt8
	 9E/gq9/BZ8BnTtFuQre3vA3bvHTy/xxWNBB3LBDyjNUvAhSPYSUnZhR8RRkokbAdM/
	 a/xpyiXZPJxPKBidcQVS6wHOBJNWvuXhbbxz7EcJESEXSCFvQ8w6Wqy784F/iiY6i2
	 xif2IYytwsuS6DOgS8r39Jc8+mYgPqir56vni7MZ2lJkF6VXjRS1VChwk6JHvq0ous
	 gtxLEsJBJpO9g==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 22:47:38 +0530
Message-Id: <DG0E63PNXEGU.1MAVGEG49ZV87@disroot.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Rayan Marzouk"
 <rayanmarzouk743@gmail.com>, "bluebunny" <kalorin.bok084@passinbox.com>
Subject: Re: [PATCH 0/2] Add device tree for Samsung Galaxy J7 (2016)
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Rob
 Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Kees Cook" <kees@kernel.org>,
 "Tony Luck" <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>
References: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
 <abc5995e-3b29-4e0f-a091-40797f1b6abf@kernel.org>
In-Reply-To: <abc5995e-3b29-4e0f-a091-40797f1b6abf@kernel.org>

On 2026-01-28 11:58 +01:00, Krzysztof Kozlowski wrote:
> On 24/01/2026 21:05, Kaustabh Chakraborty wrote:
>> This series introduces the device tree for a new Samsung Exynos 7870
>> device =E2=80=93 Samsung Galaxy J7 (2016).
>>=20
>> I have acquired permission from the authors of this patch to upstream
>> this on their behalf.
>
>
> Thank you for the patch. My tree is currently closed for new features
> till the end of the merge window. I will review and/or apply the patch

It's alright, I did not intend to have it picked up in v6.19 release anyway=
.

> then. If I misjudged this patch and this is a fix, please let me know.

It is indeed, not a fix.

>
>
>
> Best regards,
> Krzysztof

