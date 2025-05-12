Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F12AD18;
	Mon, 12 May 2025 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058529; cv=none; b=P9f3MCXEml31ogyrl0iZWBN8lynrp0qYZv9r+M6UHcfriqPk5Th5JkSFbAJJ/nMun/PrxrghRXxLQ/Bhdf2oH4CWDU8OtNuNE5dLeA9grI1ISY5/U3EMqvsaILlN5kG+Z36cRG4jFLLR1h0XDeabCMaSGghXV4eqGf0A3GnjwUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058529; c=relaxed/simple;
	bh=KN51EL+e4VUtFwp7G7kO6TE/8vRbhxJnqwxzLoK8Z7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJ6efnf+t/JZOOLMCRJRM0iqyGKWP7FwhZTa3GRsUqDIRKflzoL2QDVYmTql30nxxCwscNzLExQ+ZYJALO2+5cf8AOMFUnkxfCX7bmjyCs5rTHICGYpWqgXMFMRHMB/7JfeikUvpeHH43BeD+Rb/Z4GMeJINAunNtfZPfxlJBAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Vmd870Wt; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Vmd870Wt"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CC0743912;
	Mon, 12 May 2025 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747058525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3TRMmycxHOQ79R3VMJurcxx8hZEsQrWPdGeODqMNcc=;
	b=Vmd870WtRHsIOA6Yr7wFlzOG4AmNyCWFvocZMUvnqrE8yWUTp27MGDROkWw1/AglWncaXv
	+vj8GiQu90rRrZrWpiQnGj5nYeLthGJAxAyMirLdRtqA1kbVvjXXsj32yYMDVxfg2TnvNT
	YRTdEcq8iGDdwsthMOYJinZJyPHGL6ak4+BGsiBYdNDeEq20hap0dLm7FSJLKFYknxQWo/
	j6NMEKqWHQsdsRDjzuyjoBREAvCU+TV+4cCS+Nx3op1D9Im/DA6xYSh75ycr6Hk31DkA+N
	a6nxiISEpD8aBsL4L5+roNOI89e6Oo7wYscVzKIbGUMk2uWhEmnSu9HERElAjg==
Date: Mon, 12 May 2025 16:02:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Louis Chauvet <louis.chauvet@bootlin.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/22] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250512160201.7d0b21d8@booty>
In-Reply-To: <4yeqvg3wnlr2bhb54zutgqpkehrodat5w5x4rr5qjlrc2ts3pz@gr2iosycclpl>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
	<20250509-drm-bridge-convert-to-alloc-api-v3-2-b8bc1f16d7aa@bootlin.com>
	<4yeqvg3wnlr2bhb54zutgqpkehrodat5w5x4rr5qjlrc2ts3pz@gr2iosycclpl>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddugeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfejhffgjeelkeeftdekfefgteekgefhleelueeijeffieekieeigefhledtffetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigr
 dhinhhtvghlrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Sat, 10 May 2025 10:43:04 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks for looking at this series!

Unfortunately the exynos patch is still needing a decision. Quick recap
of the story:

 1. patch was sent in v2, nobody acked/reviewed it [1]
 2. was applied by mistake to drm-misc-next [2]
 3. you pinged maintainers, no reply do far -> should be reverted [3]
 4. Louis (fomys) asked on IRC how to handle it, no reply [4]
 5. in this v3 I added a revert (patch 1), no acks/reviews on it [5]

[1] https://lore.kernel.org/lkml/20250424-drm-bridge-convert-to-alloc-api-v2-14-8f91a404d86b@bootlin.com/
[2] https://lore.kernel.org/lkml/832a9db0-cf8a-4d35-8a98-08053fbd6723@bootlin.com/
[3] https://lore.kernel.org/lkml/20250430-arrogant-marmoset-of-justice-92ced3@houat/
[4] https://dri.freedesktop.org/~cbrill/dri-log/index.php?channel=dri-devel&highlight_names=&date=2025-05-07
[5] https://lore.kernel.org/lkml/20250509-drm-bridge-convert-to-alloc-api-v3-1-b8bc1f16d7aa@bootlin.com/

What to do? Proposed plan:

 1. Louis immediately applies the revert (patch 1)
 2. I send v4 with the original patch to hopefully be reviewed/acked

Plan is OK?

I'm assuming Louis doesn't need an Acked/Reviewed-by for that, but I might
be wrong, and we both would like to avoid further mess.

This annoying issue is taking much more effort to be fixed than it took
to develop it. I'd like to get past it and think about the next steps
in bridge lifetime management.

Thanks for your understanding.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
