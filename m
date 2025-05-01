Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA681F1516;
	Thu,  1 May 2025 11:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746098287; cv=none; b=ktvgt1XdvCWKrdRBSShsdN0VFIQNnJIh+lePWAjOfVYthsnS9HtzqxV2eMTdiDqFTOdguKVOTISbUv2Psjfe+hYZxJIcavK92oVWARMvTU9ZiqK2D2izpqSElc2CAqwyB2r1ZMR9Lxv3VnFvsRh71HyQLGpj7mZJqkrGDV0rO6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746098287; c=relaxed/simple;
	bh=M+TEHKrX1ITU5RxyRfhfDldVttVCWJHNyt+W5XTDOhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NF/OBPBZbXrGCSLZxp8uUdXc42Yxq4jrPzz/krBVU1Al0hMQIrQs8rC9IC5UaG7JtaorEwlneQ4Fns8OxoCGFy4bIC8eJ+cVCKkmfcWZ3dT+L/5u9c32FwDw0uua62OeK/geXmpPefei31AGZq1WtuD6BX0g+uqDNhSPniB/VnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZwGFe3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RZwGFe3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE149C4CEE3;
	Thu,  1 May 2025 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746098287;
	bh=M+TEHKrX1ITU5RxyRfhfDldVttVCWJHNyt+W5XTDOhY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RZwGFe3kcccqu3t0IVRYGKOGspinPsZKk882EEh49/sh5YgQM84oTJU1Bd/ncwP6q
	 pYmoc7CgojNHXaKQRhDEAgz/uycDRnoQ90Ir5xwZip3IaoQBmH5FmE1qSrtwZPfMSE
	 c9q6nOSD/Y8oz3c7vPYSbzWTgaIjSP6oPOYz8qFZuJ36FJNvSOoHXEmdgvfoH9s61e
	 u59tDUF/pr7hPUgd18c0gMpE1TcIUcSp6ikuDHetaE8R24qjFfoaKSkdqqxKx4r6Gk
	 /DFi3RINn8t3fHxvr3UmW5ZfekRW/jWEDnlsWkgXWVQwMiupXTf8k8c0GllyPkeEyA
	 yBGmlY0blnRhw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com, 
 s.nawrocki@samsung.com, m.szyprowski@samsung.com, ideal.song@samsung.com, 
 beomho.seo@samsung.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
References: <cover.1745247209.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2 0/3] mfd: exynos-lpass: Fix some error handling
 paths
Message-Id: <174609828442.3756623.12093382132101705631.b4-ty@kernel.org>
Date: Thu, 01 May 2025 12:18:04 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Mon, 21 Apr 2025 17:00:32 +0200, Christophe JAILLET wrote:
> This serie fixes several issues related to error handling paths in
> drivers/mfd/exynos-lpass.c.
> 
> I've split it in 3 patches to ease review, but it could be merge in only
> 1 patch if preferred.
> 
> Patch 1: Fix a leak in the error handling path of the probe. It should
> be straighforward. This patch is already R-b.
> 
> [...]

Applied, thanks!

[1/3] mfd: exynos-lpass: Fix an error handling path in exynos_lpass_probe()
      commit: 8cc4952d1e8618eff474dc7154c6537db88178df
[2/3] mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
      commit: cb931849ec1e71900eb54d0a377ae30e0bcfcffa
[3/3] mfd: exynos-lpass: Fix another error handling path in exynos_lpass_probe()
      commit: f408e20757afa3d8c719a8a804cd2c83262514dd

--
Lee Jones [李琼斯]

