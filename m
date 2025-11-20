Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA32BE7D6;
	Thu, 20 Nov 2025 20:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763670471; cv=none; b=Pt/MKMKa4SR3DP1JJeqPR4WHA2O2pQqp2TS3UO2ABPlH116BjsVayRULFWmfzokPn8NIGgV88Z2BjQpbPNbY5Pl3BgkBY7VE7N2A3tt56Zm8N5QTIOUiEYC/6Y1IEqs/wsiXwBFo3k03erTfqHmCJIqkssa6G/r2B29IBJpwFTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763670471; c=relaxed/simple;
	bh=oVArnOtbserfAuFbcFawnF7FAvAZyl5PmsDTAKrrzEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4ME/A3SOcrWmy+A27uFDdarRqbLl5UNqhJIaGVWT0Mim/0iyB8+ckPRNLhcYyGntGp5KFAtXkko9oCGEeXdJNCVGrrLWBEY9MzcgijQO1Lc5ZkXAVrtyTUrj0JTUgln51OMztpE5ITCdVhww+jTJkqJfNPaEVdZtWZNf2p9HIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dC8zk0spjz9smW;
	Thu, 20 Nov 2025 21:27:46 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Thu, 20 Nov 2025 21:27:39 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Henrik Grimler <henrik@grimler.se>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Marquet <tb@a-marquet.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: exynos: Add Samsung Manta (Google Nexus 10)
Message-ID: <yrc7itk6yidsomznmvzcswvs7jhq3747vv677bjogoqji2bwrw@gfz7xelxkvrf>
References: <20251120144018.961604-1-linux@timmermann.space>
 <20251120144018.961604-3-linux@timmermann.space>
 <20251120173120.GA10065@localhost>
 <a78e1277-4148-435a-9a69-042507fab308@kernel.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78e1277-4148-435a-9a69-042507fab308@kernel.org>
X-Rspamd-Queue-Id: 4dC8zk0spjz9smW

On Thu, Nov 20, 2025 at 06:36:29PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2025 18:31, Henrik Grimler wrote:
> > Hi Lukas,
> > 
> > On Thu, Nov 20, 2025 at 03:40:15PM +0100, Lukas Timmermann wrote:
> >> From: Alexandre Marquet <tb@a-marquet.fr>
> >>
> >> Manta is the code name for Google Nexus 10, and was manufactured by
> >> Samsung. This patch adds initial device-tree file for this board.
> >>
> >> Co-developed-by: Alexandre Marquet <tb@a-marquet.fr>
> >> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> >> Co-developed-by: Lukas Timmermann <linux@timmermann.space>
> >> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > 
> > Awesome! I think this series would benefit from a cover letter
> > explaining what features are working, and perhaps saying something
> > about other patches that will be sent separately (if any). The as3668
> > led driver and bindings for example has not been merged, right? Adding
> > the lore link in a cover letter would therefore help reviewers.
> 
> If "not merged" in the meaning of not taken by maintainer for next, then
> this is quite important because it not only blocks this patch but would
> cause failures in CI leading me to being grumpy.
> 
> Samsung SoC follows maintainer-soc-clean-dts profile. Please always
> explicitly document such stuff (bindings in fly).
> 
> Best regards,
> Krzysztof
> 
I just noticed, that my cover letter did not get send to the mailing.
That was unintentional. In there, I wrote that this patch depends on an
earlier patch which still needs some work. Should I also add that to the
individual patch in future mails?

I'm still quite new to the mailing list workflow. I'm sorry for any
misunderstandings.

Best regards,
Lukas Timmermann
