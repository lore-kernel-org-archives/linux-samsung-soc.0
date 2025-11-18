Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E43A5E63;
	Tue, 18 Nov 2025 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486306; cv=none; b=W9Ia82zNCuh0bGqAkRai0y+1BJl8wRcwXR+rJ05QTf8gmtjV9R+64TqzH7j1qAaTEUJWqNtK1xLl9GLED7MWI1NTpQcY1I1ZtV1500wQji57yr5e2vAsQeG4JXrkK0uVnAP3dcyjfg+LpISuxgHAWnGZ9SyDpeU1WWNnX15L04Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486306; c=relaxed/simple;
	bh=EEwSzAuRM0kq1EprADYYK7v3yQkWwLAJQjIqfYobBFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dB2dOh2aI03f/cJDO4BFSZk7oJSzJLSv5s5gWlJL1OU5lh3NMJl+zYbFzvsrurTAFD3A09KNegOIZWWfmcOCEQBZp8ECtuaxFYOovQlKCIN2ktnfz3YRkv/rPR9af2jpn1w/f1DbuBcoDw3WkBE5AnvSNVyeuWB1bdVMwk+irC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HG31WzSo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HG31WzSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3632C4CEF5;
	Tue, 18 Nov 2025 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763486305;
	bh=EEwSzAuRM0kq1EprADYYK7v3yQkWwLAJQjIqfYobBFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HG31WzSorwr9uYMM1jp8y4FNbu4d/kPuj16fkX4cfdoCG7Zpnz5qD2/cDfexk8+rg
	 o0tC1flc/yJG1IC5wU7Q/CofQRbx9tWoXaVJcLOhCMx6ZOf/lcmuxrsQd4NiXliFO3
	 fESWiu80RjXGA7I7qmRbP0ezuIpgEYsCtbUq1NaNZVeuEmje3M3RPJsa/RkFloy1Ec
	 dzUj17G8wV+xF78foJ8RUbI9EttwezeeoWjSTEDIGyX1nsyYpXB7baIYGDN38LN5rP
	 ujIl/WxR+uZGhv3JZ/YGkCAMt0iDvx6RXBT1MrbLb5pK3jl5OJQ8JIyYhEFTn0v0mg
	 LN37zgN5/oKRg==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
In-Reply-To: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
References: <20251112-phy-notify-pmstate-v5-0-39df622d8fcb@linaro.org>
Subject: Re: [PATCH v5 0/2] Add new phy_notify_state() api
Message-Id: <176348630114.62598.12188488023476027485.b4-ty@kernel.org>
Date: Tue, 18 Nov 2025 22:48:21 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 12 Nov 2025 16:27:05 +0000, Peter Griffin wrote:
> This series adds a new phy_notify_state() API to the phy subsystem. It is
> designed to be used when some specific runtime configuration parameters
> need to be changed when transitioning to the desired state which can't be
> handled by phy_calibrate()or phy_power_{on|off}().
> 
> The first user of the new API is phy-samsung-ufs and phy-gs101-ufs which
> need to issue some register writes when entering and exiting the hibern8
> link state.
> 
> [...]

Applied, thanks!

[1/2] phy: add new phy_notify_state() api
      commit: 4edf654be5471659e3260be0a557eaa2ece668ab
[2/2] phy: samsung: gs101-ufs: Add .notify_phystate() & hibern8 enter/exit values
      commit: a1af5d2be169ecec92cb4d85c811450d68164aec

Best regards,
-- 
~Vinod


