Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5E26C39E;
	Thu,  4 Dec 2025 15:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764862626; cv=none; b=GhW1ME8j7SJ/cjqM+HsV5hpnlV+5Hk52boc96Sl9RRiYkLjJ5HAX/J0+rzVSc2Q1+XYGzRzbA7xCCccexlFjIg9K7bmgil3cDTCdqSOUNVDaqKfPFgs3AodxZ2luUfTo8OD6JRbWByF/FKJyTSRKFQ6JEWswwCP98i3htu2AgO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764862626; c=relaxed/simple;
	bh=BGS0FZcNwAT4kN84K1EFaxAPrUGjGKfhVBy6CiQEox4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duw8S6VBm1aRike6vNc1Ci8YOW3mQNdQUZnrb4FgeNdBfK/Erq9nS8/abAY8sVL9jmtZ8zuZ9C1UUNL7eMc330aN/bweHnjAunTX6u52fu3BJxjHAvfH974s9Fidn7nhlAO1ecCvscy+6wOcvnwDGg/YTKki0+v5w8uctNzuPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTA+kkLd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTA+kkLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79090C4CEFB;
	Thu,  4 Dec 2025 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764862624;
	bh=BGS0FZcNwAT4kN84K1EFaxAPrUGjGKfhVBy6CiQEox4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTA+kkLd3VW7hsowY8sH2q2mgTi7/M3Nkz1kuK4ILH0Br6TKK09/opjnzdYB+ix74
	 S7MaJWbmq0O7fG1JGlH5IJyEILC5lSPVXbpJs+OECIsD5xRhozl4tsv4WCbmDZqm0y
	 BeW04I57dfv2WO038B4KRB1AoSR89rwV4AOsj1TnkqzI+ZBhjA9i/s2F16SSxK88EY
	 v/wKzfBJeo4o1eNTkcZbUKY2nWd1/QGFM5n3H76q77rhn1ePTzmf3U5Y0c2yDFZIaA
	 d4mjjpeFORlWYMnJSV4RdHq+a07NfZwIpaMkilKYadFbuDBwcbOqKmwwyczrHkZHm9
	 WUE6YCmQWTCDQ==
Date: Thu, 4 Dec 2025 09:37:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Raghav Sharma <raghav.s@samsung.com>
Cc: sboyd@kernel.org, chandan.vn@samsung.com, krzk@kernel.org,
	conor+dt@kernel.org, shin.son@samsung.com,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	devicetree@vger.kernel.org, karthik.sun@samsung.com,
	cw00.choi@samsung.com, s.nawrocki@samsung.com,
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sunyeal.hong@samsung.com, mturquette@baylibre.com
Subject: Re: [PATCH 1/3] dt-bindings: clock: exynosautov920: add MFD clock
 definitions
Message-ID: <176486262088.1527918.10847897816665673488.robh@kernel.org>
References: <20251119114744.1914416-1-raghav.s@samsung.com>
 <CGME20251119113927epcas5p15154cb4a7824e9ca65ac18842b68d785@epcas5p1.samsung.com>
 <20251119114744.1914416-2-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119114744.1914416-2-raghav.s@samsung.com>


On Wed, 19 Nov 2025 17:17:42 +0530, Raghav Sharma wrote:
> Add device tree clock binding definitions for CMU_MFD
> 
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  .../clock/samsung,exynosautov920-clock.yaml   | 19 +++++++++++++++++++
>  .../clock/samsung,exynosautov920.h            |  4 ++++
>  2 files changed, 23 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

