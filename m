Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDBD16F0E0;
	Tue,  2 Jul 2024 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719927353; cv=none; b=EG5d7ke9aBJAcKDkVl8MEObo0/HIm0J767IKMdROZqCfcTDXeZUFMLTHaDYJT9rBi2D7TV0s8xWlR478JhY1gXGXN+3cBn5XdtM0zUoCG+XzMKnuab/AsHg0rfr495tgg0PTPr05mTbnSXxSvUXQFyk1u5W997Q0CWv61S5a/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719927353; c=relaxed/simple;
	bh=WvtXhBJ3VWIptnIWb8zjZW3smoHvDA49GjGBnEmnCgg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nSMZWSA7dqHD1WfVNi51FQU1DSc1EC4BxGvBtJD2qNMUAb9BgLuRNSADIN4fNzkoeOmOSDo4KqFgs6iJhAmdjeqr7ClvRiUVVs6xhVYvv1zI7Lmw/la5om7hyVmO21EK5uBmGllSmMYX2sZx0sRG8FedRRnWA03od6GaSw5wNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYuFhJ52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYuFhJ52"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F830C116B1;
	Tue,  2 Jul 2024 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719927353;
	bh=WvtXhBJ3VWIptnIWb8zjZW3smoHvDA49GjGBnEmnCgg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RYuFhJ52ZDdzX8C5VYn9Wh6byIUy4oybnDCV60H9Wui5WXBxpOPbRJ9Px7SG8sK8d
	 wnKnfsvyNK5yLOWETFqwRXvX2jKsjvhRXM2Cb0m8XxYOInWAUzXTbqGBmmy3Hqne7m
	 xdUfmQHZvajljnpcHvjyCaTeTDEy+XMUEv4xdDHSW61FEOTmZbE9pmHvcGr08bGmNh
	 AtqCpSwLGqSGwzjcCcLs5BUBoswh/AtI/AWPCx5W3mGa3nBzk+wemK81XtHw1ReloO
	 +vzeZd5pp668MfLDPYZJEb2qerW5CtM0W4mgVu9Fsq2xpFXRl9rmXwnr9e+uU8Mlyf
	 cuI8XfBH2fq6w==
From: Vinod Koul <vkoul@kernel.org>
To: s.nawrocki@samsung.com, kishon@kernel.org, krzk@kernel.org, 
 alim.akhtar@samsung.com, Liu Jing <liujing@cmss.chinamobile.com>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
In-Reply-To: <20240701112517.6597-1-liujing@cmss.chinamobile.com>
References: <20240701112517.6597-1-liujing@cmss.chinamobile.com>
Subject: Re: [PATCH] phy: Fix the cacography in phy-exynos5250-usb2.c
Message-Id: <171992734993.699169.17205097350174077577.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:05:49 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 01 Jul 2024 19:25:17 +0800, Liu Jing wrote:
> The word 'swtich' is wrong, so fix it.
> 
> 

Applied, thanks!

[1/1] phy: Fix the cacography in phy-exynos5250-usb2.c
      commit: db4eb418c71a4223b90cac34017ed1f627371da9

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

