Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD29D3E3D89;
	Sun, 13 Sep 2026 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297018; cv=none; b=I4zSnUEqdz0vYKwnwPLtPAP4HkjjhfFgyYK4SlQij5SsHK0bf2WHl13BZov5ILc6SjoouG8aXUHT9dZbLkn20Ql1nX+kZvnG/qfnxLu88oX9Ra9dc2IvkyY7wtAkiAQEg2zhcWSDQ5axWtWFaufLkg05opJ2+0obDZJESnGudKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297018; c=relaxed/simple;
	bh=Wqmq53ZO0pbX08ozg8NdQ7c0GAj8uATnX8aluXWTjaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=srpJMoY2jQUwleQ5+asSRcjzAys1fUDZVDnx2TAgVHXsz0q20OasWTnLi/GzwAUX62D9BTiLiHriw3I22tQJ2K9EXe12fxKUkgxeG4K3iul5AiPIJ+QwrM9EV0PZu7hrumXDpq2F5wYHwBLuyiwaoaAwCl55sL6X1egqpBJiyjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ/TGJlH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ/TGJlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890E61F000FF;
	Sun, 13 Sep 2026 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297017;
	bh=frlkioWsr+rn+xQFULLyXcy9YieavxivQ8CM2t3LaSk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mJ/TGJlHtZlAQ4e+c5QMiM4QtzYPwLbu+ChInurBPBwpKXh5r63unwCOCWl5TcT1E
	 nAncKuQ4Ek0gFxbsY9rU4Cz5VcoWx2d2NYuKx7kpcD7kYJUtC1Z/W8kptRjhfqdZco
	 Yw2msQu2FWXHeykNHeczmika9tMKg15yPgYMmunLSKGY0Z3m97L3d9+cahS497tXS2
	 d7Pv4UwKlZap2KTwN0Bv3aERIsTYUfCT4qT7anq+I8w38TJV/Wn8tphxtOfVx8SV7q
	 FtVsgid48NefDGPd6cvr+187tv35tqyRZM/p/M0o6TvdTcEIm8mwlGDucQf5aRgRC4
	 fTOs1AajkNIvg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Pritam Manohar Sutar <pritam.sutar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Johan Hovold <johan@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
References: <20260623135349.42739-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] phy: samsung: usbdrd: propagate GS101 PIPE3 lock
 failures
Message-Id: <178929701318.215437.17506405540101327111.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:53 +0530
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 23 Jun 2026 21:53:49 +0800, Pengpeng Hou wrote:
> The GS101 PIPE3 initialization checks the PMA PLL lock and then checks
> the CDR lock. The PLL helper returns an error, but the GS101 PIPE3 init
> path dropped that result. The CDR helper only logged a timeout. PHY
> initialization could therefore still return success after either the PLL
> or the selected receive lane had not locked.
> 
> Make the in-file SoC-specific phy_init hook return an int so helpers
> with real failure results can propagate them through the existing PHY
> init paths. Keep the register-only helpers returning success and use the
> new return path to report the GS101 CDR wait failure. Other SoC helper
> paths keep their previous success behavior.
> 
> [...]

Applied, thanks!

[1/1] phy: samsung: usbdrd: propagate GS101 PIPE3 lock failures
      commit: 224fcee6fa830574029428d7232ea84e6a2422f5

Best regards,
-- 
~Vinod


