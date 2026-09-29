Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7B3DCD99;
	Tue, 29 Sep 2026 05:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660967; cv=none; b=HZB9VFFzf7m3wLEAoL/DZRkmbh+fvcwGnJNz9YwasF+SwkRlbijBBwA9EtRNrJ7cyCDzub58hZOZpnulxHr1NjAL7YFBoia4NR8UmfDr7KvmyEqeE24dVS7x9tIVkStcPL+bJpF/yRFR9WFRauCsW2uLH/rEOVVWtXudYVcGjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660967; c=relaxed/simple;
	bh=KUsavZPjEtXbg4UiqORlnk0mY7COcBdEpxFvTISANgY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t+LRPNJGpNx2RDdkcd+2XmRpkQa2Y67aEMv4C+rCbQnjUtYdnM1XO4pTD28tizz1SMKB4NJKFrIDaaVy9uqGkzeXeeI6wvRxxPMBOzPO4mVeIlT74aguafE3CGd/T/JW8J0BodEQdVRselsAt+EwxocuKyErRGXU3Sx2V69n2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbK2MAkr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbK2MAkr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BE61F000FF;
	Tue, 29 Sep 2026 05:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790660965;
	bh=5jP7Iz94EcMRlmpH/lYu7Szi8/9fipIFrX8rZMu8ViE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FbK2MAkrjBPSbZt4egTf/PpmW5qCI3MqSlCwyQbwLCKwKByspIZ8TrcCle80uB6FN
	 WeyQ3MoroDXx4rsao3WUd+M0tgDY+Ibx205oMW0NSCJ6LUEFzfBvK5isvWmd1Q9HwZ
	 faCAbFC22ows7gG6tcglsFln3h42Pnhfl6PGmYpKUUMuukIBcTAk6R7zq604lz2LgY
	 Jmay+6QZQDaxkElmhN0TnE3qr2TB6IDXhZpEu6andhwcpPke/InUOta2U0WOm5nTvt
	 SQ+lIk9yRdcrAfzmiabQMp1YZkba/TUR8rIrfKcrR1h9xLgGR6r17eMQlWn2ZnJVUR
	 NyTpE5uJx3H8A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Waqar Hameed <waqar.hameed@axis.com>
Cc: kernel@axis.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <5e580526e283d90c2b4c13ef5bc0633fd20e41a5.1790629313.git.waqar.hameed@axis.com>
References: <5e580526e283d90c2b4c13ef5bc0633fd20e41a5.1790629313.git.waqar.hameed@axis.com>
Subject: Re: (subset) [PATCH 09/16] arm64: dts: exynos8850: Add missing
 space in compatible
Message-Id: <179066096156.19907.15266857263274662254.b4-ty@b4>
Date: Tue, 29 Sep 2026 07:49:21 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 29 Sep 2026 00:38:20 +0200, Waqar Hameed wrote:
> Tabs should be a space between multiple property data. Found/fixed with
> dtfmt (Devicetree Source formatter).

Applied, thanks!

[09/16] arm64: dts: exynos8850: Add missing space in compatible
        https://git.kernel.org/krzk/linux/c/0e5c0ebc0faeaa52da10feeb159dd8660a0b2f4b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

