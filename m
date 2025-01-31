Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD181E570E;
	Fri, 31 Jan 2025 16:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342553; cv=none; b=pLReaLRhADI98RNm2fc72loQWhe6JEeqdt8idDQ7GXiZGQ+1ZTztm5UlAs+CqkRYNXIFbmXtXk5tR6zLe75puN16AbaTakSlq8ciTDKnrw/XoW063qG57s6N4TvE1Vey6LArJmFKMYjNr+du/Yhtd19tMgBzCzVR7ZMXMwZkj6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342553; c=relaxed/simple;
	bh=9sfX6hltXIEpM8CfQHUqmXVgOqI4/WhaFSfB01kyVac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rx7u5QYXnEdYTbzPIPPOKJKRGxS1fkBMuauC6FjF75YuN879Ig7wfcQv6mqxgcxpmlzX1cThufESwqIQrQJiDhsY8KizP4mTNkT8v1einBpRMw60CUKvhzOWEBXXqpT5g2JJTu+7UTtZEAoTdHn7TCfL9l0HJW1bCR52O5w5M2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uzIiXLKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uzIiXLKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0782EC4CEE5;
	Fri, 31 Jan 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738342552;
	bh=9sfX6hltXIEpM8CfQHUqmXVgOqI4/WhaFSfB01kyVac=;
	h=Date:From:To:Cc:Subject:From;
	b=uzIiXLKgnwQQzh785A5uZb4CZPgPN+LhirEhwE9K3HVIzsGpVF43ppZ+r9vWaBEFT
	 sVHdBbQLJoal2Vo0RGDRVfo/7wnaMRiGFF3fsOKlUJg37AlNa5d5ou7GeMia1jhzeW
	 ufmZqOWTxT9CFiMn6Gn+/E7uGMJl5Qzo5hX8CJbKcpyHJLqvImiPagokxHGGLzRxB8
	 +1S433Ca5pEaR+Cht09spyWis2k+QWhU0R+MNJAeDxRm6n9J+S5fa4c0kHnzddE3Pw
	 yw0DFFbI5pBWTkc95gHenWvLTcfdBTAVGoTgHHxp/HqJNpZHQxn2MuJb1+4jOpN9F1
	 lQch1VwbARJsw==
Date: Fri, 31 Jan 2025 10:55:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: wait_event_timeout() usage in decon_wait_for_vblank()
Message-ID: <20250131165549.GA684322@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I don't know this code at all, so this is likely just noise, but the
wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
me.

decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
to be cleared.

But decon_irq_handler() only clears wait_vsync_event and wakes up
wait_vsync_queue when !ctx->i80_if.

I don't see any i80_if connection in decon_wait_for_vblank().  Does
the wait always time out if i80_if is set?  Is there some reason we
don't use decon_wait_for_vblank() at all if i80_if is set?

Bjorn
