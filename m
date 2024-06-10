Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFDE7A705
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jun 2024 12:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718023563; cv=none; b=d7fsLpdsS91NoVA9RiyQ1qBrPKTNLS4isNPLJfWvwKp57an0cGw3LekWMPPSiUeQPi87WB8y9or53tKn51nGQzgIjwSzRMfbbB0FXlzxpzoOpiM/CAhtbXB3jAs/7QdMN/k147NK2umkmtXqGwJhzhB6W/5xIDaHPAyA73f/cUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718023563; c=relaxed/simple;
	bh=OTDscF7fjfeEwqAKGmKqQ7/J4RnoJxGJRSM9WT7dwHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EtsL3n3eTMvMfpSA+vnJgupjB5LLuqzkzQIGR7ennVS2yT+LrfZT2Szzw1RyWxP0jlwGpqMjo7DmjmjeTB16ePQDJmmSq4W3bjcjxOYIlnAUljs3+51VEhYSOjT7vLIgwi+a56IBjwH02/gai7PfzXd6MQU3o0R5IAM7D+ZZXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sGeP0-0005vE-T8; Mon, 10 Jun 2024 14:45:34 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 02/14] drm/rockchip: analogix_dp: add runtime PM handling
Date: Mon, 10 Jun 2024 14:45:33 +0200
Message-ID: <4883275.F8r316W7xa@diego>
In-Reply-To: <20240503151129.3901815-3-l.stach@pengutronix.de>
References:
 <20240503151129.3901815-1-l.stach@pengutronix.de>
 <20240503151129.3901815-3-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 3. Mai 2024, 17:11:17 CEST schrieb Lucas Stach:
> Hook up the runtime PM suspend/resume paths to make the rockchip
> glue behave more like the exynos one. The same suspend/resume
> functions are used for system sleep via the runtime PM force
> suspend/resume.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

A rk3399-gru Chromebook was able to suspend and wake up again
with working display both before and after.


Heiko


