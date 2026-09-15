Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C7494A18;
	Tue, 15 Sep 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467034; cv=none; b=IzYsYAKeaJegiNC1UOR2SW/zQ/rLFk+8fH8Hqb3jGf78s+VHGYVoa3rHG/W5HE3/p98MJveIPEgc3Uthu555rvnbzlaJGmQJJPUPOO4fNHRHn3uqiasaidhXcCRhE4mUmlloYc1EIKpLUa7N/lwstI2lPRy3r9w8dW+NFmev420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467034; c=relaxed/simple;
	bh=Y2FKgHgZy09yFuF0+HBx5vD311mDYKDESuc66r+ZT98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pk+l3Eg1e2ENH2sMEAHKc7ReiuOxLoCh4yi8lqY1xKsnh/u8XUeNW8NUD0auS3eOtsOzTb45Qz1zByUFZeYePKwDay1oUp0Hjw786bnfFTAWy30mUUE+2/s8vm2Vy0MFmwU3/hl643oV45AxmzliggIQyibWTZE1MvZLy2LKOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSeU9uao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSeU9uao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558F91F00A29;
	Tue, 15 Sep 2026 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789467029;
	bh=ldoWCmv2KEHuqW3cyXO1z62yTD72EIotOKiDOWZuGaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QSeU9uaoq+fonHNb5Nn9BAK62BHpnzzv9tjsz3Syu9/s+gU/5jLR4NRw7jmnq0XDQ
	 ag+TJ7Wt0XLyczNVZgQMHLoIUmSWYasi1DP5gM/UxeqFB39D3qYEUlb395Vj9kZDqL
	 qnQivVbyNW3A2S+ZcpEi5JC38i1z5nDvu4O8A7HSxAddAPOYOSFT5s1ZBQUt1se/Rs
	 /ALSicjmper+obhHB87ZQ0b7CSnTTSFBTOhKaH/i3GZOr5zSOL0609bjcrcu2LxCvI
	 vT2tszHUewT1FzU8kstDVSh7oBmAlwMzS5HFF+fUaPkcI0sEoPkSKN+WK7H4StFmac
	 bt74YCoseCjUw==
Date: Tue, 15 Sep 2026 12:10:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas_turner@talktalk.net, alexey.klimov@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for
 Samsung Galaxy A21s (SM-A217F)
Message-ID: <20260915-gleaming-thankful-lyrebird-b0d15a@quoll>
References: <20260913123740.203698-1-tturner@lineageos.org>
 <20260913123740.203698-2-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913123740.203698-2-tturner@lineageos.org>

On Sun, Sep 13, 2026 at 01:37:39PM +0100, Thomas Turner wrote:
> Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
> based on the Samsung Exynos850 SoC.
> 
> Signed-off-by: Thomas Turner <tturner@lineageos.org>

So I completely missed it because you cc-ed other address.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.

Best regards,
Krzysztof

