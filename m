Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B9278E42;
	Wed, 23 Jul 2025 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753257851; cv=none; b=D4CeDrgASwOu0O4yr3G3GWZM8yWDUjeOeb8SxlAdSgfJKNnxdp2Aeo8sVUrXl/AOZG/AlhwxnBupNJ9YrjtwiyvFozoelTUdQ8Ih30GuNQEmnzy2J/7RwpWktPcjOB+pI53aPK1Y2GO3O8jAklQei7dSkP9bv1xWhYPfMNd9Qcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753257851; c=relaxed/simple;
	bh=5G0MzIPGQyVzSDEfSUskutOnD5XbLYr6VIzJy8hOBhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPJyTwqTBKIliwMrtIHIvVPG8uCh5if1xwmpwPBzMc/VtvxfAb9r9KKajra/KbOsA7zDhbO8WSM36V/+CQ5uTRv1Ysv94qGumAPVbShBuAGU+rcabY1a7zjgv5ntI6zsBxB8S0EY3k3ZYq6QzuWbl98sh/ZsThxbY3SeowkH0aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvK5C2/f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvK5C2/f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6BAC4CEE7;
	Wed, 23 Jul 2025 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753257851;
	bh=5G0MzIPGQyVzSDEfSUskutOnD5XbLYr6VIzJy8hOBhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvK5C2/fwmiSxXzWTRkggiNfcnyKIjny40VwN1Iu+CBZ1S39waBVQlHolf1xIA0Xt
	 TK5zIgXYTW8ZuXP2B+q48VTDm5AmPwfzuIc/4N3oQPphbF+AaEOf1g4FJIdL3JARUy
	 qyhtk6UgCl6sPP4PmVreb+IpEEpXpxBx94fmxIHGjaA+yUsR9Gt3fKGw3/A2v85Q84
	 FtmhCs70ViIr6RsOPpzQKp5yfDSd+tLJgqKTyKp+QBARrdCgfxEfA4dFP73MJAGWmB
	 uQQJl2gW580fJJXyZJ97+j7n2gpNTZRiN7P/A8lPx3GU7npGE+dSKb3NrLMjLFtO8r
	 Eig/hwOm4gQnQ==
Date: Wed, 23 Jul 2025 13:34:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
Message-ID: <yaz4ozb55t3pkwd2gj4l4d2hdspdcsqjm2dfsux7lfdxy6lxjl@uae2qz2vjo64>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
 <aICKM-ebp9SMAkZ_@vaman>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aICKM-ebp9SMAkZ_@vaman>

On Wed, Jul 23, 2025 at 12:37:31PM GMT, Vinod Koul wrote:
> On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
> > On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
> > > Add a new phy_notify_pmstate() api that notifies and configures a phy for a
> > > given PM link state transition.
> > > 
> > > This is intended to be by phy drivers which need to do some runtime
> > > configuration of parameters during the transition that can't be handled by
> > > phy_calibrate() or phy_power_{on|off}().
> > > 
> > > The first usage of this API is in the Samsung UFS phy that needs to issue
> > > some register writes when entering and exiting the hibernate link state.
> > > 
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> > >  include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
> > >  2 files changed, 50 insertions(+)
> > > 
> > > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > > index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
> > > --- a/drivers/phy/phy-core.c
> > > +++ b/drivers/phy/phy-core.c
> > > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> > >  }
> > >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> > >  
> > > +/**
> > > + * phy_notify_pmstate() - phy link state notification
> > 
> > 'pmstate' doesn't correspond to 'link state'. So how about,
> > phy_notify_link_state()?
> > 
> > s/phy/PHY (here and below)
> > 
> > > + * @phy: the phy returned by phy_get()
> > > + * @state: the link state
> > > + *
> > > + * Notify the phy of some PM link state transition. Used to notify and
> > 
> > Link state change is common for the PHY. So remove 'PM'.
> 
> Is it really link or phy state?
> 

This is a bit of ambiguity. But as per the spec, Hibern8 is the low power state
of the M-PHY and Unipro controller.

Maybe, phy_notify_state()?

> > 
> > > + * configure the phy accordingly.
> > > + *
> > > + * Returns: %0 if successful, a negative error code otherwise
> > > + */
> > > +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
> > 
> > I think you need to use 'int state' and let drivers pass their own link state
> > values. You cannot have generic link states across all peripherals.
> 
> I would avoid that, people start overloading this if we let it keep
> open! I would like to avoid the api -(ab)use
> 

Then we will end up with peripheral specific enums in include/linux/phy/phy.h.
If you are OK with that, fine with me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
