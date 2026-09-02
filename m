Received: from mail.lvkasz.us (mail.lvkasz.us [116.203.126.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A593932C8B;
	Wed,  2 Sep 2026 00:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.126.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308026; cv=none; b=McA801J+GUHhcu9jR+GZ3Rnf+XnhZaQX03Q03UqV1TLK3SETCdng2wt7FReJZKqipAcKb3d9wNlM4BdICEBxziruAkz5poGorXUg2gnT3hrgnyNfDyoqMl5mmMgk45C7DWwLVe3Kk2L5F24/wgRCoWw0QoH9A98DA2vGuhDzrfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308026; c=relaxed/simple;
	bh=/CCCKx7u/SD1z2NkO1bJZurwMqzPzrZhPYKcLlgoSk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sQS9dubFwv7PJDLXzNgGeM6xeq//AfX69SGWFy+5Sw186kI3b6yQ1VLaVoyPIEBpqLnh3d3hmoOlhDzqutOiSbli40Z7bQuz0kjxN8ecBl8OBEnPmcAFnYUtUL2x5mI7GoSEBwFdnr/yWQpSnII50SxCpvVgvcgrTaOQywbE/ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lvkasz.us; spf=pass smtp.mailfrom=lvkasz.us; dkim=pass (2048-bit key) header.d=lvkasz.us header.i=@lvkasz.us header.b=AeS22BDt; arc=none smtp.client-ip=116.203.126.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lvkasz.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lvkasz.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lvkasz.us header.i=@lvkasz.us header.b="AeS22BDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lvkasz.us; s=pf1;
	t=1788307525; bh=/CCCKx7u/SD1z2NkO1bJZurwMqzPzrZhPYKcLlgoSk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AeS22BDtMX3vpsCc4zhlmE9WLWILrdsFNNCwOTuDGtYsojDWUPF/Y6cLP7XD7g2vA
	 pBBjHu0DYDsohnmOJgBZ7JGI4BNxLN5dQuirRObEqRQHqBtiZGfLnw46atHUcT0eQV
	 C5u4efUH+1rYSXtu8K0QjrchETNX/lbApFTAofBxnn8NwSZRexm5tvvmP3+vFl6hIf
	 fT3T6VWvP0lhxdTvtu6cY/nUlizjDDef43qSxt+1RR5Qd8OiAogMV+y6mPn1gLToRv
	 7HTrAL3a0v6eddKxde7Y0CV7Z0jUWXeCf4u32VLNct0Ti4jYtKZTk8ehFlXPBQU9aU
	 StH6MT1W4A65w==
Received: from aorus.localdomain (5.185.72.109.ipv4.public.orange.pl [5.185.72.109])
	by mail.lvkasz.us (Postfix) with ESMTPSA id 45B9BDF235;
	Wed,  2 Sep 2026 02:05:24 +0200 (CEST)
From: =?UTF-8?q?=C5=81ukasz=20Lebiedzi=C5=84ski?= <kernel@lvkasz.us>
To: selvarasu.g@samsung.com
Cc: akash.m5@samsung.com,
	alim.akhtar@samsung.com,
	andre.draszik@linaro.org,
	dh10.jung@samsung.com,
	jh0801.jung@samsung.com,
	kernel@lvkasz.us,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	muhammed.ali@samsung.com,
	neil.armstrong@linaro.org,
	peter.griffin@linaro.org,
	pritam.sutar@samsung.com,
	thiagu.r@samsung.com,
	vkoul@kernel.org
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent OOB access
Date: Wed,  2 Sep 2026 02:04:37 +0200
Message-ID: <20260902000439.25379-1-kernel@lvkasz.us>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
References: <20260831070309.158069-1-selvarasu.g@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tested this on my Samsung Galaxy A6 (Exynos7870) with this patch applied
on top of mainline. I wanted to verify the OOB read first before trusting
this fix, so I forced the device tree to request PHY index 1
(phys = <&usbdrd_phy 1>;) - this index does not exist for this SoC,
because the phy_cfg_exynos7870[] array contains only one entry. I added
a temporary pr_info() call after assigning phy_cfg in the probe loop to
display the phy_isol/phy_init values using %pS:

  i=0 phy_isol=exynos7870_usbdrd_phy_isol+0x0/0x60
      phy_init=exynos7870_usbdrd_utmi_init+0x0/0x260
  i=1 phy_isol=exynos5_usbdrd_phy_isol+0x0/0x50
      phy_init=exynos5_usbdrd_utmi_init+0x0/0xc8

For i=1, both function pointers resolve to the exynos5_* variants
instead of the exynos7870 ones - the OOB read lands right on
the adjacent phy_cfg_exynos5[] array in .rodata. No crash occurs, since
these garbage pointers happen to point to valid (though unrelated)
kernel functions rather than something invalid.

With the patch applied, the same debug print shows the loop correctly
stopping at n_phy_cfg=1; i=1 is never reached. Boot and USB both work
fine on the actual PHY index (0).

Tested-by: Łukasz Lebiedziński <kernel@lvkasz.us>
