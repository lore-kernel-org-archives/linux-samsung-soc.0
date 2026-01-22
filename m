Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2122D32BF43;
	Thu, 22 Jan 2026 15:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094401; cv=none; b=kyDCtSao1m4K4os+O6MXL6xVSOJ/9g8Q3TxUTs0kcVK06Gvfftze9YRM2HDavdsQ6iv1WUfi4D9AYn620Lgddl5xUEnCKLNGA7E3wMoySkl2sDHCi4uUQv1pMqJEqFKc1gVWqb0vUqYi0ALreJ3O2ZXV0dn1gGKfCzNZKHh0gHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094401; c=relaxed/simple;
	bh=grnlzAExfoV6G9ahrdpKeaFu1Zp25XCBFXmtxypYY1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jbh1skCh/s7E4ULUFkgk+UyHNwO3bm73XK4G96BOB1mW6J4voOm6fh0ybFtRUmAdavJdGrv2tHb/n94Jx8KpvHBRzMTN5J095yKt6RK5k2vqyz2Q8rpe+9lux1PMMf7Tw59gFTwXdx3GEXNTLv9d1+sk6o/o0J6l+p9NUNt52SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUMTE2jl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUMTE2jl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BA2C116C6;
	Thu, 22 Jan 2026 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769094401;
	bh=grnlzAExfoV6G9ahrdpKeaFu1Zp25XCBFXmtxypYY1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUMTE2jlvNOo76xSxS65vqSRwG4ztLTz5IIzNF6k/k8JshLCqUyf87eG3oVTdIgi5
	 S2aPE0aWCPVaKzRG6jkxJShzFB5LTvTQWXDbs0gIQ6AEwN+IHJyoYq8sQmoxfXJM3G
	 ScYX2nQKbnEAFsjD8HqJCij0WgMQ5WX+LZlH3mkGof7IAZl3fKb6mq+qe41MT+yvPV
	 PNQ/UvAJEDco6i0ZklZfTWubZg3ANkYNfzXKhGytYQE38Ajye128u3ZUzDzqx7uZRj
	 nzY40lUO/cQApEK0VfBMH2JlDA7jWziOlKgdJB64N5IjdeIggAUqQwXS7IYFzFIELs
	 19Jt/A/1AC++w==
Date: Thu, 22 Jan 2026 15:06:34 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <20260122150634.GK3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>

On Mon, 05 Jan 2026, André Draszik wrote:

> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
> 
> --- dependency note ---
> This series must be applied in-order, due to the regulator drivers
> depending on headers & definitions added by the bindings and core
> drivers. I would expect them all to go via the MFD tree.
> 
> The MFD patches in this series also depend on my Samsung MFD patches
> due to patch context:
> https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/
> 
> While these patches compile, regulator probe will only be successful
> with my deferrable regulators patches from
> https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
> --- end ---
> 
> The patches are kept together in one series, due to S2MPG11 and its
> regulators being very similar to S2MPG10.
> 
> The Samsung S2MPG11 PMIC is a Power Management IC for mobile
> applications with buck converters, various LDOs, power meters, and
> additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
> a main/sub configuration as the sub-PMIC and both are used on the
> Google Pixel 6 and 6 Pro (oriole / raven).
> 
> A DT update for Oriole / Raven to enable these is required which I will
> send out separately.
> 
> Cheers,
> Andre'
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Applying patch(es)
Applying: dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
Applying: dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
Applying: dt-bindings: mfd: Add samsung,s2mpg11-pmic
Applying: mfd: sec: s2mpg10: reorder regulators for better probe performance
Applying: mfd: sec: Add support for S2MPG11 PMIC via ACPM
error: invalid object 100644 11a56154d36d251d40b40e91da514db0faa15ae3 for 'drivers/mfd/sec-irq.c'
error: Repository lacks necessary blobs to fall back on 3-way merge.
Patch failed at 0005 mfd: sec: Add support for S2MPG11 PMIC via ACPM
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"

Doesn't apply to `for-mfd-next` or `ib-mfd-rtc-v6.20`.

Please rebase.

-- 
Lee Jones [李琼斯]
