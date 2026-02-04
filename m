Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C7021ABC9;
	Wed,  4 Feb 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218390; cv=none; b=cqS/XetOgSdt0MJslC99kBVRpCl3j3k1bKoj22YfME6kfgMYZwED73gbXru7SjszhSnpFkG7kxYA/EB6GWokAQi1PV2+BjOGDOz+8zJoMaUH197A33N4asB6wToXCWaPBJG4sRj/Uqx+R3vjDJfD+Sj2vpFqQ+jPVjW+XGNTurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218390; c=relaxed/simple;
	bh=N4W2OOT8cuSzttgJEnK8vKEf+348a62A9tEzp7vo3Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHQdSFB6QApouxbb/F1oG1pcHDH0sx+XjvEoY5x8hNS8g8Pu0P2kFONUObV09S/PKKj3rErU3zTrgNmpUtsQbffzv4jcQRRHBE91FbwUZY3uzJ3cyfrPZx9eYPXzLUFUOPWUudXxwpsVdPYQS2EbcQFCbJunQvG9J9GRf3Nh4eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9ulbJ6q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9ulbJ6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0D7C4CEF7;
	Wed,  4 Feb 2026 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218390;
	bh=N4W2OOT8cuSzttgJEnK8vKEf+348a62A9tEzp7vo3Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9ulbJ6qOpc4xNBiJGXL8gkDbLeGEd9b7MOQttgU3G5s9yvqUco6mWldHw0DI10Qx
	 qIa3MBBLsXyDetRivVLC+l2HpKSSKc85yMDDtitbiWO+dXBHwwMRW9O9tu1vTjTw7W
	 FnQXOQkBzj3yUQcYxA1mpyPreGmT5m+BF8h73uGo4s6jY6qQ4HJa0ax7JmtMfKYNEW
	 /r2v1a16eeQvATA0t5Js9VLcsUR6RyaAKe9Ac0k32w0fXgOfWZn6sKyYuitFqUaxKs
	 tg5T2PvEgkk+rA2Om+HiRuymg55ForoA9r2S1ADvOt7BJn5IpvSjYpCOQkaIilUW+a
	 JHmoJwk1e1tFA==
Date: Wed, 4 Feb 2026 20:49:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Naveen Kumar <mnkumar@google.com>, Roy Luo <royluo@google.com>,
	Joy Chakraborty <joychakr@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: PHY_GOOGLE_USB should depend on ARCH_GOOGLE
Message-ID: <aYNjkj0RYh3VszTn@vaman>
References: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0caa3c449b0c3d64944da3f1003d9389bdc13f98.1769541083.git.geert+renesas@glider.be>

Hi Geert,

On 27-01-26, 20:12, Geert Uytterhoeven wrote:
> The Google Tensor SoC USB PHY is only present on Google Tensor G5
> (Laguna) SoCs.  Hence add a dependency on ARCH_GOOGLE, to prevent asking
> the user about this driver when configuring a kernel without Google
> Tensor SoC support.

I have three patches for this :-) Looking at it, I prefer Arnd's
approach and not to depend on unknown symbol.

-- 
~Vinod
