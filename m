Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90CA3FCB39;
	Mon, 29 Jun 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727778; cv=none; b=nXBnHjRZ0+j2Rfo/yLfADwODaxvgklht483B18KRXPYBwO8vV59CZnH0V2Bs/a9e5FzYxO/i/4joHzvMUDC/aCATGGxuugYkYJVIXGMSrLTiM8De76mKzZpwwn0ajr0jJFmePNbOsHsiohurN3U4VTk74tQJF5YXiimFJ48+GAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727778; c=relaxed/simple;
	bh=Et0uavzmv/SxXLPbtk+QoTCr6RwqnUuBleOwUP3+TRE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mSm8Dl/3uz6lCbrS20KHo9jw5iARL2lAgK0rxLAjKPdKJxlm+rykhmmI8uUQr3JA4G8TxWb8rE3W7mrdv18n766Sr+2PA/vsqK6Yuux/2r1+bQUIk42DDTMxOvp++MC06cSbKqz9v2+xN2TROj5RnxYG7nc6xmTLFBCeiRnZtdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmfFTYWs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmfFTYWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE3F1F000E9;
	Mon, 29 Jun 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727776;
	bh=/rGtdlYc+3NGXJ5SThG5OuFaIxnpLuVSU21ppHeeTyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DmfFTYWsg9uqWg3J06bzxHu6cgNgUnuIr3vjYwhAVGmpFfqFBEAlt9JdQuM8KFlj1
	 cq0lkfwjsqa3vVqZZSHI68xV4mCiu9YFx3wuTC7FclG51B9X3zyOHWK1DXkst9WHdO
	 OELYb5/bLD7gQe9WUs2DL0cyhIUYNcyhRsLG1JUzskm0lB5PA5tAFipOrqY0Y1GPLm
	 wZq2tgiBUQXOa/vhwVqeFdWn/xVzQubraEc8ED5zF62/dIZJTggmBpw0BEUKLpTi7x
	 PNSwg+Ncc/7lRBB0VZSUe+b3SgjE+RoCr9c2ay8pd4fiblVnjU8Z4QDtiPvZC2z6vK
	 nGoLI4S8ELxDQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609143852.1783558-1-geoffreyhe2@gmail.com>
References: <20260609143852.1783558-1-geoffreyhe2@gmail.com>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: fix of_node refcount leak
 in exynos_get_pmu_regmap()
Message-Id: <178272777301.113362.3372893178879769060.b4-ty@b4>
Date: Mon, 29 Jun 2026 12:09:33 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 10 Jun 2026 00:38:52 +1000, Weigang He wrote:
> exynos_get_pmu_regmap() obtains a device_node via of_find_matching_node()
> and passes it to exynos_get_pmu_regmap_by_phandle(np, NULL). With
> propname == NULL the callee uses np directly and does not drop a
> reference, so the reference taken by of_find_matching_node() is leaked on
> every call -- including on each -EPROBE_DEFER retry of the only in-tree
> caller, exynos_retention_init() in the Exynos pinctrl driver.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
      https://git.kernel.org/krzk/linux/c/fa476d53edd24e8105faace04e881b9c4179738f

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

