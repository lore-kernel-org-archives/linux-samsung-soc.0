Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273EA2F99BC;
	Mon, 29 Sep 2025 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140121; cv=none; b=DP7PhIW3jP+yT117R33lFrhZQpBSMCIBGBPISZXZ58c50/Dt0dGI/ndO2NELNZZCcYb7DIb7HjiSz0A9aO/BimQy3oAavBsDSXLf8kwP4I9NcJV8vZrWt/rtGcAcZLdQ83rMNXNAo3phuHsPydm3lQbPo4houvQMX/iEq/2Bx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140121; c=relaxed/simple;
	bh=p5krCsk5tEj0RdSxxcj8uuSew5hXh67QcWAkeZl0lPU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Eu5e1UG3wzA7TbZq6nZLClvhWn+BrYP0Au1dp5D3xxiyTvXewwV/uc/SofK+NpQYAp4gYoU3PId89Se2NxN7Z6Qsl6rpLfYyhmY0hA/QMmXdl+6AxMrGwP1RWgPbLn3sp5H1EWgZLQNHNNt4BnUgy+2KNSH/k939ZUtAPAEG/2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=mCn1xxc+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="mCn1xxc+"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6163C26106;
	Mon, 29 Sep 2025 12:01:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgPnpGQdaUeP; Mon, 29 Sep 2025 12:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759140113; bh=p5krCsk5tEj0RdSxxcj8uuSew5hXh67QcWAkeZl0lPU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mCn1xxc+q+DoWnlmWYOr7lHIiwRv2WiGUM0nRQf4DYQBoWaBgTtR3UOYAielY4p8i
	 CaXZMlCYoPfDlfpVgEz2Twp26sitmR05DJvZoUsW5SOxJTilElHaBbAeavd7MpSQIJ
	 UFhMk698GAEB52fDa38Sdi5zg06FWY8q6wwMwYiPZVmz+JrOxrPtHrye89W2qTXgBe
	 3YwYA1lt1rWyrL2X+Nu+OGMYiGN94KGTAZrQJxJvdrvn6QWPUCQIO9qJDsTWgcpHTr
	 SN94jA9yjup6okXHquhbyticue/tb9AZj2de3wexH/vJnEiQaPR0KsiH1exu326ACJ
	 97Ye3k4miEzGQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Sep 2025 10:01:53 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos7870: relocate ${x}-names property
 after ${x}
In-Reply-To: <CAJKOXPf+fASV2WP+ix_6qb+L-0WqsqLAG7K7FxeQgscsbOUsOA@mail.gmail.com>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
 <20250928-exynos7870-dt-fixes-v1-1-a40e77a73f16@disroot.org>
 <CAJKOXPf+fASV2WP+ix_6qb+L-0WqsqLAG7K7FxeQgscsbOUsOA@mail.gmail.com>
Message-ID: <6dff1e8256f3d0932d1f5ad941e129db@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-28 21:56, Krzysztof Kozlowski wrote:
> On Mon, 29 Sept 2025 at 01:44, Kaustabh Chakraborty
> <kauschluss@disroot.org> wrote:
>> 
>> All ${x}-names properties are conventionally placed after their
>> corresponding ${x} properties. For instance, 'clock-names' must follow
>> 'clocks', 'interrupt-names' must follow 'interrupts'. Make necessary
>> changes to follow said convention. No functional changes made.
>> 
> 
> I don't intend to take such cosmetic changes, because they interfere
> with stable back porting, unless we have a tool for such cleanup. Did
> you use my prototype tool for that or some other tool?

No, I did it manually. This is due to your first remark in [1] and
my corresponding reply in [2]. What do I do here then?

[1] 
https://lore.kernel.org/all/6f0451ee-ddb8-4ded-8f0a-b491de9cc308@kernel.org/
[2] 
https://lore.kernel.org/all/00240935c664edaec3092354a303a91f@disroot.org/

> 
> Best regards,
> Krzysztof
