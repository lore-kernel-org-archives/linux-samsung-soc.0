Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F93FE37A;
	Mon, 29 Jun 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727786; cv=none; b=eWr9a9r0W2ITcVAGJsuanjIn9qjcG1H6kfMMA/xFF+VeRjLNocz2QR8rNssrVKVtf3kSaJpLHrQXFfU3uUoIBNLQ0uuffXZlDMwye3GQ6taQAsstD52m+iBTY1rd5NJuw/R8lApgGwyqT8U27ameKRAQ3bWqe+i1yUDnC7bSGhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727786; c=relaxed/simple;
	bh=UaemtKxNBlj6ZimiZ5qz7iTCrT1DLHiK5/MfXIsjMqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fEKkVsT26Wce4YiVj7bL7wy5Z7z3GexIz3FfLaSqin0sT/ZmUgYnHWvvhJWWYCkBd4VJv5mNTNInwSsGlydzHEl7fybyg366+uyv4fXgj2hN8IkreVWN+6CS0j4XYo5B9bVpVg+RUXclnCFPNQe7hgkX2ak1ju0iDwebxbN+1xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipl7EHtH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipl7EHtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C781F000E9;
	Mon, 29 Jun 2026 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727783;
	bh=7S46Iwb1NGnrffwBD/ngt0H6s3rPjy6vqhD2kJh/Vng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ipl7EHtHhkGr6ZP4iMSHY8+bCsuWQWuD7WODHFRShw0GgSxKPgsVRw+YLHlddDzId
	 FbDz+fX6M+UeDL7BWXzJCeJmeHLrK9fD3RNeUM69Ey7sCIw9IUxfi9lhWXvrXcMPpd
	 wZo0PGZnuOuePl9GnVyJreX6lq2WoLm/pCFxs7+yojjNvCipUuJrhYTt5hFIrF7p75
	 yzd+XhnuExvEWF6ql6TWq931Rmsjx9oJ4rssJ+8hOgy8jFXmE4yWsRlMNqtvAhyH2p
	 bDzkHcOGjq52M1LtyJA3FrIAwR7yyBeftfqCfKuL4V/FtwoIFx69Ll6DkJAl0igm9H
	 JepvncrCnbQRg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, 
 alim.akhtar@samsung.com, kishon@kernel.org, 
 Sanghoon Bae <sh86.bae@samsung.com>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 sowon.na@samsung.com
In-Reply-To: <20260610050326.2903402-3-sh86.bae@samsung.com>
References: <20260610050326.2903402-3-sh86.bae@samsung.com>
Subject: Re: (subset) [PATCH v3 2/2] arm64: dts: exynosautov920: Add hsi0
 syscon node for PCIe PHY
Message-Id: <178272777972.113362.4544629350524485886.b4-ty@b4>
Date: Mon, 29 Jun 2026 12:09:39 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 10 Jun 2026 14:03:26 +0900, Sanghoon Bae wrote:
> Add the syscon-hsi0 node to control PCIe PHY power, PLL settings,
> and device direction (RC/EP mode) on ExynosAutov920.

Applied, thanks!

[2/2] arm64: dts: exynosautov920: Add hsi0 syscon node for PCIe PHY
      https://git.kernel.org/krzk/linux/c/2c19e75101ee17059bf10101f4cf0157f61776a2

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

