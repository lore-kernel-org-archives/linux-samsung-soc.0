Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB2927A45A;
	Wed, 14 May 2025 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222656; cv=none; b=SzGJp79JdbZMRxczMxa4UCZI8/Koe37qLyrga+CTXBt/bwjZ4QCueYMH33ATGymEH6Q3vBsOUDP9jWNIekBUrYdRCKp9pHei+uL5J/5DdFIwfLyL8hhrGMi4vyHHCCSqC8fgf+o7QBK2BZFopddh6BbsyYYGyRLSQrraQrOMp0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222656; c=relaxed/simple;
	bh=KQlF40JSsgpURiVONi58XyU8oHv/LUiQF6gKP7AnrzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RJZimMienmEYl4UP0dVJ4luLoe2G73RRigNZ3eA4r2upFuH3DZXapMYU44otDq82nmwSfq9QdM5D+5ISJEFGdIsOY/quOI/A9aD8Zo45sx4/J22rRnWJ3sfj2bdFXli+N0XcIP7SCB1wLBbAz6b+4eRcnSS9S0qy0ccGvy4niy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elXe3iGk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elXe3iGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C82C4CEEB;
	Wed, 14 May 2025 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222656;
	bh=KQlF40JSsgpURiVONi58XyU8oHv/LUiQF6gKP7AnrzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=elXe3iGkWJ9Vlu5nNWzJQZ8B85BvjCKU9lwOnVS900YEEG9Bqm63/SeN6Hi+IwJFM
	 cKnbc4/pey81M6zXOtplioyY+n4C2m9AkrOMNIU95uydG4pkH83wLUHkowsJCxQl2z
	 wCDvD7rJf6MXWe1erWkf0zCuqFtBur+Y4v1Mp9K7p5vhcwXqMp/rNqXhWIjIoJGuw1
	 EVWbiUqA5pjH0ify1NAAAbMM4BcWa8Afi5lMNACcNQchvphI9buNpV8N6tFfKsVU6q
	 iGPmi3LvkPR5hHvxlfKYt5b6UrPTaZLJlRwep5i4pxXURIZNV+4zPuyzZqkcYiQZRU
	 dP/bmOn9WVhgA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
References: <20250429-exynos5-phy-field-prep-v1-0-39eb279a3e0e@linaro.org>
Subject: Re: [PATCH 0/2] phy: exynos5-usbdrd: FIELD_PREP fixes
Message-Id: <174722265300.85510.15558290734609621287.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Tue, 29 Apr 2025 09:49:23 +0100, André Draszik wrote:
> These patches fix some recently introduced usage issues of
> FIELD_PREP().
> 
> 

Applied, thanks!

[1/2] phy: exynos5-usbdrd: fix setting LINKSYSTEM_FLADJ on exynos7870
      commit: b45791d48752418c805ae7417dcea85a40d5a41e
[2/2] phy: exynos5-usbdrd: s/FIELD_PREP_CONST/FIELD_PREP where appropriate
      commit: 6d0e2ada3ee5a554e908178d1fce851f5e63943d

Best regards,
-- 
~Vinod


