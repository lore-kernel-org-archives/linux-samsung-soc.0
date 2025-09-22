Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B6E48CFC;
	Mon, 22 Sep 2025 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557165; cv=none; b=fy9b1HdN1ni4iGsvpM9h2Vkwwh+aTXiPccOshWY65HUbdu8VKmb61O8kGI/fQolszyb0mEVz9pUrXXPmfvhIJQ9Zo5URD1zvAeiwZGzdwxtsE3TaAV4CK8xbssbx7KDEM2v8XZbmz40+ZIgZZZc/LUGoRc8F/GojujN0mpb8R44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557165; c=relaxed/simple;
	bh=xd23r+XPRKUhoqOC2QyRgh7gsLc1kz5qKFbjLd0vuXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaVNSHIGJ7kKCegZYT+N4oHZ+tL6/qKjF09+woVpFUH9i+V6kKgxUQMhMH64T88SsgRpyJcRd0yHlwNkhpEdKGwFfUXgR0M829yNJ8uvWHE9De16OP/5yURiFxcu52idnOEfsrnrtq1QkjBGamCCHUZEPGuwCCxpl/BI6EcPrcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Klnq5wyT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Klnq5wyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFB6C4CEF0;
	Mon, 22 Sep 2025 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557164;
	bh=xd23r+XPRKUhoqOC2QyRgh7gsLc1kz5qKFbjLd0vuXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Klnq5wyTEEwwZuDvCzAf9eNVUqEgkN0oiCi0L6KCrjyu+eagc7jGEjFHxQUOKoqbR
	 yVPgBcFpkiyG2hg4q5n6fAqHI5gz03I6zn8VXN37x+T5NNBSe8avgp9/RpxhedGeDn
	 PJCcTO3VrkttXJgjT6jAkD5tsEIfK+B/H6kvXvfadHrPL4ym9g+pFxyrBf4BO9NLzF
	 fzAW4zBx5WGS1Zci0v7TiIyn9XPULs5haMR46zC2eZB7qgcXsjt9BVhEKItViEDYfS
	 e9kq06WtiPOLxpRY/+wmQy+STTI1dYYtnKyvFU+xRI93Diulvs3HH153OLhpkfEukV
	 2STz2eKHnod9A==
Date: Mon, 22 Sep 2025 11:06:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: conor+dt@kernel.org, karthik.sun@samsung.com, cw00.choi@samsung.com,
	krzk@kernel.org, linux-samsung-soc@vger.kernel.org,
	mturquette@baylibre.com, linux-clk@vger.kernel.org,
	shin.son@samsung.com, linux-arm-kernel@lists.infradead.org,
	chandan.vn@samsung.com, dev.tailor@samsung.com,
	sunyeal.hong@samsung.com, linux-kernel@vger.kernel.org,
	s.nawrocki@samsung.com, devicetree@vger.kernel.org,
	alim.akhtar@samsung.com, sboyd@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: exynosautov920: add m2m clock
 definitions
Message-ID: <175855716306.141333.16307821570342985917.robh@kernel.org>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094512epcas5p223e2eb264967508527f478eb2200be83@epcas5p2.samsung.com>
 <20250915095401.3699849-2-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915095401.3699849-2-raghav.s@samsung.com>


On Mon, 15 Sep 2025 15:23:59 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_M2M
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 21 +++++++++++++++++++
>  .../clock/samsung,exynosautov920.h            |  5 +++++
>  2 files changed, 26 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

