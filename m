Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590212343C2;
	Wed, 23 Jul 2025 07:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254456; cv=none; b=HHUXGbtJOa/6hkG+ARa5O6JfmKxLu8Nl7Ky+L+P1QUdunUcIYC9pKG44QeFlqAz66zjBG2acPJyaf/OtckhsfdEq3HRVpvLN33UREorpxLjmOUi3DwTgnd/KpG9zsub0czfPJrWOFu6hiABwYxGVAgpe5Q6h4222Ay+m3XmXWSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254456; c=relaxed/simple;
	bh=7E7mBKEkTZpJi6KBwS4H9/BtUGuLQUjDKjTNHfuzUB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7H3HqarsPa7DQfs/MyOjPPmGjHt+uPGh0qWTgsjIHoalvY5OofS9qtt6m+EkczWrw1IblabBsImDPypJnakibTogszeweoAibYI7oh4lrQeCfAdU15Sy5AV/AsVjw7b44LeJzQqjnecUu3LYIm7y2Xnj9uAzGkXMmPJK6qhtSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLfi7z3I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLfi7z3I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731F7C4CEF4;
	Wed, 23 Jul 2025 07:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753254455;
	bh=7E7mBKEkTZpJi6KBwS4H9/BtUGuLQUjDKjTNHfuzUB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLfi7z3IPD0Wgn9KrDIpoys0NFV6IQnUqVHOwOzN98FOENVX+6Y2ITCm5buayeC+A
	 tXf/fM8vwi/wDB+TDaSKEP9qEmLjej6g9Wifq+H+cdbID9P05XibOGEYsn+BVtXnJk
	 7f/OyaAjuU+MdYKcOAlWi/rgxaJYK5tB2mpUNAokmCUynLVWpGlai68gDeYky+Bmo4
	 750OfBuOe9EIg28Z2LJBPv70nrbl60M7sga86pqAJzMupUaDC5RkO4LJdfok4o6dPG
	 Ypjb/Vx2qK1ORmlN1pXZn4qyQGNvj7Luf7acSNCOdCNAA+/OJuyPB6A9h8ZR5E4c8A
	 E+kcaipV2LNQw==
Date: Wed, 23 Jul 2025 12:37:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	William Mcvicker <willmcvicker@google.com>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
Message-ID: <aICKM-ebp9SMAkZ_@vaman>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>

On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
> On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
> > Add a new phy_notify_pmstate() api that notifies and configures a phy for a
> > given PM link state transition.
> > 
> > This is intended to be by phy drivers which need to do some runtime
> > configuration of parameters during the transition that can't be handled by
> > phy_calibrate() or phy_power_{on|off}().
> > 
> > The first usage of this API is in the Samsung UFS phy that needs to issue
> > some register writes when entering and exiting the hibernate link state.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> >  include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> >  }
> >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> >  
> > +/**
> > + * phy_notify_pmstate() - phy link state notification
> 
> 'pmstate' doesn't correspond to 'link state'. So how about,
> phy_notify_link_state()?
> 
> s/phy/PHY (here and below)
> 
> > + * @phy: the phy returned by phy_get()
> > + * @state: the link state
> > + *
> > + * Notify the phy of some PM link state transition. Used to notify and
> 
> Link state change is common for the PHY. So remove 'PM'.

Is it really link or phy state?

> 
> > + * configure the phy accordingly.
> > + *
> > + * Returns: %0 if successful, a negative error code otherwise
> > + */
> > +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
> 
> I think you need to use 'int state' and let drivers pass their own link state
> values. You cannot have generic link states across all peripherals.

I would avoid that, people start overloading this if we let it keep
open! I would like to avoid the api -(ab)use

-- 
~Vinod
